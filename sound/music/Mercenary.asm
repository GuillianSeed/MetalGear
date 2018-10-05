;----------------------------------------------------------------------------
;
; Mercenary
;
;----------------------------------------------------------------------------
MusBossShare1:	    db 0E4h,0A1h,0A1h,0E3h, 53h, 33h, 51h,0E4h,0A5h,0E3h, 53h, 33h, 53h,0E4h,0A3h,0E3h
		    db	53h, 33h, 51h,0FFh
MusBossShare2:	    db 0E5h,0A1h,0A1h,0E3h,0A3h, 83h,0A1h,0E5h,0A5h,0E3h,0A3h, 83h,0A3h,0E5h,0A3h,0E3h
		    db 0A3h, 83h,0A1h,0FFh
MusBossShare3:	    db 0EFh,0E9h,   1,0B1h,   0,   0, 21h,   1,0B1h,   1, 21h,0B1h,   1,0B1h, 21h,0B1h
		    db	  1,0B1h, 21h,	 1,0B1h,   1, 21h,   1,0B1h,   1, 21h,0B1h,0FFh


Mus_Boss:	    db 0D3h,0C3h
MusBossA1:	    db 0EFh,0D3h,0FCh, 34h,0E4h, 71h, 73h,0ECh,	54h,0E2h,   5,0EFh,0E4h, 73h, 81h, 83h
		    db 0ECh, 54h,0E2h, 15h,0EFh,0E4h, 83h
		    db 0FEh,   2
		    dw MusBossA1
Mus_BossA2:	    db 0FCh, 34h,0E4h, 71h, 71h,0E3h, 23h,   3,	21h,0E4h, 75h,0E3h, 23h,   3, 23h,0E4h
		    db	73h,0E3h, 23h,	 3, 21h, 55h, 23h,   3,	23h
		    db 0FEh,   2
		    dw Mus_BossA2
		    db 0FEh,0FFh
		    dw MusBossShare1
		    db	85h, 53h, 33h, 53h
		    db 0FEh,0FFh
		    dw MusBossShare1
		    db	  5, 73h,   1,	 1,   3,0E4h, 11h, 11h,0E3h, 11h, 11h,0E4h, 11h, 11h,0E3h, 11h
		    db 0E4h,   3,   1,0E3h,   1,   1,0E4h,   1,	  1,0E3h,   1,	 1,0FBh,   4,0E3h, 31h
		    db	31h,   1,   1,0E4h, 91h, 91h, 61h, 61h,	91h, 91h,0E3h,	 1,   1, 31h, 31h, 61h
		    db	61h
		    db 0FEh,0FEh
		    dw Mus_BossA2


Mus_BossB:	    db 0D3h,0C3h
MusBossB1:	    db 0EFh,0D3h,0FBh, 24h,0E5h, 71h, 73h,0ECh,	54h,0E2h, 55h,0EFh,0E3h,   3,0E5h, 81h
		    db	83h,0ECh, 54h,0E2h, 65h,0EFh,0E3h, 13h
		    db 0FEh,   2
		    dw MusBossB1
Mus_BossB2:	    db 0FBh, 24h,0E5h, 71h, 71h,0E3h, 73h, 53h,	71h,0E5h, 75h,0E3h, 73h, 53h, 73h,0E5h
		    db	73h,0E3h, 73h, 53h, 71h,0A5h, 73h, 53h,	73h
		    db 0FEh,   2
		    dw Mus_BossB2
		    db 0FEh,0FFh
		    dw MusBossShare2
		    db 0E3h, 15h,0E4h,0A3h, 83h,0A3h
		    db 0FEh,0FFh
		    dw MusBossShare2
		    db 0E4h,   5,0E2h,	 3,0E3h,0A1h,0A1h,   3,0FCh, 34h,0E3h, 81h, 81h,0E4h, 81h, 81h
		    db 0E3h, 11h, 11h,0E2h, 11h,0E3h, 73h, 71h,0E4h, 71h, 71h,0E3h,   1,   1,0E2h,   1
		    db	  1,0FBh,   4,	 1,   1,0E3h, 91h, 91h,	61h, 61h, 31h, 31h, 61h, 61h, 91h, 91h
		    db 0E2h,   1,   1, 31h, 31h
		    db 0FEh,0FEh
		    dw Mus_BossB2


Mus_BossC:	    db 0D3h,0C3h
MusBossC1:	    db 0EFh,0D3h,0E9h,	 1,0B1h,0B1h, 31h, 31h,	31h, 31h, 21h, 21h,0B1h,0B1h, 21h, 21h
		    db	21h, 21h, 91h,0A1h
		    db 0FEh,   2
		    dw MusBossC1
Mus_BossC2:	    db 0FEh,0FFh
		    dw MusBossShare3
		    db 0EFh,0E9h,   1,	 1,0B1h, 21h,0B1h,   1,0B1h, 21h, 11h
		    db 0FEh,0FFh
		    dw MusBossShare3
		    db 0EFh,0E9h,   1, 30h, 30h, 31h, 31h, 31h,	81h, 91h,0A1h,0A1h
		    db 0FEh,   2
		    dw Mus_BossC2
		    db 0EFh,0E9h,   1,0B1h,   0,   0, 21h,   1,0B1h,0B1h, 21h,0B1h,   1,0B1h, 21h,   1
		    db 0B1h,0B1h, 21h, 11h, 31h, 31h, 31h, 31h,	21h, 21h, 21h, 21h, 30h, 30h, 71h, 71h
		    db	71h, 81h, 91h,0A1h,0B1h
		    db 0FEh,0FEh
		    dw Mus_BossC2
