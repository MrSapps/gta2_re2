import json,csv,re,io
d=json.load(open('new_data.json'))['functions']
names={}
for f in d:
    m=f['mangled_name']; a=f['og_addr']
    if a=='?' or not m.startswith('?') or m.startswith('??'): continue
    parts=m[1:].split('@@')[0].split('@')
    names[a.lower()]='::'.join(reversed(parts))
# csv
rows=list(csv.reader(open('og_function_data_v105.csv')))
n=0
for r in rows:
    a=r[1].lower()
    if a in names and r[0]!=names[a]: r[0]=names[a]; n+=1
s=io.StringIO(); w=csv.writer(s,lineterminator='\n'); w.writerows(rows)
open('og_function_data_v105.csv','w').write(s.getvalue()); print('csv',n)
p='../ida/functions_data.json'; t=open(p).read(); n=0
def rep(m):
    global n
    a=m.group(3).lower()
    if a in names and names[a]!=m.group(1): n+=1; return m.group(0).replace('"name": "%s"'%m.group(1),'"name": "%s"'%names[a],1)
    return m.group(0)
t=re.sub(r'"name": "([^"]*)",(\s*"v96f_address": [^,]*,\s*"v105_address": ")(0x[0-9a-f]+)"',rep,t)
open(p,'w').write(t); print('json',n)
