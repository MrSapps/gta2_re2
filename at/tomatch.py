# tomatch.py ADDR: WIP_FUNC -> MATCH_FUNC and drop WIP_IMPLEMENTED (plus a following blank line)
import os as _os; REPO=_os.environ.get('REPO','/home/user/gta2_re2'); TOOLS=_os.environ.get('TOOLS','/tmp/claude-0/at')
import sys,re,glob
a=int(sys.argv[1],16)
for f in glob.glob(REPO+'/Source/*.cpp'):
    s=open(f,encoding='latin-1',newline='').read()
    m=None
    for mm in re.finditer(r'WIP_FUNC\((0x[0-9A-Fa-f]+)\)',s):
        if int(mm.group(1),16)==a: m=mm
    if not m: continue
    s=s[:m.start()]+'MATCH_FUNC('+m.group(1)+')'+s[m.end():]
    i=s.find('{',m.start())
    s=s[:i]+re.sub(r'\n[ \t]*WIP_IMPLEMENTED;[ \t]*\r?\n([ \t]*\r?\n)?','\n',s[i:],count=1)
    open(f,'w',encoding='latin-1',newline='').write(s); print(f)
