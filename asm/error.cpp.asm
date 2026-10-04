.att_syntax
"??0ErrorLog@@QAE@PBDH@Z":
.global "??0ErrorLog@@QAE@PBDH@Z"
push $0xFFFFFFFF
push $0x5FB958
mov %fs:0,%eax
push %eax
mov %esp,%fs:0
push %ecx
push %esi
mov %ecx,%esi
push $1
mov %esi,8(%esp)
call "??0ofstream@@QAE@XZ"
mov 0x1C(%esp),%eax
mov 0x18(%esp),%ecx
push %eax
push %ecx
mov %esi,%ecx
movl $0,0x18(%esp)
call "?Open_4D9470@ErrorLog@@QAEXPBDH@Z"
mov 8(%esp),%ecx
mov %esi,%eax
pop %esi
mov %ecx,%fs:0
add $0x10,%esp
ret $8

.att_syntax
"?log_on_line_written_cb_4D9690@@YAXPAX@Z":
.global "?log_on_line_written_cb_4D9690@@YAXPAX@Z"
mov 4(%esp),%ecx
jmp .L_0x4d9690_0

