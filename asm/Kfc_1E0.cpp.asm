.att_syntax
"?UpdateStateMachine_5CBD50@Kfc_30@@QAEXXZ":
.global "?UpdateStateMachine_5CBD50@Kfc_30@@QAEXXZ"
sub $0x18,%esp
push %ebx
push %ebp
push %esi
mov %ecx,%esi
xor %ebx,%ebx
push %edi
mov 8(%esi),%ecx
mov %bl,0x10(%esp)
cmp %ebx,%ecx
movb $1,0x11(%esp)
movb $1,0x12(%esp)
mov %bl,0x13(%esp)
je .L_0x5cbd50_0
cmp %bl,0x34(%ecx)
jne .L_0x5cbd50_0
call "?ClearGroupData_4C8E90@PedGroup@@QAEXXZ"
mov %ebx,8(%esi)
.L_0x5cbd50_0:
mov 0x24(%esi),%eax
cmp $1,%eax
jne .L_0x5cbd50_1
mov (%esi),%ebp
cmp %ebx,%ebp
je .L_0x5cbd50_2
cmpl $5,0x88(%ebp)
jne .L_0x5cbd50_3
movb $1,0x10(%esp)
.L_0x5cbd50_3:
cmpw $0x7D01,0x74(%ebp)
jne .L_0x5cbd50_4
movb $1,0x10(%esp)
.L_0x5cbd50_4:
mov %ebp,%ecx
call "?HasSpriteZoom_43A230@Car_BC@@QAE_NXZ"
test %al,%al
je .L_0x5cbd50_5
movb $1,0x10(%esp)
.L_0x5cbd50_5:
mov (%esi),%ebp
mov 0x54(%ebp),%eax
cmp %ebx,%eax
je .L_0x5cbd50_6
cmp 4(%esi),%eax
je .L_0x5cbd50_6
movb $1,0x13(%esp)
.L_0x5cbd50_2:
movb $1,0x10(%esp)
jmp .L_0x5cbd50_7
.L_0x5cbd50_6:
cmp %bl,0x10(%esp)
je .L_0x5cbd50_8
.L_0x5cbd50_7:
mov 8(%esi),%edx
cmp %ebx,%edx
je .L_0x5cbd50_9
mov 4(%edx),%eax
xor %cl,%cl
cmp %ebx,%eax
je .L_0x5cbd50_9
.L_0x5cbd50_12:
cmp %ebx,0x168(%eax)
je .L_0x5cbd50_10
mov %bl,0x11(%esp)
jmp .L_0x5cbd50_11
.L_0x5cbd50_10:
mov %bl,0x12(%esp)
.L_0x5cbd50_11:
inc %cl
mov %cl,0x14(%esp)
mov 0x14(%esp),%eax
and $0xFF,%eax
mov 4(%edx,%eax,4),%eax
cmp %ebx,%eax
jne .L_0x5cbd50_12
.L_0x5cbd50_9:
mov 4(%esi),%eax
cmp %ebx,%eax
je .L_0x5cbd50_13
cmp %ebx,0x168(%eax)
je .L_0x5cbd50_13
mov %bl,0x11(%esp)
.L_0x5cbd50_13:
cmp %bl,0x13(%esp)
je .L_0x5cbd50_14
cmp %bl,0x12(%esp)
je .L_0x5cbd50_15
cmp %ebx,%eax
je .L_0x5cbd50_16
cmp %ebx,0x168(%eax)
je .L_0x5cbd50_15
mov 0x50(%ebp),%edx
mov 0x1B0(%eax),%edi
mov 0x1AC(%eax),%eax
mov 0x14(%edx),%ecx
sub %eax,%ecx
mov 0x18(%edx),%eax
sub %edi,%eax
mov %ecx,0x20(%esp)
cmp %ebx,%eax
jg .L_0x5cbd50_17
neg %eax
.L_0x5cbd50_17:
cmp %ebx,%ecx
mov %eax,0x18(%esp)
jle .L_0x5cbd50_18
mov %ecx,0x1C(%esp)
jmp .L_0x5cbd50_19
.L_0x5cbd50_18:
lea 0x1C(%esp),%ecx
push %ecx
lea 0x24(%esp),%ecx
call "?Negate_4086A0@Fix16@@QBE?AV1@XZ"
.L_0x5cbd50_19:
lea 0x18(%esp),%edx
lea 0x1C(%esp),%eax
push %edx
lea 0x28(%esp),%ecx
push %eax
push %ecx
call "?Max_44E540@Fix16@@SG?AV1@AAV1@0@Z"
mov (%eax),%eax
mov 0x706148,%ecx
cmp %ecx,%eax
jg .L_0x5cbd50_16
.L_0x5cbd50_14:
cmp %bl,0x10(%esp)
je .L_0x5cbd50_15
.L_0x5cbd50_16:
mov (%esi),%eax
mov $3,%edi
cmp %ebx,%eax
je .L_0x5cbd50_20
mov %bx,0x76(%eax)
mov (%esi),%eax
mov $2,%ebp
cmp %ebp,0x7C(%eax)
je .L_0x5cbd50_21
mov %edi,0x7C(%eax)
.L_0x5cbd50_21:
mov (%esi),%edx
mov 0x60(%edx),%eax
cmp %ebx,%eax
je .L_0x5cbd50_22
mov "?gHamburger_500_678E30@@3PAVHamburger_500@@A",%ecx
push %eax
call "?FreeEntry_474CC0@Hamburger_500@@QAEXPAVHamburger_40@@@Z"
mov (%esi),%eax
mov %ebx,0x60(%eax)
.L_0x5cbd50_22:
mov %ebx,(%esi)
jmp .L_0x5cbd50_23
.L_0x5cbd50_20:
mov $2,%ebp
.L_0x5cbd50_23:
cmp %bl,0x11(%esp)
je .L_0x5cbd50_24
mov 4(%esi),%eax
cmp %ebx,%eax
je .L_0x5cbd50_25
mov %edi,0x240(%eax)
mov 4(%esi),%eax
mov %ebx,0x164(%eax)
mov %bl,0x23C(%eax)
mov 4(%esi),%ecx
call "?Deallocate_45EB60@Ped@@QAEXXZ"
.L_0x5cbd50_25:
mov 8(%esi),%eax
mov %bl,0x14(%esp)
cmp %ebx,%eax
je .L_0x5cbd50_26
mov 4(%eax),%ecx
cmp %ebx,%ecx
je .L_0x5cbd50_27
.L_0x5cbd50_28:
mov %edi,0x240(%ecx)
mov %ebx,0x164(%ecx)
mov %bl,0x23C(%ecx)
call "?Deallocate_45EB60@Ped@@QAEXXZ"
mov 0x14(%esp),%al
mov 8(%esi),%edx
inc %al
mov %al,0x14(%esp)
mov 0x14(%esp),%ecx
and $0xFF,%ecx
mov 4(%edx,%ecx,4),%ecx
cmp %ebx,%ecx
jne .L_0x5cbd50_28
.L_0x5cbd50_27:
mov 8(%esi),%ecx
call "?ClearGroupData_4C8E90@PedGroup@@QAEXXZ"
.L_0x5cbd50_26:
mov %ebx,8(%esi)
mov %ebx,4(%esi)
mov %ebp,0x24(%esi)
pop %edi
pop %esi
pop %ebp
pop %ebx
add $0x18,%esp
ret
.L_0x5cbd50_24:
cmp %bl,0x12(%esp)
je .L_0x5cbd50_29
mov 4(%esi),%eax
cmp %ebx,%eax
je .L_0x5cbd50_29
cmp %ebx,0x168(%eax)
je .L_0x5cbd50_29
mov 8(%esi),%ecx
mov %ebx,0x24(%esi)
cmp %ebx,%ecx
je .L_0x5cbd50_15
call "?ResetGroupObjectives_4C8F20@PedGroup@@QAEXXZ"
pop %edi
pop %esi
pop %ebp
pop %ebx
add $0x18,%esp
ret
.L_0x5cbd50_29:
mov 8(%esi),%ecx
cmp %ebx,%ecx
je .L_0x5cbd50_30
call "?PurgeMembersInCars_4C9040@PedGroup@@QAE_NXZ"
mov 8(%esi),%ecx
test %al,%al
mov 0x2C(%ecx),%eax
je .L_0x5cbd50_31
cmp %ebx,%eax
je .L_0x5cbd50_32
mov %ebx,0x24(%esi)
call "?ResetGroupObjectives_4C8F20@PedGroup@@QAEXXZ"
pop %edi
pop %esi
pop %ebp
pop %ebx
add $0x18,%esp
ret
.L_0x5cbd50_32:
mov 0x34(%ecx),%al
cmp $1,%al
jne .L_0x5cbd50_33
mov 4(%ecx),%eax
mov %eax,4(%esi)
call "?ClearGroupData_4C8E90@PedGroup@@QAEXXZ"
.L_0x5cbd50_34:
mov 4(%esi),%ecx
push $0x270F
mov %ebx,8(%esi)
push %ebx
.L_0x5cbd50_36:
call "?SetObjective@Ped@@QAEXHF@Z"
mov 4(%esi),%ecx
push $0x270F
push %ebx
call "?SetObjective2_463830@Ped@@QAEXHF@Z"
mov %ebx,0x24(%esi)
pop %edi
pop %esi
pop %ebp
pop %ebx
add $0x18,%esp
ret
.L_0x5cbd50_33:
and $0xFF,%eax
mov 4(%ecx,%eax,4),%edx
mov %edx,0x2C(%ecx)
mov 8(%esi),%eax
xor %ecx,%ecx
mov 0x34(%eax),%cl
mov %ebx,4(%eax,%ecx,4)
mov 8(%esi),%eax
mov 0x36(%eax),%dl
dec %dl
mov %dl,0x36(%eax)
mov 8(%esi),%eax
mov 0x34(%eax),%cl
dec %cl
mov %cl,0x34(%eax)
mov 8(%esi),%ecx
mov 0x2C(%ecx),%edx
mov %edx,4(%esi)
call "?ResetGroupObjectives_4C8F20@PedGroup@@QAEXXZ"
mov %ebx,0x24(%esi)
pop %edi
pop %esi
pop %ebp
pop %ebx
add $0x18,%esp
ret
.L_0x5cbd50_31:
mov %eax,4(%esi)
call "?DestroyGroup_4C93A0@PedGroup@@QAEXXZ"
jmp .L_0x5cbd50_34
.L_0x5cbd50_30:
mov 4(%esi),%ecx
cmp %ebx,%ecx
je .L_0x5cbd50_35
cmp %ebx,0x168(%ecx)
je .L_0x5cbd50_15
push $0x270F
push %ebx
jmp .L_0x5cbd50_36
.L_0x5cbd50_35:
cmp %ebx,(%esi)
jne .L_0x5cbd50_15
mov %ebp,0x24(%esi)
pop %edi
pop %esi
pop %ebp
pop %ebx
add $0x18,%esp
ret
.L_0x5cbd50_8:
mov 8(%esi),%edx
movb $1,0x10(%esp)
cmp %ebx,%edx
mov $9,%edi
je .L_0x5cbd50_37
mov 4(%edx),%eax
xor %cl,%cl
cmp %ebx,%eax
je .L_0x5cbd50_37
.L_0x5cbd50_39:
cmp %edi,0x278(%eax)
je .L_0x5cbd50_38
mov %bl,0x10(%esp)
.L_0x5cbd50_38:
inc %cl
mov %cl,0x14(%esp)
mov 0x14(%esp),%eax
and $0xFF,%eax
mov 4(%edx,%eax,4),%eax
cmp %ebx,%eax
jne .L_0x5cbd50_39
cmp %bl,0x10(%esp)
je .L_0x5cbd50_40
.L_0x5cbd50_37:
mov 4(%esi),%eax
cmp %ebx,%eax
je .L_0x5cbd50_41
cmp %edi,0x278(%eax)
jne .L_0x5cbd50_40
.L_0x5cbd50_41:
movl $2,0x24(%esi)
.L_0x5cbd50_40:
cmpl $2,0x24(%esi)
jne .L_0x5cbd50_15
cmp %ebx,%ebp
je .L_0x5cbd50_15
movl $3,0x7C(%ebp)
mov %bx,0x76(%ebp)
mov (%esi),%ecx
pop %edi
pop %esi
pop %ebp
movw $0xFF38,0x76(%ecx)
pop %ebx
add $0x18,%esp
ret
.L_0x5cbd50_1:
cmp %ebx,%eax
jne .L_0x5cbd50_42
mov 8(%esi),%ecx
movb $1,0x10(%esp)
cmp %ebx,%ecx
mov $9,%edi
je .L_0x5cbd50_43
mov 4(%ecx),%eax
xor %dl,%dl
cmp %ebx,%eax
je .L_0x5cbd50_43
.L_0x5cbd50_45:
cmp %edi,0x278(%eax)
je .L_0x5cbd50_44
mov %bl,0x10(%esp)
.L_0x5cbd50_44:
inc %dl
mov %dl,0x14(%esp)
mov 0x14(%esp),%eax
and $0xFF,%eax
mov 4(%ecx,%eax,4),%eax
cmp %ebx,%eax
jne .L_0x5cbd50_45
cmp %bl,0x10(%esp)
je .L_0x5cbd50_15
.L_0x5cbd50_43:
mov 4(%esi),%eax
cmp %ebx,%eax
je .L_0x5cbd50_46
cmp %edi,0x278(%eax)
jne .L_0x5cbd50_15
.L_0x5cbd50_46:
movl $2,0x24(%esi)
pop %edi
pop %esi
pop %ebp
pop %ebx
add $0x18,%esp
ret
.L_0x5cbd50_42:
mov (%esi),%eax
cmp %ebx,%eax
je .L_0x5cbd50_47
mov 0x60(%eax),%eax
cmp %ebx,%eax
je .L_0x5cbd50_47
mov "?gHamburger_500_678E30@@3PAVHamburger_500@@A",%ecx
push %eax
call "?FreeEntry_474CC0@Hamburger_500@@QAEXPAVHamburger_40@@@Z"
mov (%esi),%ecx
mov %ebx,0x60(%ecx)
.L_0x5cbd50_47:
mov %ebx,(%esi)
.L_0x5cbd50_15:
pop %edi
pop %esi
pop %ebp
pop %ebx
add $0x18,%esp
ret

