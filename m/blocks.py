import re,sys
def blocks(path):
    L=open(path).read().split('\n')
    idx=[i for i,l in enumerate(L) if re.match(r'(MATCH|WIP|STUB)_FUNC\(0x\w+\)',l)]
    pre=L[:idx[0]]; out={}; order=[]
    for k,i in enumerate(idx):
        j=idx[k+1] if k+1<len(idx) else len(L)
        m=re.match(r'(MATCH|WIP|STUB)_FUNC\((0x\w+)\)',L[i])
        a=m.group(2).lower(); out[a]=(m.group(1),L[i:j]); order.append(a)
    return pre,out,order
