.att_syntax
"?DivideInt_53E860@Fix16@@QBE?AV1@ABH@Z":
.global "?DivideInt_53E860@Fix16@@QBE?AV1@ABH@Z"
mov (%ecx),%eax
mov 8(%esp),%ecx
cltd
idivl (%ecx)
mov 4(%esp),%ecx
mov %eax,(%ecx)
mov %ecx,%eax
ret $8

