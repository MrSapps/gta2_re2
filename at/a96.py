import json,sys
import os as _os; REPO=_os.environ.get('REPO','/home/user/gta2_re2'); TOOLS=_os.environ.get('TOOLS','/tmp/claude-0/at')
d=json.load(open(REPO+'/Scripts/bin_comp/target_96f.json'))
m=json.load(open(REPO+'/Scripts/bin_comp/match_96f.json'))
r={b:a for a,b in m['pairs'].items()}
for a in sys.argv[1:]:
    a=hex(int(a,16))
    if a in m['pairs'] and a not in d: print('# 10.5',a,'-> 9.6f',m['pairs'][a]); a=m['pairs'][a]
    e=d.get(a)
    if not e: print(a,'not dumped');continue
    print(f"## {a} {e['name']} size={e['size']} 10.5={r.get(a)}")
    print(e['asm'])
