from blocks import blocks
import sys,json,re
po,o,oo=blocks('ours.cpp');pt,t,to=blocks('theirs.cpp')
take=set(['0x45ea00','0x4633e0','0x466fb0','0x467ca0','0x46bd50','0x46d0d0','0x46d240','0x46f110','0x46f490','0x46fc90','0x46ff00','0x470160','0x470300'])
if len(sys.argv)>1 and sys.argv[1]: take|=set(sys.argv[1].split(','))
pf=json.load(open('/tmp/claude-0/perfile.json'))['Source/Ped.cpp']
mp={k:max(v,key=v.get) for k,v in pf.items()}
mp.update({'SetStateForObjective_4633E0':'SetStatesForObjective_4633E0','sub_463300':'ChangePedStatesByMode_463300','sub_46BD50':'IsOtherPedEnteringAsDriver_46BD50','sub_46D240':'ExitTrainStateMachine_46D240','SelectAttackWeapon_46F490':'ChooseAttackWeapon_46F490','sub_45EA00':'DeallocateWithGroupCleanup_45EA00'})
import glob,collections
decl=collections.defaultdict(set)
for f in glob.glob('/home/user/gta2_re2/Source/*.hpp')+glob.glob('/home/user/gta2_re2/Source/*.cpp'):
    if f.endswith('/Ped.cpp'): continue
    for m in re.finditer(r'\b([A-Za-z_]\w*?_([0-9A-Fa-f]{6}))\s*\(',open(f,errors='ignore').read()):
        decl[m.group(2).upper()].add(m.group(1))
def callfix(m):
    n=m.group(1);a=m.group(2).upper()
    if n in mp: return mp[n]+m.group(3)
    if n in decl[a] or not decl[a]: return m.group(0)
    c=[x for x in decl[a] if not x.lower().startswith('sub_')] or list(decl[a])
    return (c[0] if len(c)==1 else n)+m.group(3)
def tr(lines):
    s='\n'.join(lines)
    s=re.sub(r'\b([A-Za-z_]\w*?_([0-9A-Fa-f]{6}))(\s*\()',callfix,s)
    s=s.replace('char_type Ped::HandlePickupCollision_45DE80','bool Ped::HandlePickupCollision_45DE80').replace('char_type Ped::IsPedAThreat_465D00','bool Ped::IsPedAThreat_465D00')
    s=re.sub(r'\b\w+\b',lambda m: mp.get(m.group(0),m.group(0)),s)
    return s.split('\n')
out=list(po)
for a in oo:
    out+= (tr(t[a][1]) if a in take else o[a][1])
    if a=='0x465cd0':
        out+=tr(t['0x466b70'][1]+t['0x4614e0'][1])
s='\n'.join(out); s=re.sub(r'\bsub_45EA00\b','DeallocateWithGroupCleanup_45EA00',s)
open('/home/user/gta2_re2/Source/Ped.cpp','w').write(s)
