.att_syntax
"?IsSpriteInView_435630@Camera_0xBC@@QAEDPAVSprite@@H@Z":
.global "?IsSpriteInView_435630@Camera_0xBC@@QAEDPAVSprite@@H@Z"
sub $0x1C,%esp
mov 0x20(%esp),%eax
push %ebx
push %ebp
mov "?dword_676840@@3VFix16@@A",%edx
mov 0x1C(%eax),%ebx
push %esi
push %edi
mov %ecx,%edi
mov $0xE,%ecx
mov 0xA0(%edi),%esi
mov 0xA4(%edi),%eax
sub %ebx,%esi
add %edx,%esi
imull 0x676820
call "__allshr"
cltd
mov %eax,%ebp
mov %esi,%eax
mov %ebp,0x10(%esp)
mov %edx,%ebp
cltd
mov $0xE,%ecx
call "__allshl"
mov 0x10(%esp),%ecx
push %ebp
push %ecx
push %edx
push %eax
call "__alldiv"
mov %eax,%esi
mov 0x34(%esp),%eax
cmp $1,%eax
jne .L_0x435630_0
mov "?dword_676684@@3VFix16@@A",%eax
mov $0xE,%ecx
imul %esi
call "__allshr"
mov %eax,%esi
.L_0x435630_0:
mov "?dword_6766F4@@3VFix16@@A",%eax
mov $0xE,%ecx
imul %esi
call "__allshr"
mov 0x9C(%edi),%ecx
mov %ebx,0x24(%esp)
mov %ebx,0x28(%esp)
lea (%ecx,%eax),%ebx
sub %eax,%ecx
mov 0x98(%edi),%eax
mov 0x30(%esp),%edi
mov %ecx,0x1C(%esp)
mov %ebx,0x20(%esp)
lea (%eax,%esi),%edx
sub %esi,%eax
mov 0xC(%edi),%esi
mov %eax,0x14(%esp)
add $0x30,%esi
mov %edx,0x18(%esp)
mov (%esi),%ecx
cmp %ecx,%eax
jge .L_0x435630_1
cmp %ecx,%edx
jl .L_0x435630_2
jmp .L_0x435630_3
.L_0x435630_1:
cmp 4(%esi),%eax
jg .L_0x435630_2
.L_0x435630_3:
lea 0xC(%esi),%edx
lea 8(%esi),%eax
push %edx
lea 0x24(%esp),%ecx
push %eax
lea 0x24(%esp),%edx
push %ecx
push %edx
call "?IntervalIntersectsRange_438FB0@@YG_NABVFix16@@000@Z"
test %al,%al
je .L_0x435630_2
lea 0x14(%esi),%eax
add $0x10,%esi
push %eax
lea 0x2C(%esp),%ecx
push %esi
lea 0x2C(%esp),%edx
push %ecx
push %edx
call "?IntervalIntersectsRange_438FB0@@YG_NABVFix16@@000@Z"
test %al,%al
je .L_0x435630_2
mov 0xC(%edi),%eax
mov (%eax),%ecx
mov 4(%eax),%edx
cmp %edx,%ecx
jne .L_0x435630_4
cmp "?dword_676694@@3VFix16@@A",%ecx
jle .L_0x435630_5
.L_0x435630_4:
mov (%edi),%ax
test %ax,%ax
je .L_0x435630_5
cmp $0x168,%ax
je .L_0x435630_5
cmp $0x2D0,%ax
je .L_0x435630_5
cmp $0x438,%ax
je .L_0x435630_5
lea 0x14(%esp),%eax
mov %edi,%ecx
push %eax
call "?IntersectsRectSAT_59FB10@Sprite@@QAE_NPAVFix16_Rect@@@Z"
test %al,%al
jne .L_0x435630_5
push %edi
lea 0x18(%esp),%ecx
call "?IntersectsSpriteRenderingRect_59DDF0@Fix16_Rect@@QAE_NPAVSprite@@@Z"
test %al,%al
je .L_0x435630_2
.L_0x435630_5:
pop %edi
pop %esi
pop %ebp
mov $1,%al
pop %ebx
add $0x1C,%esp
ret $8
.L_0x435630_2:
pop %edi
pop %esi
pop %ebp
xor %al,%al
pop %ebx
add $0x1C,%esp
ret $8

.att_syntax
"?ComputeTargetFacingAngle_4358D0@Camera_0xBC@@QAE?AVAng16@@XZ":
.global "?ComputeTargetFacingAngle_4358D0@Camera_0xBC@@QAE?AVAng16@@XZ"
push %ecx
push %esi
mov %ecx,%esi
mov 0x34(%esi),%ecx
test %ecx,%ecx
je .L_0x4358d0_0
mov 0x16C(%ecx),%eax
test %eax,%eax
je .L_0x4358d0_1
mov 0x50(%eax),%ecx
mov 0x58(%eax),%eax
test %eax,%eax
mov (%ecx),%dx
je .L_0x4358d0_2
mov 0x94(%eax),%cl
test %cl,%cl
je .L_0x4358d0_2
mov "?kAng180_676772@@3VAng16@@A",%cx
mov 0xC(%esp),%eax
add %dx,%cx
mov %cx,(%eax)
jns .L_0x4358d0_3
.L_0x4358d0_4:
addw $0x5A0,(%eax)
cmpw $0,(%eax)
jl .L_0x4358d0_4
.L_0x4358d0_3:
cmpw $0x5A0,(%eax)
jl .L_0x4358d0_5
.L_0x4358d0_6:
addw $0xFA60,(%eax)
cmpw $0x5A0,(%eax)
jge .L_0x4358d0_6
pop %esi
pop %ecx
ret $4
.L_0x4358d0_2:
mov 0xC(%esp),%eax
pop %esi
mov %dx,(%eax)
pop %ecx
ret $4
.L_0x4358d0_1:
lea 6(%esp),%edx
push %edx
call "?GetRotation@Ped@@QAE?AVAng16@@XZ"
mov 0x34(%esi),%ecx
mov (%eax),%ax
mov 0x168(%ecx),%ecx
test %ecx,%ecx
je .L_0x4358d0_7
testb $8,0x58(%ecx)
je .L_0x4358d0_7
mov "?kAng180_676772@@3VAng16@@A",%cx
add %ax,%cx
mov 0xC(%esp),%eax
mov %cx,(%eax)
jns .L_0x4358d0_8
.L_0x4358d0_9:
addw $0x5A0,(%eax)
cmpw $0,(%eax)
jl .L_0x4358d0_9
.L_0x4358d0_8:
cmpw $0x5A0,(%eax)
jl .L_0x4358d0_5
.L_0x4358d0_10:
addw $0xFA60,(%eax)
cmpw $0x5A0,(%eax)
jge .L_0x4358d0_10
pop %esi
pop %ecx
ret $4
.L_0x4358d0_7:
mov 0xC(%esp),%ecx
pop %esi
mov %ax,(%ecx)
mov %ecx,%eax
pop %ecx
ret $4
.L_0x4358d0_0:
mov 0x38(%esi),%eax
test %eax,%eax
je .L_0x4358d0_11
mov 0x50(%eax),%edx
mov 0x58(%eax),%eax
test %eax,%eax
mov (%edx),%dx
je .L_0x4358d0_2
mov 0x94(%eax),%cl
test %cl,%cl
je .L_0x4358d0_2
mov "?kAng180_676772@@3VAng16@@A",%cx
mov 0xC(%esp),%eax
add %dx,%cx
mov %cx,(%eax)
jns .L_0x4358d0_12
.L_0x4358d0_13:
addw $0x5A0,(%eax)
cmpw $0,(%eax)
jl .L_0x4358d0_13
.L_0x4358d0_12:
cmpw $0x5A0,(%eax)
jl .L_0x4358d0_5
.L_0x4358d0_14:
addw $0xFA60,(%eax)
cmpw $0x5A0,(%eax)
jge .L_0x4358d0_14
pop %esi
pop %ecx
ret $4
.L_0x4358d0_11:
mov 0xC(%esp),%eax
mov "?kAngZero_676964@@3VAng16@@A",%cx
mov %cx,(%eax)
.L_0x4358d0_5:
pop %esi
pop %ecx
ret $4

.att_syntax
"?UpdateBoundaries_435B90@Camera_0xBC@@QAEXXZ":
.global "?UpdateBoundaries_435B90@Camera_0xBC@@QAEXXZ"
push %ebx
push %ebp
push %esi
mov %ecx,%esi
push %edi
mov 0xA4(%esi),%eax
cltd
mov %eax,%edi
mov 0x68(%esi),%eax
shl $0xE,%eax
mov %edx,%ebx
cltd
push %ebx
push %edi
push %edx
push %eax
call "__allmul"
mov $0xE,%ecx
call "__allshr"
xor %ebp,%ebp
mov %eax,0x60(%esi)
push %ebp
push $0xA00000
push %ebx
push %edi
call "__allmul"
mov $0xE,%ecx
call "__allshr"
mov %eax,0x64(%esi)
mov "?kOne_67681C@@3VFix16@@A",%eax
cltd
mov $0xE,%ecx
call "__allshl"
push %ebx
push %edi
push %edx
push %eax
call "__alldiv"
mov 0xA0(%esi),%ecx
mov "?dword_676838@@3VFix16@@A",%edx
add %edx,%ecx
imul %ecx
mov $0xE,%ecx
call "__allshr"
imull 0x67671C
mov $0xE,%ecx
call "__allshr"
mov 0x98(%esi),%edx
mov %eax,%ecx
mov %edx,%eax
sub %ecx,%eax
mov %eax,0x78(%esi)
mov "?kZero_676818@@3VFix16@@A",%edi
cmp %edi,%eax
jge .L_0x435b90_0
mov %ebp,0x78(%esi)
jmp .L_0x435b90_1
.L_0x435b90_0:
mov "?kMaxMapCoord_67668C@@3VFix16@@A",%edi
cmp %edi,%eax
jle .L_0x435b90_1
mov %edi,0x78(%esi)
.L_0x435b90_1:
lea (%edx,%ecx),%eax
mov %eax,0x7C(%esi)
mov "?kZero_676818@@3VFix16@@A",%edx
cmp %edx,%eax
jge .L_0x435b90_2
mov %ebp,0x7C(%esi)
jmp .L_0x435b90_3
.L_0x435b90_2:
mov "?kMaxMapCoord_67668C@@3VFix16@@A",%edx
cmp %edx,%eax
jle .L_0x435b90_3
mov %edx,0x7C(%esi)
.L_0x435b90_3:
mov "?dword_6768E0@@3VFix16@@A",%eax
imul %ecx
mov $0xE,%ecx
call "__allshr"
mov 0x9C(%esi),%edx
mov %edx,%ecx
sub %eax,%ecx
mov %ecx,0x80(%esi)
mov "?kZero_676818@@3VFix16@@A",%edi
cmp %edi,%ecx
jge .L_0x435b90_4
mov %ebp,0x80(%esi)
jmp .L_0x435b90_5
.L_0x435b90_4:
mov "?kMaxMapCoord_67668C@@3VFix16@@A",%edi
cmp %edi,%ecx
jle .L_0x435b90_5
mov %edi,0x80(%esi)
.L_0x435b90_5:
add %edx,%eax
mov %eax,0x84(%esi)
mov "?kZero_676818@@3VFix16@@A",%ecx
cmp %ecx,%eax
jge .L_0x435b90_6
mov %ebp,0x84(%esi)
jmp .L_0x435b90_7
.L_0x435b90_6:
mov "?kMaxMapCoord_67668C@@3VFix16@@A",%ecx
cmp %ecx,%eax
jle .L_0x435b90_7
mov %ecx,0x84(%esi)
.L_0x435b90_7:
mov 0x78(%esi),%edx
mov "?dword_67691C@@3VFix16@@A",%ebx
mov 0x7C(%esi),%eax
sub %ebx,%edx
mov 0x80(%esi),%ecx
mov %edx,0x20(%esi)
mov "?dword_67691C@@3VFix16@@A",%edi
add %edi,%eax
pop %edi
mov %eax,0x24(%esi)
mov "?dword_67691C@@3VFix16@@A",%edx
sub %edx,%ecx
mov 0x84(%esi),%edx
mov %ecx,0x28(%esi)
mov "?dword_67691C@@3VFix16@@A",%eax
add %eax,%edx
mov %edx,0x2C(%esi)
pop %esi
pop %ebp
pop %ebx
ret

.att_syntax
"?SmoothApproach_4F7540@@YGXAAVFix16@@0000@Z":
.global "?SmoothApproach_4F7540@@YGXAAVFix16@@0000@Z"
mov 4(%esp),%eax
push %esi
mov "?kZero_6F6C50@@3VFix16@@A",%esi
push %edi
mov 0x14(%esp),%edi
mov (%eax),%ecx
mov 0x10(%esp),%eax
sub (%edi),%ecx
cmp %esi,%ecx
jle .L_0x4f7540_0
mov (%eax),%edx
cmp %esi,%edx
jl .L_0x4f7540_1
mov 0x18(%esp),%esi
mov (%esi),%esi
add %esi,%edx
cmp %ecx,%edx
jg .L_0x4f7540_2
mov 0x1C(%esp),%ecx
mov %edx,(%eax)
mov (%ecx),%ecx
cmp %ecx,%edx
jle .L_0x4f7540_3
mov %ecx,(%eax)
mov (%edi),%eax
mov %ecx,%edx
add %edx,%eax
mov %eax,(%edi)
pop %edi
pop %esi
ret $0x14
.L_0x4f7540_0:
jge .L_0x4f7540_1
mov (%eax),%edx
cmp %esi,%edx
jg .L_0x4f7540_1
mov 0x18(%esp),%esi
push %ebx
mov (%esi),%ebx
sub %ebx,%edx
pop %ebx
cmp %ecx,%edx
jl .L_0x4f7540_2
mov 0x1C(%esp),%ecx
mov %edx,(%eax)
mov (%ecx),%ecx
neg %ecx
cmp %ecx,%edx
jge .L_0x4f7540_3
.L_0x4f7540_2:
mov %ecx,(%eax)
mov (%edi),%eax
mov %ecx,%edx
add %edx,%eax
mov %eax,(%edi)
pop %edi
pop %esi
ret $0x14
.L_0x4f7540_1:
mov %esi,(%eax)
.L_0x4f7540_3:
mov (%eax),%edx
mov (%edi),%eax
add %edx,%eax
mov %eax,(%edi)
pop %edi
pop %esi
ret $0x14

.att_syntax
"?ApplyCarVelocityCameraOffset_436200@Camera_0xBC@@QAEXPAVCar_BC@@PAVFix16@@11@Z":
.global "?ApplyCarVelocityCameraOffset_436200@Camera_0xBC@@QAEXPAVCar_BC@@PAVFix16@@11@Z"
push $0xFFFFFFFF
push $0x5FAEF8
mov %fs:0,%eax
push %eax
mov %esp,%fs:0
sub $0x28,%esp
push %ebx
push %ebp
push %esi
push %edi
mov %ecx,%ebp
mov 0x48(%esp),%esi
mov $1,%ebx
mov %ebx,0x40(%esp)
mov 0x84(%esi),%eax
cmp $0x3B,%eax
je .L_0x436200_0
cmp $0x3C,%eax
je .L_0x436200_0
cmp $0x3D,%eax
je .L_0x436200_0
cmp $6,%eax
jne .L_0x436200_1
.L_0x436200_0:
mov "?dword_67696C@@3VFix16@@A",%eax
mov $0xE,%ecx
imull 0x676900
call "__allshr"
jmp .L_0x436200_2
.L_0x436200_1:
lea 0x20(%esp),%eax
mov %esi,%ecx
push %eax
call "?get_linvel_43A450@Car_BC@@QAE?AVFix16_Point@@XZ"
lea 0x18(%esp),%ecx
push $"?dword_67696C@@3VFix16@@A"
push %ecx
mov %eax,%ecx
movb $2,0x48(%esp)
call "?Multiply_438FE0@Fix16_Point_POD@@QAE?AVFix16_Point@@AAVFix16@@@Z"
mov (%eax),%ecx
mov "?kZero_676818@@3VFix16@@A",%edx
mov %ecx,0x28(%esp)
mov 4(%eax),%eax
cmp %edx,%ecx
mov %eax,0x2C(%esp)
mov %bl,0x40(%esp)
jne .L_0x436200_3
lea 0x2C(%esp),%edx
lea 0x48(%esp),%eax
push %edx
push %eax
call "?Abs_436A50@Fix16@@SG?AV1@AAV1@@Z"
jmp .L_0x436200_4
.L_0x436200_3:
cmp %edx,%eax
jne .L_0x436200_5
lea 0x28(%esp),%ecx
lea 0x48(%esp),%edx
push %ecx
push %edx
call "?Abs_436A50@Fix16@@SG?AV1@AAV1@@Z"
jmp .L_0x436200_4
.L_0x436200_5:
lea 0x2C(%esp),%eax
lea 0x14(%esp),%ecx
push %eax
push %ecx
lea 0x34(%esp),%ecx
call "?Multiply_408680@Fix16@@QBE?AV1@ABV1@@Z"
push %eax
lea 0x1C(%esp),%edx
lea 0x2C(%esp),%eax
push %edx
lea 0x28(%esp),%ecx
push %eax
push %ecx
lea 0x38(%esp),%ecx
call "?Multiply_408680@Fix16@@QBE?AV1@ABV1@@Z"
mov %eax,%ecx
call "??HFix16@@QBE?AV0@ABV0@@Z"
lea 0x48(%esp),%edx
push %eax
push %edx
call "?SquareRoot_436A70@Fix16@@SG?AV1@AAV1@@Z"
.L_0x436200_4:
mov 0x48(%esp),%eax
.L_0x436200_2:
cmp "?dword_67674C@@3VFix16@@A",%eax
jle .L_0x436200_6
mov 0x54(%esp),%edi
mov (%edi),%edx
add %eax,%edx
mov %edx,(%edi)
mov 0x84(%esi),%eax
cmp $0x3B,%eax
je .L_0x436200_6
cmp $0x3C,%eax
je .L_0x436200_6
cmp $0x3D,%eax
je .L_0x436200_6
cmp $6,%eax
je .L_0x436200_6
cmp $0x36,%eax
je .L_0x436200_6
lea 0x28(%esp),%eax
lea 0x2C(%esp),%ecx
push %eax
lea 0x4C(%esp),%edx
push %ecx
push %edx
call "?atan2_fixed_405320@Fix16@@SG?AVAng16@@AAV1@0@Z"
mov 0x48(%esp),%bx
cmp "?kAng45_6766DC@@3VAng16@@A",%bx
jle .L_0x436200_7
cmp "?kAng135_676790@@3VAng16@@A",%bx
jl .L_0x436200_8
.L_0x436200_7:
cmp "?kAng225_676764@@3VAng16@@A",%bx
jle .L_0x436200_9
cmp "?kAng315_67679C@@3VAng16@@A",%bx
jge .L_0x436200_9
.L_0x436200_8:
mov $0x3C0000,%ecx
jmp .L_0x436200_10
.L_0x436200_9:
mov $0x2D0000,%ecx
.L_0x436200_10:
mov 0x64(%esi),%eax
test %eax,%eax
je .L_0x436200_11
cmp %esi,8(%eax)
jne .L_0x436200_11
mov "?dword_6768E0@@3VFix16@@A",%eax
imul %ecx
mov $0xE,%ecx
call "__allshr"
mov %eax,%ecx
.L_0x436200_11:
mov 0x44(%ebp),%al
test %al,%al
je .L_0x436200_12
cmp $0x40,%al
jbe .L_0x436200_13
mov "?dword_6768E4@@3VFix16@@A",%eax
jmp .L_0x436200_14
.L_0x436200_13:
and $0xFF,%eax
shl $0xE,%eax
.L_0x436200_14:
cltd
and $0x7F,%edx
add %eax,%edx
mov "?kOne_67681C@@3VFix16@@A",%eax
sar $7,%edx
sub %edx,%eax
imul %ecx
mov $0xE,%ecx
call "__allshr"
mov %eax,%ecx
.L_0x436200_12:
mov 0x50(%esi),%edx
mov (%edi),%eax
sub 0x1C(%edx),%eax
add $0x20000,%eax
imul %ecx
mov $0xE,%ecx
call "__allshr"
cltd
mov $0xE,%ecx
call "__allshl"
mov %eax,%ecx
mov 0x64(%ebp),%eax
mov %edx,%esi
cltd
push %edx
push %eax
push %esi
push %ecx
call "__alldiv"
movswl %bx,%esi
mov %eax,0x10(%esp)
lea 0x48(%esp),%eax
shl $2,%esi
lea 0x54(%esp),%ecx
push %eax
mov 0x667A80(%esi),%edx
push %ecx
lea 0x18(%esp),%ecx
mov %edx,0x50(%esp)
call "?Multiply_408680@Fix16@@QBE?AV1@ABV1@@Z"
mov (%eax),%edi
mov 0x669260(%esi),%edx
lea 0x48(%esp),%eax
lea 0x54(%esp),%ecx
push %eax
push %ecx
lea 0x18(%esp),%ecx
mov %edi,0x38(%esp)
mov %edx,0x50(%esp)
call "?Multiply_408680@Fix16@@QBE?AV1@ABV1@@Z"
mov 0x4C(%esp),%ecx
mov (%eax),%eax
mov (%ecx),%esi
add %edi,%esi
mov %esi,(%ecx)
mov 0x50(%esp),%ecx
add %eax,(%ecx)
.L_0x436200_6:
mov 0x38(%esp),%ecx
pop %edi
pop %esi
pop %ebp
pop %ebx
mov %ecx,%fs:0
add $0x34,%esp
ret $0x10

