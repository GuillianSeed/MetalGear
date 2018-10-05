;----------------------------------------------------------------------------
; Sourveillance	camera graphics	(vertical)
;----------------------------------------------------------------------------
gfxCameraV:	    db	  3,   2,   9, 0Eh, 0Bh, 0Ch, 0Fh, 0Fh,	  9, 0Eh, 0Bh, 0Ch, 0Bh, 0Ch, 0Bh, 0Ch
		    db	40h,0C0h,0B0h, 50h,0F0h, 10h,0F0h,0F0h,0F0h, 10h,0F0h, 10h,0F0h, 10h,0F0h, 10h
		    db	  1,   1,   8, 0Fh, 0Ah, 0Dh, 0Bh, 0Ch,	0Bh, 0Ch, 0Bh, 0Ch,   9, 0Eh, 0Fh, 0Fh
		    db	98h, 98h, 54h,0B4h,0F4h, 10h,0F4h, 14h,0F8h, 18h,0F0h, 10h, 70h, 90h,0F0h,0F0h
		    db	  0,   0,   0,	 0,   0,   0, 1Fh, 1Fh,	  4, 1Fh,0CDh,0D6h,   4,0DFh,0FFh, 3Fh
		    db	  0,   0, 0Ch,	 8, 12h, 12h,0FDh,0FDh,	17h,0EBh,0FEh,	 2, 7Eh, 82h,0FFh,0EBh
		    db	  0,   0, 30h, 10h, 48h, 48h,0BFh,0BFh,0C0h,0FFh, 4Fh, 70h, 43h, 7Ch,0FFh,0F7h
		    db	  0,   0,   0,	 0,   0,   0,0F8h,0F8h,0A8h, 70h,0EBh, 33h,0E8h, 33h,0FFh,0FCh

;----------------------------------------------------------------------------
; Sourveillance	camera graphics	(horizontal)
;----------------------------------------------------------------------------
gfxCameraH:	    db	0Bh, 0Ch, 1Bh, 1Ch, 29h, 2Eh, 2Fh, 0Fh,	2Fh, 2Eh, 1Fh, 1Eh,   7,   6,	1,   1
		    db 0F0h, 10h,0F0h, 10h, 30h,0D0h,0F0h,0F0h,0F0h, 70h,0F0h,0F0h,0F0h,0F0h, 80h, 80h
		    db	  9, 0Eh,   8, 0Fh, 0Fh, 0Fh, 0Eh, 0Fh,	0Fh, 0Dh, 0Fh, 0Fh,   3,   2,	1,   1
		    db 0F0h, 10h,0B0h, 50h,0F0h,0F0h, 70h,0D0h,0F0h,0B0h,0F0h,0F0h, 40h,0C0h, 80h, 80h
		    db 0FFh,0E6h,0DFh,0C4h,0DFh,0C4h, 1Fh, 1Fh,	  0,   0,   7,	 6,   0,   0,	0,   0
		    db 0FFh,   3,0FEh,	 2,0FEh,   2,0FEh,0FEh,	10h,   0,0F0h, 80h,   0,   0,	0,   0
		    db 0FFh,0C0h, 7Fh, 40h, 7Fh, 40h, 3Fh, 3Fh,	  8,   0, 0Fh,	 1,   0,   0,	0,   0
		    db 0FFh, 27h,0FBh, 23h,0FBh, 23h,0F8h,0F8h,	  0,   0,0E0h, 60h,   0,   0,	0,   0
