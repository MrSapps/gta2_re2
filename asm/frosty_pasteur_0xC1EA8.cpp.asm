.att_syntax
"?LoadStringTbl_5121E0@frosty_pasteur_0xC1EA8@@QAEXG@Z":
.global "?LoadStringTbl_5121E0@frosty_pasteur_0xC1EA8@@QAEXG@Z"
sub $8,%esp
push %ebx
push %ebp
push %esi
mov 0x18(%esp),%esi
mov %ecx,%ebp
xor %edx,%edx
and $0xFFFF,%esi
push %edi
mov 0x1334C(%ebp),%ecx
mov %ebp,0x14(%esp)
mov %esi,0x10(%esp)
jbe .L_0x5121e0_0
.L_0x5121e0_1:
xor %eax,%eax
mov 8(%ecx),%al
add $9,%eax
mov %eax,%edi
add %eax,%edx
and $0xFFFFFFFE,%edi
add %eax,%ecx
cmp %esi,%edx
jb .L_0x5121e0_1
.L_0x5121e0_0:
push $0xFA0
call "?malloc_4FE4D0@Memory@@SGPAXI@Z"
mov %eax,%edi
mov $0x3E8,%ecx
xor %eax,%eax
mov %edi,0x13350(%ebp)
rep stos %eax,(%edi)
mov 0x10(%esp),%ecx
mov 0x1334C(%ebp),%esi
xor %ebx,%ebx
mov %eax,0x1C(%esp)
test %ecx,%ecx
jbe .L_0x5121e0_2
mov $4,%ebp
.L_0x5121e0_3:
lea 9(%esi),%edx
or $0xFFFFFFFF,%ecx
mov %edx,%edi
xor %eax,%eax
repne scas (%edi),%al
not %ecx
dec %ecx
push %ecx
mov "?gMap_0x370_6F6268@@3PAVMap_0x370@@A",%ecx
push %edx
call "?zone_idx_by_name_4DF050@Map_0x370@@QAEHPBDE@Z"
mov %ax,2(%esi)
mov 0x14(%esp),%eax
mov 0x1C(%esp),%edx
add $4,%ebp
mov 0x13350(%eax),%ecx
xor %eax,%eax
mov %esi,-4(%ecx,%ebp)
mov 8(%esi),%al
add $9,%eax
add %eax,%ebx
add %eax,%esi
mov 0x10(%esp),%eax
inc %edx
cmp %eax,%ebx
mov %edx,0x1C(%esp)
jb .L_0x5121e0_3
mov 0x14(%esp),%edx
mov 0x1C(%esp),%cx
pop %edi
pop %esi
mov 0x13350(%edx),%eax
pop %ebp
pop %ebx
mov %cx,(%eax)
add $8,%esp
ret $4
.L_0x5121e0_2:
mov 0x13350(%ebp),%edx
pop %edi
pop %esi
pop %ebp
mov %ax,(%edx)
pop %ebx
add $8,%esp
ret $4

