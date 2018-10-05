;----------------------------------------------------------------------------
;
; Return of Fox	Hunder
;
;----------------------------------------------------------------------------
MusEndingShare1:    db 0EFh,0D7h,0FBh, 23h,0E2h, 93h,0F8h, 13h,	93h,0F6h,   3, 91h,0FBh, 23h, 51h, 91h
		    db 0E1h, 45h, 41h, 23h,0E2h,0B1h,0E1h,   1,0FFh
MusEndingShare2:    db 0EFh,0D7h,0FBh, 23h,0E2h, 53h,0F8h, 13h,	53h,0F6h,   3, 51h,0F9h, 12h,0E8h, 51h
		    db 0E9h,   1, 30h,0EFh,0E8h, 50h, 91h,0E1h,	43h,0E9h,   1, 30h,0EFh,0E8h, 40h, 41h
		    db	23h,0E9h,   1, 30h,0EFh,0E8h,0E2h,0B0h,0FFh

Mus_Ending:	    db 0D7h,0E8h,0FBh, 2Dh,0E5h, 93h, 93h, 93h,	91h,0FBh, 12h,0E2h, 71h, 91h, 41h,0FBh
		    db	6Fh,0E4h, 91h,0E5h, 90h, 90h, 91h, 90h,	90h, 91h,0FBh, 12h,0E2h, 71h, 91h,0F9h
		    db	22h, 71h, 91h,0F8h, 12h, 71h, 91h,0FAh,	12h,0ECh, 55h, 71h, 91h, 59h, 77h, 97h
		    db 0B7h
Mus_EndingA2:	    db 0FEh,0FFh
		    dw MusEndingShare1
		    db 0ECh, 52h, 27h,	 9,0E2h,0B5h,0E1h,   9
		    db 0FEh,0FFh
		    dw MusEndingShare1
		    db	27h, 19h,0E2h,0B5h,0E1h, 11h,0F6h, 43h,	11h,0F8h, 43h, 11h,0F9h, 43h, 11h,0FBh
		    db	43h, 11h,0FBh, 23h,0E1h, 21h,0FAh, 23h,	21h,0F8h, 23h, 21h,0FAh, 13h,0ECh, 52h
		    db	  7,0E2h,0B7h,0E1h,   9,0EFh, 21h,   1,	21h, 93h, 23h,	 3, 23h,0E2h, 93h,0E1h
		    db	25h,0FBh, 23h,	 1,0E2h,0B1h, 91h,0F9h,	23h, 91h,0F7h, 23h, 91h,0FBh, 23h, 91h
		    db	71h, 51h,0FAh, 12h, 40h, 50h, 90h,0E1h,	  0, 40h, 50h, 90h,0E0h,   0,0E3h, 40h
		    db	50h, 90h,0E2h,	 0, 40h, 50h, 90h,0E1h,	  0,0FBh, 23h,0E2h,0B5h, 90h,0B0h,0E1h
		    db	  5,0E2h,0B0h,0E1h,   0,0FAh, 12h, 21h,	41h, 51h, 71h,0F8h, 12h, 71h,0E5h, 60h
		    db	70h,0D2h,0F6h,	 0,0E4h, 70h, 90h,0B0h,0F7h,   0,0E3h,	 0, 20h, 40h, 50h,0F8h
		    db	  0, 70h, 90h,0B0h,0F9h,   0,0E2h,   0,	20h, 40h, 50h
		    db 0FEh,0FEh
		    dw Mus_EndingA2

Mus_EndingB:	    db 0D7h,0FCh, 2Dh,0E4h, 93h, 93h, 93h, 93h,	93h, 93h, 93h, 93h, 93h, 93h, 90h, 90h
		    db	90h,0E3h,   0,0E4h, 90h, 70h,0FCh, 21h,	50h, 50h, 50h, 50h,0E3h,   1, 50h,0E4h
		    db	51h, 72h,0E3h, 71h,0E4h, 70h, 70h,0E3h,	71h,0E4h
MusEndingB1:	    db	71h
		    db 0FEh,   6
		    dw MusEndingB1
		    db	70h,0B0h,0E9h,	 1, 90h, 90h
Mus_EndingB2:	    db 0EFh,0D7h,0E4h, 51h, 50h, 50h,0E9h,   1,	30h,0EFh, 71h, 70h, 91h, 91h, 51h, 73h
		    db	71h,0E3h, 21h,0E4h, 71h, 71h, 70h, 70h,	81h, 93h, 91h,0E9h,   1, 30h,0EFh, 91h
		    db	90h, 91h, 91h,0E9h,   1, 30h,0EFh, 90h,	71h, 61h, 61h,0E9h,   1, 30h,0EFh, 60h
		    db	91h,0E3h, 21h, 21h, 20h,   0,0E4h, 90h,0E3h,   0, 21h, 21h,0E9h,   1, 30h,0EFh
		    db	  1,   0,0E4h, 91h, 91h, 51h, 73h, 71h,0E3h, 21h,0E4h, 71h, 71h, 70h, 70h, 81h
		    db	93h, 91h, 90h, 91h, 90h, 91h, 91h, 91h,	91h, 91h, 91h, 91h, 91h,0F9h, 23h, 91h
		    db 0FAh, 23h, 91h,0FBh, 23h, 91h,0FCh, 23h,	91h,0E4h, 7Fh, 71h,0B1h,0E3h, 21h,0E4h
		    db	77h, 71h, 6Fh, 61h, 91h,0E3h, 21h,0E4h,	67h, 61h, 57h, 53h, 53h, 50h, 50h, 90h
		    db	90h,0E3h,   0,	 0,0E4h, 57h, 51h, 71h,	71h, 71h, 71h, 71h, 71h, 71h, 71h, 70h
		    db	70h,0E5h, 70h,0E4h, 70h, 71h, 71h, 70h,	70h,0E3h, 60h, 70h,0E5h, 70h,0E4h, 60h
		    db	60h,0E5h, 70h
		    db 0FEh,0FEh
		    dw Mus_EndingB2

Mus_EndingC:	    db 0D7h,0E9h,   1,0B3h, 33h,0A0h,0A0h,0A1h,	31h,0EFh,0FBh, 12h,0E2h, 21h, 41h,0E3h
		    db 0B1h,0E9h,   1, 33h,0A0h,0A0h, 81h, 31h,0EFh,0E2h, 21h, 41h,0F9h, 12h, 21h, 41h
		    db 0E9h,   1, 30h, 30h,0A0h, 20h,0EFh,0FAh,	12h,0ECh, 55h, 41h, 51h,   9, 27h, 57h
		    db	77h
Mus_EndingC2:	    db 0FEh,0FFh
		    dw MusEndingShare2
		    db 0E1h,   1,0E3h, 90h,0E2h,   0, 40h, 90h,0E1h,   0,0E2h, 90h, 40h,   0,0E1h, 40h
		    db	  0,0E2h, 90h, 40h,   0,0E3h, 90h, 40h,	90h, 60h, 90h,0E2h,   0, 20h, 60h, 90h
		    db 0E1h,   0, 20h, 60h,0E2h, 90h,0E1h, 20h,0E2h, 60h,0E9h,	 1,   0, 30h, 30h,0A0h
		    db 0FEh,0FFh
		    dw MusEndingShare2
		    db 0E2h, 97h, 99h, 95h, 91h,0E9h,	1,   1,	31h, 21h,0A1h,0EFh,0FAh, 23h,0E8h,0E1h
		    db	21h,0F9h, 23h, 21h,0F7h, 23h, 21h,0F7h,	13h,0ECh, 54h,	 2,   7,0E2h,0B7h,0E1h
		    db	  9,0EFh,0E8h,0F9h, 33h, 21h,	1, 21h,	93h, 23h,   3, 23h,0E2h, 93h,0E1h, 22h
		    db 0F8h,   3,   3,0E2h, 91h, 51h,	1,0EFh,0FAh, 23h, 51h, 41h,   1,0E8h,0F8h, 12h
		    db	42h, 50h, 90h,0E1h,   0, 40h, 50h, 90h,0E0h,   0,0E3h, 40h, 50h, 90h,0E2h,   0
		    db	40h, 50h,0FAh, 23h, 75h, 70h, 70h, 55h,	50h, 50h,0F9h, 13h, 20h, 20h,	0,   0
		    db 0E3h, 90h, 90h, 71h,0F7h, 13h, 71h,0E9h,	  1,0B0h, 30h,0EFh,0D2h,0F6h,	0,0E4h
		    db	40h, 50h,0F7h,	 0, 70h, 90h,0B0h,0F8h,	  0,0E3h,   0, 20h, 40h, 50h, 70h,0F9h
		    db	  0, 90h,0B0h,0E2h,   0, 20h
		    db 0FEh,0FEh
		    dw Mus_EndingC2

