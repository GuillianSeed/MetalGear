
;----------------------------------------------------------------------------
; Font
;----------------------------------------------------------------------------
gfxFont:	    db	  0, 28h, 6Ch,0C6h,0C6h,0C6h, 6Ch, 28h,	  0, 18h, 38h, 18h, 18h, 18h, 18h, 7Ah
		    db	  0, 6Ch,0C6h,	 6, 0Ch, 28h, 60h,0EEh,	  0, 6Eh, 0Ch,	 8, 2Ch,   6,0C6h, 6Ch
		    db	  0, 0Ch, 2Ch, 6Ch,0CCh,0EEh, 0Ch, 0Ch,	  0,0EEh,0C0h,0ECh,   6,   6,0C6h, 6Ch
		    db	  0, 2Eh, 60h,0C0h,0ECh,0C6h,0C6h, 6Ch,	  0,0F6h, 86h, 84h, 10h, 30h, 30h, 30h
		    db	  0, 68h,0C4h,0E4h, 68h, 8Eh, 86h, 6Ch,	  0, 6Ch,0C6h,0C6h, 6Eh,   6, 0Ch, 68h
		    db	3Ch, 42h, 99h,0A1h,0A1h, 99h, 42h, 3Ch


gfxSymbChars:	    db	  0, 18h, 18h,0FFh, 7Eh, 3Ch, 3Ch, 66h,	  0,   8, 0Ch, 7Eh, 7Fh, 7Eh, 0Ch,   8
		    db	  0, 18h, 18h, 18h, 18h, 18h,	0, 18h,	  0, 6Ch, 6Ch, 6Ch, 6Ch, 6Ch,	0, 6Ch
		    db	  0,   6,   6, 26h, 66h,0FCh, 60h, 20h,	  0,   0,   0,	 0, 3Ch,   0,	0,   0
		    db	  0, 30h, 74h,0C6h,0C6h,0F6h,0C6h,0C6h,	  0,0DCh,0C6h,0C6h,0DCh,0C6h,0C6h,0DCh
		    db	  0, 2Ch, 66h,0C0h,0C0h,0C0h, 66h, 2Ch,	  0,0D8h,0CCh,0C6h,0C6h,0C6h,0CCh,0D8h
		    db	  0, 6Eh, 60h, 60h, 6Ch, 60h, 60h, 6Eh,	  0, 6Eh, 60h, 60h, 6Ch, 60h, 60h, 60h
		    db	  0, 2Eh, 60h,0C0h,0CEh,0C6h, 66h, 2Eh,	  0,0C6h,0C6h,0C6h,0F6h,0C6h,0C6h,0C6h
		    db	  0, 3Ah, 18h, 18h, 18h, 18h, 18h, 3Ah,	  0, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 8Eh, 6Ch
		    db	  0,0C6h,0CCh,0D8h,0D0h,0D8h,0DCh,0CEh,	  0, 60h, 60h, 60h, 60h, 60h, 60h, 6Eh
		    db	  0,0C6h,0EEh,0FEh,0FEh,0D6h,0C6h,0C6h,	  0,0C6h,0E6h, 76h,0BAh,0DCh,0CEh,0C6h
		    db	  0, 6Ch,0C6h,0C6h,0C6h,0C6h,0C6h, 6Ch,	  0,0DCh,0C6h,0C6h,0C6h,0DCh,0C0h,0C0h
		    db	  0, 7Ch,0C6h,0C6h,0C6h,0DAh,0CCh, 7Ah,	  0,0DCh,0C6h,0C6h,0CCh,0D8h,0DCh,0CEh
		    db	  0, 6Ch,0C6h,0C0h, 6Ch,   6,0C6h, 6Ch,	  0, 7Ah, 18h, 18h, 18h, 18h, 18h, 18h
		    db	  0,0C6h,0C6h,0C6h,0C6h,0C6h,0C6h, 74h,	  0,0C6h,0C6h,0C6h,0C6h, 6Ch, 38h, 10h
		    db	  0,0D6h,0D6h,0FEh,0FEh,0EEh,0C6h, 82h,	  0,0C6h,0EEh, 74h, 38h, 5Ch,0EEh,0C6h
		    db	  0, 66h, 66h, 66h, 3Ch, 18h, 18h, 18h,	  0,0F6h, 0Eh, 1Ch, 38h, 70h,0E0h,0DEh
	IF (JAPANESE)
		    db	  0, 3Ch, 66h,	 6, 0Ch, 10h,	0, 18h,	  0,   0,   0, 18h, 18h,   0,   0,   0
	ELSE
		    db	  0, 3Ch, 66h,	 6, 0Ch, 10h,	0, 18h,	  0,   0,   0,	 0,   0,   0, 18h, 18h	
	ENDIF
		    db	  0,   0,   0,	 0,   0, 20h, 50h, 20h,	  0,   0,   0,	 0,   0,   0, 40h, 20h
		    db	  0,   0,   0,	 0,   0, 30h, 10h, 20h,	  0, 7Fh,   9,	 9, 0Eh,   8,	8, 30h
		    db	  0,   3, 1Ch, 68h,   8,   8,	8,   8,	  0,   8, 7Fh, 41h, 41h,   1,	2, 1Ch
		    db	  0, 7Fh,   8,	 8,   8,   8,	8, 7Fh,	  0,   4, 7Fh,	 4, 0Ch, 14h, 14h, 64h
		    db	  0, 10h, 7Fh, 11h, 11h, 11h, 11h, 62h,	  0, 10h, 7Fh,	 8,   8, 7Fh,	4,   4
		    db	  0, 3Fh, 21h, 41h,   1,   1,	6, 38h,	  0, 20h, 3Fh, 22h, 42h,   2,	4, 18h
		    db	  0, 7Fh,   1,	 1,   1,   1,	1, 7Fh,	  0, 22h, 7Fh, 22h, 22h, 22h,	2, 1Ch
		    db	  0, 70h,   1, 71h,   1,   1,	2, 7Ch,	  0, 7Fh,   1,	 1,   2,   4, 1Ah, 61h
		    db	  0, 20h, 7Fh, 21h, 21h, 22h, 20h, 1Fh,	  0, 41h, 41h, 41h, 21h,   1,	2, 3Ch
		    db	  0, 3Fh, 21h, 59h,   7,   1,	6, 38h,	  0, 3Fh,   4, 7Fh,   4,   4,	8, 30h
		    db	  0, 51h, 51h, 51h,   1,   2,	2, 3Ch,	  0, 7Fh,   0, 7Fh,   4,   4,	4, 38h
		    db	  0, 20h, 20h, 3Ch, 23h, 20h, 20h, 20h,	  0,   4, 7Fh,	 4,   4,   4,	8, 70h
		    db	  0,   0, 3Eh,	 0,   0,   0,	0, 7Fh,	  0, 7Fh,   1, 11h,   9,   6,	6, 79h
		    db	  0,   8, 7Fh,	 1,   1, 3Eh, 49h,   8,	  0,   1,   1,	 2,   2,   4,	8, 30h
		    db	  0, 22h, 21h, 21h, 21h, 21h, 21h, 41h,	  0, 40h, 7Eh, 40h, 40h, 40h, 40h, 3Fh
		    db	  0, 7Fh,   1,	 1,   1,   1,	2, 3Ch,	  0, 10h, 28h, 44h, 44h,   2,	2,   1
		    db	  0,   8, 7Fh,	 8, 2Ah, 2Ah, 4Ah, 49h,	  0, 7Fh,   1,	 1, 21h, 16h,	8,   4
		    db	  0, 7Eh,   0,	 0, 7Eh,   0,	0, 7Eh,	  0, 10h, 20h, 20h, 42h, 41h, 41h, 7Fh
		    db	  0,   1,   1, 12h, 0Ah,   4, 0Ah, 31h,	  0, 7Fh, 10h, 10h, 7Fh, 10h, 10h, 0Fh
		    db	  0, 20h, 7Fh, 21h, 21h, 26h, 20h, 20h,	  0, 3Eh,   2,	 2,   2,   2,	2, 7Fh
		    db	  0, 7Fh,   1,	 1, 7Fh,   1,	1, 7Fh,	  0, 7Fh,   0, 7Fh,   1,   1,	1, 3Eh
		    db	  0, 41h, 41h, 41h, 41h,   1,	6, 38h,	  0, 28h, 28h, 28h, 29h, 29h, 49h, 4Eh
		    db	  0, 20h, 20h, 20h, 21h, 21h, 22h, 3Ch,	  0, 7Fh, 41h, 41h, 41h, 41h, 41h, 7Fh
		    db	  0, 7Fh, 41h, 41h,   1,   1,	2, 3Ch,	  0, 7Fh,   1,	 1, 7Fh,   1,	2, 3Ch
		    db	  0, 71h,   1,	 1,   1,   1,	2, 7Ch,	  0,   0,   0, 1Fh,   1,   5,	4, 18h
		    db	  0,   0,   0,	 1,   7, 1Ch,	4,   4,	  0,   0,   0,	 4, 1Fh, 11h,	1,   6
		    db	  0,   0,   0,	 0, 0Fh,   2,	2, 0Fh,	  0,   0,   0,	 2, 1Fh,   6, 0Ah, 12h
		    db	  0,   0,   0, 15h, 15h, 15h,	1,   6,	  0,   0,   0,	 8, 1Fh,   9, 0Ah,   8
		    db	  0,   0,   0,	 0, 1Eh,   2,	2, 1Fh,	  0,   0,   0, 0Fh,   1, 0Fh,	1, 0Fh
	IF (JAPANESE)
		    db 40h, 0A0h, 40h,	 0,   0,   0,	0,   0,	40h, 20h, 80h, 40h,   0,   0,	0,   0
	ELSE
		    db 0C0h, 40h, 80h,	 0,   0,   0,	0,   0,	40h, 20h, 80h, 40h,   0,   0,	0,   0
	ENDIF
		    
		    db	  0,   8, 18h, 3Fh, 7Fh, 3Fh, 18h,   8,	  0,   8, 1Ch, 3Eh, 7Fh, 1Ch, 1Ch, 1Ch
		    db	  0, 1Ch, 1Ch, 1Ch, 7Fh, 3Eh, 1Ch,   8


;----------------------------------------------------------------------------
; Frequency / countdown	digits
;----------------------------------------------------------------------------
gfxFreqDigits:	    db	  0,   0,   0,	 0,   0, 18h, 18h,   0,	7Ch,0BAh,0C6h,0C6h,0C6h,0C6h,0C6h,0C6h
		    db 0C6h,0C6h,0C6h,0C6h,0C6h,0BAh, 7Ch,   0,	  0,   2,   6,	 6,   6,   6,	6,   6
		    db	  6,   6,   6,	 6,   6,   2,	0,   0,	7Ch, 3Ah,   6,	 6,   6,   6, 7Eh,0BCh
		    db 0C0h,0C0h,0C0h,0C0h,0C0h,0B8h, 7Ch,   0,	7Ch, 3Ah,   6,	 6,   6,   6, 3Eh, 3Eh
		    db	  6,   6,   6,	 6,   6, 3Ah, 7Ch,   0,	  0, 82h,0C6h,0C6h,0C6h,0C6h, 7Eh, 7Eh
		    db	7Eh,0BCh,0C0h,0C0h,0C0h,0C0h, 7Ch, 7Ch,	7Ch,0BAh,0C6h,0C6h,0C6h,0C6h, 86h,   6
		    db	7Ch,0BAh,0C6h,0C6h,0C6h,0C6h, 7Ch, 7Ch

;----------------------------------------------------------------------------
; CALL sign
;----------------------------------------------------------------------------
gfxCALL:	    db 0FFh,0FFh,0FFh,0FFh,0FFh,0C7h,0FFh, 82h,0FFh, 92h,0FFh, 92h,0FFh, 9Eh,0FFh, 9Eh
		    db 0FFh,0FFh,0FFh,0FFh,0FFh, 19h,0FFh,   9,0FFh, 49h,0FFh, 49h,0FFh, 49h,0FFh, 49h
		    db 0FFh,0FFh,0FFh,0FFh,0FFh,0CFh,0FFh,0CFh,0FFh,0CFh,0FFh,0CFh,0FFh,0CFh,0FFh,0CFh
		    db 0FFh, 9Eh,0FFh, 92h,0FFh, 92h,0FFh, 82h,0FFh,0C6h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
		    db 0FFh,   9,0FFh,	 9,0FFh, 49h,0FFh, 48h,0FFh, 48h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
		    db 0FFh,0CFh,0FFh,0CFh,0FFh,0CFh,0FFh, 43h,0FFh, 43h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh