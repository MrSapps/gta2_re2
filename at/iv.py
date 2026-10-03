# iv.py ADDR105 [-b]: 9.6f view of a 10.5 function: annotated 9.6f asm, the inlined callees' bodies,
import os as _os; REPO=_os.environ.get('REPO') or __import__('subprocess').run(['git','rev-parse','--show-toplevel'],capture_output=True,text=True).stdout.strip() or '/home/user/gta2_re2'; TOOLS=_os.environ.get('TOOLS','/tmp/claude-0/at')
# and Source/ helpers noted with those 9.6f addresses
import json,re,sys,glob
from collections import defaultdict
BC=REPO+'/Scripts/bin_comp/'
fp=json.load(open(BC+'fingerprints.json'));A,B=fp['v105'],fp['v96f']
m=json.load(open(BC+'match_96f.json'));P=m['pairs'];R={b:a for a,b in P.items()}
d=json.load(open(BC+'target_96f.json'))
a=hex(int(sys.argv[1],16)); b=P.get(a)
print(f"# 10.5 {a} {A[a]['name']} size={A[a]['size']}  9.6f {b} size={B[b]['size'] if b else '-'}")
if not b: sys.exit()
miss=[c for c in m["per_func"].get(a,[]) if not re.match(r"^(Fix16|ang16|Ang16|Fix16_Point|Fix16_2|Fix16_rect)::",B[c]["name"])]
called=set(A[a]['c'])
noted=defaultdict(list)
for f in glob.glob(REPO+'/Source/**/*.[ch]pp',recursive=True):
    if '3rdParty' in f: continue
    for i,l in enumerate(open(f,errors='ignore'),1):
        for x in re.findall(r'0x([0-9A-Fa-f]{6})\b',l):
            if '9.6f' in l or '96f' in l: noted[hex(int(x,16))].append(f"{f[len(REPO)+8:]}:{i}: {l.strip()[:110]}")
        for x in re.findall(r'\b\w+_([0-9A-Fa-f]{6})\s*\(',l):
            if 'FUNC' not in l and f.endswith('hpp'): noted[hex(int(x,16))].append(f"{f[len(REPO)+8:]}:{i}: {l.strip()[:110]}")
def ann(t):
    t=hex(t)
    s=B[t]['name'] if t in B else '?'
    if t in R: s+=f" [10.5 {R[t]} {A[R[t]]['name']}{' CALLED' if R[t] in called else ' NOT CALLED'}]"
    if t in miss: s+=' <<INLINE'
    return s
asm=d.get(b,{}).get('asm')
if asm and '-n' not in sys.argv:
    for l in asm.split('\n'):
        mm=re.search(r'call\s+(?:0x)?([0-9a-fA-F]+)$',l.strip())
        if mm: l+='    ; '+ann(int(mm.group(1),16))
        print(l)
for c in miss:
    print(f"\n## inline {c} {B[c]['name']} size={B[c]['size']}" + (f" 10.5 copy {R[c]} {A[R[c]]['name']}" if c in R else ''))
    for n in noted.get(c,[])[:4]: print('   noted:',n)
    if c in R:
        for n in noted.get(R[c],[])[:4]: print('   noted10.5:',n)
    e=d.get(c)
    if e and e['size']<=int(sys.argv[2] if len(sys.argv)>2 and sys.argv[2].isdigit() else 80): print(e['asm'])
