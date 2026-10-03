.att_syntax
"?SetAltKeyState_498CB0@BurgerKing_1@@QAEXI@Z":
.global "?SetAltKeyState_498CB0@BurgerKing_1@@QAEXI@Z"
mov 4(%esp),%eax
shr $7,%al
mov %al,"?gAltKeyDown_67B80C@@3EA"
ret $4

.att_syntax
"?read_input_device_498DA0@BurgerKing_1@@QAEXPAHE@Z":
.global "?read_input_device_498DA0@BurgerKing_1@@QAEXPAHE@Z"
.L_0x498da0_17:
sub $0x18,%esp
mov "?gKeyboardDevice_67B5C0@@3PAUIDirectInputDeviceA@@A",%eax
push %ebx
push %ebp
push %esi
push %edi
mov %ecx,%esi
push %eax
mov %esi,0x28(%esp)
mov $1,%bl
movl $0,0x14(%esp)
movl $1,0x18(%esp)
call "?acquire_input_device_498730@BurgerKing_1@@QAE_NPAUIDirectInputDeviceA@@@Z"
test %al,%al
jne .L_0x498da0_0
mov "?gGamePadDevice_67B6C0@@3PAUIDirectInputDeviceA@@A",%ecx
push %ecx
mov %esi,%ecx
call "?acquire_input_device_498730@BurgerKing_1@@QAE_NPAUIDirectInputDeviceA@@@Z"
test %al,%al
je .L_0x498da0_1
.L_0x498da0_0:
mov "?gGamePadDevice_67B6C0@@3PAUIDirectInputDeviceA@@A",%ecx
xor %edx,%edx
xor %eax,%eax
mov %edx,"?gKeyboardDeviceData_67B610@@3UDIDEVICEOBJECTDATA@@A"
mov %eax,"?gGamePadDeviceData_67B5B0@@3Umini_device_obj_data@@A"
mov %edx,0x67B614
mov %eax,0x67B5B4
mov %edx,0x67B618
mov %eax,0x67B5B8
push %ecx
mov %esi,%ecx
mov %edx,0x67B61C
mov %eax,0x67B5BC
call "?acquire_input_device_498730@BurgerKing_1@@QAE_NPAUIDirectInputDeviceA@@@Z"
test %al,%al
je .L_0x498da0_2
mov "?gGamePadDevice_67B6C0@@3PAUIDirectInputDeviceA@@A",%eax
push %eax
mov (%eax),%edx
call unknown_func0
.L_0x498da0_2:
mov %esi,%ecx
call "?game_pad_read_498D20@BurgerKing_1@@QAE_NXZ"
test %al,%al
jne .L_0x498da0_3
test %bl,%bl
je .L_0x498da0_1
.L_0x498da0_3:
mov "?gKeyboardDevice_67B5C0@@3PAUIDirectInputDeviceA@@A",%eax
xor %edi,%edi
cmp %edi,%eax
mov %edi,"?gKeyboardStatus_67B624@@3KA"
je .L_0x498da0_4
push %edi
push $"?gKeyboardStatus_67B624@@3KA"
movl $1,"?gKeyboardStatus_67B624@@3KA"
mov (%eax),%ecx
push $"?gKeyboardDeviceData_67B610@@3UDIDEVICEOBJECTDATA@@A"
push $0x10
push %eax
call unknown_func1
mov %eax,0x18(%esp)
jmp .L_0x498da0_5
.L_0x498da0_4:
movl $0xFFFFFFFF,0x18(%esp)
.L_0x498da0_5:
mov "?gGamePadDevice_67B6C0@@3PAUIDirectInputDeviceA@@A",%eax
cmp %edi,%eax
je .L_0x498da0_6
cmp %edi,"?gKeyboardStatus_67B624@@3KA"
jne .L_0x498da0_6
lea 0x14(%esp),%ecx
push $1
push %ecx
movl $1,"?gKeyboardStatus_67B624@@3KA"
mov (%eax),%edx
push %edi
push $0x10
push %eax
call unknown_func2
mov "?gGamePadDevice_67B6C0@@3PAUIDirectInputDeviceA@@A",%eax
push %edi
push $"?gKeyboardStatus_67B624@@3KA"
push $"?gGamePadDeviceData_67B5B0@@3Umini_device_obj_data@@A"
mov (%eax),%edx
push $0x10
push %eax
call unknown_func2
mov %eax,0x1C(%esp)
mov "?bLog_directinput_67D6C0@@3_NA",%al
test %al,%al
je .L_0x498da0_7
cmp %edi,"?gKeyboardStatus_67B624@@3KA"
jbe .L_0x498da0_7
mov 0x67B5B4,%eax
mov "?gGamePadDeviceData_67B5B0@@3Umini_device_obj_data@@A",%ecx
mov 0x14(%esp),%edx
push %eax
mov "?gpRng_67AB34@@3PAVrng@@A",%eax
push %ecx
push %edx
mov (%eax),%ecx
push %ecx
push $0x61AB10
push $"?gTmpBuffer_67C598@@3PADA"
call "_sprintf"
add $0x18,%esp
mov $"?gErrorLog_67C530@@3VErrorLog@@A",%ecx
push $"?gTmpBuffer_67C598@@3PADA"
call "?Write_4D9620@ErrorLog@@QAEXPBD@Z"
jmp .L_0x498da0_7
.L_0x498da0_6:
movl $0xFFFFFFFF,0x1C(%esp)
mov %edi,0x14(%esp)
.L_0x498da0_7:
cmp %edi,0x18(%esp)
jge .L_0x498da0_8
cmp %edi,0x1C(%esp)
jl .L_0x498da0_1
.L_0x498da0_8:
cmp %edi,"?gKeyboardStatus_67B624@@3KA"
jbe .L_0x498da0_1
mov "?gKeyboardDeviceData_67B610@@3UDIDEVICEOBJECTDATA@@A",%eax
cmp $0x38,%eax
jne .L_0x498da0_9
mov 0x67B614,%edx
mov %esi,%ecx
push %edx
call "?SetAltKeyState_498CB0@BurgerKing_1@@QAEXI@Z"
mov "?gKeyboardDeviceData_67B610@@3UDIDEVICEOBJECTDATA@@A",%eax
jmp .L_0x498da0_10
.L_0x498da0_9:
cmp $0x39,%eax
je .L_0x498da0_11
cmp $0xF,%eax
je .L_0x498da0_11
cmp $0x1C,%eax
jne .L_0x498da0_10
.L_0x498da0_11:
cmpb $1,"?gAltKeyDown_67B80C@@3EA"
je .L_0x498da0_1
.L_0x498da0_10:
mov "?gHud_2B00_706620@@3PAVHud_2B00@@A",%ecx
push %eax
call "?IsInputKeyConsumed_5D6C70@Hud_2B00@@QAEHH@Z"
test %al,%al
jne .L_0x498da0_12
mov "?gGamePadDeviceData_67B5B0@@3Umini_device_obj_data@@A",%edi
mov 0x67B5B4,%edx
xor %esi,%esi
mov $0x67F8B8,%ebp
movl $0xC,0x20(%esp)
.L_0x498da0_23:
mov 0x18(%esp),%eax
xor %bl,%bl
test %eax,%eax
jne .L_0x498da0_13
mov 0x67B91C(,%esi,4),%eax
test %eax,%eax
jne .L_0x498da0_13
mov 0x67B6E8(,%esi,4),%eax
mov "?gKeyboardDeviceData_67B610@@3UDIDEVICEOBJECTDATA@@A",%ecx
cmp %ecx,%eax
jne .L_0x498da0_13
mov 0x67B614,%al
mov $1,%bl
test $0x80,%al
mov 0x30(%esp),%al
je .L_0x498da0_14
.L_0x498da0_19:
test %al,%al
je .L_0x498da0_15
push %esi
mov $"?gBurgerKing_67F8B0@@3VBurgerKing_67F8B0@@A",%ecx
call "?set_input_4CDCF0@BurgerKing_67F8B0@@QAEXH@Z"
mov "?gGamePadDeviceData_67B5B0@@3Umini_device_obj_data@@A",%edi
mov 0x67B5B4,%edx
jmp .L_0x498da0_15
.L_0x498da0_14:
test %al,%al
je .L_0x498da0_15
push %esi
mov $"?gBurgerKing_67F8B0@@3VBurgerKing_67F8B0@@A",%ecx
call "?clear_input_4CDD10@BurgerKing_67F8B0@@QAEXH@Z"
mov "?gGamePadDeviceData_67B5B0@@3Umini_device_obj_data@@A",%edi
mov 0x67B5B4,%edx
jmp .L_0x498da0_15
.L_0x498da0_13:
mov 0x1C(%esp),%eax
test %eax,%eax
jne .L_0x498da0_15
cmpl $1,0x67B91C(,%esi,4)
jne .L_0x498da0_15
mov 0x67B6E8(,%esi,4),%eax
movl $0,0x10(%esp)
lea -0xE0(%eax),%ecx
cmp $3,%ecx
ja .L_0x498da0_16
jmp .L_0x498da0_17
test %edi,%edi
jne .L_0x498da0_15
cmp $0xFFFFFD12,%edx
jg .L_0x498da0_18
mov 0x30(%esp),%al
mov $1,%bl
jmp .L_0x498da0_19
test %edi,%edi
jne .L_0x498da0_15
cmp $0x2EE,%edx
jl .L_0x498da0_18
mov 0x30(%esp),%al
mov $1,%bl
jmp .L_0x498da0_19
cmp $4,%edi
jne .L_0x498da0_15
cmp $0xFFFFFD12,%edx
jle .L_0x498da0_20
mov (%ebp),%ecx
mov 0x67F8B4,%eax
jmp .L_0x498da0_21
cmp $4,%edi
jne .L_0x498da0_15
cmp $0x2EE,%edx
jge .L_0x498da0_20
mov 0x67F8B4,%eax
mov (%ebp),%ecx
.L_0x498da0_21:
test %eax,%ecx
jbe .L_0x498da0_15
.L_0x498da0_18:
mov 0x30(%esp),%al
movl $1,0x10(%esp)
test %al,%al
je .L_0x498da0_22
mov 0x67F8B4,%ecx
mov (%ebp),%eax
test %ecx,%eax
jbe .L_0x498da0_22
push %esi
mov $"?gBurgerKing_67F8B0@@3VBurgerKing_67F8B0@@A",%ecx
call "?clear_input_4CDD10@BurgerKing_67F8B0@@QAEXH@Z"
mov "?gGamePadDeviceData_67B5B0@@3Umini_device_obj_data@@A",%edi
mov 0x67B5B4,%edx
.L_0x498da0_22:
mov $1,%bl
.L_0x498da0_15:
mov 0x20(%esp),%eax
inc %esi
add $4,%ebp
dec %eax
mov %eax,0x20(%esp)
jne .L_0x498da0_23
mov 0x24(%esp),%esi
test %bl,%bl
jne .L_0x498da0_24
.L_0x498da0_12:
mov 0x10(%esp),%eax
test %eax,%eax
jne .L_0x498da0_24
mov 0x2C(%esp),%edx
push $"?gKeyboardDeviceData_67B610@@3UDIDEVICEOBJECTDATA@@A"
push %edx
mov %esi,%ecx
call "?AddKeyToInputBits_498C80@BurgerKing_1@@QAEXPAHPAUDIDEVICEOBJECTDATA@@@Z"
mov "?bLog_directinput_67D6C0@@3_NA",%al
xor %bl,%bl
test %al,%al
je .L_0x498da0_2
mov 0x67B614,%al
mov "?gpRng_67AB34@@3PAVrng@@A",%ecx
test $0x80,%al
mov "?gKeyboardDeviceData_67B610@@3UDIDEVICEOBJECTDATA@@A",%eax
mov (%ecx),%edx
push %eax
push %edx
je .L_0x498da0_25
push $0x61AB00
push $"?gTmpBuffer_67C598@@3PADA"
call "_sprintf"
add $0x10,%esp
jmp .L_0x498da0_2
.L_0x498da0_16:
add $0x30,%eax
cmp %eax,%edi
jne .L_0x498da0_15
test $0x80,%dl
je .L_0x498da0_18
.L_0x498da0_20:
mov 0x30(%esp),%al
mov $1,%bl
jmp .L_0x498da0_19
.L_0x498da0_25:
push $0x61AAF0
push $"?gTmpBuffer_67C598@@3PADA"
call "_sprintf"
add $0x10,%esp
jmp .L_0x498da0_2
.L_0x498da0_24:
xor %bl,%bl
jmp .L_0x498da0_2
.L_0x498da0_1:
pop %edi
pop %esi
pop %ebp
pop %ebx
add $0x18,%esp
ret $8

.att_syntax
"?modify_inputs_4CDF30@BurgerKing_67F8B0@@QAEXH@Z":
.global "?modify_inputs_4CDF30@BurgerKing_67F8B0@@QAEXH@Z"
push %ebx
mov 8(%esp),%ebx
push %esi
push %edi
lea 8(%ecx),%esi
mov $0xC,%edi
.L_0x4cdf30_3:
mov (%esi),%eax
test %eax,%ebx
je .L_0x4cdf30_0
mov 4(%ecx),%edx
test %eax,%edx
je .L_0x4cdf30_1
not %eax
and %edx,%eax
jmp .L_0x4cdf30_2
.L_0x4cdf30_1:
or %edx,%eax
.L_0x4cdf30_2:
mov %eax,4(%ecx)
.L_0x4cdf30_0:
add $4,%esi
dec %edi
jne .L_0x4cdf30_3
mov %ebx,%eax
pop %edi
and $0xFFFFF000,%eax
pop %esi
pop %ebx
je .L_0x4cdf30_4
or %eax,4(%ecx)
.L_0x4cdf30_4:
ret $4

