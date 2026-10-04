.att_syntax
"?BuildCarInfoContainer_5AA9A0@gtx_0x106C@@QAEXH@Z":
.global "?BuildCarInfoContainer_5AA9A0@gtx_0x106C@@QAEXH@Z"
sub $8,%esp
push %ebx
push %ebp
push %esi
push %edi
mov %ecx,%edi
xor %ebx,%ebx
push $0x404
mov %edi,0x18(%esp)
mov 0x58(%edi),%esi
xor %ebp,%ebp
mov %bl,0x16(%esp)
mov %bl,0x17(%esp)
call "??2@YAPAXI@Z"
mov %eax,%edx
add $4,%esp
test %edx,%edx
je .L_0x5aa9a0_0
mov $0x100,%ecx
xor %eax,%eax
mov %edx,%edi
mov %bl,0x400(%edx)
rep stos %eax,(%edi)
mov 0x14(%esp),%edi
jmp .L_0x5aa9a0_1
.L_0x5aa9a0_0:
xor %edx,%edx
.L_0x5aa9a0_1:
test %edx,%edx
mov %edx,0x5C(%edi)
jne .L_0x5aa9a0_2
push $0x335
push $0x62629C
push $0x20
call "?FatalError_4A38C0@@YAXHPBDHZZ"
add $0xC,%esp
.L_0x5aa9a0_2:
mov 0x1C(%esp),%eax
test %eax,%eax
jbe .L_0x5aa9a0_3
jmp .L_0x5aa9a0_4
.L_0x5aa9a0_11:
mov 0x14(%esp),%edi
.L_0x5aa9a0_4:
cmp $0x100,%ebx
jb .L_0x5aa9a0_5
push $0x339
push $0x62629C
push $0x22
call "?FatalError_4A38C0@@YAXHPBDHZZ"
add $0xC,%esp
.L_0x5aa9a0_5:
cmpb $0x80,2(%esi)
ja .L_0x5aa9a0_6
cmpb $0x80,3(%esi)
ja .L_0x5aa9a0_6
cmpb $0x40,4(%esi)
jbe .L_0x5aa9a0_7
.L_0x5aa9a0_6:
xor %eax,%eax
mov (%esi),%al
push %eax
push $0x33A
push $0x62629C
push $0x453
call "?FatalError_4A38C0@@YAXHPBDHZZ"
add $0x10,%esp
.L_0x5aa9a0_7:
mov 1(%esi),%al
test %al,%al
je .L_0x5aa9a0_8
cmp $1,%al
je .L_0x5aa9a0_8
xor %ecx,%ecx
mov (%esi),%cl
push %ecx
push $0x33B
push $0x62629C
push $0x453
call "?FatalError_4A38C0@@YAXHPBDHZZ"
add $0x10,%esp
.L_0x5aa9a0_8:
mov 0x5C(%edi),%eax
xor %edx,%edx
mov (%esi),%dl
mov %esi,(%eax,%edx,4)
mov 1(%esi),%al
test %al,%al
je .L_0x5aa9a0_9
mov 0x13(%esp),%cl
mov 0x12(%esp),%dl
add %cl,%dl
mov %al,0x13(%esp)
mov %dl,0x12(%esp)
.L_0x5aa9a0_9:
mov 0x12(%esp),%dl
xor %eax,%eax
mov 4(%esi),%al
mov %dl,1(%esi)
mov %eax,%edi
mov 0xE(%edi,%esi),%al
add $0xE,%edi
cmp $5,%al
jbe .L_0x5aa9a0_10
xor %ecx,%ecx
mov (%esi),%cl
push %ecx
push $0x34A
push $0x62629C
push $0x453
call "?FatalError_4A38C0@@YAXHPBDHZZ"
add $0x10,%esp
.L_0x5aa9a0_10:
xor %edx,%edx
mov (%edi,%esi),%dl
lea 1(%edx,%edx),%eax
add %edi,%eax
add %eax,%ebp
add %eax,%esi
mov 0x1C(%esp),%eax
inc %ebx
cmp %eax,%ebp
jb .L_0x5aa9a0_11
mov 0x14(%esp),%eax
pop %edi
pop %esi
pop %ebp
mov 0x5C(%eax),%ecx
mov %bl,0x400(%ecx)
pop %ebx
add $8,%esp
ret $4
.L_0x5aa9a0_3:
mov 0x5C(%edi),%edx
pop %edi
pop %esi
pop %ebp
mov %bl,0x400(%edx)
pop %ebx
add $8,%esp
ret $4

