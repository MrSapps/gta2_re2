.att_syntax
"?ftell@crt@@YAJPAU_iobuf@@@Z":
.global "?ftell@crt@@YAJPAU_iobuf@@@Z"
push %ebp
mov %esp,%ebp
sub $0xC,%esp
push %ebx
push %esi
push %edi
mov 8(%ebp),%edi
xor %ebx,%ebx
mov 0x10(%edi),%esi
cmp %ebx,4(%edi)
mov %esi,-0xC(%ebp)
jge .L_0x5ee316_0
mov %ebx,4(%edi)
.L_0x5ee316_0:
push $1
push %ebx
push %esi
call "__lseek"
add $0xC,%esp
cmp %ebx,%eax
mov %eax,-4(%ebp)
jl .L_0x5ee316_1
mov 0xC(%edi),%edx
test $0x108,%dx
jne .L_0x5ee316_2
sub 4(%edi),%eax
jmp .L_0x5ee316_3
.L_0x5ee316_2:
mov (%edi),%eax
mov 8(%edi),%ecx
mov %eax,%ebx
sub %ecx,%ebx
test $3,%dl
mov %ebx,-8(%ebp)
je .L_0x5ee316_4
mov %esi,%edx
mov %esi,%ebx
sar $5,%edx
and $0x1F,%ebx
mov 0x7098E0(,%edx,4),%edx
testb $0x80,4(%edx,%ebx,8)
je .L_0x5ee316_5
mov %ecx,%edx
.L_0x5ee316_7:
cmp %eax,%edx
jae .L_0x5ee316_5
cmpb $0xA,(%edx)
jne .L_0x5ee316_6
incl -8(%ebp)
.L_0x5ee316_6:
inc %edx
jmp .L_0x5ee316_7
.L_0x5ee316_4:
test $0x80,%dl
jne .L_0x5ee316_5
movl $0x16,0x708294
.L_0x5ee316_1:
or $0xFFFFFFFF,%eax
jmp .L_0x5ee316_3
.L_0x5ee316_5:
cmpl $0,-4(%ebp)
jne .L_0x5ee316_8
mov -8(%ebp),%eax
jmp .L_0x5ee316_3
.L_0x5ee316_8:
testb $1,0xC(%edi)
je .L_0x5ee316_9
mov 4(%edi),%edx
test %edx,%edx
jne .L_0x5ee316_10
and %edx,-8(%ebp)
jmp .L_0x5ee316_9
.L_0x5ee316_10:
sub %ecx,%eax
add %edx,%eax
mov %eax,8(%ebp)
mov %esi,%eax
sar $5,%eax
and $0x1F,%esi
lea 0x7098E0(,%eax,4),%ebx
shl $3,%esi
mov (%ebx),%eax
testb $0x80,4(%esi,%eax)
je .L_0x5ee316_11
push $2
push $0
pushl -0xC(%ebp)
call "__lseek"
add $0xC,%esp
cmp -4(%ebp),%eax
jne .L_0x5ee316_12
mov 8(%edi),%eax
mov 8(%ebp),%ecx
add %eax,%ecx
.L_0x5ee316_15:
cmp %ecx,%eax
jae .L_0x5ee316_13
cmpb $0xA,(%eax)
jne .L_0x5ee316_14
incl 8(%ebp)
.L_0x5ee316_14:
inc %eax
jmp .L_0x5ee316_15
.L_0x5ee316_13:
testb $0x20,0xD(%edi)
jmp .L_0x5ee316_16
.L_0x5ee316_12:
push $0
pushl -4(%ebp)
pushl -0xC(%ebp)
call "__lseek"
mov $0x200,%eax
add $0xC,%esp
cmp %eax,8(%ebp)
ja .L_0x5ee316_17
mov 0xC(%edi),%ecx
test $8,%cl
je .L_0x5ee316_17
test $4,%ch
je .L_0x5ee316_18
.L_0x5ee316_17:
mov 0x18(%edi),%eax
.L_0x5ee316_18:
mov %eax,8(%ebp)
mov (%ebx),%eax
testb $4,4(%esi,%eax)
.L_0x5ee316_16:
je .L_0x5ee316_11
incl 8(%ebp)
.L_0x5ee316_11:
mov 8(%ebp),%eax
sub %eax,-4(%ebp)
.L_0x5ee316_9:
mov -8(%ebp),%eax
mov -4(%ebp),%ecx
add %ecx,%eax
.L_0x5ee316_3:
pop %edi
pop %esi
pop %ebx
leave
ret

.att_syntax
"?fseek@crt@@YAHPAU_iobuf@@JH@Z":
.global "?fseek@crt@@YAHPAU_iobuf@@JH@Z"
push %esi
mov 8(%esp),%esi
push %edi
mov 0xC(%esi),%eax
test $0x83,%al
je .L_0x5ee28a_0
mov 0x14(%esp),%edi
test %edi,%edi
je .L_0x5ee28a_1
cmp $1,%edi
je .L_0x5ee28a_1
cmp $2,%edi
jne .L_0x5ee28a_0
.L_0x5ee28a_1:
and $0xEF,%al
cmp $1,%edi
mov %eax,0xC(%esi)
jne .L_0x5ee28a_2
push %esi
call "?ftell@crt@@YAJPAU_iobuf@@@Z"
add %eax,0x14(%esp)
pop %ecx
xor %edi,%edi
.L_0x5ee28a_2:
push %esi
call "__flush"
mov 0xC(%esi),%eax
pop %ecx
test $0x80,%al
je .L_0x5ee28a_3
and $0xFC,%al
mov %eax,0xC(%esi)
jmp .L_0x5ee28a_4
.L_0x5ee28a_3:
test $1,%al
je .L_0x5ee28a_4
test $8,%al
je .L_0x5ee28a_4
test $4,%ah
jne .L_0x5ee28a_4
movl $0x200,0x18(%esi)
.L_0x5ee28a_4:
push %edi
pushl 0x14(%esp)
pushl 0x10(%esi)
call "__lseek"
add $0xC,%esp
xor %ecx,%ecx
cmp $0xFFFFFFFF,%eax
setne %cl
dec %ecx
mov %ecx,%eax
jmp .L_0x5ee28a_5
.L_0x5ee28a_0:
movl $0x16,0x708294
or $0xFFFFFFFF,%eax
.L_0x5ee28a_5:
pop %edi
pop %esi
ret

.att_syntax
"?fopen@crt@@YAPAU_iobuf@@PBD0@Z":
.global "?fopen@crt@@YAPAU_iobuf@@PBD0@Z"
push $0x40
pushl 0xC(%esp)
pushl 0xC(%esp)
call "__fsopen"
add $0xC,%esp
ret

.att_syntax
"?fclose@crt@@YAHPAU_iobuf@@@Z":
.global "?fclose@crt@@YAHPAU_iobuf@@@Z"
push %esi
mov 8(%esp),%esi
push %edi
or $0xFFFFFFFF,%edi
mov 0xC(%esi),%eax
test $0x40,%al
je .L_0x5ee46e_0
or $0xFFFFFFFF,%eax
jmp .L_0x5ee46e_1
.L_0x5ee46e_0:
test $0x83,%al
je .L_0x5ee46e_2
push %esi
call "__flush"
push %esi
mov %eax,%edi
call "__freebuf"
pushl 0x10(%esi)
call "__close"
add $0xC,%esp
test %eax,%eax
jge .L_0x5ee46e_3
or $0xFFFFFFFF,%edi
jmp .L_0x5ee46e_2
.L_0x5ee46e_3:
mov 0x1C(%esi),%eax
test %eax,%eax
je .L_0x5ee46e_2
push %eax
call "?free@crt@@YAXPAX@Z"
andl $0,0x1C(%esi)
pop %ecx
.L_0x5ee46e_2:
mov %edi,%eax
.L_0x5ee46e_1:
andl $0,0xC(%esi)
pop %edi
pop %esi
ret

.att_syntax
"?fread@crt@@YAIPAXIIPAU_iobuf@@@Z":
.global "?fread@crt@@YAIPAXIIPAU_iobuf@@@Z"
push %ebp
mov %esp,%ebp
push %ecx
push %ebx
push %esi
push %edi
mov 0xC(%ebp),%edi
imul 0x10(%ebp),%edi
mov 8(%ebp),%ebx
mov %edi,%ecx
test %edi,%edi
mov %edi,-4(%ebp)
mov %ecx,8(%ebp)
jne .L_0x5ee4f7_0
xor %eax,%eax
jmp .L_0x5ee4f7_1
.L_0x5ee4f7_0:
mov 0x14(%ebp),%esi
testw $0x10C,0xC(%esi)
je .L_0x5ee4f7_2
mov 0x18(%esi),%eax
mov %eax,0x14(%ebp)
jmp .L_0x5ee4f7_3
.L_0x5ee4f7_2:
movl $0x1000,0x14(%ebp)
jmp .L_0x5ee4f7_3
.L_0x5ee4f7_12:
mov 8(%ebp),%ecx
.L_0x5ee4f7_3:
testw $0x10C,0xC(%esi)
je .L_0x5ee4f7_4
mov 4(%esi),%eax
test %eax,%eax
je .L_0x5ee4f7_4
cmp %eax,%ecx
mov %ecx,%edi
jb .L_0x5ee4f7_5
mov %eax,%edi
.L_0x5ee4f7_5:
push %edi
pushl (%esi)
push %ebx
call "_memcpy_0"
sub %edi,8(%ebp)
sub %edi,4(%esi)
add %edi,(%esi)
add $0xC,%esp
add %edi,%ebx
mov -4(%ebp),%edi
jmp .L_0x5ee4f7_6
.L_0x5ee4f7_4:
cmp 0x14(%ebp),%ecx
jb .L_0x5ee4f7_7
cmpl $0,0x14(%ebp)
mov %ecx,%eax
je .L_0x5ee4f7_8
xor %edx,%edx
divl 0x14(%ebp)
mov %ecx,%eax
sub %edx,%eax
.L_0x5ee4f7_8:
push %eax
push %ebx
pushl 0x10(%esi)
call "__read"
add $0xC,%esp
test %eax,%eax
je .L_0x5ee4f7_9
cmp $0xFFFFFFFF,%eax
je .L_0x5ee4f7_10
sub %eax,8(%ebp)
add %eax,%ebx
jmp .L_0x5ee4f7_6
.L_0x5ee4f7_7:
push %esi
call "__filbuf"
cmp $0xFFFFFFFF,%eax
pop %ecx
je .L_0x5ee4f7_11
mov %al,(%ebx)
mov 0x18(%esi),%eax
inc %ebx
decl 8(%ebp)
mov %eax,0x14(%ebp)
.L_0x5ee4f7_6:
cmpl $0,8(%ebp)
jne .L_0x5ee4f7_12
mov 0x10(%ebp),%eax
.L_0x5ee4f7_1:
pop %edi
pop %esi
pop %ebx
leave
ret
.L_0x5ee4f7_9:
orl $0x10,0xC(%esi)
jmp .L_0x5ee4f7_11
.L_0x5ee4f7_10:
orl $0x20,0xC(%esi)
.L_0x5ee4f7_11:
mov %edi,%eax
xor %edx,%edx
sub 8(%ebp),%eax
divl 0xC(%ebp)
jmp .L_0x5ee4f7_1

.att_syntax
"?fgetc@crt@@YAHPAU_iobuf@@@Z":
.global "?fgetc@crt@@YAHPAU_iobuf@@@Z"
mov 4(%esp),%edx
decl 4(%edx)
js .L_0x5ee6e9_0
mov (%edx),%ecx
movzbl (%ecx),%eax
inc %ecx
mov %ecx,(%edx)
ret
.L_0x5ee6e9_0:
push %edx
call "__filbuf"
pop %ecx
ret

.att_syntax
"?fwrite@crt@@YAIPBXIIPAU_iobuf@@@Z":
.global "?fwrite@crt@@YAIPBXIIPAU_iobuf@@@Z"
push %ebp
mov %esp,%ebp
push %ecx
push %ebx
push %esi
push %edi
mov 0xC(%ebp),%edi
imul 0x10(%ebp),%edi
mov 8(%ebp),%eax
mov %edi,-4(%ebp)
test %edi,%edi
mov %eax,8(%ebp)
mov %edi,%ebx
jne .L_0x5ee5df_0
xor %eax,%eax
jmp .L_0x5ee5df_1
.L_0x5ee5df_0:
mov 0x14(%ebp),%esi
testw $0x10C,0xC(%esi)
je .L_0x5ee5df_2
mov 0x18(%esi),%eax
mov %eax,0x14(%ebp)
jmp .L_0x5ee5df_3
.L_0x5ee5df_2:
movl $0x1000,0x14(%ebp)
.L_0x5ee5df_3:
mov 0xC(%esi),%ecx
and $0x108,%ecx
je .L_0x5ee5df_4
mov 4(%esi),%eax
test %eax,%eax
je .L_0x5ee5df_4
cmp %eax,%ebx
mov %ebx,%edi
jb .L_0x5ee5df_5
mov %eax,%edi
.L_0x5ee5df_5:
push %edi
pushl 8(%ebp)
pushl (%esi)
call "_memcpy_0"
sub %edi,4(%esi)
add %edi,(%esi)
add $0xC,%esp
sub %edi,%ebx
add %edi,8(%ebp)
jmp .L_0x5ee5df_6
.L_0x5ee5df_4:
cmp 0x14(%ebp),%ebx
jb .L_0x5ee5df_7
test %ecx,%ecx
je .L_0x5ee5df_8
push %esi
call "__flush"
test %eax,%eax
pop %ecx
jne .L_0x5ee5df_9
.L_0x5ee5df_8:
cmpl $0,0x14(%ebp)
je .L_0x5ee5df_10
mov %ebx,%eax
xor %edx,%edx
divl 0x14(%ebp)
mov %ebx,%edi
sub %edx,%edi
jmp .L_0x5ee5df_11
.L_0x5ee5df_10:
mov %ebx,%edi
.L_0x5ee5df_11:
push %edi
pushl 8(%ebp)
pushl 0x10(%esi)
call "__write"
add $0xC,%esp
cmp $0xFFFFFFFF,%eax
je .L_0x5ee5df_12
add %eax,8(%ebp)
sub %eax,%ebx
cmp %edi,%eax
jb .L_0x5ee5df_12
.L_0x5ee5df_6:
mov -4(%ebp),%edi
jmp .L_0x5ee5df_13
.L_0x5ee5df_7:
mov 8(%ebp),%eax
push %esi
movsbl (%eax),%eax
push %eax
call "__flsbuf"
pop %ecx
cmp $0xFFFFFFFF,%eax
pop %ecx
je .L_0x5ee5df_9
incl 8(%ebp)
mov 0x18(%esi),%eax
dec %ebx
mov %eax,0x14(%ebp)
test %eax,%eax
jg .L_0x5ee5df_13
movl $1,0x14(%ebp)
.L_0x5ee5df_13:
test %ebx,%ebx
jne .L_0x5ee5df_3
mov 0x10(%ebp),%eax
.L_0x5ee5df_1:
pop %edi
pop %esi
pop %ebx
leave
ret
.L_0x5ee5df_12:
orl $0x20,0xC(%esi)
mov -4(%ebp),%eax
jmp .L_0x5ee5df_14
.L_0x5ee5df_9:
mov %edi,%eax
.L_0x5ee5df_14:
sub %ebx,%eax
xor %edx,%edx
divl 0xC(%ebp)
jmp .L_0x5ee5df_1

.att_syntax
"?free@crt@@YAXPAX@Z":
.global "?free@crt@@YAXPAX@Z"
push %ebp
mov %esp,%ebp
push %ecx
push %esi
mov 8(%ebp),%esi
test %esi,%esi
je .L_0x5ed478_0
mov 0x7088AC,%eax
cmp $3,%eax
jne .L_0x5ed478_1
push %esi
call "___sbh_find_block"
pop %ecx
test %eax,%eax
push %esi
je .L_0x5ed478_2
push %eax
call "crt_sub_5F13B5"
pop %ecx
pop %ecx
jmp .L_0x5ed478_0
.L_0x5ed478_1:
cmp $2,%eax
jne .L_0x5ed478_3
lea 8(%ebp),%eax
push %eax
lea -4(%ebp),%eax
push %eax
push %esi
call "crt_sub_5F2507"
add $0xC,%esp
test %eax,%eax
je .L_0x5ed478_3
push %eax
pushl 8(%ebp)
pushl -4(%ebp)
call "crt_sub_5F255E"
add $0xC,%esp
jmp .L_0x5ed478_0
.L_0x5ed478_3:
push %esi
.L_0x5ed478_2:
push $0
pushl 0x7088A8
call unknown_func0
.L_0x5ed478_0:
pop %esi
leave
ret

.att_syntax
"?malloc@crt@@YAPAXI@Z":
.global "?malloc@crt@@YAPAXI@Z"
pushl 0x708308
pushl 8(%esp)
call "__nh_malloc"
pop %ecx
pop %ecx
ret

