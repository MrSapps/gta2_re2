# src.py ADDR: print the source of the marked function (file:line)
import os as _os; REPO=_os.environ.get('REPO','/home/user/gta2_re2'); TOOLS=_os.environ.get('TOOLS','/tmp/claude-0/at')
import glob,re,sys
a=int(sys.argv[1],16)
for f in sorted(glob.glob(REPO+'/Source/*.cpp')):
    L=open(f,errors='ignore').read().split('\n')
    for i,l in enumerate(L):
        m=re.match(r'^\s*(MATCH|WIP|STUB)_FUNC\((0x[0-9A-Fa-f]+)\)',l)
        if m and int(m.group(2),16)==a:
            j=i+1
            while j<len(L) and not re.match(r'^\s*(MATCH|WIP|STUB)_FUNC\(',L[j]): j+=1
            print(f'{f[len(REPO)+8:]}:{i+1}')
            for k in range(i,j): print(f'{k+1}: {L[k]}')
