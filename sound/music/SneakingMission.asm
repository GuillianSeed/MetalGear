;----------------------------------------------------------------------------
;
; Sneaking mission
;
;----------------------------------------------------------------------------
MusBasementA3B:	    db 0FBh, 23h,0E2h,0B0h,0B0h,0B1h,0F9h, 23h,0E3h,0B0h,0B0h,0B1h,0F8h, 23h,0B0h,0B0h
		    db 0FFh

MusBasementC3B:	    db 0FBh, 23h,0E2h, 40h, 40h, 41h,0F9h, 23h,0E3h, 40h, 40h, 41h,0F8h, 23h, 40h, 40h
		    db 0FFh



Mus_Basement:	    db 0D9h,0C1h
Mus_BasementA2:	    db 0ECh, 53h,0D9h,0FBh, 23h,0E2h,0B7h,0E1h,	27h, 17h,0E2h, 97h,0E1h,   7,0E2h,0B7h
		    db	67h, 97h,0BFh,0E1h, 0Fh,0E2h,0B3h,0E1h,	43h, 53h,0B3h,0E0h, 2Fh
MusBasementA3:	    db 0FEh,0FFh
		    dw MusBasementA3B
		    db 0B1h
		    db 0FEh,   2
		    dw MusBasementA3
		    db 0FBh, 23h,0E2h,0B0h,0B0h,0B1h,0B0h,0B0h,0B1h
		    db 0FEh,0FFh
		    dw MusBasementA3B
		    db 0B0h,0F7h, 21h,0E2h,0B0h,0F9h, 21h,0B0h,0FAh, 21h,0B0h,0FBh, 21h,0B0h,0FCh, 21h
		    db 0B0h
MusBasementA4:	    db 0EFh,0FBh, 21h,0E2h,0B0h,0E1h, 40h, 50h,0B0h,   0, 50h, 60h,0E0h,   0
		    db 0FEh,   2
		    dw MusBasementA4
		    db 0EFh,0FBh, 22h,0E2h,0B0h,0B0h,0FCh, 22h,0B1h,0FBh, 22h,0B0h,0B0h,0B1h,0F8h, 23h
		    db 0B0h,0F9h, 23h,0B0h,0FAh, 23h,0B0h,0FBh,	23h,0B0h,0FCh, 22h,0B0h,0FAh, 23h,0B0h
		    db 0F9h, 23h,0B0h,0F8h, 23h,0B0h
		    db 0FEh,0FEh
		    dw Mus_BasementA2


Mus_BasementB:	    db 0D9h,0C1h
Mus_BasementB2:	    db 0D9h,0FCh, 21h,0E5h,0B3h,0E4h,	3, 43h,	33h
		    db 0FEh,   2
		    dw Mus_BasementB2
		    db 0E5h,0B3h,0E4h, 43h, 33h,0B3h,0E5h,0B3h,0E4h,   3, 43h, 33h
MusBasementB3:	    db 0FCh, 23h,0E4h, 41h,0FBh, 21h, 41h,0FCh,	23h, 51h,0FBh, 21h, 51h,0FCh, 23h, 91h
		    db 0FBh, 21h, 91h,0FCh, 23h, 81h,0FBh, 21h,	81h
		    db 0FEh,   4
		    dw MusBasementB3
MusBasementB4:	    db 0FCh, 23h, 43h, 53h
		    db 0FEh,   5
		    dw MusBasementB4
		    db	43h,0F7h, 21h, 50h,0F9h, 21h, 50h,0FAh,	21h, 50h,0FBh, 21h, 50h
MusBasementB5:	    db 0EFh,0FCh, 21h,0E5h,0B0h,0E4h, 40h, 50h,0B0h,   0, 50h,0B0h,   0
		    db 0FEh,   2
		    dw MusBasementB5
		    db 0EFh,0E3h,   0,	 0,   1,   0,	0,   1,0F8h, 23h,0E4h,0B0h,0F9h, 23h,0B0h,0FAh
		    db	23h,0B0h,0FBh, 23h,0B0h,0FCh, 22h,0B0h,0FAh, 23h, 40h,0F9h, 23h,0B0h,0F8h, 23h
		    db	40h
		    db 0FEh,0FEh
		    dw Mus_BasementB2


Mus_BasementC:	    db 0D9h,0C1h
Mus_BasementC2:	    db 0E8h,0ECh, 43h,0D9h,0F9h, 23h,0E2h, 90h,0A0h,0B7h,0E1h, 27h, 17h,0E2h, 97h,0E1h
		    db	  7,0E2h,0B7h, 67h, 97h,0ECh, 53h,0BFh,0E1h, 0Dh,0D3h,0F5h,   0, 80h, 70h, 80h
		    db 0B0h, 90h,0B0h, 70h,0F6h,   0, 80h, 70h,	80h,0F7h,   0,0B0h, 90h,0B0h, 70h,0F8h
		    db	  0, 80h, 70h, 80h,0F9h,   0,0B0h, 80h,0B0h, 70h,0F8h,	 0, 80h, 70h, 80h,0F7h
		    db	  0,0B0h, 80h,0B0h, 70h,0F6h,	0, 80h,	70h, 80h,0F5h,	 0,0B0h, 80h,0B0h,0C1h
		    db 0D9h,0F9h, 20h,0E2h, 53h,0B3h,0E1h, 43h,0B3h,0E0h, 23h
MusBasementC3:	    db 0FEh,0FFh
		    dw MusBasementC3B
		    db	41h
		    db 0FEh,   2
		    dw MusBasementC3
		    db 0FBh, 23h, 40h, 40h, 41h, 40h, 40h, 41h
		    db 0FEh,0FFh
		    dw MusBasementC3B
		    db	40h,0F7h, 23h, 40h,0F8h, 23h, 40h,0F9h,	23h, 40h,0FAh, 23h, 40h,0FBh, 23h, 40h
MusBasementC4:	    db 0EFh,0FCh, 23h,0E4h,0B0h,0E3h, 40h, 50h,0B0h,0E3h,   0, 50h, 60h,0E2h,	0
		    db 0FEh,   2
		    dw MusBasementC4
		    db 0EFh,0FCh, 22h,0E3h, 40h, 40h, 41h, 40h,	40h, 41h,0F8h, 23h, 40h,0F9h, 23h, 40h
		    db 0FAh, 23h, 40h,0FBh, 23h, 40h,0FCh, 22h,	40h,0FAh, 23h, 40h,0F9h, 23h, 40h,0F8h
		    db	23h, 40h
		    db 0FEh,0FEh
		    dw Mus_BasementC2

