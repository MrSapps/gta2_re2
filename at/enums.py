# enum table: 'ns::NAME' and 'NAME' -> value (namespace/enum name prefixes)
import os as _os; REPO=_os.environ.get('REPO','/home/user/gta2_re2'); TOOLS=_os.environ.get('TOOLS','/tmp/claude-0/at')
import re,glob
def enums():
    out={}
    for f in glob.glob(REPO+'/Source/*.hpp'):
        t=open(f,errors='ignore').read()
        for mm in re.finditer(r'(?:namespace\s+(\w+)\s*\{\s*)?enum\s+(\w+)?\s*(?::\s*\w+\s*)?\{([^}]*)\}',t):
            ns=mm.group(1) or mm.group(2); v=-1
            for item in mm.group(3).split(','):
                item=re.sub(r'//.*','',item).strip()
                if not item: continue
                im=re.match(r'(\w+)\s*(?:=\s*(.+))?$',item,re.S)
                if not im: continue
                if im.group(2) is not None:
                    try: v=int(eval(im.group(2).strip().rstrip('uUlL'),{},{k.split('::')[-1]:x for k,x in out.items()}))
                    except Exception: continue
                else: v+=1
                out[im.group(1)]=v
                if ns: out[ns+'::'+im.group(1)]=v
                if mm.group(2): out[mm.group(2)+'::'+im.group(1)]=v
    return out
if __name__=='__main__':
    e=enums(); print(len(e)); print(e.get('car_model_enum::TANK'),e.get('car_model_enum::apc'))
