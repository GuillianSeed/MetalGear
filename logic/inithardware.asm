;----------------------------------------------------------------------------
;
; Initialize hardware
;
; Enable PSG channels
; Disable sprites
; Set SCREEN 5 mode
; Clear	VRAM pages 0 and 1
; Configure VDP
; Clear	texts for function keys
; Clear	sprites	attributes
;----------------------------------------------------------------------------

InitHardware:
		    ld	    a, 0BFh
		    ld	    (PGS_MixerVal), a
		    ld	    e, a
		    ld	    a, 7
		    call    WRTPSG			    ; Enable PSG channels (mixer)

		    call    DisableSprites

		    ld	    a, 5
		    call    CHGMOD			    ; Screen 5

		    call    DisableScreen		    ; Disable screen rendering
		    call    ClearPage0			    ; Erase VRAM page 0

		    ld	    d, 1
		    call    ClearPage			    ; Erase RAM	page 1
		    call    WaitVdpCmd			    ; Wait until the VDP finishes

		    ld	    b, 4
		    ld	    hl,	InitVdpDat		    ; VDP registers values

InitHardware2:
		    push    bc
		    ld	    c, (hl)			    ; VDP register
		    inc	    hl
		    ld	    b, (hl)			    ; Value
		    inc	    hl
		    push    hl
		    call    WRTVDP
		    pop	    hl
		    pop	    bc
		    djnz    InitHardware2

		    ld	    hl,	FNKSTR
		    ld	    de,	 FNKSTR+1
		    ld	    bc,	0A0h
		    ld	    (hl), 0
		    ldir				    ; Clear texts for function keys (!?)

		    call    ClearSprAttr		    ; Clear sprite attributes buffers in VRAM
		    jp	    EnableScreen		    ; Enable screen rendering

;----------------------------------------------------------------------------
;
; R#1: Sprites 16x16, Vertical retrace interrupts ON, Screen display enabled
; R#5: Sprite attribute	table
; R#6: Sprite pattern table
; R#11:Sprite attribute	table (high)
;
; Sprite attribute table =  #F600
; Sprite pattern table = #F800
;
;----------------------------------------------------------------------------
InitVdpDat:	    db	  1, 62h
		    db	  5,0EFh
		    db	  6, 1Fh
		    db	0Bh,   1