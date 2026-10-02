# objcmp.py A.obj B.obj: names of functions whose code differs (padding ignored) or that exist in one only
import os as _os; REPO=_os.environ.get('REPO','/home/user/gta2_re2'); TOOLS=_os.environ.get('TOOLS','/tmp/claude-0/at')
import sys,re
sys.path.insert(0,REPO+'/Scripts/bin_comp')
import permuter_score as ps
def funcs(p):
    c=ps.Coff(open(p,'rb').read()); out={}
    for i,s in enumerate(c.symbols):
        if s and s['sec']>0 and (s['type']&0x20):
            lines=[l.strip() for l in ps.function_asm(c,i).split('\n') if l.strip()]
            while lines and ps.PADDING.match(lines[-1]): lines.pop()
            out[s['name']]=lines
    return out
a,b=funcs(sys.argv[1]),funcs(sys.argv[2])
for n in sorted(set(a)|set(b)):
    if n.startswith('?Marker_'): continue
    if n not in a: print('NEW ',n)
    elif n not in b: print('GONE',n)
    elif a[n]!=b[n]: print('DIFF',n)
