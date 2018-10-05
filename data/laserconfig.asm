;----------------------------------------------------------------------------
;
; Laser	beams data
;
; status, Y, X,	DY buffer, DX buffer, Lenght, vert/horiz
;----------------------------------------------------------------------------
LasersRoom24:	    db 6
		    db	  1, 10h, 6Fh, 98h, 9Eh, 30h,	0
		    db	  1, 18h,0AFh, 98h, 9Ch, 28h,	0
		    db	  1, 50h, 40h,0A0h,   0, 20h,	1
		    db	  1, 58h, 6Fh, 98h, 9Ah, 28h,	0
		    db	  1, 50h, 80h,0A2h,   0, 20h,	1
		    db	  1, 98h,0AFh, 98h, 98h, 20h,	0


LasersRoom25:	    db 5
		    db	  1, 30h,   8,0A0h,   0, 38h,	1
		    db	  1, 38h, 4Fh, 98h, 9Eh, 28h,	0
		    db	  1, 78h, 4Fh, 98h, 9Ch, 20h,	0
		    db	  1, 50h,0E0h,0A2h,   0, 18h,	1
		    db	  1,0B0h, 88h,0A4h,   0, 18h,	1


LasersRoom72:	    db 0Ah
		    db	  1, 10h,0AFh, 98h, 9Eh, 30h,	0
		    db	  0, 50h,   8,0A0h,   0, 18h,	1
		    db	  0, 50h, 40h,0A2h,   0, 60h,	1
		    db	  1, 58h, 2Fh, 98h, 9Ch, 28h,	0
		    db	  0, 70h,   8,0A4h,   0, 58h,	1
		    db	  0, 58h,0AFh, 98h, 9Ah, 28h,	0
		    db	  1, 90h, 40h,0A6h,   0, 60h,	1
		    db	  0, 90h,0C0h,0A8h,   0, 38h,	1
		    db	  1, 98h, 30h, 98h, 98h, 20h,	0
		    db	  0, 98h,0B0h, 98h, 96h, 20h,	0

;----------------------------------------------------------------------------
;
; Moving lasers	ON/OFF sequences
;
;----------------------------------------------------------------------------
idxLaserOnOff:	    dw LasersOnOff1
		    dw LasersOnOff2
		    dw LasersOnOff3
		    dw LasersOnOff4
		    dw LasersOnOff5

LasersOnOff1:	    db	  1,   0,   0,	 1,   0,   0,	1,   0,	  1,   0
LasersOnOff2:	    db	  0,   1,   1,	 0,   0,   0,	1,   0,	  0,   1
LasersOnOff3:	    db	  1,   0,   1,	 0,   0,   1,	0,   0,	  1,   1
LasersOnOff4:	    db	  1,   1,   1,	 0,   0,   0,	0,   1,	  0,   0
LasersOnOff5:	    db	  1,   0,   0,	 0,   1,   1,	0,   0,	  0,   1