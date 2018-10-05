;----------------------------------------------------------------------------
;
; Locate 16 sprites in two rows	in the HUD to hide elevator sprites and
; avoid	it overlaping the HUD (8 sprite	limit trick)
;
;----------------------------------------------------------------------------

SetHUDSprMask:
		    ld	    de,	SprAttRAM
		    ld	    hl,	MaskSprAttrib		    ; Spr att: Y, X, num, EC-color
		    ld	    b, 8			    ; 8	sprites

SetHUDSprMask2:
		    push    hl
		    ld	    c, 8			    ; 2	sprites	x 4 attributes bytes

SetHUDSprMask3:
		    ld	    a, (hl)
		    ld	    (de), a
		    inc	    hl
		    inc	    de
		    dec	    c
		    jr	    nz,	SetHUDSprMask3

		    pop	    hl
		    djnz    SetHUDSprMask2

		    ld	    de,	SpritesColors
		    ld	    a, 0Fh

SetHUDSprMask4:
		    ld	    (de), a
		    inc	    de
		    djnz    SetHUDSprMask4
		    ret

;
; Attributes for 2 sprites at (192,255)	and (208,255)
;
MaskSprAttrib:	    db 0C0h,0FFh,   0,0E0h
		    db 0D0h,0FFh,   0,0E0h		    ; Spr att: Y, X, num, EC-color