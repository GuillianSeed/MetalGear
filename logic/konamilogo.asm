;----------------------------------------------------------------------------
;
; Set up Konami	logo
;
; Stop sound, set palette, load	and draw logo, initialize logo variables
;
;----------------------------------------------------------------------------

InitKonamiLogo:
		    call    DisableScreenBnk

		    ld	    a, 5Ch
		    call    SetSound_
		    call    SetDefaultPal_		    ; Set default palette

		    ld	    hl,	KonamiLogoPal
		    call    SetPalette_			    ; Set Konami logo colors

		    ld	    b, 0Fh
		    ld	    c, 7
		    call    WRTVDP			    ; Background color white

		    ld	    hl,	2840h
		    ld	    bc,	0A848h
		    xor	    a
		    ld	    d, 1
		    call    FillRect_			    ; Clear logo buffer	on page	1

		    call    SetUpKonamiLogo_		    ; Load and draw logo

		    call    EnableScreenBnk


		    ld	    hl,	Room
		    ld	    (hl), 3Ch
		    inc	    hl
		    ld	    (hl), 31h
		    inc	    hl
		    ld	    (hl), 0
		    ret

;----------------------------------------------------------------------------
; Konami logo colors
;----------------------------------------------------------------------------
KonamiLogoPal:	    db	  0,   0,   0
		    db	  1, 70h,   3
		    db	  2, 60h,   1
		    db	  3, 44h,   4
		    db	0Fh, 77h,   7
		    db 0FFh



;-------------------------------------------------------------------------------
;
; Draw Konami logo logic
; Draw a line of the logo each two iterations
;
;-------------------------------------------------------------------------------

DrawKonamiLogo:
		    ld	    hl,	Room
		    dec	    (hl)
		    ld	    a, (hl)
		    and	    1
		    ret	    nz				    ; Draws a line each	two frames

		    inc	    hl
		    dec	    (hl)
		    jr	    nz,	DrawKonamiLogo2

		    ld	    a, 1
		    ld	    (Class), a			    ; Logo end flag
		    ret


DrawKonamiLogo2:
		    ld	    a, 49
		    sub	    (hl)
		    ld	    c, a			    ; NY
		    ld	    b, 168			    ; NX
		    ld	    hl,	2840h			    ; Logo XY
		    ld	    e, l
		    ld	    d, h			    ; Destination XY
		    ld	    a, 1			    ; From page	1 to 0
		    jp	    VdpCopyByteBnks


;----------------------------------------------------------------------------
;
; Konami logo tiles and	offsets
;
;----------------------------------------------------------------------------
KonamiLogoTiles:    db	  1,   2,   3
		    db 0FEh
		    db -8
		    db	  4,   5,   6,	 7
		    db 0FEh
		    db -10h
		    db	  8,   9, 0Ah, 0Bh, 0Eh, 0Fh, 10h, 11h,	1Bh, 1Ch, 1Dh, 1Eh, 1Fh, 20h, 21h, 22h,	23h, 24h, 25h, 26h
		    db 0FEh
		    db 0
		    db	0Ch,   2, 0Dh, 12h, 13h, 14h, 15h, 27h,	28h, 29h, 2Ah, 2Bh, 2Ch, 2Dh, 2Eh, 2Fh,	30h, 31h, 32h, 33h, 34h
		    db 0FEh
		    db 10h
		    db	16h, 19h, 17h
		    db 0FEh
		    db -8
		    db	18h, 19h, 1Ah
		    db 0FFh
