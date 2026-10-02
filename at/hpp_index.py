# hpp index: classes -> (file, open line, close line), fields (name -> type), methods
import os as _os; REPO=_os.environ.get('REPO','/home/user/gta2_re2'); TOOLS=_os.environ.get('TOOLS','/tmp/claude-0/at')
import re,glob
def index():
    classes={}
    for f in sorted(glob.glob(REPO+'/Source/*.hpp')):
        L=open(f,errors='ignore').read().split('\n')
        i=0
        while i<len(L):
            mm=re.match(r'^\s*(?:class|struct)\s+(?:EXPORT\s+)?(\w+)\s*(?::[^{;]*)?$',L[i])
            if mm and i+1<len(L) and L[i+1].strip()=='{' or (mm and L[i].rstrip().endswith('{')):
                pass
            if mm and ((i+1<len(L) and L[i+1].strip().startswith('{')) ):
                name=mm.group(1); depth=0; j=i+1; start=j
                while j<len(L):
                    depth+=L[j].count('{')-L[j].count('}')
                    if depth==0 and '}' in L[j]: break
                    j+=1
                fields={}; d=0
                for k in range(start,j+1):
                    if d==1:
                        fm=re.match(r'^\s*([\w:<>\*& ]+?[\w\*&>])\s*\b(field_\w+)\s*(\[[^\]]*\])?\s*;',L[k])
                        if fm: fields[fm.group(2)]=(fm.group(1).strip(),fm.group(3))
                    d+=L[k].count('{')-L[k].count('}')
                if name not in classes or len(fields)>len(classes[name]['fields']):
                    classes[name]=dict(file=f,start=start,end=j,fields=fields)
                i=j
            i+=1
    return classes
if __name__=='__main__':
    c=index(); print(len(c)); print(c['Ped']['file'],c['Ped']['start'],c['Ped']['end'],list(c['Ped']['fields'].items())[:5])
