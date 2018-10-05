;----------------------------------------------------------------------------
;
; Load font tiles in white
; Load yellow star
; Load frequency/countdown digits in red
; Load incoming	call sign
;
;----------------------------------------------------------------------------

LoadFont:
		    ld	    a, 1
		    ld	    (ACPAGE), a			    ; (!?) Not used
		    call    ClearP1_24x8

		    ld	    de,	40h
		    ld	    hl,	gfxFont
		    ld	    bc,	6C0Eh			    ; 108 tiles, white color
		    call    Load1bppGFX_		    ; Load font

		    ld	    de,	9858h
		    ld	    hl,	gfxFreqDigits
		    ld	    bc,	0D08h			    ; 13 tiles,	red color
		    call    Load1bppGFX_		    ; Radio frequency /	countdown digits

		    ld	    de,	5840h
		    ld	    hl,	gfxSymbChars		    ; Star, arrow, enter, exclamation marks
		    ld	    bc,	106h			    ; 1	tile, yellow color
		    call    Load1bppGFX_		    ; Load yellow star tile

		    ld	    hl,	colorsCALL
		    ld	    de,	BufferColor		    ; Buffer used to store the colors' indexes for decoding 2/3bpp graphics
		    ld	    bc,	4
		    ldir

		    ld	    hl,	gfxCALL
		    ld	    de,	0AC30h
		    ld	    b, 6
		    call    Load2bppTile_		    ; Incoming call sign

		    xor	    a
		    ld	    (ACPAGE), a			    ; Active page number (SET PAGE ,X)
		    ret


;-------------------------------------------------------------------------------
; Erase	(0,0)-(24,8) VRAM page 1
;-------------------------------------------------------------------------------

ClearP1_24x8:
		    xor	    a				    ; Black color
		    ld	    h, a			    ; DX = 0
		    ld	    l, a			    ; DY = 0
		    ld	    bc,	1808h
		    ld	    d, 1			    ; Page 1
		    jp	    FillRect_

colorsCALL:	    db	  6,   8, 0Eh, 0Fh