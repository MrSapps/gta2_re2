.att_syntax
"?InsertLineBreaksAndGetNumLines_5B5BC0@text_0x14@@SGHPAGPBGHG@Z":
.global "?InsertLineBreaksAndGetNumLines_5B5BC0@text_0x14@@SGHPAGPBGHG@Z"
sub $0xC,%esp
mov 0x1C(%esp),%eax
push %ebx
mov 0x18(%esp),%ebx
push %ebp
push %esi
mov 0x1C(%esp),%esi
lea 0x1C(%esp),%ecx
push %edi
push %ecx
mov "?gGtx_0x106C_703DD4@@3PAVgtx_0x106C@@A",%ecx
movl $1,0x28(%esp)
mov %eax,0x24(%esp)
call "?GetSpaceCharWidth_5AA7B0@gtx_0x106C@@QAEGPAG@Z"
mov %ax,%dx
xor %ebp,%ebp
and $0xFFFF,%edx
xor %edi,%edi
cmp %bp,(%ebx)
mov %edx,0x10(%esp)
mov %ebp,0x20(%esp)
je .L_0x5b5bc0_0
jmp .L_0x5b5bc0_1
.L_0x5b5bc0_8:
mov 0x10(%esp),%edx
.L_0x5b5bc0_1:
mov (%ebx),%ax
mov %ax,(%esi)
mov (%ebx),%cx
mov %ecx,%eax
and $0xFFFF,%eax
cmp $0xA,%eax
je .L_0x5b5bc0_2
cmp $0x20,%eax
je .L_0x5b5bc0_3
cmp $0x23,%eax
je .L_0x5b5bc0_4
mov %ecx,0x14(%esp)
mov 0x2C(%esp),%ecx
lea 0x14(%esp),%edx
lea 0x18(%esp),%eax
mov %ecx,0x18(%esp)
mov "?gGtx_0x106C_703DD4@@3PAVgtx_0x106C@@A",%ecx
push %edx
push %eax
call "?GetFontWidth_5AA760@gtx_0x106C@@QAEGPAG0@Z"
and $0xFFFF,%eax
add %eax,%edi
jmp .L_0x5b5bc0_4
.L_0x5b5bc0_3:
add %edx,%edi
mov %ebx,0x20(%esp)
mov %esi,%ebp
jmp .L_0x5b5bc0_4
.L_0x5b5bc0_2:
mov 0x24(%esp),%eax
xor %edi,%edi
xor %ebp,%ebp
inc %eax
mov %edi,0x20(%esp)
mov %eax,0x24(%esp)
.L_0x5b5bc0_4:
cmp 0x28(%esp),%edi
jle .L_0x5b5bc0_5
mov 0x20(%esp),%eax
xor %edi,%edi
cmp %edi,%eax
je .L_0x5b5bc0_6
cmp %edi,%ebp
je .L_0x5b5bc0_6
mov %ebp,%esi
movw $0xA,(%ebp)
mov %eax,%ebx
mov %edi,0x20(%esp)
xor %ebp,%ebp
jmp .L_0x5b5bc0_7
.L_0x5b5bc0_6:
mov 0x2C(%esp),%edx
movw $0xA,(%esi)
mov (%ebx),%cx
lea 0x18(%esp),%eax
mov %ecx,0x18(%esp)
lea 0x14(%esp),%ecx
push %eax
push %ecx
mov "?gGtx_0x106C_703DD4@@3PAVgtx_0x106C@@A",%ecx
add $2,%esi
mov %edx,0x1C(%esp)
call "?GetFontWidth_5AA760@gtx_0x106C@@QAEGPAG0@Z"
mov (%ebx),%dx
mov %ax,%di
and $0xFFFF,%edi
mov %dx,(%esi)
.L_0x5b5bc0_7:
incl 0x24(%esp)
.L_0x5b5bc0_5:
add $2,%ebx
add $2,%esi
cmpw $0,(%ebx)
jne .L_0x5b5bc0_8
mov 0x24(%esp),%eax
movw $0,(%esi)
pop %edi
pop %esi
pop %ebp
pop %ebx
add $0xC,%esp
ret $0x10
.L_0x5b5bc0_0:
mov 0x24(%esp),%eax
mov %bp,(%esi)
pop %edi
pop %esi
pop %ebp
pop %ebx
add $0xC,%esp
ret $0x10

