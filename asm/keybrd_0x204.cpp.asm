.att_syntax
"?GetLayout_4D6000@keybrd_0x204@@SAHXZ":
.global "?GetLayout_4D6000@keybrd_0x204@@SAHXZ"
.L_0x4d6000_1:
sub $0x14,%esp
mov 0x620D2C,%eax
lea 8(%esp),%ecx
push %ecx
mov %eax,4(%esp)
call unknown_func0
lea 4(%esp),%ecx
mov 0xE(%esp),%dl
mov 0xF(%esp),%al
mov %dl,(%esp)
push %ecx
lea 4(%esp),%edx
push $0x620D28
push %edx
mov %al,0xD(%esp)
call "_sscanf"
mov 0x10(%esp),%eax
add $0xC,%esp
add $0xFFFFFFF9,%eax
cmp $0x12,%eax
ja .L_0x4d6000_0
xor %ecx,%ecx
mov 0x4D60B8(%eax),%cl
jmp .L_0x4d6000_1
mov $1,%eax
add $0x14,%esp
ret
mov $2,%eax
add $0x14,%esp
ret
mov $3,%eax
add $0x14,%esp
ret
mov $4,%eax
add $0x14,%esp
ret
mov $5,%eax
add $0x14,%esp
ret
mov $6,%eax
add $0x14,%esp
ret
.L_0x4d6000_0:
xor %eax,%eax
add $0x14,%esp
ret

