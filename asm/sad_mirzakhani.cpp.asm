.att_syntax
"?ProcessBonusEvent_4320D0@sad_mirzakhani@@QAEXFHHFFHHPAVgmp_map_zone@@@Z":
.global "?ProcessBonusEvent_4320D0@sad_mirzakhani@@QAEXFHHFFHHPAVgmp_map_zone@@@Z"
push %ebx
push %ebp
mov 0x28(%esp),%ebp
push %esi
push %edi
mov %ecx,%ebx
xor %esi,%esi
.L_0x4320d0_2:
mov 0x2C(%esp),%eax
mov 0x28(%esp),%ecx
mov 0x24(%esp),%edx
push %ebp
push %eax
mov 0x28(%esp),%eax
push %ecx
mov 0x28(%esp),%ecx
push %edx
mov 0x28(%esp),%edx
push %eax
mov 0x28(%esp),%eax
push %ecx
push %edx
push %eax
push %esi
mov %ebx,%ecx
call "?find_431EC0@sad_mirzakhani@@QAEGGFHHFFHHPAVgmp_map_zone@@@Z"
mov %eax,%esi
cmp $0xA,%si
jae .L_0x4320d0_0
and $0xFFFF,%eax
lea (%eax,%eax,4),%ecx
lea (%eax,%ecx,2),%edx
lea (%ebx,%edx,4),%edi
mov 0x26(%ebx,%edx,4),%dl
inc %dl
mov %dl,0x26(%edi)
mov 0x25(%edi),%cl
mov %dl,%al
cmp %cl,%al
jne .L_0x4320d0_1
mov 0x1B8(%ebx),%eax
xor %ecx,%ecx
mov 0x28(%edi),%cx
mov 0x368(%eax),%eax
imul 0x6BC(%eax),%ecx
push %ecx
lea 0x2D4(%eax),%ecx
call "?AddCash_592620@eager_benz@@QAEXH@Z"
mov %edi,%ecx
call "?Deactivate_431DB0@silly_saha_0x2C@@QAEXXZ"
.L_0x4320d0_1:
inc %esi
cmp $0xA,%si
jb .L_0x4320d0_2
.L_0x4320d0_0:
pop %edi
pop %esi
pop %ebp
pop %ebx
ret $0x20

