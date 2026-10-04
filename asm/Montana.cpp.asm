.att_syntax
"?AddSprite_5C5CF0@Montana_4@@QAEXPAVSprite@@@Z":
.global "?AddSprite_5C5CF0@Montana_4@@QAEXPAVSprite@@@Z"
sub $8,%esp
mov 0xC(%esp),%edx
mov (%ecx),%eax
push %ebx
push %ebp
mov 0x28(%edx),%ebx
push %esi
cmp $9,%ebx
push %edi
mov %ecx,0x14(%esp)
jle .L_0x5c5cf0_0
cmp $0x22,%ebx
jne .L_0x5c5cf0_1
mov "?kFp96_705B80@@3VFix16@@A",%edx
jmp .L_0x5c5cf0_2
.L_0x5c5cf0_1:
mov 0x1C(%edx),%edx
jmp .L_0x5c5cf0_2
.L_0x5c5cf0_0:
mov "?kFpZero_705AC4@@3VFix16@@A",%edx
.L_0x5c5cf0_2:
test %eax,%eax
mov %edx,0x10(%esp)
je .L_0x5c5cf0_3
.L_0x5c5cf0_11:
mov (%eax),%edx
mov %eax,%ebp
mov 0x28(%edx),%esi
cmp $9,%esi
jle .L_0x5c5cf0_4
mov 0x1C(%edx),%edi
jmp .L_0x5c5cf0_5
.L_0x5c5cf0_4:
mov "?kFpZero_705AC4@@3VFix16@@A",%edi
.L_0x5c5cf0_5:
mov 0x10(%esp),%ecx
cmp %edi,%ecx
jge .L_0x5c5cf0_6
mov 4(%eax),%eax
jmp .L_0x5c5cf0_7
.L_0x5c5cf0_6:
jne .L_0x5c5cf0_8
cmp %esi,%ebx
jge .L_0x5c5cf0_9
mov 4(%eax),%eax
jmp .L_0x5c5cf0_7
.L_0x5c5cf0_9:
cmp 0x1C(%esp),%edx
je .L_0x5c5cf0_10
.L_0x5c5cf0_8:
mov 8(%eax),%eax
.L_0x5c5cf0_7:
test %eax,%eax
jne .L_0x5c5cf0_11
mov 0x14(%esp),%ecx
.L_0x5c5cf0_14:
mov "?gMontana_2EE4_705BBC@@3PAVMontana_2EE4@@A",%esi
mov 0x2EE0(%esi),%edx
cmp $0x3E8,%edx
jb .L_0x5c5cf0_12
xor %eax,%eax
jmp .L_0x5c5cf0_13
.L_0x5c5cf0_3:
mov 0x1C(%esp),%edi
mov 0x1C(%esp),%ebp
jmp .L_0x5c5cf0_14
.L_0x5c5cf0_12:
lea (%edx,%edx,2),%eax
inc %edx
mov %edx,0x2EE0(%esi)
lea (%esi,%eax,4),%eax
.L_0x5c5cf0_13:
mov 0x1C(%esp),%edx
xor %esi,%esi
mov %edx,(%eax)
mov %esi,4(%eax)
mov %esi,8(%eax)
mov (%ecx),%ebx
cmp %esi,%ebx
jne .L_0x5c5cf0_15
pop %edi
pop %esi
pop %ebp
mov %eax,(%ecx)
pop %ebx
add $8,%esp
ret $4
.L_0x5c5cf0_15:
mov 0x10(%esp),%ecx
cmp %edi,%ecx
jl .L_0x5c5cf0_16
jne .L_0x5c5cf0_17
mov (%ebp),%ecx
mov 0x28(%edx),%edx
cmp 0x28(%ecx),%edx
jl .L_0x5c5cf0_16
.L_0x5c5cf0_17:
pop %edi
mov %eax,8(%ebp)
pop %esi
pop %ebp
pop %ebx
add $8,%esp
ret $4
.L_0x5c5cf0_16:
mov %eax,4(%ebp)
.L_0x5c5cf0_10:
pop %edi
pop %esi
pop %ebp
pop %ebx
add $8,%esp
ret $4

