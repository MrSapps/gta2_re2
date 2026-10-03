.att_syntax
"?TryCreateRoadblockAt_577370@Police_7B8@@QAEXEEH@Z":
.global "?TryCreateRoadblockAt_577370@Police_7B8@@QAEXEEH@Z"
.L_0x577370_1:
push %ebx
push %ebp
push %esi
mov %ecx,%esi
xor %bl,%bl
push %edi
mov 0x654(%esi),%eax
mov $1,%ecx
add $0xFFFFFFFD,%eax
cmp $3,%eax
ja .L_0x577370_0
jmp .L_0x577370_1
mov %ecx,"?gRoadblockGuardType_6FEDB8@@3HA"
jmp .L_0x577370_0
movl $3,"?gRoadblockGuardType_6FEDB8@@3HA"
jmp .L_0x577370_0
movl $4,"?gRoadblockGuardType_6FEDB8@@3HA"
.L_0x577370_0:
mov 0x1C(%esp),%eax
test %eax,%eax
jle .L_0x577370_2
cmp $2,%eax
jg .L_0x577370_2
mov %cl,%bl
.L_0x577370_2:
mov 0x18(%esp),%edi
push %ecx
mov 0x18(%esp),%ebp
mov %edi,%ecx
and $0xFF,%ecx
mov %esp,%eax
shl $0xE,%ecx
push %ecx
mov %ecx,(%eax)
mov %esp,%ecx
push %ebp
call "FromInt_45C4E0"
mov "?gMap_0x370_6F6268@@3PAVMap_0x370@@A",%ecx
lea 0x24(%esp),%edx
push %edx
call "?FindGroundZForCoord_4E5B60@Map_0x370@@QAE?AVFix16@@V2@0@Z"
mov (%eax),%eax
lea 0x664(%esi),%ecx
sar $0xE,%eax
mov %al,0x1C(%esp)
mov (%ecx),%al
test %bl,%bl
je .L_0x577370_3
test %al,%al
jne .L_0x577370_4
mov 0x1C(%esp),%edx
push $3
push %edx
push %edi
push %ebp
call "?CreateRoadblock_575FF0@PoliceRoadblock_A4@@QAEDEEEH@Z"
pop %edi
pop %esi
pop %ebp
pop %ebx
ret $0xC
.L_0x577370_4:
mov 0x708(%esi),%al
lea 0x708(%esi),%ecx
test %al,%al
jne .L_0x577370_5
jmp .L_0x577370_6
.L_0x577370_3:
test %al,%al
jne .L_0x577370_7
mov 0x1C(%esp),%edx
push $2
push %edx
push %edi
push %ebp
call "?CreateRoadblock_575FF0@PoliceRoadblock_A4@@QAEDEEEH@Z"
pop %edi
pop %esi
pop %ebp
pop %ebx
ret $0xC
.L_0x577370_7:
mov 0x708(%esi),%al
lea 0x708(%esi),%ecx
test %al,%al
jne .L_0x577370_5
.L_0x577370_6:
mov 0x1C(%esp),%eax
push $3
push %eax
push %edi
push %ebp
call "?CreateRoadblock_575FF0@PoliceRoadblock_A4@@QAEDEEEH@Z"
.L_0x577370_5:
pop %edi
pop %esi
pop %ebp
pop %ebx
ret $0xC

