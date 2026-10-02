# mnd.py <obj> <addr> <needle>: show diffs ignoring stack offsets (regs kept)
import os as _os; REPO=_os.environ.get('REPO','/home/user/gta2_re2'); TOOLS=_os.environ.get('TOOLS','/tmp/claude-0/at')
import sys, json, re, difflib
sys.path.insert(0, REPO+'/Scripts/bin_comp')
import permuter_score as ps
obj, addr, needle = sys.argv[1], sys.argv[2], sys.argv[3]
t = json.load(open(REPO+'/Scripts/bin_comp/target_asm.json'))[hex(int(addr,16))]
coff = ps.Coff(open(obj, 'rb').read())
ours = [x for x in ps.function_asm(coff, ps.find_function(coff, needle)).split('\n') if x.strip()]
tgt = [x for x in t['asm'].split('\n') if x.strip()]
REG='-r' in sys.argv
def norm(s):
    s=s.strip(); m = s.split()[0] if s else ''
    if m.startswith('call'): return 'call'
    if m.startswith('j'): return m
    s = re.sub(r'0x[0-9A-F]{5,8}\b', 'G', s)
    s = re.sub(r'(0x[0-9A-Fa-f]+|[0-9])\(%esp\)', 'S', s)
    if REG: s = re.sub(r'%e?[a-d]x|%e?[sd]i|%ebp|%[a-d][lh]', 'R', s)
    return s
a=[norm(x) for x in tgt]; b=[norm(x) for x in ours]
sm=difflib.SequenceMatcher(None,a,b,autojunk=False)
ctx=int(sys.argv[4]) if len(sys.argv)>4 and sys.argv[4]!='-r' else 2
for tag,i1,i2,j1,j2 in sm.get_opcodes():
    if tag=='equal': continue
    print('--- %s orig[%d:%d] ours[%d:%d]'%(tag,i1,i2,j1,j2))
    for k in range(max(0,i1-ctx),i1): print('    '+tgt[k])
    for k in range(i1,i2): print('  - '+tgt[k])
    for k in range(j1,j2): print('  + '+ours[k])
