;----------------------------------------------------------------------------
;
; Animate big explosion	sprites
;
;----------------------------------------------------------------------------

BigExplosionLogic:
		    dec	    (ix+ACTOR.Wait)
		    jp	    z, DismissActor0		    ; Explosion	finished. Remove actor

		    ld	    a, (ix+ACTOR.Wait)
		    cp	    0Dh
		    ld	    b, 73h			    ; ID sprite	frame 1
		    jr	    nc,	BigExplosionLogic2

		    cp	    8
		    inc	    b				    ; ID sprite	frame 2
		    jr	    nc,	BigExplosionLogic2

		    inc	    b				    ; ID sprite	frame 3

BigExplosionLogic2:
		    ld	    (ix+ACTOR.SpriteId), b

		    ld	    a, b
		    sub	    73h				    ; A	= Animation index

		    ld	    de,	BigExplSprCols
		    call    GetPointerDE2A		    ; Get sprites colors

		    ld	    (ix+ACTOR.Spr1Color), e
		    ld	    (ix+ACTOR.Spr2Color), d
		    ld	    (ix+ACTOR.Spr3Color), e
		    ld	    (ix+ACTOR.Spr4Color), d
		    ret

;----------------------------------------------------------------------------
; Explosion sprites colors
;----------------------------------------------------------------------------
BigExplSprCols:	    dw 4608h
		    dw 4608h
		    dw 0E0Eh
