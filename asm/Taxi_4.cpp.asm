.att_syntax
"?GetTaxiNear_457BF0@Taxi_4@@QAEPAVCar_BC@@VFix16@@0@Z":
.global "?GetTaxiNear_457BF0@Taxi_4@@QAEPAVCar_BC@@VFix16@@0@Z"
sub $0xC,%esp
push %esi
mov (%ecx),%esi
push %edi
xor %edi,%edi
test %esi,%esi
movl $0x61A7C000,8(%esp)
je .L_0x457bf0_0
push %ebx
mov 0x20(%esp),%ebx
push %ebp
mov 0x20(%esp),%ebp
.L_0x457bf0_5:
mov (%esi),%eax
mov 0x50(%eax),%eax
mov 0x14(%eax),%ecx
mov 0x18(%eax),%eax
sub %ebx,%eax
sub %ebp,%ecx
test %eax,%eax
mov %ecx,0x14(%esp)
jg .L_0x457bf0_1
neg %eax
.L_0x457bf0_1:
test %ecx,%ecx
mov %eax,0x24(%esp)
jle .L_0x457bf0_2
mov %ecx,0x20(%esp)
jmp .L_0x457bf0_3
.L_0x457bf0_2:
lea 0x20(%esp),%ecx
push %ecx
lea 0x18(%esp),%ecx
call "?Negate_4086A0@Fix16@@QBE?AV1@XZ"
.L_0x457bf0_3:
lea 0x24(%esp),%edx
lea 0x20(%esp),%eax
push %edx
lea 0x1C(%esp),%ecx
push %eax
push %ecx
call "?Max_44E540@Fix16@@SG?AV1@AAV1@0@Z"
mov (%eax),%eax
mov 0x10(%esp),%ecx
cmp %ecx,%eax
jge .L_0x457bf0_4
mov (%esi),%edi
cmpl $5,0x88(%edi)
je .L_0x457bf0_4
mov %eax,0x10(%esp)
.L_0x457bf0_4:
mov 4(%esi),%esi
test %esi,%esi
jne .L_0x457bf0_5
pop %ebp
mov %edi,%eax
pop %ebx
pop %edi
pop %esi
add $0xC,%esp
ret $8
.L_0x457bf0_0:
mov %edi,%eax
pop %edi
pop %esi
add $0xC,%esp
ret $8

