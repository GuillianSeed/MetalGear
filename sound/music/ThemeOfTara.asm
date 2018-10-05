;----------------------------------------------------------------------------
;
; Theme	of Tara
;
;----------------------------------------------------------------------------
ThemeOfTaraShared1: db 0EFh,0D7h,0FAh,	 3,0ECh, 53h,0E2h, 33h,	41h,0F7h, 22h, 41h,0E9h,   4, 43h,0B3h
		    db 0E9h,   5,   3,0E9h,   4, 93h,0B3h, 73h,0FFh

ThemeOfTaraShared2: db 0EFh,0D7h,0FAh,	 3,0ECh, 53h,0E3h, 63h,	71h,0F8h, 22h, 71h,0F9h,   3,0ECh, 63h
		    db 0E2h, 77h, 67h, 27h,0FFh

ThemeOfTaraShared3: db 0EFh,0FAh, 12h,0E3h,0B1h,0B1h,0B1h,0F9h,	21h,0B1h,0FAh, 12h,0B1h,0F9h, 21h,0B1h
		    db 0FFh

ThemeOfTaraShared4: db 0FBh, 23h,0E2h,	 1,   1,   1,0F9h, 21h,	  1,0FBh, 23h,	 1,0F9h, 21h,	1,0FFh

ThemeOfTaraShared5: db 0EFh,0D7h,0FAh,	 3,0ECh, 53h,0E3h,0A3h,0B1h,0F7h, 22h,0B1h,0E8h,0F6h,	3,0E2h
		    db	79h, 67h, 25h,0FFh

ThemeOfTaraShared6: db 0EFh,0FAh, 12h,0E2h, 51h, 51h, 51h,0F9h,	31h, 51h,0FAh, 12h, 51h,0F9h, 21h, 51h
		    db 0FFh

ThemeOfTaraShared7: db 0EFh,0FAh,   3,0ECh, 62h,0E2h, 51h,   1,	51h,0E1h,   9,0E2h, 61h, 11h, 61h,0FFh

ThemeOfTaraShared8: db 0E9h,   5, 51h, 51h, 51h, 51h, 51h, 51h,	51h, 51h, 61h, 61h, 61h, 61h,0FFh

;----------------------------------------------------------------------------
; Intro
;----------------------------------------------------------------------------
Mus_IntroTara:	    db 0D1h,0CDh,0E9h,	 1, 22h, 23h, 26h, 26h,	  6, 2Dh, 26h, 26h, 2Dh, 2Dh,0D7h,0E9h
		    db	  5,0B1h,0E9h,	 4,0B1h,0EFh,0FBh, 22h,0ECh, 52h,0E2h, 43h,0E5h, 40h, 40h,0E2h
		    db	40h, 40h, 41h, 41h, 71h,0B1h, 92h, 90h,0E1h, 47h, 21h,	 1,0E2h,0BBh,0E1h, 43h
		    db 0F9h,   0, 37h,0F8h,   0, 32h,0F7h,   0,	32h,0F6h,   0, 32h,0F5h,   0, 32h,0CFh

;----------------------------------------------------------------------------
; Theme	of Tara	(A)
;----------------------------------------------------------------------------
Mus_ThemeTara:	    db 0EFh,0D7h,0C3h
MusThemeOfTara1:    db 0EFh,0FAh,   3,0ECh, 53h,0E2h, 33h, 41h,0F7h, 22h, 41h,0E9h,   5, 43h, 43h, 43h
		    db	43h, 43h, 43h

		    db 0FEh,   2
		    dw MusThemeOfTara1
MusThemeTara2:	    db 0FEh,0FFh
		    dw ThemeOfTaraShared1

		    db 0FEh,   3
		    dw MusThemeTara2
		    db 0EFh,0FAh,   3,0ECh, 53h,0E2h, 33h, 41h,0F7h, 22h, 41h,0FCh, 36h,0E5h, 43h,0B3h
		    db 0E4h,   3,0E5h, 93h,0FBh, 20h,0B3h,0F8h,	  0,0B3h,0F7h,	 0,0B3h,0F6h,	0,0B3h
		    db 0F5h,   0,0B3h,0F4h,   0,0B3h
MusThemeTara3:	    db 0EFh,0FAh,   3,0ECh, 53h,0E2h, 83h, 91h,0F7h, 22h, 91h,0E9h,   4, 93h,0E9h,   5
		    db	43h, 53h, 23h, 43h,   3
		    db 0FEh,   2
		    dw MusThemeTara3

MusThemeTara4:	    db 0FEh,0FFh
		    dw ThemeOfTaraShared1

		    db 0FEh,   2
		    dw MusThemeTara4
MusThemeTara5:	    db 0E9h,   5, 51h, 51h, 53h, 53h, 51h, 51h,	53h, 53h, 51h, 51h, 53h

		    db 0FEh,   4
		    dw MusThemeTara5

MusThemeTara6:	    db 0E9h,   5, 51h, 51h, 51h, 51h, 51h, 51h,	51h, 51h, 61h, 61h, 61h, 61h, 61h, 61h
		    db	61h, 61h
		    db 0FEh,   2
		    dw MusThemeTara6
		    db 0FEh,0FFh
		    dw ThemeOfTaraShared7
		    db 0E1h, 19h
		    db 0FEh,0FFh
		    dw ThemeOfTaraShared7
		    db 0E1h, 11h,0E2h, 71h, 21h, 71h,0E1h, 21h,0FAh, 12h,0ECh, 53h,0E2h, 2Bh, 43h, 75h
		    db	65h, 73h, 95h, 51h, 9Fh, 73h, 93h,0BBh,0B3h, 95h, 75h, 63h, 70h, 60h, 49h, 23h
		    db	40h, 60h, 70h, 60h, 4Bh, 2Bh,0E1h, 43h,0E2h,0B5h, 95h, 73h, 95h, 51h, 9Fh, 73h
		    db	93h,0B5h, 71h,0E1h, 47h,0E2h,0B5h, 71h,0E1h, 47h,0FAh, 2Fh,0E3h, 70h, 72h,0F8h
		    db	2Fh, 70h, 72h,0F6h, 2Fh, 70h, 72h,0F4h,	2Fh, 70h, 72h,0C1h,0F9h, 2Fh, 90h, 92h
		    db 0F7h, 2Fh, 90h, 92h,0F5h, 2Fh, 90h, 92h,0F3h, 2Fh, 90h, 92h, 90h, 92h, 90h, 92h
		    db 0FEh,0FEh
		    dw MusThemeTara2

;----------------------------------------------------------------------------
; Intro	Theme of Tara (B)
;----------------------------------------------------------------------------
Mus_IntroTaraB:	    db 0D7h,0C1h,0E9h,	 1,   0,   0,	9,0B1h,0B1h,0EFh,0FCh, 23h,0E4h, 43h, 40h, 40h
		    db	41h, 23h, 23h, 10h, 10h,0E3h, 10h,0E4h,	10h, 10h,0E3h, 10h,0E4h, 10h, 10h,   1
		    db	  1,0E3h,   1,0E4h,   1,0E5h,0B3h,0B3h,0B3h,0D2h,0FAh,	 0,0E5h,0B1h,0E4h,   0
		    db	10h, 20h, 30h, 40h, 50h, 60h, 70h, 80h,	90h,0A0h,0B0h,0D7h,0F9h,   0,0ECh, 54h
		    db 0B7h,0F8h,   0,0B2h,0F7h,   0,0B2h,0F6h,	  0,0B2h,0F5h,	 0,0B2h,0CFh

;----------------------------------------------------------------------------
; Theme	of Tara	(B)
;----------------------------------------------------------------------------
Mus_ThemeTaraB:	    db 0EFh,0D7h,0C3h
MusThemeTaraB1:	    db 0EFh,0FAh,   3,0ECh, 53h,0E3h,0A3h,0B1h,0F7h, 22h,0B1h,0E9h,   4, 43h, 43h, 43h
		    db	43h, 43h, 43h
		    db 0FEh,   2
		    dw MusThemeTaraB1
Mus_ThemeTaraB2:    db 0FEh,0FFh
		    dw ThemeOfTaraShared2
		    db 0FEh,   3
		    dw Mus_ThemeTaraB2
		    db 0EFh,0FAh,   3,0ECh, 53h,0E3h, 63h, 71h,0F8h, 22h, 71h,0F9h,   3,0ECh, 63h,0E2h
		    db	77h, 67h,0FAh, 20h, 23h,0F7h,	0, 23h,0F6h,   0, 23h,0F5h,   0, 23h,0F4h,   0
		    db	23h,0F3h,   0, 23h
MusThemeTaraB3:	    db 0EFh,0FAh,   3,0ECh, 53h,0E2h, 33h, 41h,0F8h, 22h, 41h,0F9h,   3,0ECh, 72h,0E1h
		    db	  7,0E2h,0B7h, 97h
		    db 0FEh,   2
		    dw MusThemeTaraB3
MusThemeTaraB4:	    db 0FEh,0FFh
		    dw ThemeOfTaraShared2
		    db 0FEh,   2
		    dw MusThemeTaraB4
MusThemeTaraB5:	    db 0FEh,0FFh
		    dw ThemeOfTaraShared3
		    db 0FEh,0FFh
		    dw ThemeOfTaraShared3
		    db 0FAh, 12h,0B1h,0B1h,0B1h,0F9h, 21h,0B1h
		    db 0FEh,0FFh
		    dw ThemeOfTaraShared4
		    db 0FEh,0FFh
		    dw ThemeOfTaraShared4
		    db 0FAh, 12h,   1,	 1,   1,0F9h, 21h,   1
		    db 0FEh,   2
		    dw MusThemeTaraB5
MusThemeTaraB6:	    db 0F6h,   0,0ECh, 61h,0E1h, 50h,0F7h,   0,	50h,0F8h,   0, 50h,0F9h,   3, 5Ch,0F6h
		    db	  0, 40h,0F7h,	 0, 40h,0F8h,	0, 40h,0F9h,   3, 4Ch
		    db 0FEh,   2
		    dw MusThemeTaraB6
		    db 0FEh,0FFh
		    dw ThemeOfTaraShared8
		    db	61h, 61h, 61h, 61h
		    db 0FEh,0FFh
		    dw ThemeOfTaraShared8
		    db	71h, 71h, 71h, 71h
MusThemeTaraB7:	    db 0EFh,0E9h,   5, 41h
		    db 0FEh, 10h
		    dw MusThemeTaraB7
MusThemeTaraB8:	    db 0EFh,0E9h,   5, 51h
		    db 0FEh, 10h
		    dw MusThemeTaraB8
MusThemeTaraB9:	    db	41h
		    db 0FEh,   8
		    dw MusThemeTaraB9
MusThemeTaraB10:    db	21h
		    db 0FEh,   8
		    dw MusThemeTaraB10
		    db	  1,   1,   1,	 1,   0,0E9h,	4, 70h,0E9h,   5,   0, 40h, 70h, 40h,	0, 40h
		    db	21h, 21h, 21h, 21h, 20h,0E9h,	4, 90h,0E9h,   5, 20h, 60h, 90h, 60h, 20h, 60h
		    db 0EFh,0FCh, 33h
MusThemeTaraB11:    db 0E4h, 41h, 40h, 40h
		    db 0FEh,   8
		    dw MusThemeTaraB11
MusThemeTaraB12:    db	51h, 50h, 50h
		    db 0FEh,   8
		    dw MusThemeTaraB12
		    db	42h, 40h,0B1h,0E3h, 43h,0E4h, 41h,0B1h,0E3h, 41h,0E4h, 22h, 20h, 91h,0E3h, 23h
		    db 0E4h, 21h, 91h,0E3h, 21h,0FCh, 2Fh,0E3h,	  0,   2,0F9h, 2Fh,   0,   2,0F7h, 2Fh
		    db	  0,   2,0F5h, 2Fh,   0,   2,0FBh, 2Fh,	20h, 22h,0F9h, 2Fh, 20h, 22h,0F7h, 2Fh
		    db	20h, 22h,0F5h, 2Fh, 20h, 22h, 20h, 22h,	20h, 22h, 20h, 20h
		    db 0FEh,0FEh
		    dw Mus_ThemeTaraB2
;----------------------------------------------------------------------------
; Intro	Theme of Tara (C)
;----------------------------------------------------------------------------
Mus_IntroTaraC:	    db 0D7h,0FBh, 21h,0E3h,0C1h,0CFh,0B3h,0E9h,	  1, 30h, 30h, 10h,0EFh,0B0h,0B1h,0B1h
		    db 0E2h, 21h, 71h, 42h, 40h, 93h, 73h, 71h,	71h
MusIntroThemeTaraC1:db 0FAh, 11h, 40h,0E3h,0B0h, 90h
		    db 0FEh,   5
		    dw MusIntroThemeTaraC1
		    db	40h,0B0h,0E2h, 30h, 60h, 90h,0B0h,0E1h,	30h, 60h, 90h,0F7h,   0,0B2h,0F6h,   0
		    db 0B2h,0F5h,   0,0B2h,0F4h,   0,0B2h,0CFh
;----------------------------------------------------------------------------
; Theme	of Tara	(C)
;----------------------------------------------------------------------------
Mus_ThemeTaraC:	    db 0EFh,0D7h,0C3h
MusThemeTaraC1:	    db 0EFh,0FAh,   3,0ECh, 53h,0E3h, 63h, 71h,0F7h, 22h, 71h,0E9h,   1,0B3h,0B3h,0B3h
		    db 0B3h,0B3h,0B3h
		    db 0FEh,   2
		    dw MusThemeTaraC1

Mus_ThemeTaraC2:    db 0FEh,0FFh
		    dw ThemeOfTaraShared5

		    db 0FEh,   3
		    dw Mus_ThemeTaraC2
		    db 0EFh,0FAh,   3,0ECh, 53h,0E3h,0A3h,0B1h,0F7h, 22h,0B1h,0E8h,0F7h,   3,0E2h, 79h
		    db	65h,0F8h, 20h, 23h,0F5h,   0, 23h,0F4h,	  0, 23h,0F3h,	 0, 23h,0F2h,	0, 27h

MusThemeTaraC3:	    db 0EFh,0FAh,   3,0ECh, 53h,0E3h,0B3h,0E2h,	  1,0F7h, 22h,	 1,0F8h,   3,0ECh, 72h
		    db	97h, 87h, 47h
		    db 0FEh,   2
		    dw MusThemeTaraC3

MusThemeTaraC4:	    db 0FEh,0FFh
		    dw ThemeOfTaraShared5

		    db 0FEh,   2
		    dw MusThemeTaraC4

MusThemeTaraC5:	    db 0FEh,0FFh
		    dw ThemeOfTaraShared6

		    db 0FEh,0FFh
		    dw ThemeOfTaraShared6
		    db 0FAh, 12h, 51h, 51h, 51h,0F9h, 21h, 51h

		    db 0FEh,   4
		    dw MusThemeTaraC5

MusThemeTaraC6:	    db 0EFh,0F6h,   0,0ECh, 61h,0E2h,0B0h,0F7h,	  0,0B0h,0F8h,	 0,0B0h,0F9h,	3,0BCh
		    db 0F6h,   0,0E1h, 10h,0F7h,   0, 10h,0F8h,	  0, 10h,0F9h,	 3, 1Ch

		    db 0FEh,   2
		    dw MusThemeTaraC6
		    db 0E8h,0F9h,   2,0ECh, 62h,0E2h, 53h,   1,	51h, 51h,   1, 51h,0E1h,   3,0E2h, 61h
		    db	11h, 61h, 61h, 11h, 61h,0E1h, 13h,0E2h,	51h,   1, 51h, 51h,   1, 51h,0E1h,   3
		    db 0E2h, 61h, 11h, 61h,0E1h, 11h,0E2h, 71h,	21h, 71h,0F9h, 12h,0ECh, 54h,0E3h, 9Bh
		    db 0B3h,0E2h, 45h, 25h,0E3h,0B3h,0E2h,   5,	  1, 5Fh, 43h, 53h, 7Bh, 73h, 65h, 45h
		    db	23h, 40h, 20h, 0Bh,   1,0E3h, 91h, 91h,	9Bh,0ECh, 53h,0E3h, 75h, 45h,0FAh, 12h
		    db 0E2h, 73h, 75h, 65h, 43h,   5,	1, 5Fh,0E3h,0B3h, 93h, 75h, 71h, 77h, 65h, 61h
		    db	67h,0FBh, 2Fh,0E3h, 40h, 42h,0F9h, 2Fh,	40h, 42h,0F7h, 2Fh, 40h, 42h,0F5h, 2Fh
		    db	40h, 42h,0FBh, 2Fh, 60h, 62h,0F9h, 2Fh,	60h, 62h,0F7h, 2Fh, 60h, 62h,0F5h, 2Fh
		    db	60h, 62h, 60h, 62h, 60h, 62h, 60h, 60h

		    db 0FEh,0FEh
		    dw Mus_ThemeTaraC2