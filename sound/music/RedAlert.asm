;----------------------------------------------------------------------------
;
; Red alert
;
;----------------------------------------------------------------------------
Mus_RedAlert:	    db 0FEh,   0
MusRedAlertA1:	    db	22h,   1,0B1h, 78h,0B1h, 70h,0B1h, 60h,0B1h, 50h,0B1h, 40h,0B1h, 30h,0B1h, 20h
		    db 0B1h, 10h,0B1h,	 0,0B0h,0F0h,0B0h,0E0h,0B0h,0D0h,0B0h,0C0h, 22h,   3,0B0h,0B0h
		    db 0B0h,0B2h,0B0h,0B0h,0B0h,0AEh,0B0h,0B0h,0B0h,0B2h,0B0h,0B0h,0B0h,0AEh, 22h,   1
		    db 0B0h,0B0h,0B0h,0C0h,0B0h,0D0h,0B0h,0E0h,0B0h,0F0h,0B1h,	 0,0B1h, 10h,0B1h, 20h
		    db 0B1h, 30h,0B1h, 40h,0B1h, 50h,0B1h, 60h,0B1h, 78h, 22h,	 7,0B0h,   0
		    db 0FEh,   4
		    dw MusRedAlertA1
		    db 0FEh,   0,0D1h,0FAh,   0,0E2h,0C0h
		    db 0FEh,0FEh
		    dw Mus_AlertA2


Mus_RedAlertB:	    db 0FEh,   0
MusRedAlertB1:	    db	22h,   1,0B1h, 79h,0B1h, 79h,0B1h, 71h,0B1h, 61h,0B1h, 51h,0B1h, 41h,0B1h, 31h
		    db 0B1h, 21h,0B1h, 11h,0B1h,   1,0B0h,0F1h,0BBh,0E1h,0B0h,0D1h,0B0h,0C1h, 22h,   3
		    db 0B0h,0B1h,0B0h,0B3h,0B0h,0B1h,0B0h,0AFh,0B0h,0B1h,0B0h,0B3h,0B0h,0B1h,0B0h,0AFh
		    db	22h,   1,0B0h,0B1h,0B0h,0C1h,0B0h,0D1h,0B0h,0E1h,0B0h,0F1h,0B1h,   1,0B1h, 11h
		    db 0B1h, 21h,0B1h, 31h,0B1h, 41h,0B1h, 51h,0B1h, 61h,0B1h, 79h, 22h,   6,	0,   0
		    db 0FEh,   4
		    dw MusRedAlertB1
		    db 0FEh,   0,0D1h,0FAh,   0,0E2h,0C0h
		    db 0FEh,0FEh
		    dw Mus_AlertB2


Mus_RedAlertC:	    db 0FEh,   0
MusRedAlertC1:	    db	22h,   1,0B1h, 7Ah,0B1h, 7Ah,0B1h, 7Ah,0B1h, 72h,0B1h, 62h,0B1h, 52h,0B1h, 42h
		    db 0B1h, 32h,0B1h, 22h,0B1h, 12h,0B1h,   2,0B0h,0F2h,0B0h,0E2h,0B0h,0D2h,0B0h,0C2h
		    db	22h,   3,0B0h,0B2h,0B0h,0B4h,0B0h,0B2h,0B0h,0B0h,0B0h,0B2h,0B0h,0B4h,0B0h,0B2h
		    db 0B0h,0B0h, 22h,	 1,0B0h,0B2h,0B0h,0C2h,0B0h,0D2h,0B0h,0E2h,0B0h,0F2h,0B1h,   2
		    db 0B1h, 12h,0B1h, 22h,0B1h, 32h,0B1h, 42h,0B1h, 52h,0B1h, 62h,0B1h, 7Ah, 22h,   5
		    db	  0,   0
		    db 0FEh,   4
		    dw MusRedAlertC1
		    db 0FEh,   0
		    db 0D1h,0FAh,   0,0E2h,0C0h
		    db 0FEh,0FEh
		    dw Mus_AlertC2

;----------------------------------------------------------------------------
; Alert	fragments
;----------------------------------------------------------------------------

MusAlertA3:	    db 0EFh,0D5h,0FBh, 22h,0ECh, 52h,0E2h,0B1h,	40h, 40h, 41h, 91h, 40h, 40h, 41h,0B1h
		    db 0E1h,   1,0E2h,0B1h,0FFh

MusAlertA4:	    db 0E8h,0FCh, 31h,0ECh, 52h,0E3h,0B3h,0E2h,	43h, 73h, 61h, 21h, 45h, 75h,0B3h, 90h
		    db 0C0h, 49h,0F9h, 22h, 43h,0FCh, 31h,0E3h,	40h, 40h, 41h, 40h, 40h, 41h, 41h, 41h
		    db	60h, 90h,0E2h, 21h,0E3h,0B3h,0E2h, 43h,0FFh

MusAlertA5:	    db 0E8h,0FCh, 31h,0ECh, 52h,0E5h, 20h, 40h,0E2h, 71h,0C0h, 71h, 70h, 91h, 63h, 21h
		    db	70h,0C0h, 71h, 40h, 70h,0E1h,	1,0E2h,	90h,0C0h, 91h, 60h, 90h,0E1h, 21h,0E5h
		    db	20h, 40h,0E2h, 71h,0C0h, 71h, 70h, 91h,0FFh

MusAlertB3:	    db 0FDh, 32h,0E4h, 41h, 41h, 41h, 40h, 40h,	41h, 41h, 41h, 40h, 40h, 71h, 71h, 71h
		    db	70h, 70h, 71h, 71h, 71h, 70h, 70h, 91h,	91h, 91h, 90h, 90h, 91h, 91h, 91h, 90h
		    db	90h,   1,   1,	 0,   0,   1,	1,   1,	20h, 20h, 21h, 41h, 41h, 41h, 40h, 40h
		    db	41h, 41h, 41h, 40h, 40h,0FFh

MusAlertB4:	    db 0FDh, 32h,0E4h, 20h, 20h, 41h, 41h, 40h,	40h, 21h, 21h, 21h, 20h, 20h,	1,   1
		    db	  1,   0,   0, 21h, 21h, 20h, 20h, 21h,	20h, 40h, 41h, 40h, 41h, 40h, 71h, 21h
		    db	20h, 20h,0FFh

MusAlertC3:	    db 0D5h,0FBh, 22h,0ECh, 52h,0E2h, 71h,0E9h,	  1,   0,   0, 11h,0EFh, 61h,0E9h,   1
		    db	  0,   0, 11h,0EFh, 71h, 91h, 71h,0E9h,	  1,   0,   0, 11h,0FFh

MusAlertC4:	    db 0FCh, 41h,0ECh, 52h,0E3h, 73h,0B3h,0E2h,	43h, 21h,0E3h, 91h,0B5h,0E2h, 45h, 73h
		    db	40h,0C0h, 19h,0E9h,   1, 80h, 80h, 81h,0EFh,0E3h, 70h, 70h, 71h, 70h, 70h, 71h
		    db	71h, 71h, 20h, 60h, 91h,0E3h, 73h,0B3h,0FFh

MusAlertC5:	    db 0E9h,   1,0B0h,0B0h,0EFh,0FCh, 41h,0ECh,	52h,0E2h, 41h,0C0h, 41h, 40h, 61h, 23h
		    db 0E3h, 91h,0E2h, 40h,0C0h, 41h,0E3h,0B0h,0E2h, 40h, 71h, 60h,0C0h, 61h, 20h, 60h
		    db	91h,0E9h,   1,0B0h,0B0h,0EFh, 41h,0C0h,	41h, 40h, 61h,0FFh


;----------------------------------------------------------------------------
;
; Alert
;
;----------------------------------------------------------------------------
Mus_Alert:	    db 0D3h,0FBh, 11h,0E3h, 60h, 90h,0E2h,   0,	30h, 60h, 90h,0E1h,   0, 30h, 67h,0C7h
Mus_AlertA2:	    db 0FEh,0FFh
		    dw MusAlertA3
		    db	40h, 40h, 41h, 91h, 40h, 40h, 41h, 61h,	71h
		    db 0FEh,0FFh
		    dw MusAlertA3
		    db 0E3h,0B0h,0B0h,0B1h,0E1h,   1,0E3h,0B0h,0B0h,0B1h,0E1h, 23h
		    db 0FEh,0FFh
		    dw MusAlertA4
		    db	71h, 21h, 41h, 61h, 75h, 25h,0E1h, 23h,	1Fh,0E2h, 21h, 20h, 10h, 20h, 10h, 20h
		    db	40h, 61h, 60h, 40h, 60h, 40h, 60h,0B0h
		    db 0FEh,0FFh
		    dw MusAlertA4
		    db	72h, 40h, 61h, 91h,0B5h, 91h, 73h, 93h,	75h, 60h, 40h, 77h, 95h, 70h, 60h, 43h
		    db	63h
		    db 0FEh,0FFh
		    dw MusAlertA5
		    db	63h, 21h, 72h, 70h,0E1h, 23h,0E1h, 12h,	10h,0E1h, 43h
		    db 0FEh,0FFh
		    dw MusAlertA5
		    db	71h, 61h, 21h,0FBh, 12h, 40h, 60h, 70h,	90h,0B0h, 90h, 70h, 60h, 40h, 60h, 70h
		    db	90h,0B0h, 90h, 70h, 40h,0FCh, 31h, 93h,	73h, 63h, 33h
		    db 0FEh,0FEh
		    dw Mus_AlertA2


Mus_AlertB:	    db 0D3h,0FBh, 11h,0E3h, 30h, 60h, 90h,0E2h,	  0, 30h, 60h, 90h,0E1h,   0, 37h,0C7h
Mus_AlertB2:	    db 0D5h,0FDh, 32h,0E4h, 41h, 41h, 40h, 40h,	41h, 41h, 41h, 40h, 40h, 41h, 21h, 21h
		    db	20h, 20h, 21h, 21h, 21h, 20h, 20h, 21h,	  1,   1,   0,	 0,   1,   1,	1,   0
		    db	  0,   1,0E5h,0B1h,0B1h,0B0h,0B0h,0B1h,0E4h,   1,   1,0E5h,0B0h,0B0h,0B1h
		    db 0FEh,0FFh
		    dw MusAlertB3
		    db	71h, 71h, 71h, 70h, 70h, 71h, 71h, 71h,	70h, 70h, 91h, 91h, 91h, 90h, 90h, 91h
		    db	91h, 91h, 90h, 90h,0B1h,0B1h,0B1h,0B0h,0B0h, 91h, 91h, 70h, 70h, 61h
		    db 0FEh,0FFh
		    dw MusAlertB3
		    db	21h, 21h, 21h, 20h, 20h, 21h, 21h, 21h,	20h, 20h,   1,	 1,   1,   0,	0,   1
		    db	  1,   1,   0,	 0, 21h, 21h, 21h, 20h,	20h, 21h, 21h, 20h, 60h, 90h, 60h
		    db 0FEh,0FFh
		    dw MusAlertB4
		    db	21h, 71h, 71h, 70h, 70h, 71h, 91h, 91h,	90h, 90h, 91h
		    db 0FEh,0FFh
		    dw MusAlertB4
		    db	71h,0B0h,0B0h,0B1h,0B0h,0B0h,0B1h,0B1h,0B1h,0B0h,0B0h,0B0h,0B0h, 90h,0B0h,0B1h
		    db 0B0h,0B0h,0B1h, 91h, 91h, 70h, 70h, 60h,	60h
		    db 0FEh,0FEh
		    dw Mus_AlertB2


Mus_AlertC:	    db 0D3h,0FBh, 11h,0E3h,   0, 30h, 60h, 90h,0E2h,   0, 30h, 60h, 90h,0E1h,	7,0C7h
Mus_AlertC2:	    db 0FEh,0FFh
		    dw MusAlertC3
		    db 0EFh, 61h,0E9h,	 1,   0,   0, 11h,0EFh,	21h, 41h
		    db 0FEh,0FFh
		    dw MusAlertC3
		    db 0EFh, 91h,0E9h,	 1,   0,   0, 11h,0EFh,0B3h
		    db 0FEh,0FFh
		    dw MusAlertC4
		    db 0E2h, 41h,0E3h, 91h,0B1h,0E2h, 21h, 45h,0E3h, 75h, 63h, 41h, 40h, 10h, 40h, 10h
		    db	40h, 60h, 71h, 70h, 60h, 70h, 60h, 70h,	90h,0B1h,0B0h, 90h,0B0h, 90h,0B0h,0E2h
		    db	  0, 21h, 20h,0E3h,0B0h,0E2h, 20h,0E3h,0B0h,0E2h, 20h, 60h
		    db 0FEh,0FFh
		    dw MusAlertC4
		    db 0E2h, 42h,0E3h,0B0h,0E2h, 21h, 61h, 75h,	61h, 43h, 63h, 45h, 20h,0E3h,0B0h,0E2h
		    db	47h, 65h, 40h, 20h,0E3h,0B3h, 20h, 60h,	90h, 60h
		    db 0FEh,0FFh
		    dw MusAlertC5
		    db	23h,0E3h, 91h,0E2h, 42h, 40h,0B3h, 92h,	90h, 93h
		    db 0FEh,0FFh
		    dw MusAlertC5
		    db	41h,0E3h, 91h, 91h,0F9h,   2,0E2h, 42h,	60h, 70h, 90h,0B0h, 90h, 70h, 60h, 40h
		    db	60h, 80h, 90h,0B0h, 90h,0EFh,0FCh, 41h,0ECh, 52h, 63h, 43h, 33h,0E3h,0B3h
		    db 0FEh,0FEh
		    dw Mus_AlertC2

