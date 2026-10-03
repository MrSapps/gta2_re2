.att_syntax
"?SetNewFugitive_516590@youthful_einstein@@QAEXPAVPlayer@@@Z":
.global "?SetNewFugitive_516590@youthful_einstein@@QAEXPAVPlayer@@@Z"
mov 4(%esp),%eax
push %esi
test %eax,%eax
mov %ecx,%esi
jne .L_0x516590_0
mov "?gGame_0x40_67E008@@3PAVGame_0x40@@A",%ecx
call "?IterateFirstPlayer_4B9CD0@Game_0x40@@QAEPAVPlayer@@XZ"
.L_0x516590_0:
mov %eax,(%esi)
mov "?gHud_2B00_706620@@3PAVHud_2B00@@A",%eax
lea 0x1F18(%eax),%ecx
call "?ReleaseAllArrows_5D10B0@Hud_Arrow_7C_Array@@QAEXXZ"
mov (%esi),%ecx
call "?UnloadCarWeapons_564C00@Player@@QAEXXZ"
mov (%esi),%ecx
call "?RemovePlayerWeapons_564C50@Player@@QAEXXZ"
mov (%esi),%ecx
call "?ClearPowerUps_564CC0@Player@@QAEXXZ"
mov (%esi),%ecx
mov 0x2C4(%ecx),%ecx
test %ecx,%ecx
je .L_0x516590_1
call "?SetVisible@Ped@@QAEXXZ"
mov (%esi),%edx
mov 0x2C4(%edx),%ecx
call "?ClearInvulnerable_45C050@Ped@@QAEXXZ"
mov (%esi),%eax
mov 0x2C4(%eax),%eax
andl $0xFBFFFFFF,0x21C(%eax)
.L_0x516590_1:
mov (%esi),%ecx
cmpb $0,(%ecx)
jne .L_0x516590_2
mov "?gHud_2B00_706620@@3PAVHud_2B00@@A",%edx
lea 0x1F18(%edx),%ecx
call "?AllocArrow_5D1050@Hud_Arrow_7C_Array@@QAEPAVHud_Arrow_7C@@XZ"
mov (%esi),%ecx
movl $6,0x40(%eax)
mov %ecx,0x3C(%eax)
mov (%esi),%edx
mov 0x2C4(%edx),%ecx
test %ecx,%ecx
je .L_0x516590_3
push %ecx
mov %eax,%ecx
call "?SetPlayerArrowColour_5D0DC0@Hud_Arrow_7C@@QAEXPAVPed@@@Z"
pop %esi
ret $4
.L_0x516590_2:
mov "?gText_0x14_704DFC@@3PAVtext_0x14@@A",%ecx
push $3
push $0x621404
call "?Find_5B5F90@text_0x14@@QAEPAGPBD@Z"
push %eax
mov "?gHud_2B00_706620@@3PAVHud_2B00@@A",%eax
lea 0x2854(%eax),%ecx
call "?ShowMessage_5D1A00@Hud_Message_1C8@@QAEXPAGH@Z"
.L_0x516590_3:
pop %esi
ret $4

