;---------------------------------------------------------------------------
;
; Enemy	respawn	information
;
; Each room has	an entry of 3 bytes
; +0 = Enemy ID	(0=No respawn)
; +1 = Respawn location	1
; +2 = Respawn location	2
;
; Respawn location is calculated mutiplying each nibble	by 16
;---------------------------------------------------------------------------
; #A = Alert guard, #B = Read alert guard, #16 = Jetpack guard
RespawnInfo:	    db	0Ah, 19h,0AFh
		    db	0Ah, 14h, 9Fh
		    db	0Ah,0C5h, 1Ah
		    db	0Bh, 3Fh,0AFh
		    db	0Ah, 91h,0AFh
		    db	0Ah, 81h, 1Eh
		    db	  0,   0,   0
		    db	0Ah, 85h, 31h
		    db	  0, 31h,0B1h
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	0Ah, 3Fh,0BFh
		    db	0Ah, 91h, 16h
		    db	0Ah,0C6h,0CAh
		    db	0Ah, 1Ah, 16h
		    db	0Ah,0CAh, 31h
		    db	  0, 12h, 1Ah
		    db	0Ah, 55h,0CAh
		    db	0Ah, 15h, 1Ah
		    db	0Ah,0C8h, 69h
		    db	  0,   0,   0
		    db	0Ah,0BFh,0BFh
		    db	0Bh,0BFh, 3Fh
		    db	0Bh,0B1h, 3Fh
		    db	0Bh, 1Eh, 71h
		    db	0Bh,0C2h, 1Bh
		    db	0Ah,0C7h, 1Eh
		    db	0Ah, 31h,0CEh
		    db	0Ah,0BFh, 9Fh
		    db	  0,   0,   0
		    db	0Ah, 93h, 1Ch
		    db	0Ah,0C6h,0AFh
		    db	0Ah, 83h,0BFh
		    db	0Ah, 51h,0B1h
		    db	0Ah, 71h, 7Fh
		    db	0Bh,0BFh, 7Fh
		    db	0Ah,0B1h, 19h
		    db	  0,   0,   0
		    db	0Ah, 1Dh,0C4h
		    db	0Ah, 51h,0CEh
		    db	16h, 5Fh,0A1h
		    db	16h, 12h, 1Dh
		    db	16h, 18h,0C4h
		    db	0Bh,0C7h, 3Fh
		    db	16h, 9Fh, 41h
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	0Bh, 71h, 9Fh
		    db	16h,0CDh, 14h
		    db	0Bh, 31h, 7Fh
		    db	  0,   0,   0
		    db	0Ah, 17h, 18h
		    db	0Bh, 17h,0C8h
		    db	0Ah, 91h,0CDh
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0, 21h, 1Ch
		    db	0Bh, 31h, 3Fh
		    db	0Ah, 4Fh,0BFh
		    db	  0,   0,   0
		    db	0Ah, 3Fh, 7Fh
		    db	0Ah, 41h, 1Ah
		    db	0Ah,0BFh, 14h
		    db	0Ah,0C7h, 41h
		    db	  0,   0,   0
		    db	0Ah, 12h, 1Dh
		    db	0Ah,0CDh, 31h
		    db	0Ah, 1Ah, 1Eh
		    db	0Bh,0C9h, 18h
		    db	0Ah,0C2h,0CEh
		    db	0Ah, 7Fh,0B1h
		    db	  0,   0,   0
		    db	0Ah, 71h, 3Fh
		    db	0Bh, 71h, 71h
		    db	0Bh, 18h, 18h
		    db	0Bh,0C8h, 71h
		    db	0Ah, 9Fh,0AFh
		    db	16h, 31h, 1Dh
		    db	0Ah,0C3h, 1Eh
		    db	0Ah,0A1h,0CEh
		    db	16h,0CBh,0CDh
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	0Ah, 14h, 1Ch
		    db	0Bh,0C7h,0C7h
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	0Ah, 29h, 27h
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	0Ah, 7Dh, 7Dh
		    db	0Ah, 7Dh, 7Dh
		    db	0Ah, 7Dh, 7Dh
		    db	  0,   0,   0
		    db	0Ah, 7Dh, 7Dh
		    db	0Ah, 7Dh, 7Dh
		    db	0Ah, 7Dh, 7Dh
		    db	  0,0C7h,0C7h
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	0Ah, 73h, 73h
		    db	0Bh,0C7h,0C7h
		    db	0Ah,0C7h,0C7h
		    db	0Ah, 7Dh, 7Dh
		    db	  0,   0,   0
		    db	  0, 53h, 53h
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	0Ah, 7Dh, 7Dh
		    db	  0,   0,   0
		    db	0Ah, 7Dh, 7Dh
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	0Ah,0C7h,0C7h
		    db	0Ah,0C7h,0C7h
		    db	0Bh,0C7h,0C7h
		    db	0Ah,0C7h,0C7h
		    db	0Ah,0C7h,0C7h
		    db	  0,   0,   0
		    db	0Ah,0C7h,0C7h
		    db	  0,   0,   0
		    db	0Ah, 73h, 73h
		    db	0Ah,0C7h,0C7h
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,0C7h,0C7h
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0,   0,   0
		    db	  0, 7Dh, 7Dh
		    db	  0, 7Dh, 7Dh
		    db	0Ah,0C7h,0C7h
		    db	0Ah,0C7h,0C7h
		    db	0Ah, 7Dh, 7Dh
		    db	0Ah, 73h, 73h
		    db	  0,   0,   0
		    db	0Ah,0C7h,0C7h
		    db	  0,   0,   0
		    db	0Bh,0C7h,0C7h
		    db	0Bh,0C7h,0C7h
		    db	0Bh,0C7h,0C7h
		    db	  0,   0,   0
		    db	0Ah,0C7h,0C7h
