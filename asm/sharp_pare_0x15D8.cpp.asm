.att_syntax
"?ReadTextures_5B92E0@sharp_pare_0x15D8@@QAEXXZ":
.global "?ReadTextures_5B92E0@sharp_pare_0x15D8@@QAEXXZ"
mov "?gGtx_0x106C_703DD4@@3PAVgtx_0x106C@@A",%eax
mov 0x3C(%eax),%edx
test %edx,%edx
je .L_0x5b92e0_0
push %ebx
push %ebp
push %esi
push %edi
xor %edi,%edi
movb $1,0x1001(%ecx)
mov %ecx,%ebp
xor %ebx,%ebx
.L_0x5b92e0_1:
mov %ebx,%esi
mov %ebx,%ecx
and $0xFFFFFFFC,%esi
and $3,%ecx
shl $6,%esi
add %ecx,%esi
mov "?gGtx_0x106C_703DD4@@3PAVgtx_0x106C@@A",%ecx
shl $6,%esi
mov 0x3C(%ecx),%eax
push $0
push %edi
add %eax,%esi
call "?get_phys_pal_5AA6F0@gtx_0x106C@@QAEGG@Z"
and $0xFFFF,%eax
push %eax
push %esi
push $0x40
push $0x40
call unknown_func0
mov %eax,(%ebp)
inc %edi
inc %ebx
add $4,%ebp
cmp $0x400,%di
jb .L_0x5b92e0_1
pop %edi
pop %esi
pop %ebp
pop %ebx
.L_0x5b92e0_0:
ret

