;----------------------------------------------------------------------------
;
; Snake	portrait used in radio mode
;
;----------------------------------------------------------------------------
gfxSnakePortrait:   db 0FFh,0FFh,   0,0FFh,0FFh,   1,0FFh,0FFh,	  3,0FFh,0FFh,	 3,0FFh,0FFh,	7,0FFh
		    db 0FFh, 0Fh,0FFh,0FFh, 1Eh,0FFh,0FFh, 1Eh,0FFh,0FFh, 3Fh,0FFh,0FCh,0F8h,0FFh,0FFh
		    db 0E3h,0FFh,0FFh,0FFh,0FFh,0EEh,0CEh,0FFh,0C4h,0C4h,0FFh,0FFh,0CFh,0FFh,0FFh,0F4h
		    db 0FFh,0FFh,0FFh,0FFh,0FFh,0F3h,0FFh,0FFh,0F0h,0FFh,0FFh,0FFh,0FFh,0F9h, 91h,0FFh
		    db 0FFh, 91h,0FFh,0FFh,0C8h,0FFh,0FFh, 36h,0FFh,0FFh, 80h,0FFh,0FFh,0C0h,0FFh,0FFh
		    db 0E0h,0FFh,0FFh, 60h,0FFh,0FFh,0E0h,0FFh,0FFh,0B0h,0FFh,0FFh, 90h,0FFh,0FFh, 50h
		    db 0FFh,0FFh, 1Eh,0FFh,0FFh, 0Fh,0FFh,0FFh,	0Fh,0FFh,0FFh, 0Dh,0FFh,0FFh,	9,0FFh
		    db 0FFh,   9,0FFh,0FFh,   5,0FFh,0FFh,   4,0FFh,0B2h, 82h, 91h, 81h,   1,0DFh, 1Fh
		    db	  0,0FFh, 9Fh, 8Fh,0DEh,0CCh,0C7h,0D7h,0C0h,   0,0C2h, 80h,   0,0C1h, 80h, 80h
		    db 0FFh, 1Fh, 17h,0CFh, 0Ah,   3,0EFh,0C2h,	83h,0FEh,0E1h, 41h, 4Fh,   0, 81h, 17h
		    db	  0,   1, 27h,	 0,   1, 0Fh,	1,   2,0FFh,0FFh,0F0h, 7Fh, 3Fh, 30h,0FFh, 1Fh
		    db	  8,0DFh,0D7h,	 4,0FFh,0DBh, 12h,0FFh,	9Bh, 92h,0FFh,0AFh, 8Ch,0FFh, 2Fh,   8
		    db 0FFh,0FFh,   0,0FFh,0FFh,   1,0FFh,0FFh,	  1,0FFh,0FFh,	 0,0FFh,0FFh,	0,0FFh
		    db 0FFh,   0,0FFh,0FFh, 0Eh,0F1h,0F1h, 11h,	80h, 80h, 80h, 38h,   0,   0,0FCh,0F0h
		    db	  0,0F0h,0E0h,0C0h,0FFh,0F2h, 5Eh,0F0h,0E0h, 40h,0FCh,0F4h, 24h,0F0h,0F0h, 20h
		    db	2Fh,   1,   2, 2Fh,   9,   2, 5Eh, 12h,	  4, 3Eh, 26h,	 8, 3Eh,   8, 10h, 3Eh
		    db	14h, 20h, 7Eh, 2Ch, 40h,0FFh, 58h, 80h,0FFh, 6Fh, 48h, 7Fh, 7Fh, 68h, 7Fh, 7Fh
		    db	78h, 3Fh, 3Fh, 3Eh, 1Fh, 11h, 11h, 0Fh,	0Dh,   9, 3Fh, 1Fh, 11h, 7Fh, 3Fh, 20h
		    db 0FFh,0EEh, 20h,0DFh,0DFh, 56h,0EFh,0CFh,	8Fh,0BFh, 27h, 27h,0DFh, 1Fh, 13h,0FFh
		    db 0EFh,0CBh,0FFh,0BFh, 27h,0FFh,0DFh, 9Ch,0FBh, 81h,0F2h,0FFh, 47h, 3Ch,0FFh,0FFh
		    db 0FFh,0FFh,0FFh,0DFh,0FFh,0DFh, 9Fh,0FFh,	9Ch, 1Ch,0FFh,0B3h, 30h,0FFh,0AFh, 2Eh
		    db 0FFh,0F8h,   0,0FFh,0FFh,   3,0FFh, 3Fh,	  4,0FFh,0BEh,0B8h,0FFh,0FDh,0C9h,0FFh
		    db 0FBh, 33h,0FFh,0F7h, 46h,0FFh,0F3h,   3,0FFh, 7Fh, 59h,0FFh,0FFh,0C2h,0FFh,0FFh
		    db	  7,0FFh,0FCh, 0Ch,0FFh,0F8h, 78h,0FFh,0F0h, 50h,0FFh,0F6h,0A6h,0FFh,0F8h,0C8h

; Snake	portrait (face animation frame)
gfxSnakePortrait2:  db 0FFh,0B2h, 82h, 91h, 81h,   1,0DFh, 1Fh,	  0,0FFh, 9Fh, 8Fh,0DCh,0CCh,0C7h,0D7h
		    db 0C0h,   0,0C2h, 80h,   0,0C1h, 80h, 80h,0FFh, 1Fh, 17h,0CFh, 0Ah,   3,0EFh,0C2h
		    db	  3,0FEh,0E1h, 41h,0CFh,   0, 81h, 17h,	  0,   1, 27h,	 0,   1, 0Fh,	1,   2
		    db	80h, 80h, 80h, 38h,   0,   0,0FCh,0B0h,	  0,0F2h,0E0h,0C0h,0FFh,0DEh, 4Eh,0FFh
		    db 0FEh, 40h,0F8h,0E0h, 40h,0FCh,0F4h, 24h
