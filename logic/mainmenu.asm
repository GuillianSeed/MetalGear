;----------------------------------------------------------------------------
;
; Load Metal Gear logo graphics
;
;----------------------------------------------------------------------------

LoadIntroGfx:
		    call    DisableScreenBnk

		    ld	    d, 1
		    call    ClearPage_			    ; Erase page 1

		    call    ClearScreen_		    ; Erase page 0 and sprites

		    ld	    bc,	7
		    call    WRTVDP			    ; Black background color

		    call    LoadFont			    ; Load font, frequency and call sign tiles
		    call    SetMetalGearLogo		    ; Setup Metal Gear logo

		    ld	    a, 60h
		    ld	    (MenuCnt), a

		    xor	    a
		    ld	    (MenuStatus), a

		    call    ClearP1_24x8

		    ld	    hl,	MenuPalette
		    call    SetPalette_

		    jp	    EnableScreenBnk


;----------------------------------------------------------------------------
;
; Metal	Gear logo logic
;
;----------------------------------------------------------------------------

MenuLogoLogic:
		    ld	    a, (MenuStatus)
		    ld	    hl,	idxIntro

JumpIndex2:
		    add	    a, a
		    call    ADD_HL_A_
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)
		    ex	    de,	hl
		    jp	    (hl)

idxIntro:	    dw LogoSfx
		    dw LogoScroll			    ; Logo scroll logic
		    dw EraseLogoRests			    ; Clean scroll rests
		    dw PrintPushSpace			    ; Print "KONAMI 1987" and "PUSH SPACE" texts
		    dw DrawMenuNow			    ; Used for showing the menu	without	intro effect


;----------------------------------------------------------------------------
; Metal	Gear logo moving SFX
;----------------------------------------------------------------------------

LogoSfx:
		    ld	    a, 47h			    ; SFX Metal	Gear logo moving
		    call    SetSound_

NextMenuStatus:
		    ld	    a, 0Ch
		    ld	    (MenuCnt), a
		    ld	    hl,	MenuStatus
		    inc	    (hl)
		    ret



;----------------------------------------------------------------------------
;
; Metal	Gear logo scroll logic
;
;----------------------------------------------------------------------------

LogoScroll:
		    ld	    hl,	MenuCnt			    ; Logo scroll iterations
		    dec	    (hl)
		    jr	    z, NextMenuStatus


DrawMG_Logo:
		    ld	    a, (MenuCnt)
		    dec	    a
		    ld	    hl,	MGLogoYpos
		    call    ADD_HL_A_

		    ld	    e, (hl)			    ; DY
		    ld	    d, 20h			    ; DX

		    push    de

		    ld	    hl,	2068h			    ; HL = SX,SY (32,104)
		    ld	    bc,	6820h			    ; (104, 32)
		    ld	    a, 48h			    ; From page	1 to page 0
		    call    VDP_Copy_Dot_		    ; Draw "Metal"

		    pop	    de

		    ld	    a, 8
		    add	    a, e
		    ld	    e, a			    ; DY + 8

		    ld	    d, 88h			    ; DX
		    ld	    hl,	8868h			    ; HL = SX,SY (136,104)
		    ld	    bc,	4820h			    ; BC = NX,NY (72, 32)
		    ld	    a, 48h
		    jp	    VDP_Copy_Dot_		    ; Draw "Gear"


;-------------------------------------------------------------------------------
; Erase	scroll rests
;-------------------------------------------------------------------------------

EraseLogoRests:
		    call    ClearPage0_

		    ld	    a, 1
		    ld	    (MenuCnt), a
		    call    DrawMG_Logo			    ; Draw Metal Gear logo in its final	location

		    xor	    a
		    ld	    (MenuCnt), a		    ; (!?)
		    jp	    NextMenuStatus


;-------------------------------------------------------------------------------
; Print	"KONAMI 1987" and "PUSH SPACE" texts
;-------------------------------------------------------------------------------

PrintPushSpace:
		    ld	    hl,	MenuCnt
		    dec	    (hl)
		    ret	    nz

		    call    NextMenuStatus


PrintPushSpace2:
		    ld	    hl,	txtPushSpace
		    jp	    PrintTextXY_


;-------------------------------------------------------------------------------
; Draw Metal Gear logo directly, without scroll	effect
; Play sfx and print "PUSH SPACE KEY"
;-------------------------------------------------------------------------------

DrawMenuNow:
		    call    EraseLogoRests

		    ld	    a, 4Ah			    ; Sfx: Metal Gear logo end
		    call    SetSound_

		    jp	    PrintPushSpace2


;----------------------------------------------------------------------------
; KONAMI 1987
; PUSH SPACE KEY
;----------------------------------------------------------------------------
txtPushSpace:	    dw 604Eh
		    db	3Ah ; (C)
		    db 0FEh
		    dw 6058h
		    db	"KONAMI",   0, "1987"
		    db 0FEh
		    dw 8848h
		    db	"PUSH", 0, "SPACE", 0, "KEY"
		    db 0FFh


MGLogoColors:	    db    0,   2,   3,   4,   5,   9, 10, 14


;----------------------------------------------------------------------------
;
; Load Metal Gear logo tiles and draw logo on page 1
;
;----------------------------------------------------------------------------

SetMetalGearLogo:
		    ld	    hl,	MGLogoColors
		    ld	    de,	BufferColor		    ; Buffer used to store the colors' indexes for decoding 2/3bpp graphics
		    ld	    bc,	8
		    ldir				    ; Set the colors used by Metal Gear	logo

		    ld	    hl,	gfxMetalGearLogo
		    ld	    de,	8004h
		    ld	    b, 46h
		    call    Load3pppTile_		    ; Decode Metal Gear	logo tiles

		    ld	    hl,	MetalTilesDat
		    ld	    de,	2068h			    ; DE = XY
		    ld	    bc,	0D04h			    ; B	= Number of X tiles, C = Number	of rows
		    call    DrawTiles			    ; Draw "Metal"

		    ld	    hl,	GearTilesDat
		    ld	    de,	8870h			    ; DE = XY
		    ld	    bc,	904h			    ; Draw "Gear"

DrawTiles:
		    push    de
		    push    bc

DrawTiles2:
		    ld	    a, (hl)			    ; Tile number
		    call    DrawTileP1_

		    ld	    a, d
		    add	    a, 8
		    ld	    d, a			    ; Next X

		    inc	    hl
		    djnz    DrawTiles2

		    pop	    bc
		    pop	    de

		    ld	    a, e
		    add	    a, 8
		    ld	    e, a			    ; Next row Y coordinate

		    dec	    c				    ; Decrement	number of rows
		    jr	    nz,	DrawTiles
		    ret


;----------------------------------------------------------------------------
; Metal	Gear logo Y values (scroll effect)
;----------------------------------------------------------------------------
MGLogoYpos:	    db	20h, 30h, 40h, 50h, 60h, 70h, 80h, 90h,0A0h,0B0h,0C0h ;	...

;----------------------------------------------------------------------------
; Menu palette
;----------------------------------------------------------------------------
MenuPalette:	    db	  2, 33h,   3
		    db	  3, 22h,   2
		    db	  4, 55h,   5
		    db	  5, 62h,   5
		    db	  9, 60h,   3
		    db	0Ah, 61h,   1
		    db	0Eh, 77h,   7
		    db 0FFh

;----------------------------------------------------------------------------
; "METAL" logo tiles
;----------------------------------------------------------------------------
MetalTilesDat:	    db	  1,   2,   3,	 4,   5,   0,	0,   0,	  0,   0,   0,	 0,   0
		    db	  6,   7,   8,	 9, 0Ah, 0Bh, 0Ch, 0Dh,	0Eh, 0Fh, 10h, 11h,   0
		    db	12h, 13h, 14h, 15h, 16h, 17h, 18h, 19h,	1Ah, 1Bh, 1Ch, 1Dh,   0
		    db	1Eh, 1Fh, 20h, 21h, 22h, 23h, 24h, 25h,	26h, 27h, 28h, 29h, 2Ah

;----------------------------------------------------------------------------
; "GEAR" logo tiles
;----------------------------------------------------------------------------
GearTilesDat:	    db	2Bh, 2Ch, 2Dh, 2Eh, 2Fh, 30h, 31h, 32h,	33h
		    db	34h, 35h, 36h, 37h, 38h, 39h, 3Ah, 3Bh,	3Ch
		    db	3Dh, 3Eh, 3Fh, 40h, 41h, 42h, 43h, 44h,	45h
		    db	  0,   0,   0,	 0,   0,   0,	0,   0,	46h
