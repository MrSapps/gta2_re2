.att_syntax
"?next_cycle_4C1AB0@Generator_2C@@QAEHXZ":
.global "?next_cycle_4C1AB0@Generator_2C@@QAEHXZ"
push %ecx
push %esi
mov %ecx,%esi
mov 0x12(%esi),%cx
mov 0x14(%esi),%ax
cmp %ax,%cx
jne .L_0x4c1ab0_0
mov "?gpRng_67AB34@@3PAVrng@@A",%eax
and $0xFFFF,%ecx
pop %esi
mov (%eax),%eax
add %ecx,%eax
pop %ecx
ret
.L_0x4c1ab0_0:
sub %ecx,%eax
mov $"?gRng_6F6784@@3Vrng@@A",%ecx
shl $2,%eax
mov %eax,4(%esp)
lea 4(%esp),%eax
push %eax
call "?get_int_4F7AE0@rng@@QAEFABF@Z"
movswl %ax,%ecx
mov "?gpRng_67AB34@@3PAVrng@@A",%eax
xor %edx,%edx
mov 0x12(%esi),%dx
pop %esi
mov (%eax),%eax
lea (%ecx,%edx,4),%ecx
add %ecx,%eax
pop %ecx
ret

