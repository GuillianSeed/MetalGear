;----------------------------------------------------------------------------
;
; Beyond Big Boss
;
;----------------------------------------------------------------------------
MusEscapeShare1:    db 0EFh,0FCh, 24h,0E4h, 71h, 70h, 70h,0E9h,	  1,0A1h,0EFh,0E4h, 70h, 70h,0FFh
MusEscapeShare2:    db 0E3h,   1,   0,	 0,0E9h,   1,0A1h,0EFh,0E4h,   0,   0,0FFh
MusEscapeShare3:    db 0EFh,0E4h, 21h, 20h, 20h,0E9h,	1,0A1h,0A1h,0FFh
MusEscapeShare4:    db	51h, 50h, 50h,0E9h,   1,0A1h,0EFh, 50h,	50h,0FFh
MusEscapeShare5:    db	41h, 40h, 40h,0E9h,   1,0A1h,0EFh, 40h,	40h,0FFh
MusEscapeShare6:    db 0D5h,0FBh, 12h,0E1h, 71h, 21h,0E2h,0A1h,0E1h, 71h, 21h,0E2h,0A1h,0E1h, 71h, 21h
		    db 0FFh
MusEscapeShare7:    db 0EFh,0FBh, 12h,0E1h, 21h,0E2h,0A1h, 71h,0E1h, 21h,0E2h,0A1h, 71h,0E1h, 21h,0E2h
		    db 0A1h,0FFh
MusEscapeShare8:    db	21h, 20h, 20h, 21h, 20h, 20h, 51h, 50h,	50h, 51h, 50h,0FFh
MusEscapeShare9:    db	50h, 70h, 90h,0A0h, 90h,0A0h,0E1h,   0,0FFh
MusEscapeShare10:   db 0A0h,0A1h,0A0h, 70h, 71h, 70h, 40h, 41h,	40h, 70h, 71h,0FFh
MusEscapeShare11:   db 0FCh, 23h,0E2h, 21h, 20h, 20h, 21h, 20h,	20h, 61h, 60h, 60h, 61h, 60h, 60h, 91h
		    db	90h, 90h, 91h,0FFh



Mus_Escape:	    db 0D5h,0FEh, 23h,0E4h,0C3h, 51h, 51h, 51h,	51h, 61h, 61h, 61h, 61h
Mus_EscapeA2:	    db 0FEh,0FFh
		    dw MusEscapeShare1
		    db 0FEh,   8
		    dw Mus_EscapeA2
MusEscapeA3:	    db 0FEh,0FFh
		    dw MusEscapeShare2
		    db 0FEh,   4
		    dw MusEscapeA3
MusEscapeA4:	    db 0FEh,0FFh
		    dw MusEscapeShare3
		    db 0FEh,   4
		    dw MusEscapeA4
MusEscapeA5:	    db 0FEh,0FFh
		    dw MusEscapeShare1
		    db 0FEh,   8
		    dw MusEscapeA5
MusEscapeA6:	    db 0FEh,0FFh
		    dw MusEscapeShare2
		    db 0FEh,   4
		    dw MusEscapeA6
MusEscapeA7:	    db 0FEh,0FFh
		    dw MusEscapeShare3
		    db 0FEh,   4
		    dw MusEscapeA7
MusEscapeA8:	    db 0FEh,0FFh
		    dw MusEscapeShare1
		    db 0FEh,0FFh
		    dw MusEscapeShare1
		    db 0FEh,0FFh
		    dw MusEscapeShare4
		    db 0FEh,0FFh
		    dw MusEscapeShare4
		    db 0FEh,0FFh
		    dw MusEscapeShare5
		    db 0FEh,0FFh
		    dw MusEscapeShare5
		    db	31h, 30h, 30h,0E9h,   1,0A1h,0EFh, 70h,0A0h, 51h, 50h, 50h,0E9h,   1,0A1h,0EFh
		    db	90h,0E3h,   0
		    db 0FEh,   2
		    dw MusEscapeA8
		    db 0FEh,0FEh
		    dw Mus_EscapeA2


Mus_EscapeB:	    db 0D5h,0F9h,   3,0ECh, 51h,0E1h,0C3h,   1,	  1,0FAh,   3,	 1,   1,0FBh,	3, 11h
		    db	11h, 11h, 11h
Mus_EscapeB2:	    db 0EFh,0FBh, 12h,0E2h, 70h, 90h,0A0h,0E1h,	20h
		    db 0FEh,   8
		    dw Mus_EscapeB2
MusEscapeB3:	    db 0E2h, 70h, 90h,0A0h,0E1h, 10h
		    db 0FEh,   8
		    dw MusEscapeB3
MusEscapeB4:	    db 0E2h, 70h, 90h,0A0h,0E1h,   0
		    db 0FEh,   8
		    dw MusEscapeB4
		    db 0E1h,   0,   0,0E2h,0B0h,0B0h,0A0h,0A0h,	90h, 90h,0E1h, 10h, 10h,   0,	0,0E2h
		    db 0B0h,0B0h,0A0h,0A0h, 70h, 70h, 60h, 60h,	50h, 50h, 40h, 40h,0E1h, 30h, 30h, 20h
		    db	20h, 10h, 10h,	 0,   0
MusEscapeB5:	    db 0E2h, 70h, 90h,0A0h,0E1h, 20h
		    db 0FEh,   8
		    dw MusEscapeB5
MusEscapeB6:	    db 0E2h, 70h, 90h,0A0h,0E1h, 10h
		    db 0FEh,   8
		    dw MusEscapeB6
MusEscapeB7:	    db 0E2h, 70h, 90h,0A0h,0E1h,   0
		    db 0FEh,   8
		    dw MusEscapeB7
		    db 0FEh,0FFh
		    dw MusEscapeShare11
		    db	90h, 90h,0E1h,	 1,   0,   0,	1, 60h,0E8h, 60h
		    db 0FEh,0FFh
		    dw MusEscapeShare6
		    db 0EFh,   0
		    db 0FEh,0FFh
		    dw MusEscapeShare8
		    db	71h, 41h,0E2h,0A1h,0E1h, 51h, 41h,0E2h,	71h,0A1h, 91h, 70h
		    db 0FEh,0FFh
		    dw MusEscapeShare9
		    db	20h,   0, 20h, 30h, 50h, 30h, 50h, 60h
		    db 0FEh,0FFh
		    dw MusEscapeShare6
		    db	90h, 90h, 51h,	 1, 91h, 50h, 50h,   1,	91h, 51h
		    db 0FEh,0FFh
		    dw MusEscapeShare10
		    db	70h,0A1h,0A0h,0A0h, 70h, 30h,0E2h,0A0h,	70h, 91h, 90h, 90h, 50h,   0,0E2h, 50h
		    db	90h
		    db 0FEh,0FEh
		    dw Mus_EscapeB2


Mus_EscapeC:	    db 0D5h,0FCh, 23h,0E5h,0C3h, 51h, 51h,0E9h,	  1,0A3h,0EFh, 61h, 61h,0E9h,	1,0A3h
		    db 0EFh
Mus_EscapeC2:	    db 0FBh, 12h,0E2h, 20h, 50h, 70h,0A0h
		    db 0FEh, 10h
		    dw Mus_EscapeC2
MusEscapeC3:	    db 0E2h, 20h, 50h, 70h, 90h
		    db 0FEh,   8
		    dw MusEscapeC3
		    db 0FCh, 22h,0E2h, 50h, 50h, 41h, 31h, 21h,	60h, 60h, 51h, 41h, 31h, 20h, 20h, 11h
		    db	  1,0E3h,0B1h,0E2h, 80h, 80h, 71h, 61h,	51h,0FBh, 12h
MusEscapeC4:	    db 0E2h, 20h, 50h, 70h,0A0h
		    db 0FEh, 10h
		    dw MusEscapeC4
MusEscapeC5:	    db 0E2h, 20h, 50h, 70h, 90h
		    db 0FEh,   8
		    dw MusEscapeC5
		    db	  1,   0,   0,	 1,   0,   0
		    db 0FEh,0FFh
		    dw MusEscapeShare11
		    db 0E1h, 20h, 60h
		    db 0FEh,0FFh
		    dw MusEscapeShare7
		    db	  0
		    db 0FEh,0FFh
		    dw MusEscapeShare8
		    db 0FCh, 22h,0E1h, 41h,0E2h,0A1h, 71h,0E1h,	21h,   1,0E2h, 41h, 71h, 51h,0E8h, 70h
		    db 0FEh,0FFh
		    dw MusEscapeShare9
		    db 0EFh,0E2h,0A0h, 90h,0A0h,0E1h,	0, 20h,	  0, 20h, 30h
		    db 0FEh,0FFh
		    dw MusEscapeShare7
		    db 0E1h, 50h, 50h,	 1,0E2h, 91h,0E1h, 51h,	  0,   0,0E2h, 91h,0E1h, 51h,	1,0FBh
		    db	12h,0E8h,0A0h
		    db 0FEh,0FFh
		    dw MusEscapeShare10
		    db 0EFh,0FBh, 12h, 71h, 70h, 70h, 30h,0E2h,0A0h, 70h, 30h,0E8h, 90h, 91h, 90h, 90h
		    db	50h,   0,0E2h, 50h
		    db 0FEh,0FEh
		    dw Mus_EscapeC2
