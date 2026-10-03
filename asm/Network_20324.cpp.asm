.att_syntax
"?EnumerateMaps_51BFA0@Network_20324@@QAEXXZ":
.global "?EnumerateMaps_51BFA0@Network_20324@@QAEXXZ"
mov $0x204CC,%eax
call "__alloca_probe"
push %ebx
push %ebp
push %esi
mov %ecx,0x14(%esp)
push %edi
mov $0x50,%ecx
xor %eax,%eax
lea 0x124(%esp),%edi
rep stos %eax,(%edi)
mov $0x62038C,%edi
or $0xFFFFFFFF,%ecx
repne scas (%edi),%al
not %ecx
sub %ecx,%edi
lea 0x20(%esp),%edx
mov %ecx,%eax
mov %edi,%esi
mov %edx,%edi
lea 0x20(%esp),%edx
shr $2,%ecx
rep movsl (%esi),(%edi)
mov %eax,%ecx
xor %eax,%eax
and $3,%ecx
rep movsb (%esi),(%edi)
mov $0x5FE8E0,%edi
or $0xFFFFFFFF,%ecx
repne scas (%edi),%al
not %ecx
sub %ecx,%edi
mov %edi,%esi
mov %ecx,%ebx
mov %edx,%edi
or $0xFFFFFFFF,%ecx
repne scas (%edi),%al
mov %ebx,%ecx
dec %edi
shr $2,%ecx
rep movsl (%esi),(%edi)
mov %ebx,%ecx
lea 0x124(%esp),%eax
and $3,%ecx
push %eax
rep movsb (%esi),(%edi)
lea 0x24(%esp),%ecx
xor %esi,%esi
push %ecx
mov %esi,0x18(%esp)
call unknown_func0
mov %eax,%ebx
cmp $0xFFFFFFFF,%ebx
je .L_0x51bfa0_0
lea 0x150(%esp),%edi
or $0xFFFFFFFF,%ecx
xor %eax,%eax
lea 0xB8C(%esp),%edx
repne scas (%edi),%al
not %ecx
sub %ecx,%edi
movl $1,0x10(%esp)
mov %ecx,%eax
mov %edi,%esi
mov %edx,%edi
shr $2,%ecx
rep movsl (%esi),(%edi)
mov %eax,%ecx
and $3,%ecx
rep movsb (%esi),(%edi)
lea 0x124(%esp),%ecx
push %ecx
push %ebx
call unknown_func1
test %eax,%eax
je .L_0x51bfa0_1
lea 0x10A4(%esp),%ebp
.L_0x51bfa0_2:
cmpl $0x64,0x10(%esp)
jae .L_0x51bfa0_1
lea 0x150(%esp),%edi
or $0xFFFFFFFF,%ecx
xor %eax,%eax
repne scas (%edi),%al
not %ecx
sub %ecx,%edi
mov 0x10(%esp),%eax
mov %ecx,%edx
mov %edi,%esi
mov %ebp,%edi
add $0x518,%ebp
shr $2,%ecx
rep movsl (%esi),(%edi)
mov %edx,%ecx
and $3,%ecx
inc %eax
mov %eax,0x10(%esp)
lea 0x124(%esp),%eax
push %eax
push %ebx
rep movsb (%esi),(%edi)
call unknown_func1
test %eax,%eax
jne .L_0x51bfa0_2
.L_0x51bfa0_1:
push %ebx
call unknown_func2
mov 0x10(%esp),%esi
.L_0x51bfa0_0:
test %esi,%esi
jbe .L_0x51bfa0_3
mov 0x18(%esp),%ecx
mov 0x5FE04C,%ebp
add $4,%ecx
lea 0x984(%esp),%ebx
mov %ecx,0x1C(%esp)
mov %esi,0x14(%esp)
.L_0x51bfa0_9:
mov $0x62038C,%edi
or $0xFFFFFFFF,%ecx
xor %eax,%eax
lea 0x20(%esp),%edx
repne scas (%edi),%al
not %ecx
sub %ecx,%edi
mov %ecx,%eax
mov %edi,%esi
mov %edx,%edi
lea 0x20(%esp),%edx
shr $2,%ecx
rep movsl (%esi),(%edi)
mov %eax,%ecx
xor %eax,%eax
and $3,%ecx
rep movsb (%esi),(%edi)
lea 0x208(%ebx),%edi
or $0xFFFFFFFF,%ecx
repne scas (%edi),%al
not %ecx
sub %ecx,%edi
mov %edi,%esi
mov %edx,%edi
mov %ecx,%edx
or $0xFFFFFFFF,%ecx
repne scas (%edi),%al
mov %edx,%ecx
dec %edi
shr $2,%ecx
rep movsl (%esi),(%edi)
mov %edx,%ecx
lea 0x20(%esp),%eax
and $3,%ecx
push %eax
rep movsb (%esi),(%edi)
lea -0x208(%ebx),%esi
push $0x103
push %esi
push $0x67DC88
push $0x5FE8F4
push $0x5FE8E8
call unknown_func3
lea 0x20(%esp),%ecx
lea -0x104(%ebx),%edi
push %ecx
push $0x103
push %edi
push $0x67DC88
push $0x5FE8FC
push $0x5FE8E8
call unknown_func3
lea 0x20(%esp),%edx
push %edx
push $0x103
push %ebx
push $0x67DC88
push $0x5FE904
push $0x5FE8E8
call unknown_func3
lea 0x20(%esp),%eax
lea 0x104(%ebx),%ecx
push %eax
push $0x103
push %ecx
push $0x67DC88
push $0x5FE90C
push $0x5FE8E8
call unknown_func3
lea 0x20(%esp),%edx
push %edx
push $2
push $"?gTmpBuffer_67C598@@3PADA"
push $0x67DC88
push $0x5FE918
push $0x5FE8E8
call unknown_func3
push $"?gTmpBuffer_67C598@@3PADA"
call "_atoi"
mov %eax,0x30C(%ebx)
push $0x623DFC
call "__chdir"
add $8,%esp
push %esi
call unknown_func4
cmp $0xFFFFFFFF,%eax
je .L_0x51bfa0_4
push %edi
call unknown_func4
cmp $0xFFFFFFFF,%eax
je .L_0x51bfa0_5
push %ebx
call unknown_func4
cmp $0xFFFFFFFF,%eax
je .L_0x51bfa0_6
mov 0x1C(%esp),%eax
push %eax
call unknown_func5
mov 0x18(%esp),%edx
mov 0x1FD64(%edx),%eax
lea (%eax,%eax,8),%ecx
lea (%ecx,%ecx,8),%ecx
lea (%eax,%ecx,2),%eax
mov $0x146,%ecx
lea 4(%edx,%eax,8),%edi
rep movsl (%esi),(%edi)
incl 0x1FD64(%edx)
jmp .L_0x51bfa0_7
.L_0x51bfa0_6:
push %ebx
jmp .L_0x51bfa0_8
.L_0x51bfa0_5:
push %edi
jmp .L_0x51bfa0_8
.L_0x51bfa0_4:
push %esi
.L_0x51bfa0_8:
lea 0x208(%ebx),%eax
push %eax
call "?ShowUnableToOpenFileError_51CAD0@Network_20324@@QAEXPBD0@Z"
.L_0x51bfa0_7:
push $0x623DF8
call "__chdir"
mov 0x20(%esp),%edx
mov 0x18(%esp),%eax
add $4,%esp
add $0x518,%edx
add $0x518,%ebx
dec %eax
mov %edx,0x1C(%esp)
mov %eax,0x14(%esp)
jne .L_0x51bfa0_9
mov 0x10(%esp),%edi
test %edi,%edi
jbe .L_0x51bfa0_3
dec %edi
mov %edi,0x14(%esp)
.L_0x51bfa0_12:
xor %esi,%esi
xor %ebp,%ebp
test %edi,%edi
jbe .L_0x51bfa0_3
xor %eax,%eax
.L_0x51bfa0_11:
lea (%eax,%eax,8),%ecx
lea (%ecx,%ecx,8),%ecx
lea (%eax,%ecx,2),%edx
mov 0x18(%esp),%eax
lea (%eax,%edx,8),%ebx
lea 0x828(%ebx),%ecx
lea 0x310(%ebx),%edx
push %ecx
push %edx
call "__strcmpi"
add $8,%esp
test %eax,%eax
jle .L_0x51bfa0_10
lea 4(%ebx),%eax
mov $0x146,%ecx
mov %eax,%esi
lea 0x264(%esp),%edi
rep movsl (%esi),(%edi)
lea 0x51C(%ebx),%edx
mov $0x146,%ecx
mov %edx,%esi
mov %eax,%edi
rep movsl (%esi),(%edi)
mov $0x146,%ecx
lea 0x264(%esp),%esi
mov %edx,%edi
rep movsl (%esi),(%edi)
mov 0x14(%esp),%edi
mov $1,%esi
.L_0x51bfa0_10:
inc %ebp
mov %ebp,%eax
and $0xFFFF,%eax
cmp %edi,%eax
jb .L_0x51bfa0_11
cmp $1,%esi
je .L_0x51bfa0_12
.L_0x51bfa0_3:
pop %edi
pop %esi
pop %ebp
pop %ebx
add $0x204CC,%esp
ret

.att_syntax
"?SetGameSpeedTextLabelAndSlider_51CFC0@Network_20324@@QAEXJPAUHWND__@@@Z":
.global "?SetGameSpeedTextLabelAndSlider_51CFC0@Network_20324@@QAEXJPAUHWND__@@@Z"
push %esi
mov 8(%esp),%esi
push %edi
mov 0x10(%esp),%edi
push %esi
push $1
push $0x405
push $0x407
push %edi
call unknown_func0
mov %esi,%eax
sub $0,%eax
je .L_0x51cfc0_0
dec %eax
je .L_0x51cfc0_1
dec %eax
jne .L_0x51cfc0_2
push $0x623D80
call "?GetString_519A00@@YGPADPBD@Z"
push %eax
push $0x408
push %edi
call unknown_func1
pop %edi
pop %esi
ret $8
.L_0x51cfc0_1:
push $0x623D78
call "?GetString_519A00@@YGPADPBD@Z"
push %eax
push $0x408
push %edi
call unknown_func1
pop %edi
pop %esi
ret $8
.L_0x51cfc0_0:
push $0x623D70
call "?GetString_519A00@@YGPADPBD@Z"
push %eax
push $0x408
push %edi
call unknown_func1
pop %edi
pop %esi
ret $8
.L_0x51cfc0_2:
mov 0xC(%esp),%eax
push %eax
push $0x408
push %edi
call unknown_func1
pop %edi
pop %esi
ret $8

