.att_syntax
"?ApplyKillRespectChange_4BEF70@Gang_144@@QAEXEE@Z":
.global "?ApplyKillRespectChange_4BEF70@Gang_144@@QAEXEE@Z"
push %ecx
push %ebx
mov 0x10(%esp),%bl
push %ebp
push %esi
mov %ecx,%esi
mov 0x14(%esp),%ebp
push %edi
mov %esi,0x10(%esp)
mov 0x139(%esi),%al
imul %bl
push %eax
push %ebp
call "?DecrementRespect_4BEEA0@Gang_144@@QAEXED@Z"
movb $0,0x1C(%esp)
lea 0x122(%esi),%edi
.L_0x4bef70_3:
mov 0x1C(%esp),%eax
mov "?gGangPool_CA8_67E274@@3PAVGangPool_CA8@@A",%ecx
push %eax
call "?GangByIdx_4BF1C0@GangPool_CA8@@QAEPAVGang_144@@E@Z"
mov 1(%esi),%dl
mov %eax,%ecx
cmp 1(%ecx),%dl
je .L_0x4bef70_0
mov (%edi),%al
mov %ebp,%edx
imul %bl
and $0xFF,%edx
lea 0x11C(%edx,%ecx),%esi
mov 0x11C(%edx,%ecx),%dl
mov %dl,%cl
add %al,%cl
cmp %dl,%cl
jl .L_0x4bef70_1
cmp $0x64,%cl
jg .L_0x4bef70_1
mov %cl,(%esi)
jmp .L_0x4bef70_2
.L_0x4bef70_1:
movb $0x64,(%esi)
.L_0x4bef70_2:
mov 0x10(%esp),%esi
.L_0x4bef70_0:
mov 0x1C(%esp),%al
inc %al
inc %edi
cmp $0xA,%al
mov %al,0x1C(%esp)
jb .L_0x4bef70_3
pop %edi
pop %esi
pop %ebp
pop %ebx
pop %ecx
ret $8

