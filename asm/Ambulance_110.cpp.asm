.att_syntax
"?UpdateState_4FB330@Ambulance_20@@QAEXXZ":
.global "?UpdateState_4FB330@Ambulance_20@@QAEXXZ"
push %esi
mov %ecx,%esi
push %edi
lea 0x10(%esi),%edi
mov %edi,%ecx
call "?RemovePedsInSpecificState_471290@Ped_List_4@@QAEDXZ"
mov 4(%esi),%eax
mov 0x28(%eax),%ecx
sub $3,%ecx
je .L_0x4fb330_0
sub $2,%ecx
je .L_0x4fb330_1
dec %ecx
je .L_0x4fb330_2
push $0x43F
push $0x621090
push $0x3EE
call "?FatalError_4A38C0@@YAXHPBDHZZ"
add $0xC,%esp
.L_0x4fb330_5:
mov %esi,%ecx
call "?HandleObjectiveState_4FAAC0@Ambulance_20@@QAEXXZ"
.L_0x4fb330_9:
pop %edi
pop %esi
ret
.L_0x4fb330_2:
mov %esi,%ecx
call "?EvaluatePickupState_4FA9D0@Ambulance_20@@QAEXXZ"
mov %esi,%ecx
call "?HandleObjectiveState_4FAAC0@Ambulance_20@@QAEXXZ"
pop %edi
pop %esi
ret
.L_0x4fb330_1:
cmpl $0,(%edi)
je .L_0x4fb330_3
.L_0x4fb330_4:
mov %edi,%ecx
call "?RemoveFirstPed_471320@Ped_List_4@@QAEPAVPed@@XZ"
mov "?gAmbulance_110_6F70A8@@3PAVAmbulance_110@@A",%ecx
push %eax
call "?TryAddPatient_4FA470@Ambulance_110@@QAEDPAVPed@@@Z"
cmpl $0,(%edi)
jne .L_0x4fb330_4
.L_0x4fb330_3:
mov 4(%esi),%eax
mov 0x2C(%eax),%cl
test %cl,%cl
je .L_0x4fb330_5
movl $0,0x28(%eax)
mov 4(%esi),%ecx
call "?ReInit_5CBC30@Kfc_30@@QAEXXZ"
mov %esi,%ecx
call "?ClearTask_4FA7D0@Ambulance_20@@QAEXXZ"
pop %edi
pop %esi
ret
.L_0x4fb330_0:
mov 0x2C(%eax),%cl
test %cl,%cl
je .L_0x4fb330_6
mov %esi,%ecx
call "?SpawnParamedicCrew_4FA820@Ambulance_20@@QAE_NXZ"
test %al,%al
jne .L_0x4fb330_7
mov 4(%esi),%eax
mov (%eax),%eax
test %eax,%eax
je .L_0x4fb330_8
mov 0x88(%eax),%ecx
cmp $5,%ecx
je .L_0x4fb330_8
cmp $2,%ecx
je .L_0x4fb330_8
cmp $3,%ecx
je .L_0x4fb330_8
movl $4,0x88(%eax)
.L_0x4fb330_8:
mov 4(%esi),%ecx
call "?ReInit_5CBC30@Kfc_30@@QAEXXZ"
mov %esi,%ecx
call "?ClearTask_4FA7D0@Ambulance_20@@QAEXXZ"
pop %edi
pop %esi
ret
.L_0x4fb330_7:
mov 4(%esi),%ecx
mov 4(%ecx),%edx
mov %edx,"?gParamedicCrewPed_6F6D60@@3PAVPed@@A"
mov 4(%esi),%eax
movb $0,0x1C(%esi)
mov (%eax),%ecx
test %ecx,%ecx
je .L_0x4fb330_5
call "?ActivateEmergencyLights_43C920@Car_BC@@QAEXXZ"
mov %esi,%ecx
call "?HandleObjectiveState_4FAAC0@Ambulance_20@@QAEXXZ"
pop %edi
pop %esi
ret
.L_0x4fb330_6:
incw 0x1C(%eax)
mov 4(%esi),%esi
cmpw $0x1F4,0x1C(%esi)
jle .L_0x4fb330_9
movl $5,0x28(%esi)
pop %edi
pop %esi
ret

