.att_syntax
"?OpenSlot2_5133E0@Bink@@SGXPBDPAU_DIG_DRIVER@@@Z":
.global "?OpenSlot2_5133E0@Bink@@SGXPBDPAU_DIG_DRIVER@@@Z"
mov 8(%esp),%eax
mov 0x5FE29C,%ecx
push %ebx
push %eax
push %ecx
call unknown_func0
push $0x927C0
call unknown_func1
push $0x4000000
mov 0xC(%esp),%edx
push %edx
call unknown_func2
test %eax,%eax
mov %eax,"?gBinkHandleSlot2_6F83B0@@3PAUBINK@@A"
mov $2,%ebx
je .L_0x5133e0_0
cmp %ebx,"?gBufferMode_706B34@@3IA"
jne .L_0x5133e0_1
mov "?gVidSys_7071D0@@3PAUSVideo@@A",%eax
mov $5,%edx
mov 0x5C(%eax),%ecx
cmp %edx,%ecx
jne .L_0x5133e0_2
mov 0x64(%eax),%ecx
cmp %edx,%ecx
jne .L_0x5133e0_3
cmp %edx,0x6C(%eax)
jne .L_0x5133e0_3
mov %ebx,"?gBinkPixelFormat_6F81B0@@3HA"
mov %bl,"?gBinkActiveSlot_6F83FF@@3DA"
pop %ebx
ret $8
.L_0x5133e0_3:
cmp $6,%ecx
jne .L_0x5133e0_4
mov 0x6C(%eax),%ecx
.L_0x5133e0_4:
mov %bl,"?gBinkActiveSlot_6F83FF@@3DA"
movl $3,"?gBinkPixelFormat_6F81B0@@3HA"
pop %ebx
ret $8
.L_0x5133e0_2:
cmp $6,%ecx
jne .L_0x5133e0_4
mov 0x64(%eax),%ecx
cmp %edx,%ecx
jne .L_0x5133e0_5
cmp %edx,0x6C(%eax)
jne .L_0x5133e0_5
mov %bl,"?gBinkActiveSlot_6F83FF@@3DA"
movl $4,"?gBinkPixelFormat_6F81B0@@3HA"
pop %ebx
ret $8
.L_0x5133e0_5:
cmp $6,%ecx
jne .L_0x5133e0_4
cmpl $4,0x6C(%eax)
jne .L_0x5133e0_4
mov %bl,"?gBinkActiveSlot_6F83FF@@3DA"
mov %edx,"?gBinkPixelFormat_6F81B0@@3HA"
pop %ebx
ret $8
.L_0x5133e0_1:
mov "?gBinkDDState_6F83FE@@3DA",%cl
test %cl,%cl
jne .L_0x5133e0_6
mov "?gVidSys_7071D0@@3PAUSVideo@@A",%eax
mov 0x134(%eax),%ecx
push %ecx
call unknown_func3
mov "?gBinkHandleSlot2_6F83B0@@3PAUBINK@@A",%eax
.L_0x5133e0_6:
mov "?gHwnd_707F04@@3PAUHWND__@@A",%ecx
movb $1,"?gBinkDDState_6F83FE@@3DA"
mov 4(%eax),%edx
mov (%eax),%eax
push $0
push %edx
push %eax
push %ecx
call unknown_func4
test %eax,%eax
mov %eax,"?gBinkBufferSlot2_6F80C4@@3PAUBINKBUFFER@@A"
jne .L_0x5133e0_7
push $0x168
push $0x6213E0
push $0xA9
mov %al,"?gBinkDDState_6F83FE@@3DA"
call "?FatalError_4A38C0@@YAXHPBDHZZ"
add $0xC,%esp
mov %bl,"?gBinkActiveSlot_6F83FF@@3DA"
pop %ebx
ret $8
.L_0x5133e0_7:
mov %bl,"?gBinkDDState_6F83FE@@3DA"
mov %bl,"?gBinkActiveSlot_6F83FF@@3DA"
pop %ebx
ret $8
.L_0x5133e0_0:
push $0x178
push $0x6213E0
push $0xAA
call "?FatalError_4A38C0@@YAXHPBDHZZ"

