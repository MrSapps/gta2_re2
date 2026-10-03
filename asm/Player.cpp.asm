.att_syntax
"?AddCarToHistory_5645B0@Player@@QAEXPAVCar_BC@@@Z":
.global "?AddCarToHistory_5645B0@Player@@QAEXPAVCar_BC@@@Z"
mov "?bStartNetworkGame_7081F0@@3HA",%eax
push %ebx
push %esi
lea 0x54(%ecx),%esi
push %edi
mov %esi,%edi
test %eax,%eax
jne .L_0x5645b0_0
mov 0x10(%esp),%ebx
push $0
push %ebx
call "?PromoteCarInHistory_564610@Player@@QAE_NPAVCar_BC@@_N@Z"
test %al,%al
jne .L_0x5645b0_0
.L_0x5645b0_2:
cmpl $0,(%edi)
je .L_0x5645b0_1
add $4,%edi
inc %al
cmp $3,%al
jb .L_0x5645b0_2
mov (%esi),%ecx
call "?MarkRecycled_443E80@Car_BC@@QAEXXZ"
mov 4(%esi),%ecx
mov 8(%esi),%edx
mov %esi,%eax
mov %ecx,(%eax)
mov %edx,4(%eax)
mov %ebx,8(%esi)
.L_0x5645b0_0:
pop %edi
pop %esi
pop %ebx
ret $4
.L_0x5645b0_1:
mov %ebx,(%edi)
pop %edi
pop %esi
pop %ebx
ret $4

.att_syntax
"?PushCarInfo_564680@Player@@QAEXPAVCar_BC@@@Z":
.global "?PushCarInfo_564680@Player@@QAEXPAVCar_BC@@@Z"
push %ecx
mov "?bStartNetworkGame_7081F0@@3HA",%edx
push %esi
test %edx,%edx
push %edi
lea 0x54(%ecx),%eax
jne .L_0x564680_0
mov 0x10(%esp),%esi
xor %dl,%dl
mov %dl,8(%esp)
.L_0x564680_2:
cmp %esi,(%eax)
je .L_0x564680_1
add $4,%eax
inc %dl
cmp $2,%dl
jb .L_0x564680_2
mov %dl,8(%esp)
mov (%eax),%esi
mov 8(%esp),%edx
and $0xFF,%edx
lea 0x54(%ecx,%edx,4),%ecx
mov (%ecx),%edx
cmp %esi,%edx
jne .L_0x564680_0
movl $0,(%ecx)
.L_0x564680_0:
pop %edi
pop %esi
pop %ecx
ret $4
.L_0x564680_1:
mov 4(%eax),%ecx
lea 4(%eax),%esi
cmp $2,%dl
mov %dl,8(%esp)
mov %ecx,(%eax)
jae .L_0x564680_3
mov 8(%esp),%ecx
mov $2,%edx
and $0xFF,%ecx
mov %eax,%edi
sub %ecx,%edx
mov %edx,%ecx
rep movsl (%esi),(%edi)
lea (%eax,%edx,4),%eax
.L_0x564680_3:
pop %edi
movl $0,(%eax)
pop %esi
pop %ecx
ret $4

