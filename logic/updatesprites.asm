;----------------------------------------------------------------------------
;
; Swaps	sprite attribute and color buffers
;
;----------------------------------------------------------------------------

SwapSprBuffer:
		    ld	    hl,	(SprColAddress)
		    bit	    2, h
		    ld	    hl,	0F600h
		    ld	    de,	0F400h
		    ld	    bc,	0E705h			    ; VDP: B = Data, C=	Register
		    jr	    z, SwapSprBuffer2

		    ld	    hl,	0F200h
		    ld	    de,	0F000h
		    ld	    b, 0EFh

SwapSprBuffer2:
		    ld	    (SprAttAddress), hl
		    ld	    (SprColAddress), de
		    jp	    WRTVDP

;----------------------------------------------------------------------------
;
; Update sprites colors	and attributes in VRAM from RAM
; Shuffles the sprite layers to	avoid horizontal sprites limit (flickering)
; Sprites are grouped in pairs in order	to get 3 colors	per line
;
;----------------------------------------------------------------------------

UpdateSpritesShuf:
		    ld	    hl,	SprShuffleOffset
		    ld	    a, (hl)
		    add	    a, 68h
		    and	    78h
		    ld	    (hl), a

		    ld	    a, (VDP_DW)
		    ld	    c, a
		    ld	    hl,	(SprColAddress)
		    call    SetVRAMAddWR_

; Update colors
		    ld	    a, (SprShuffleOffset)
		    ld	    d, 16			    ; 32 sprites / 2
		    add	    a, a

UpdateSpritesShuf2:
		    ld	    h, SpritesColors/512;	74h			    ; (!?) #74*2 = #E800 (SpritesColors)
		    ld	    l, a
		    add	    hl,	hl
		    ld	    b, 32			    ; Bytes per	sprite pair (16x2)
		    otir				    ; Update sprites color

		    add	    a, 90h			    ; #90 * 2 =	#120
							    ; #120 / #20 = 9 sprites
		    dec	    d
		    jr	    nz,	UpdateSpritesShuf2

; Update attributes
		    ld	    a, (SprShuffleOffset)
		    ld	    d, 16			    ; 32 sprites / 2
		    ld	    h, SprAttRAM/256;	0EAh			    ; (!?) #EA00 = SpriteAttributesRAM

UpdateSpritesShuf3:
		    ld	    l, a
		    ld	    b, 8			    ; 4	bytes of attributes * 2
		    otir				    ; Update attributes

		    add	    a, 48h			    ; #48 / 8 =	9 sprites
		    and	    78h
		    dec	    d
		    jr	    nz,	UpdateSpritesShuf3
		    ret


;----------------------------------------------------------------------------
;
; Update sprites colors	and attributes in VRAM from RAM	buffers
;
;----------------------------------------------------------------------------

UpdateSprites:
		    ld	    hl,	SpritesColors
		    ld	    de,	(SprColAddress)
		    ld	    bc,	280h			    ; #200 color + #80 attributes
		    jr	    RAMtoVRAM_


;----------------------------------------------------------------------------
;
; Set binoculars target	sprite
; Update VRAM buffers (colors and attributes)
;
;----------------------------------------------------------------------------

SetBinoTargetSpr:
		    ld	    hl,	BinocularSprCol
		    ld	    de,	(SprColAddress)		    ; Address of current sprites color buffer
		    ld	    a, 40h			    ; 4	* 16
		    call    ADD_DE_A__			    ; DE = Destination VRAM address

		    ld	    bc,	1C0h			    ; 28 * 16
		    call    RAMtoVRAM__			    ; Set sprite color

		    ld	    hl,	SprShootsAtt
		    ld	    de,	(SprAttAddress)
		    ld	    a, 10h			    ; 4	* 4
		    call    ADD_DE_A__
		    ld	    bc,	70h			    ; 28 * 4

RAMtoVRAM_:
		    jp	    RAMtoVRAM__

