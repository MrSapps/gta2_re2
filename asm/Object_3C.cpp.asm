.att_syntax
"?CleanupSpriteList_5A7080@struct_4@@QAEXXZ":
.global "?CleanupSpriteList_5A7080@struct_4@@QAEXXZ"
push %ebx
mov %ecx,%ebx
push %esi
push %edi
mov (%ebx),%esi
xor %edi,%edi
test %esi,%esi
je .L_0x5a7080_0
.L_0x5a7080_6:
mov (%esi),%ecx
mov 0x30(%ecx),%eax
cmp $1,%eax
je .L_0x5a7080_1
cmp $3,%eax
jle .L_0x5a7080_2
cmp $5,%eax
jg .L_0x5a7080_2
.L_0x5a7080_1:
mov 8(%ecx),%ecx
cmpl $0xC5,0x18(%ecx)
je .L_0x5a7080_3
call "?sub_525AC0@Object_2C@@QAEDXZ"
test %al,%al
je .L_0x5a7080_2
.L_0x5a7080_3:
mov (%esi),%eax
mov 8(%eax),%ecx
push %ecx
mov "?gObject_5C_6F8F84@@3PAVObject_5C@@A",%ecx
call "?RemoveAndFree_52A610@Object_5C@@QAEXPAVObject_2C@@@Z"
test %edi,%edi
je .L_0x5a7080_4
mov 4(%esi),%edx
mov %edx,4(%edi)
mov "?gSprite_18_Pool_703B80@@3PAVSprite_18_Pool@@A",%eax
mov (%eax),%ecx
mov %ecx,4(%esi)
mov %esi,(%eax)
mov 4(%edi),%esi
jmp .L_0x5a7080_5
.L_0x5a7080_2:
mov %esi,%edi
mov 4(%esi),%esi
jmp .L_0x5a7080_5
.L_0x5a7080_4:
mov "?gSprite_18_Pool_703B80@@3PAVSprite_18_Pool@@A",%ecx
mov 4(%esi),%eax
mov (%ecx),%edx
mov %edx,4(%esi)
mov %esi,(%ecx)
mov %eax,%esi
mov %eax,(%ebx)
.L_0x5a7080_5:
test %esi,%esi
jne .L_0x5a7080_6
.L_0x5a7080_0:
pop %edi
pop %esi
pop %ebx
ret

