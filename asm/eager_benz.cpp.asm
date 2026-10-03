.att_syntax
"?OnPedKilled_592660@eager_benz@@QAEXPAVPed@@0@Z":
.global "?OnPedKilled_592660@eager_benz@@QAEXPAVPed@@0@Z"
.L_0x592660_9:
sub $0x10,%esp
push %ebx
mov 0x1C(%esp),%ebx
push %ebp
push %esi
mov %ecx,%esi
mov %esi,0x14(%esp)
mov 0x368(%esi),%eax
mov 0x6BC(%eax),%ecx
mov 0x1B0(%ebx),%eax
mov %ecx,0x18(%esp)
mov 0x1AC(%ebx),%ecx
sar $0xE,%eax
sar $0xE,%ecx
push %eax
push %ecx
mov "?gMap_0x370_6F6268@@3PAVMap_0x370@@A",%ecx
call "?first_zone_by_pos_4DF6A0@Map_0x370@@QAEPAVgmp_map_zone@@EE@Z"
mov 0x20(%esp),%ebp
mov 0x17C(%ebp),%ecx
test %ecx,%ecx
je .L_0x592660_0
movzbw 1(%ecx),%dx
jmp .L_0x592660_1
.L_0x592660_0:
mov 0x19C(%ebp),%ecx
test %ecx,%ecx
je .L_0x592660_2
movzbw 1(%ecx),%dx
jmp .L_0x592660_1
.L_0x592660_2:
or $0xFFFFFFFF,%edx
.L_0x592660_1:
mov 0x16C(%ebx),%ecx
test %ecx,%ecx
je .L_0x592660_3
mov 0x84(%ecx),%ecx
jmp .L_0x592660_4
.L_0x592660_3:
mov $0x57,%ecx
.L_0x592660_4:
push %edi
push %eax
mov 0x290(%ebp),%eax
push %ecx
movsbw 0x244(%ebp),%cx
push %eax
push %ecx
push %edx
mov 0x240(%ebp),%edx
push %edx
push $0x57
push $0
lea 0x1A8(%esi),%ecx
call "?ProcessBonusEvent_4320D0@sad_mirzakhani@@QAEXFHHFFHHPAVgmp_map_zone@@@Z"
mov "?gpRng_67AB34@@3PAVrng@@A",%eax
mov 0x78(%esi),%edx
mov (%eax),%edi
mov %edi,%ecx
sub %edx,%ecx
cmp $0xF,%ecx
jbe .L_0x592660_5
movw $1,0x7C(%esi)
jmp .L_0x592660_6
.L_0x592660_5:
incw 0x7C(%esi)
.L_0x592660_6:
mov 0x18(%esp),%eax
xor %esi,%esi
movb $0,0x15(%esp)
incw 0x86(%eax)
mov %edi,0x78(%eax)
mov 0x168(%ebp),%ecx
mov "?bStartNetworkGame_7081F0@@3HA",%eax
test %ecx,%ecx
setne 0x17(%esp)
test %eax,%eax
je .L_0x592660_7
push $2
mov %ebp,%ecx
call "?IsField238_45EDE0@Ped@@QAE_NH@Z"
test %al,%al
je .L_0x592660_7
mov 0x15C(%ebp),%eax
test %eax,%eax
je .L_0x592660_7
mov 0x290(%ebp),%eax
dec %eax
cmp $0x13,%eax
ja .L_0x592660_8
xor %edx,%edx
mov 0x592D44(%eax),%dl
jmp .L_0x592660_9
mov $0x7D0,%esi
.L_0x592660_8:
mov 0x24(%esp),%bl
.L_0x592660_24:
mov "?bIsFrench_67D53C@@3_NA",%al
mov $1,%cl
test %al,%al
mov %cl,0x16(%esp)
je .L_0x592660_10
mov 0x240(%ebp),%eax
cmp $0x18,%eax
je .L_0x592660_11
cmp $0x1D,%eax
je .L_0x592660_11
cmp $0x25,%eax
je .L_0x592660_11
mov 0x13(%esp),%al
test %al,%al
jne .L_0x592660_11
mov 0x28(%esp),%al
test %al,%al
jne .L_0x592660_11
test %bl,%bl
je .L_0x592660_10
.L_0x592660_11:
xor %cl,%cl
mov %cl,0x16(%esp)
.L_0x592660_10:
test %esi,%esi
jbe .L_0x592660_12
mov 0x18(%esp),%edx
xor %eax,%eax
mov 0x75(%edx),%al
mov %eax,%edi
mov "?bExplodingScoresOff_67D4FB@@3_NA",%al
imul %esi,%edi
test %al,%al
jne .L_0x592660_13
mov 0x17(%esp),%al
test %al,%al
je .L_0x592660_13
test %cl,%cl
je .L_0x592660_14
mov 0x368(%edx),%eax
cmpb $0,(%eax)
je .L_0x592660_13
mov %edi,%esi
mov 0x1B4(%ebp),%eax
imul 0x1C(%esp),%esi
mov 0x1B0(%ebp),%ecx
mov 0x1AC(%ebp),%edx
push %esi
push %eax
push %ecx
mov "?gExplodingScorePool@@3PAVExplodingScorePool@@A",%ecx
push %edx
call "?PushScore_596890@ExplodingScorePool@@QAEXVFix16@@00I@Z"
mov 0x16(%esp),%cl
mov 0x24(%esp),%ebp
mov 0x18(%esp),%edx
.L_0x592660_13:
test %cl,%cl
je .L_0x592660_14
mov 0x18(%esp),%ecx
mov 0x368(%ecx),%eax
mov 0x6BC(%eax),%edx
lea 0x2D4(%eax),%ecx
imul %edi,%edx
push %edx
call "?AddCash_592620@eager_benz@@QAEXH@Z"
mov 0x18(%esp),%edx
.L_0x592660_14:
mov 0x75(%edx),%al
cmp $5,%al
jae .L_0x592660_12
inc %al
mov %al,0x75(%edx)
.L_0x592660_12:
mov 0x18(%esp),%esi
mov "?gShooey_CC_67A4B8@@3PAVShooey_CC@@A",%ecx
mov 0x368(%esi),%eax
push %eax
push %ebp
call "?ShouldReportPedCrime_485140@Shooey_CC@@QAEDPAVPed@@PAVPlayer@@@Z"
test %al,%al
pop %edi
je .L_0x592660_15
mov 0x11(%esp),%al
test %al,%al
je .L_0x592660_16
mov 0x368(%esi),%eax
cmpl $2,0x68(%eax)
jne .L_0x592660_17
mov 0x2C8(%eax),%eax
mov "?gShooey_CC_67A4B8@@3PAVShooey_CC@@A",%ecx
push %eax
push $9
call "?ReportCrimeForPed@Shooey_CC@@QAEXIPAVPed@@@Z"
pop %esi
pop %ebp
pop %ebx
add $0x10,%esp
ret $8
mov $0x3E8,%esi
jmp .L_0x592660_8
mov $0x2710,%esi
jmp .L_0x592660_8
mov $0x1388,%esi
jmp .L_0x592660_8
.L_0x592660_7:
mov 0x17C(%ebp),%ecx
test %ecx,%ecx
je .L_0x592660_18
mov 0x17C(%ebx),%eax
test %eax,%eax
je .L_0x592660_19
cmp %ecx,%eax
je .L_0x592660_18
.L_0x592660_19:
movb $1,0x15(%esp)
.L_0x592660_18:
mov 0x19C(%ebp),%ecx
test %ecx,%ecx
je .L_0x592660_20
mov 0x17C(%ebx),%eax
test %eax,%eax
je .L_0x592660_21
cmp %ecx,%eax
je .L_0x592660_20
.L_0x592660_21:
movb $1,0x15(%esp)
.L_0x592660_20:
mov 0x240(%ebp),%eax
add $0xFFFFFFF1,%eax
cmp $0x1D,%eax
ja .L_0x592660_22
xor %ecx,%ecx
mov 0x592D78(%eax),%cl
jmp .L_0x592660_9
movb $1,0x14(%esp)
movb $0,0x13(%esp)
movb $0,0x28(%esp)
xor %bl,%bl
jmp .L_0x592660_23
movb $1,0x28(%esp)
movb $0,0x13(%esp)
.L_0x592660_26:
xor %bl,%bl
.L_0x592660_27:
movb $0,0x14(%esp)
.L_0x592660_23:
xor %cl,%cl
.L_0x592660_29:
xor %al,%al
.L_0x592660_30:
mov 0x290(%ebp),%edx
lea -1(%edx),%edi
cmp $0x13,%edi
ja .L_0x592660_24
xor %edx,%edx
mov 0x592DB4(%edi),%dl
jmp .L_0x592660_9
mov 0x15(%esp),%dl
test %dl,%dl
je .L_0x592660_25
mov $0x32,%esi
jmp .L_0x592660_24
movb $1,0x13(%esp)
movb $0,0x28(%esp)
jmp .L_0x592660_26
mov $1,%bl
movb $0,0x13(%esp)
movb $0,0x28(%esp)
jmp .L_0x592660_27
mov 0x18(%esp),%eax
mov %edi,%edx
xor %bl,%bl
movb $0,0x14(%esp)
mov 0x80(%eax),%ecx
movb $0,0x13(%esp)
sub %ecx,%edx
movb $0,0x28(%esp)
cmp $0xF,%edx
mov $0x64,%esi
jbe .L_0x592660_28
movw $1,0x84(%eax)
mov %edi,0x80(%eax)
jmp .L_0x592660_24
mov $1,%cl
movb $0,0x14(%esp)
movb $0,0x13(%esp)
movb $0,0x28(%esp)
xor %bl,%bl
jmp .L_0x592660_29
xor %bl,%bl
mov $1,%al
movb $0,0x14(%esp)
movb $0,0x13(%esp)
movb $0,0x28(%esp)
xor %cl,%cl
jmp .L_0x592660_30
.L_0x592660_22:
movb $0,0x14(%esp)
movb $0,0x13(%esp)
movb $0,0x28(%esp)
xor %bl,%bl
jmp .L_0x592660_23
.L_0x592660_28:
incw 0x84(%eax)
mov %edi,0x80(%eax)
jmp .L_0x592660_24
.L_0x592660_25:
mov 0x14(%esp),%dl
test %dl,%dl
je .L_0x592660_31
mov $0xC8,%esi
jmp .L_0x592660_24
.L_0x592660_31:
test %bl,%bl
je .L_0x592660_32
mov $0x1F4,%esi
jmp .L_0x592660_24
.L_0x592660_32:
mov 0x28(%esp),%dl
test %dl,%dl
je .L_0x592660_33
mov $0x12C,%esi
jmp .L_0x592660_24
.L_0x592660_33:
mov 0x13(%esp),%dl
test %dl,%dl
je .L_0x592660_34
mov $0x190,%esi
jmp .L_0x592660_24
.L_0x592660_34:
test %cl,%cl
je .L_0x592660_35
mov $0x28,%esi
jmp .L_0x592660_24
.L_0x592660_35:
neg %al
sbb %eax,%eax
and $0x14,%eax
add $0x14,%eax
mov %eax,%esi
jmp .L_0x592660_24
mov 0x15(%esp),%dl
test %dl,%dl
je .L_0x592660_36
mov $0x14,%esi
jmp .L_0x592660_24
.L_0x592660_36:
mov 0x14(%esp),%dl
test %dl,%dl
je .L_0x592660_37
mov $0x64,%esi
jmp .L_0x592660_24
.L_0x592660_37:
test %bl,%bl
je .L_0x592660_38
mov $0xFA,%esi
jmp .L_0x592660_24
.L_0x592660_38:
mov 0x28(%esp),%dl
test %dl,%dl
je .L_0x592660_39
mov $0x96,%esi
jmp .L_0x592660_24
.L_0x592660_39:
mov 0x13(%esp),%dl
test %dl,%dl
je .L_0x592660_40
mov $0xC8,%esi
jmp .L_0x592660_24
.L_0x592660_40:
test %cl,%cl
je .L_0x592660_41
mov $0x14,%esi
jmp .L_0x592660_24
.L_0x592660_41:
neg %al
sbb %eax,%eax
and $0xA,%eax
add $0xA,%eax
mov %eax,%esi
jmp .L_0x592660_24
mov 0x15(%esp),%dl
test %dl,%dl
je .L_0x592660_42
mov $0xC8,%esi
jmp .L_0x592660_24
.L_0x592660_42:
mov 0x14(%esp),%dl
test %dl,%dl
je .L_0x592660_43
mov $0x1F4,%esi
jmp .L_0x592660_24
.L_0x592660_43:
test %bl,%bl
je .L_0x592660_44
mov $0x4E2,%esi
jmp .L_0x592660_24
.L_0x592660_44:
mov 0x28(%esp),%dl
test %dl,%dl
je .L_0x592660_45
mov $0x2EE,%esi
jmp .L_0x592660_24
.L_0x592660_45:
mov 0x13(%esp),%dl
test %dl,%dl
je .L_0x592660_46
mov $0x3E8,%esi
jmp .L_0x592660_24
.L_0x592660_46:
test %cl,%cl
je .L_0x592660_47
mov $0x64,%esi
jmp .L_0x592660_24
.L_0x592660_47:
neg %al
sbb %eax,%eax
and $0x32,%eax
add $0x32,%eax
mov %eax,%esi
jmp .L_0x592660_24
mov 0x15(%esp),%dl
test %dl,%dl
je .L_0x592660_48
mov $0xC8,%esi
jmp .L_0x592660_24
.L_0x592660_48:
mov 0x14(%esp),%dl
test %dl,%dl
je .L_0x592660_49
mov $0x3E8,%esi
jmp .L_0x592660_24
.L_0x592660_49:
test %bl,%bl
je .L_0x592660_50
mov $0x9C4,%esi
jmp .L_0x592660_24
.L_0x592660_50:
mov 0x28(%esp),%dl
test %dl,%dl
je .L_0x592660_51
mov $0x5DC,%esi
jmp .L_0x592660_24
.L_0x592660_51:
mov 0x13(%esp),%dl
test %dl,%dl
je .L_0x592660_52
mov $0x7D0,%esi
jmp .L_0x592660_24
.L_0x592660_52:
test %cl,%cl
je .L_0x592660_53
mov $0xC8,%esi
jmp .L_0x592660_24
.L_0x592660_53:
neg %al
sbb %eax,%eax
and $0x64,%eax
add $0x64,%eax
mov %eax,%esi
jmp .L_0x592660_24
.L_0x592660_17:
mov 0x2C4(%eax),%eax
mov "?gShooey_CC_67A4B8@@3PAVShooey_CC@@A",%ecx
push %eax
push $9
call "?ReportCrimeForPed@Shooey_CC@@QAEXIPAVPed@@@Z"
pop %esi
pop %ebp
pop %ebx
add $0x10,%esp
ret $8
.L_0x592660_16:
mov 0x10(%esp),%al
test %al,%al
jne .L_0x592660_54
test %bl,%bl
jne .L_0x592660_54
mov 0x24(%esp),%al
test %al,%al
jne .L_0x592660_54
mov 0xF(%esp),%al
test %al,%al
jne .L_0x592660_54
mov 0x290(%ebp),%eax
cmp $1,%eax
je .L_0x592660_55
cmp $3,%eax
je .L_0x592660_55
mov 0x368(%esi),%eax
cmpl $2,0x68(%eax)
jne .L_0x592660_56
mov 0x2C8(%eax),%eax
mov "?gShooey_CC_67A4B8@@3PAVShooey_CC@@A",%ecx
push %eax
push $7
call "?ReportCrimeForPed@Shooey_CC@@QAEXIPAVPed@@@Z"
pop %esi
pop %ebp
pop %ebx
add $0x10,%esp
ret $8
.L_0x592660_56:
mov 0x2C4(%eax),%eax
mov "?gShooey_CC_67A4B8@@3PAVShooey_CC@@A",%ecx
push %eax
push $7
call "?ReportCrimeForPed@Shooey_CC@@QAEXIPAVPed@@@Z"
pop %esi
pop %ebp
pop %ebx
add $0x10,%esp
ret $8
.L_0x592660_55:
mov 0x368(%esi),%eax
cmpl $2,0x68(%eax)
jne .L_0x592660_57
mov 0x2C8(%eax),%eax
mov "?gShooey_CC_67A4B8@@3PAVShooey_CC@@A",%ecx
push %eax
push $6
call "?ReportCrimeForPed@Shooey_CC@@QAEXIPAVPed@@@Z"
pop %esi
pop %ebp
pop %ebx
add $0x10,%esp
ret $8
.L_0x592660_57:
mov 0x2C4(%eax),%eax
mov "?gShooey_CC_67A4B8@@3PAVShooey_CC@@A",%ecx
push %eax
push $6
call "?ReportCrimeForPed@Shooey_CC@@QAEXIPAVPed@@@Z"
pop %esi
pop %ebp
pop %ebx
add $0x10,%esp
ret $8
.L_0x592660_54:
mov 0x368(%esi),%eax
cmpl $2,0x68(%eax)
jne .L_0x592660_58
mov 0x2C8(%eax),%eax
jmp .L_0x592660_59
.L_0x592660_58:
mov 0x2C4(%eax),%eax
.L_0x592660_59:
mov "?gShooey_CC_67A4B8@@3PAVShooey_CC@@A",%ecx
push %eax
push $8
call "?ReportCrimeForPed@Shooey_CC@@QAEXIPAVPed@@@Z"
.L_0x592660_15:
pop %esi
pop %ebp
pop %ebx
add $0x10,%esp
ret $8

