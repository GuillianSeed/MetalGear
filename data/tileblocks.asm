;----------------------------------------------------------------------------
;
; Ending explosion animation
;
;----------------------------------------------------------------------------
ExploxionTiles1:    db 1
		    db 4
		    db 0A0h,0A0h,0D1h,0D0h

ExploxionTiles2:    db 3
		    db 8
		    db	  0,   0,0A2h,0A3h,0D3h,0D2h,	0,   0
		    db	  0,   0,0A4h,0A5h,0D5h,0D4h,	0,   0
		    db 0A6h,0A7h,0A8h,0A9h,0D9h,0D8h,0D7h,0D6h

ExploxionTiles3:    db 5
		    db 8
		    db	  0,0A2h, 17h, 18h,   3,   4,0D2h,   0
		    db	  0, 19h, 1Ah, 1Bh, 1Ch, 1Dh, 1Eh,   0
		    db	  0, 1Fh, 20h, 21h, 22h, 23h, 24h,   0
		    db	  0, 25h, 26h, 27h, 28h, 29h, 2Ah,   0
		    db 0A6h,0ABh,0ACh,0ADh,0DDh,0DCh,0DBh,0D6h

;----------------------------------------------------------------------------
; Radio	tile map
;----------------------------------------------------------------------------
RadioTilesMap:      db 9
                    db 18
                    db  48h, 44h, 44h, 44h, 44h, 44h, 44h, 44h, 4Ch, 46h, 46h, 46h, 46h, 46h, 46h, 4Fh, 44h, 4Eh
                    db  5Bh, 52h, 41h, 41h, 41h, 41h, 41h, 41h, 55h, 40h, 40h, 40h, 40h, 40h, 40h, 57h, 56h, 62h
                    db  5Bh, 52h, 41h, 41h, 41h, 41h, 41h, 41h, 55h, 40h, 40h, 40h, 40h, 40h, 40h, 57h, 56h, 62h
                    db  5Bh, 56h, 51h, 51h, 51h, 51h, 51h, 51h, 50h, 45h, 45h, 45h, 45h, 45h, 45h, 4Dh, 56h, 62h
                    db  5Bh, 40h, 40h, 40h, 40h, 56h, 64h, 53h, 49h, 5Dh, 56h, 47h, 47h, 47h, 47h, 47h, 47h, 62h
                    db  5Bh, 40h, 40h, 40h, 40h, 56h, 5Ah, 54h, 54h, 61h, 56h, 58h, 4Ah, 58h, 4Ah, 58h, 4Ah, 62h
                    db  5Bh, 51h, 51h, 51h, 51h, 56h, 5Eh, 54h, 54h, 65h, 56h, 58h, 4Ah, 58h, 4Ah, 58h, 4Ah, 62h
                    db  5Bh, 56h, 47h, 47h, 47h, 56h, 59h, 5Fh, 66h, 60h, 56h, 56h, 56h, 56h, 56h, 56h, 56h, 62h
                    db  4Bh, 4Bh, 4Bh, 4Bh, 4Bh, 4Bh, 4Bh, 5Ch, 63h, 4Bh, 4Bh, 4Bh, 4Bh, 4Bh, 4Bh, 4Bh, 4Bh, 4Bh


SnakeTilesMap:	    dw 404h
		    db	10h, 11h, 12h, 13h
		    db	14h, 15h, 16h, 17h
		    db	18h, 19h, 1Ah, 1Bh
		    db	1Ch, 1Dh, 1Eh, 1Fh


SnakePicture0:	    dw 202h
		    db	15h, 16h
		    db	19h, 1Ah

SnakePicture1:	    dw 202h
		    db	30h, 31h
		    db	19h, 1Ah

SnakePicture2:	    dw 202h
		    db	15h, 16h
		    db	32h, 1Ah

;----------------------------------------------------------------------------
; Hind D set tilemap
;----------------------------------------------------------------------------
HindDTileMap:	    dw 100Bh
		    db	13h, 1Bh, 0Ch, 0Dh, 0Eh, 0Fh, 10h, 11h,	51h, 50h, 4Fh, 4Eh, 4Dh, 4Ch, 4Bh, 53h
		    db	  3,   3, 12h, 13h, 14h, 15h, 16h, 17h,	57h, 56h, 55h, 54h, 53h, 52h,	3,   3
		    db	  7,   3,   3,	 3, 12h, 18h, 19h, 1Ah,	5Ah, 59h, 58h, 52h,   3,   3,	3,   3
		    db	  9,   3,   3,	 3,   3, 1Bh, 1Ch, 1Dh,	5Dh, 5Ch, 5Bh,	 3,   3,   3,	3,   3
		    db 0A0h,0A1h,0D1h,0D0h,   3, 1Eh, 1Fh, 20h,	60h, 5Fh, 5Eh,	 3,0A0h,0A1h,0D1h,0D0h
		    db 0A2h,0A3h,0D3h,0D2h,   3, 21h, 22h, 23h,	63h, 62h, 61h,	 3,0A2h,0A3h,0D3h,0D2h
		    db 0A4h,0A5h,0D5h,0D4h,   7, 24h, 25h, 26h,	66h, 65h, 64h,	 3,0A4h,0A5h,0D5h,0D4h
		    db 0A6h,0A7h,0D7h,0D6h,   9, 27h, 28h, 29h,	69h, 68h, 67h,	 3,0A6h,0A7h,0D7h,0D6h
		    db	  9,   9,   9,	 9,   9, 2Ah, 2Bh, 2Ch,	6Ch, 6Bh, 6Ah,	 3,0A0h,0A1h,0D1h,0D0h
		    db	  3,   3,   3,	 3,   3,   3, 2Dh, 2Eh,	6Eh, 6Dh,   3,	 3,0A2h,0A3h,0D3h,0D2h
		    db	  3,   3,   3,	 3,   3,   3,	3, 2Fh,	6Fh,   3,   3,	 3,0A4h,0A5h,0D5h,0D4h

;----------------------------------------------------------------------------
; Hind D remove	map
;----------------------------------------------------------------------------
HindDTileMap2:	    dw 100Bh
		    db	  3,   3,   3,	 3,   3,   3,	3,   3,	  3,   3,   3,	 3,   3,   3,	3,   3
		    db	  3,   3,   3,	 3,   3,   3,	3,   3,	  3,   3,   3,	 3,   3,   3,	3,   3
		    db	  7,   3,   3,	 3,   3,   3,	3,   3,	  3,   3,   3,	 3,   3,   3,	3,   3
		    db	  9,   3,   3,	 3,   3,   3,	3,   3,	  3,   3,   3,	 3,   3,   3,	3,   3
		    db 0A0h,0A1h,0D1h,0D0h,   3,   3,	3,   3,	  3,   3,   3,	 3,0A0h,0A1h,0D1h,0D0h
		    db 0A2h,0A3h,0D3h,0D2h,   3,   3,	3,   3,	  3,   3,   3,	 3,0A2h,0A3h,0D3h,0D2h
		    db 0A4h,0A5h,0D5h,0D4h,   7,   3,	3,   3,	  3,   3,   3,	 3,0A4h,0A5h,0D5h,0D4h
		    db 0A6h,0A7h,0D7h,0D6h,   9,   3,	3,   3,	  3,   3,   3,	 3,0A6h,0A7h,0D7h,0D6h
		    db	  9,   9,   9,	 9,   9,   3,	3,   3,	  3,   3,   3,	 3,0A0h,0A1h,0D1h,0D0h
		    db	  3,   3,   3,	 3,   3,   3,	3,   3,	  3,   3,   3,	 3,0A2h,0A3h,0D3h,0D2h
		    db	  3,   3,   3,	 3,   3,   3,	3,   3,	  3,   3,   3,	 3,0A4h,0A5h,0D5h,0D4h

;----------------------------------------------------------------------------
; Metal	Gear tile map
;----------------------------------------------------------------------------
MetalGearTileMap:   dw 80Ch
		    db	49h,0A1h,0A2h, 49h, 49h, 49h, 49h, 49h
		    db	4Ah,0A3h,0A4h,0A5h,0A6h,0A7h, 4Ah, 4Bh
		    db	49h,0A8h,0A9h,0AAh,0ABh,0ACh,0ADh, 49h
		    db 0AEh,0AFh,0B0h,0B1h,0B2h,0B3h,0B4h, 4Ah
		    db 0B5h,0B6h,0B7h,0B8h,0B9h,0BAh,0BBh, 61h
		    db	60h, 61h,0BCh,0BDh,0BEh,0BFh,0C0h,0C1h
		    db	60h,0C2h,0C3h,0C4h,0C5h,0C6h,0C7h,0C8h
		    db 0C9h,0CAh,0CBh,0CCh,0CDh,0CEh,0CFh,0D0h
		    db 0D1h,0D2h,0D3h,0D4h,0D5h,0D6h,0D7h,0D8h
		    db	60h,0D9h,0DAh,0DBh,0DCh,0DDh, 60h, 60h
		    db	60h,0DEh,0DFh,0E0h,0E1h,0E2h, 60h, 60h
		    db	60h,0E3h,0E4h,0E5h,0E6h,0E7h,0E8h, 60h

;----------------------------------------------------------------------------
; Metal	Gear background
;----------------------------------------------------------------------------
MetalGearTileMap2:  dw 80Ch
		    db	49h, 49h, 49h, 47h, 47h, 49h, 49h, 49h
		    db	4Ah, 4Bh, 4Ah, 4Bh, 4Ah, 4Bh, 4Ah, 4Bh
		    db	49h, 46h, 49h, 49h, 43h, 49h, 47h, 49h
		    db	4Bh, 4Ah, 4Bh, 4Ah, 4Bh, 4Ah, 4Bh, 4Ah
		    db	61h, 61h, 61h, 61h, 61h, 61h, 61h, 61h
		    db	60h, 60h, 60h, 60h, 60h, 60h, 60h, 60h
		    db	60h, 60h, 60h, 60h, 60h, 60h, 60h, 60h
		    db	60h, 60h, 60h, 60h, 60h, 60h, 60h, 60h
		    db	60h, 60h, 60h, 60h, 60h, 60h, 60h, 60h
		    db	60h, 60h, 60h, 60h, 60h, 60h, 60h, 60h
		    db	60h, 60h, 60h, 60h, 60h, 60h, 60h, 60h
		    db	60h, 60h, 60h, 60h, 60h, 60h, 60h, 60h
