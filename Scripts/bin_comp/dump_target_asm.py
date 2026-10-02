"""
Dump the original 10.5.exe asm for every function the build has but doesn't mark as
matching (WIP_FUNC/STUB_FUNC/unmarked), so it can be compared without the exe.
Output: target_asm.json {og_addr: {name, size, status, asm, pp}} where pp is the
post processed asm that compare_function.py compares.
"""
import json
import compare_function
import post_process_asm

sizes = {}
with open("og_function_data_v105.csv") as f:
    for line in f:
        rec = line.rstrip().split(",")
        if len(rec) >= 4:
            sizes[int(rec[1], 16)] = (rec[0], int(rec[2], 16), int(rec[3], 16))

with open("new_data.json") as f:
    new_data = json.load(f)

out = {}
for rec in new_data["functions"]:
    if rec["func_status"] == "0x1" or rec["og_addr"] in ("?", None):
        continue
    try:
        addr = int(rec["og_addr"], 16)
    except ValueError:
        continue
    if addr not in sizes:
        continue
    name, fo, size = sizes[addr]
    asm = compare_function.dism_func(compare_function.get_bytes_from_file("10.5.exe", fo, size))
    try:
        pp = post_process_asm.post_process_asm(asm)
    except Exception as e:
        pp = None
        print(f"post processing failed for {name}: {e!r}")
    out[hex(addr)] = {"name": name, "size": size, "status": rec["func_status"], "asm": asm, "pp": pp}

# extra functions the build doesn't mark (callees of WIPs/STUBs), one hex address per line
import os
if os.path.exists("dump_extra_addrs.txt"):
    for line in open("dump_extra_addrs.txt"):
        line = line.split("#")[0].strip()
        if not line:
            continue
        addr = int(line, 16)
        if addr not in sizes or hex(addr) in out:
            continue
        name, fo, size = sizes[addr]
        asm = compare_function.dism_func(compare_function.get_bytes_from_file("10.5.exe", fo, size))
        try:
            pp = post_process_asm.post_process_asm(asm)
        except Exception as e:
            pp = None
        out[hex(addr)] = {"name": name, "size": size, "status": "unmarked", "asm": asm, "pp": pp}

# bytes of read-only data referenced by absolute address (float constants etc.), so values can be
# compared without the exe. PE layout: map VA -> file offset via section headers.
import re, struct
exe = open("10.5.exe", "rb").read()
pe = struct.unpack_from("<I", exe, 0x3C)[0]
nsec = struct.unpack_from("<H", exe, pe + 6)[0]
opt = struct.unpack_from("<H", exe, pe + 20)[0]
base = struct.unpack_from("<I", exe, pe + 24 + 28)[0]
secs = []
for i in range(nsec):
    o = pe + 24 + opt + i * 40
    vsz, va, rsz, rptr = struct.unpack_from("<IIII", exe, o + 8)
    secs.append((base + va, max(vsz, rsz), rptr, rsz))
def read_va(va, n):
    for sva, sz, rptr, rsz in secs:
        if sva <= va < sva + sz and va - sva + n <= rsz:
            return exe[rptr + va - sva: rptr + va - sva + n]
    return None
data = {}
for v in out.values():
    fpu_lines = "\n".join(l for l in v["asm"].split("\n") if l.startswith("f"))
    for m in re.finditer(r"\b0x([0-9A-Fa-f]{6,8})\b", fpu_lines):
        a = int(m.group(1), 16)
        if a >= 0x400000 and hex(a) not in data:
            b = read_va(a, 8)
            if b is not None:
                data[hex(a)] = b.hex()
# switch jump tables and their byte index tables
for v in out.values():
    for l in v["asm"].split("\n"):
        m = re.match(r"^jmpl \*0x([0-9A-Fa-f]+)\(", l)
        if m and hex(int(m.group(1), 16)) not in data:
            b = read_va(int(m.group(1), 16), 4 * 128)
            if b is not None: data[hex(int(m.group(1), 16))] = b.hex()
        m = re.match(r"^mov 0x([0-9A-Fa-f]+)\(%e\w\w\),%\w+$", l)
        if m and hex(int(m.group(1), 16)) not in data and int(m.group(1), 16) >= 0x401000:
            b = read_va(int(m.group(1), 16), 256)
            if b is not None: data[hex(int(m.group(1), 16))] = b.hex()
# strings and other data pushed or loaded by immediate address (format strings, file names, ...):
# up to 128 bytes, cut after the first NUL when it looks like text
for v in out.values():
    for m in re.finditer(r"\$0x([0-9A-Fa-f]{6,8})\b", v["asm"]):
        a = int(m.group(1), 16)
        if a < 0x5F0000 or a >= 0x800000 or hex(a) in data:
            continue
        b = read_va(a, 128)
        if b is None:
            continue
        z = b.find(b"\0")
        if z > 0 and all(32 <= c < 127 or c in (9, 10, 13) for c in b[:z]):
            b = b[:z + 1]
        data[hex(a)] = b.hex()
# functions marked in Source/ whose address isn't in the csv: dump the bytes up to the next
# known function so they can be sized and added to the csv
import glob, bisect
starts = sorted(sizes)
extra = {}
for path in glob.glob("../../Source/*.cpp"):
    for m in re.finditer(r"(?:WIP|STUB|MATCH)_FUNC\(\s*(0x[0-9A-Fa-f]+)\s*\)", open(path, encoding="utf-8", errors="ignore").read()):
        a = int(m.group(1), 16)
        if a in sizes or a < 0x401000:
            continue
        i = bisect.bisect_right(starts, a)
        if i >= len(starts):
            continue
        b = read_va(a, min(starts[i] - a, 0x2000))
        if b is not None:
            extra[hex(a)] = b.hex()
# x87 constants used by those functions too (they aren't in `out`, so the scan above misses them)
for blob in extra.values():
    asm = compare_function.dism_func(bytes.fromhex(blob))
    fpu_lines = "\n".join(l for l in asm.split("\n") if l.startswith("f"))
    for m in re.finditer(r"\b0x([0-9A-Fa-f]{6,8})\b", fpu_lines):
        a = int(m.group(1), 16)
        if a >= 0x400000 and hex(a) not in data:
            b = read_va(a, 8)
            if b is not None:
                data[hex(a)] = b.hex()
with open("target_extra.json", "w") as f:
    json.dump(extra, f)

with open("target_data.json", "w") as f:
    json.dump(data, f)

with open("target_asm.json", "w") as f:
    json.dump(out, f, indent=1)
print(f"dumped {len(out)} functions")

# 9.6f asm of the functions in dump_96f_addrs.txt (partners of WIP/STUB functions and the 9.6f
# callees inlined in 10.5, see match_96f.py), with absolute addresses so calls can be followed
if os.path.exists("dump_96f_addrs.txt") and os.path.exists("9.6f.exe"):
    from iced_x86 import Decoder, Formatter, FormatterSyntax
    s96 = {}
    for line in open("og_function_data_v96f.csv"):
        rec = line.rstrip().split(",")
        if len(rec) >= 4:
            s96[int(rec[1], 16)] = (rec[0], int(rec[2], 16), int(rec[3], 16))
    exe96 = open("9.6f.exe", "rb").read()
    fmt = Formatter(FormatterSyntax.GAS)
    out96 = {}
    for line in open("dump_96f_addrs.txt"):
        line = line.split("#")[0].strip()
        if not line or int(line, 16) not in s96:
            continue
        addr = int(line, 16)
        name, fo, size = s96[addr]
        asm = [f"{ins.ip:x}: {fmt.format(ins)}" for ins in Decoder(32, exe96[fo:fo + size], ip=addr)]
        out96[hex(addr)] = {"name": name, "size": size, "asm": "\n".join(asm)}
    with open("target_96f.json", "w") as f:
        json.dump(out96, f, indent=1)
    print(f"dumped {len(out96)} 9.6f functions")
