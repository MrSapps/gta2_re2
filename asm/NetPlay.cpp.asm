.att_syntax
"?EnumAddress_cb_51E030@NetPlay@@SGHABU_GUID@@KPBXPAX@Z":
.global "?EnumAddress_cb_51E030@NetPlay@@SGHABU_GUID@@KPBXPAX@Z"
push %ebx
mov 0x10(%esp),%ebx
push %ebp
push %esi
mov 0x10(%esp),%esi
push %edi
mov $4,%ecx
mov $0x600634,%edi
xor %eax,%eax
movl $0,0x1C(%esp)
repe cmpsl (%edi),(%esi)
jne .L_0x51e030_0
mov 0x18(%esp),%eax
test %eax,%eax
je .L_0x51e030_0
mov 0x5FE058,%edi
push %ebx
call unknown_func0
test %eax,%eax
je .L_0x51e030_0
mov 0x20(%esp),%ebp
.L_0x51e030_2:
mov 0x1C(%esp),%eax
test %eax,%eax
jne .L_0x51e030_0
push %ebx
call unknown_func0
lea 2(%eax,%eax),%ecx
push %ecx
call "??2@YAPAXI@Z"
add $4,%esp
mov %eax,%esi
push %ebx
call unknown_func0
lea 2(%eax,%eax),%edx
push %edx
push %esi
push $0xFFFFFFFF
push %ebx
push $0
push $0
call unknown_func1
push %esi
mov %ebp,%ecx
call "?PushConnection_51E0E0@NetPlay@@QAEHPAG@Z"
push %esi
call "delete_5ED46D"
add $4,%esp
push %ebx
call unknown_func0
lea 1(%ebx,%eax),%ebx
push %ebx
call unknown_func0
test %eax,%eax
jne .L_0x51e030_1
movl $1,0x1C(%esp)
.L_0x51e030_1:
push %ebx
call unknown_func0
test %eax,%eax
jne .L_0x51e030_2
.L_0x51e030_0:
pop %edi
pop %esi
pop %ebp
mov $1,%eax
pop %ebx
ret $0x10

.att_syntax
"?EnumSessions_51E650@NetPlay@@QAEHXZ":
.global "?EnumSessions_51E650@NetPlay@@QAEHXZ"
sub $0x6C,%esp
push %esi
mov %ecx,%esi
push %edi
mov $0x14,%ecx
xor %eax,%eax
lea 0x24(%esp),%edi
rep stos %eax,(%edi)
mov "?kGta2_DP_Guid_5FE928@@3U_GUID@@A",%eax
mov 0x5FE92C,%ecx
mov 0x5FE930,%edx
mov %eax,0x3C(%esp)
mov 0x5FE934,%eax
movl $0x50,0x24(%esp)
mov %eax,0x48(%esp)
mov 4(%esi),%al
test %al,%al
mov 0x5E4(%esi),%eax
mov %ecx,0x40(%esp)
mov %edx,0x44(%esp)
mov (%eax),%ecx
je .L_0x51e650_0
push $0
push %esi
push $0x51EAE0
lea 0x30(%esp),%edx
push $0
push %edx
push %eax
call unknown_func0
cmp $0x8877015E,%eax
jne .L_0x51e650_1
mov 0x5FE074,%edi
push %ebx
mov 0x5FE1AC,%ebx
push %ebp
mov 0x5FE194,%ebp
.L_0x51e650_3:
push $1
push $0
push $0
lea 0x1C(%esp),%eax
push $0
push %eax
call unknown_func1
test %eax,%eax
je .L_0x51e650_2
lea 0x10(%esp),%ecx
push %ecx
call unknown_func2
lea 0x10(%esp),%edx
push %edx
call unknown_func3
.L_0x51e650_2:
push $0x1F4
call unknown_func4
mov 0x5E4(%esi),%eax
push $0
push %esi
push $0x51EAE0
mov (%eax),%ecx
lea 0x38(%esp),%edx
push $0
push %edx
push %eax
call unknown_func0
cmp $0x8877015E,%eax
je .L_0x51e650_3
pop %ebp
pop %ebx
.L_0x51e650_1:
cmp $0x88770118,%eax
jne .L_0x51e650_4
pop %edi
xor %eax,%eax
pop %esi
add $0x6C,%esp
ret
.L_0x51e650_4:
test %eax,%eax
jne .L_0x51e650_5
mov 0x5E4(%esi),%eax
push $0x80
push %esi
push $0x51EAE0
mov (%eax),%ecx
lea 0x30(%esp),%edx
push $0
push %edx
push %eax
call unknown_func0
cmp $0x88770118,%eax
jne .L_0x51e650_6
pop %edi
xor %eax,%eax
pop %esi
add $0x6C,%esp
ret
.L_0x51e650_6:
test %eax,%eax
jne .L_0x51e650_5
.L_0x51e650_7:
mov 0x5C4(%esi),%eax
pop %edi
pop %esi
add $0x6C,%esp
ret
.L_0x51e650_0:
push $0x11
push %esi
push $0x51EAE0
lea 0x30(%esp),%edx
push $0
push %edx
push %eax
call unknown_func0
test %eax,%eax
jge .L_0x51e650_7
.L_0x51e650_5:
pop %edi
or $0xFFFFFFFF,%eax
pop %esi
add $0x6C,%esp
ret

.att_syntax
"?CalcPacketLen_51F210@NetPlay@@QAEHHI@Z":
.global "?CalcPacketLen_51F210@NetPlay@@QAEHHI@Z"
.L_0x51f210_1:
sub $0x40,%esp
mov 0x44(%esp),%eax
mov 0x48(%esp),%edx
push %ebx
push %ebp
lea 5(%eax),%ecx
push %esi
mov %ecx,0x50(%esp)
mov %edx,%ecx
mov %ecx,%ebx
push %edi
mov %eax,%esi
lea 0x10(%esp),%edi
shr $2,%ecx
rep movsl (%esi),(%edi)
mov %ebx,%ecx
mov $3,%ebx
and %ebx,%ecx
xor %ebp,%ebp
rep movsb (%esi),(%edi)
mov 0x10(%esp),%ecx
mov %ecx,%esi
and $0xFF,%esi
dec %esi
cmp $8,%esi
ja .L_0x51f210_0
jmp .L_0x51f210_1
mov %bl,3(%eax)
cmpb $0,"?bDo_sync_check_67D6C1@@3_NA"
je .L_0x51f210_2
movb $8,4(%eax)
jmp .L_0x51f210_3
.L_0x51f210_2:
movb $4,4(%eax)
.L_0x51f210_3:
mov 0x54(%esp),%edi
movb $1,(%eax)
mov %ch,1(%eax)
mov 4(%eax),%cl
add $2,%cl
mov %cl,2(%eax)
movl $0xFFFFFFFF,(%edi)
mov "?bDo_sync_check_67D6C1@@3_NA",%cl
test %cl,%cl
je .L_0x51f210_4
lea -2(%edx),%ecx
lea 0x12(%esp),%esi
mov %ecx,%edx
add $4,%edi
shr $2,%ecx
rep movsl (%esi),(%edi)
mov %edx,%ecx
and %ebx,%ecx
rep movsb (%esi),(%edi)
.L_0x51f210_4:
xor %ecx,%ecx
pop %edi
mov 4(%eax),%cl
pop %esi
mov %ecx,%ebp
add $5,%ebp
mov %ebp,%eax
pop %ebp
pop %ebx
add $0x40,%esp
ret $8
mov %bl,3(%eax)
mov %dl,%bl
sub $2,%bl
mov 0x54(%esp),%edi
mov %bl,4(%eax)
movb $1,(%eax)
mov %ch,1(%eax)
mov 4(%eax),%cl
add $2,%cl
lea 0x12(%esp),%esi
mov %cl,2(%eax)
lea -2(%edx),%ecx
mov %ecx,%eax
lea 3(%edx),%ebp
shr $2,%ecx
rep movsl (%esi),(%edi)
mov %eax,%ecx
mov %ebp,%eax
and $3,%ecx
rep movsb (%esi),(%edi)
pop %edi
pop %esi
pop %ebp
pop %ebx
add $0x40,%esp
ret $8
mov %dl,%bl
movb $1,3(%eax)
dec %bl
mov 0x54(%esp),%edi
mov %bl,4(%eax)
movb $1,(%eax)
mov %ch,1(%eax)
mov 4(%eax),%cl
add $2,%cl
lea 0x11(%esp),%esi
mov %cl,2(%eax)
lea -1(%edx),%ecx
mov %ecx,%eax
lea 4(%edx),%ebp
shr $2,%ecx
rep movsl (%esi),(%edi)
mov %eax,%ecx
mov %ebp,%eax
and $3,%ecx
rep movsb (%esi),(%edi)
pop %edi
pop %esi
pop %ebp
pop %ebx
add $0x40,%esp
ret $8
xor %cl,%cl
mov %ebx,%ebp
movb $2,(%eax)
mov %cl,1(%eax)
mov %cl,2(%eax)
pop %edi
mov %ebp,%eax
pop %esi
pop %ebp
pop %ebx
add $0x40,%esp
ret $8
mov %dl,%cl
movb $2,3(%eax)
dec %cl
mov 0x54(%esp),%edi
mov %cl,4(%eax)
movb $1,(%eax)
movb $0,1(%eax)
mov 4(%eax),%cl
add $2,%cl
lea 0x11(%esp),%esi
mov %cl,2(%eax)
lea -1(%edx),%ecx
mov %ecx,%eax
lea 4(%edx),%ebp
shr $2,%ecx
rep movsl (%esi),(%edi)
mov %eax,%ecx
mov %ebp,%eax
and %ebx,%ecx
rep movsb (%esi),(%edi)
pop %edi
pop %esi
pop %ebp
pop %ebx
add $0x40,%esp
ret $8
xor %cl,%cl
movb $4,3(%eax)
mov %cl,4(%eax)
mov $5,%ebp
movb $1,(%eax)
mov %cl,1(%eax)
movb $2,2(%eax)
pop %edi
mov %ebp,%eax
pop %esi
pop %ebp
pop %ebx
add $0x40,%esp
ret $8
.L_0x51f210_0:
push $0
push $0x890
push $0x623E98
push $0x431
call "?FatalError_4A38C0@@YAXHPBDHZZ"

.att_syntax
"?RemovePlayerByName_520F80@NetPlay@@QAEHPAG@Z":
.global "?RemovePlayerByName_520F80@NetPlay@@QAEHPAG@Z"
push %ecx
push %ebx
push %ebp
mov 0x10(%esp),%ebp
push %esi
push %edi
mov %ecx,%edi
xor %esi,%esi
mov %esi,0x10(%esp)
lea 0x784(%edi),%ebx
.L_0x520f80_2:
cmp 0x75C(%edi),%esi
jae .L_0x520f80_0
mov (%ebx),%eax
push %ebp
push %eax
call "_wcscmp"
add $8,%esp
test %eax,%eax
je .L_0x520f80_1
inc %esi
add $0x2C,%ebx
jmp .L_0x520f80_2
.L_0x520f80_1:
mov 0x5E4(%edi),%eax
lea (%esi,%esi,4),%edx
mov $1,%ebx
mov (%eax),%ecx
lea (%esi,%edx,2),%edx
mov 0x778(%edi,%edx,4),%edx
push %edx
mov 0x758(%edi),%edx
push %edx
push %eax
call unknown_func0
pop %edi
pop %esi
mov %ebx,%eax
pop %ebp
pop %ebx
pop %ecx
ret $4
.L_0x520f80_0:
mov 0x10(%esp),%eax
pop %edi
pop %esi
pop %ebp
pop %ebx
pop %ecx
ret $4

.att_syntax
"?WaitForPlayersSync_5213E0@NetPlay@@QAE_NXZ":
.global "?WaitForPlayersSync_5213E0@NetPlay@@QAE_NXZ"
sub $0x14,%esp
push %ebx
push %ebp
push %esi
push %edi
mov %ecx,%esi
call unknown_func0
push $"?gSyncCheckData_6F58E0@@3PAEA"
mov %eax,0x1C(%esp)
xor %bl,%bl
call "?sub_4DB2E0@@YGXPAE@Z"
push $"?gSyncCheckData_6F58E0@@3PAEA"
mov %esi,%ecx
call "?Send_521E40@NetPlay@@QAEHH@Z"
mov %esi,%ecx
call "?Send_521370@NetPlay@@QAEXXZ"
xor %ebp,%ebp
xor %edi,%edi
xor %ecx,%ecx
lea 0x768(%esi),%edx
.L_0x5213e0_1:
cmpl $0,(%edx)
je .L_0x5213e0_0
cmp 0x5D4(%esi),%ecx
je .L_0x5213e0_0
mov $1,%eax
shl %cl,%eax
or %eax,%ebp
or %eax,%edi
.L_0x5213e0_0:
inc %ecx
add $0x2C,%edx
cmp $6,%ecx
jb .L_0x5213e0_1
.L_0x5213e0_7:
test %edi,%edi
jne .L_0x5213e0_2
test %ebp,%ebp
je .L_0x5213e0_3
.L_0x5213e0_2:
test %bl,%bl
jne .L_0x5213e0_4
lea 0x10(%esp),%eax
lea 0x1C(%esp),%ecx
push %eax
lea 0x24(%esp),%edx
push %ecx
lea 0x1C(%esp),%eax
push %edx
push %eax
mov %esi,%ecx
call "?Receive_51F010@NetPlay@@QAEDPAH0PAK1@Z"
test %al,%al
je .L_0x5213e0_5
mov 0x14(%esp),%ecx
mov (%ecx),%al
cmp $2,%al
jne .L_0x5213e0_6
mov 0x10(%esp),%edx
lea 0x758(%esi),%ecx
push %ecx
push %edx
mov %esi,%ecx
call "?IndexOf_520E30@NetPlay@@QAEIHPAVNetwork_Unknown@@@Z"
cmp $0xEEEEEEEE,%eax
je .L_0x5213e0_4
mov $1,%edx
mov %eax,%ecx
shl %cl,%edx
not %edx
and %edx,%ebp
jmp .L_0x5213e0_5
.L_0x5213e0_6:
cmp $1,%al
jne .L_0x5213e0_5
cmpb $2,3(%ecx)
jne .L_0x5213e0_5
lea 5(%ecx),%eax
mov 5(%ecx),%cl
cmp $5,%cl
jne .L_0x5213e0_5
push %eax
push $"?gSyncCheckData_6F58E0@@3PAEA"
call "?CompareRemotePlayers_4DB440@@YGXPAE0@Z"
mov 0x10(%esp),%ecx
lea 0x758(%esi),%eax
push %eax
push %ecx
mov %esi,%ecx
call "?IndexOf_520E30@NetPlay@@QAEIHPAVNetwork_Unknown@@@Z"
cmp $0xEEEEEEEE,%eax
je .L_0x5213e0_4
mov $1,%edx
mov %eax,%ecx
shl %cl,%edx
not %edx
and %edx,%edi
.L_0x5213e0_5:
call unknown_func0
sub 0x18(%esp),%eax
cmp $0x4E20,%eax
seta %bl
jmp .L_0x5213e0_7
.L_0x5213e0_3:
test %bl,%bl
je .L_0x5213e0_8
.L_0x5213e0_4:
pop %edi
pop %esi
pop %ebp
xor %al,%al
pop %ebx
add $0x14,%esp
ret
.L_0x5213e0_8:
pop %edi
pop %esi
pop %ebp
mov $1,%al
pop %ebx
add $0x14,%esp
ret

.att_syntax
"?ReceiveGameMessage_521890@NetPlay@@QAEDPAUNetwork_8@@PAHPAI@Z":
.global "?ReceiveGameMessage_521890@NetPlay@@QAEDPAUNetwork_8@@PAHPAI@Z"
sub $0x18,%esp
push %ebx
push %ebp
push %esi
push %edi
mov 0x5FE250,%edi
mov %ecx,%esi
movb $1,0x12(%esp)
movb $0,0x11(%esp)
xor %bl,%bl
call unknown_func0
mov %eax,%ebp
mov %ebp,0x1C(%esp)
.L_0x521890_18:
test %bl,%bl
jne .L_0x521890_0
mov 0x8F0(%esi),%al
test %al,%al
jne .L_0x521890_0
mov 0x12(%esp),%al
mov 0x30(%esp),%edi
test %al,%al
je .L_0x521890_1
mov 0x2C(%esp),%ebx
lea 0x13(%esp),%eax
push %edi
push %eax
push %ebx
mov %esi,%ecx
call "?sub_521770@NetPlay@@QAEIPAUNetwork_8@@PADPAI@Z"
cmp $0xFFFFFFFF,%eax
je .L_0x521890_2
mov 0x34(%esp),%ecx
movb $1,0x11(%esp)
movl $3,(%ecx)
mov 0x13(%esp),%cl
mov (%edi),%ebp
mov %cl,%dl
sub 0x760(%esi,%ebp),%dl
and $0xFF,%edx
jne .L_0x521890_3
xor %edx,%edx
jmp .L_0x521890_4
.L_0x521890_3:
cmp $0x80,%edx
jl .L_0x521890_4
add $0xFFFFFF00,%edx
.L_0x521890_4:
mov 0x5D4(%esi),%ebp
sub 0x760(%esi,%ebp),%cl
and $0xFF,%ecx
jne .L_0x521890_5
xor %ecx,%ecx
jmp .L_0x521890_6
.L_0x521890_5:
cmp $0x80,%ecx
jl .L_0x521890_6
add $0xFFFFFF00,%ecx
.L_0x521890_6:
test %edx,%edx
jge .L_0x521890_7
push %eax
mov %esi,%ecx
movb $0,0x15(%esp)
call "?Remove_521870@NetPlay@@QAEXH@Z"
jmp .L_0x521890_8
.L_0x521890_7:
jg .L_0x521890_9
test %ecx,%ecx
jge .L_0x521890_9
push %eax
mov %esi,%ecx
call "?Remove_521870@NetPlay@@QAEXH@Z"
mov (%edi),%eax
mov %esi,%ecx
push %eax
push %ebx
call "?sub_521820@NetPlay@@QAEXPAPAHH@Z"
mov (%edi),%eax
xor %ecx,%ecx
mov 0x760(%esi,%eax),%cl
inc %ecx
and $0x800000FF,%ecx
jns .L_0x521890_10
dec %ecx
or $0xFFFFFF00,%ecx
inc %ecx
.L_0x521890_10:
mov %cl,0x760(%esi,%eax)
jmp .L_0x521890_8
.L_0x521890_9:
movb $0,0x11(%esp)
movb $0,0x12(%esp)
jmp .L_0x521890_8
.L_0x521890_1:
mov 0x2C(%esp),%ebx
.L_0x521890_2:
lea 0x18(%esp),%edx
lea 0x20(%esp),%eax
push %edx
lea 0x28(%esp),%ecx
push %eax
lea 0x1C(%esp),%edx
push %ecx
push %edx
mov %esi,%ecx
call "?Receive_51F010@NetPlay@@QAEDPAH0PAK1@Z"
test %al,%al
je .L_0x521890_8
mov 0x14(%esp),%ecx
mov 0x34(%esp),%edx
xor %eax,%eax
lea 0x758(%esi),%ebp
mov 3(%ecx),%al
push %ebp
mov %eax,(%edx)
mov 0x1C(%esp),%eax
push %eax
mov %esi,%ecx
call "?IndexOf_520E30@NetPlay@@QAEIHPAVNetwork_Unknown@@@Z"
cmp $0xEEEEEEEE,%eax
mov %eax,(%edi)
je .L_0x521890_8
mov 0x14(%esp),%eax
xor %ecx,%ecx
movb $1,0x11(%esp)
mov 4(%eax),%cl
lea 5(%eax),%edx
mov %ecx,4(%ebx)
mov 0x34(%esp),%ecx
mov %edx,(%ebx)
cmpl $3,(%ecx)
jne .L_0x521890_8
mov (%edi),%ecx
mov 1(%eax),%al
mov %al,%dl
sub 0x760(%ecx,%esi),%dl
and $0xFF,%edx
jne .L_0x521890_11
xor %edx,%edx
jmp .L_0x521890_12
.L_0x521890_11:
cmp $0x80,%edx
jl .L_0x521890_12
add $0xFFFFFF00,%edx
.L_0x521890_12:
mov 0x5D4(%esi),%edi
mov %al,%bl
sub 0x760(%edi,%esi),%bl
and $0xFF,%ebx
mov %ebx,%edi
jne .L_0x521890_13
xor %edi,%edi
jmp .L_0x521890_14
.L_0x521890_13:
cmp $0x80,%edi
jl .L_0x521890_14
add $0xFFFFFF00,%edi
.L_0x521890_14:
test %edx,%edx
jge .L_0x521890_15
movb $0,0x11(%esp)
jmp .L_0x521890_8
.L_0x521890_15:
jg .L_0x521890_16
test %edi,%edi
jge .L_0x521890_16
mov 0x2C(%esp),%eax
push %ecx
push %eax
mov %esi,%ecx
call "?sub_521820@NetPlay@@QAEXPAPAHH@Z"
mov 0x30(%esp),%ecx
xor %edx,%edx
mov (%ecx),%eax
mov 8(%eax,%ebp),%dl
inc %edx
and $0x800000FF,%edx
jns .L_0x521890_17
dec %edx
or $0xFFFFFF00,%edx
inc %edx
.L_0x521890_17:
mov %dl,8(%eax,%ebp)
jmp .L_0x521890_8
.L_0x521890_16:
push %eax
mov 0x30(%esp),%eax
push %ecx
push %eax
mov %esi,%ecx
movb $0,0x1D(%esp)
call "?Add_5216E0@NetPlay@@QAEXPAUNetwork_8@@HD@Z"
.L_0x521890_8:
mov 0x5FE250,%edi
call unknown_func0
mov 0x1C(%esp),%ebp
sub %ebp,%eax
cmp $0x1F4,%eax
mov 0x11(%esp),%al
seta %bl
test %al,%al
je .L_0x521890_18
.L_0x521890_0:
call unknown_func0
sub %ebp,%eax
pop %edi
mov %eax,0x8F4(%esi)
mov 0xD(%esp),%al
pop %esi
pop %ebp
pop %ebx
add $0x18,%esp
ret $0xC

