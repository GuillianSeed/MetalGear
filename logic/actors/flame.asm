;----------------------------------------------------------------------------
;
; Initialize flame
;
;----------------------------------------------------------------------------

InitFlame:
		    ld	    a, (REMOVE_FLAMES)		    ; Not used
		    or	    a

InitFlame2:
		    jp	    nz,	DismissActor0

		    ld	    a, ID_MADNAR		    ; (!?) Why?	Perhaps	it wanted to count other actor ID?
		    call    CountEnemyType
		    cp	    5
		    jp	    nc,	DismissActor0

		    ld	    (ix+ACTOR.SpriteId), 10h	    ; Fire sprite ID
		    ld	    a, r
		    ld	    (ix+ACTOR.ANIM_CNT), a
		    inc	    (ix+ACTOR.Moving)		    ; 0=Does not move

		    ld	    hl,	0
		    ld	    d, h
		    ld	    e, l			    ; Speed XY = 0

jpSetActorSpeed:
		    jp	    SetActorSpeed		    ; DE = Speed X, HL = Speed Y



;----------------------------------------------------------------------------
;
; Flame	logic
;
;----------------------------------------------------------------------------

FlamesLogic:
		    ld	    a, (FireTrooper_KO)
		    or	    a
		    jp	    nz,	RemoveActor_		    ; Remove flames after defeating Fire Trooper

		    ld	    a, ID_FIRE_TROOPER
		    call    CountEnemyType
		    or	    a				    ; Fire Tropper is not in the room
		    jp	    z, DismissActor0

		    ld	    b, 7
		    call    Anim2FramesActor		    ; Animate each 8 iterations

		    ld	    a, (ix+ACTOR.Spr1Color)
		    or	    a				    ; Color 0? (Non visible)
		    ret	    nz				    ; No

		    ld	    a, (ix+ACTOR.NegativeGap)
		    or	    a
		    ld	    a, (ix+ACTOR.X)
		    jr	    nz,	FlamesLogic2

		    cp	    80h
		    ret	    c				    ; Out of the screen

		    jr	    FlamesLogic3


FlamesLogic2:
		    cp	    80h
		    ret	    nc				    ; Out of the screen

FlamesLogic3:
		    ld	    a, (ix+ACTOR.HiddenFlame)
		    or	    a
		    ret	    nz				    ; Do not make the flame visible

SetFlameSprColor:
		    ld	    a, 8
		    ld	    c, 46h
		    jr	    SetSprColor_



;----------------------------------------------------------------------------
;
; Hide flame sprite (setting its color to 0)
;
;----------------------------------------------------------------------------

FlameOutScreen:
		    ld	    a, (ix+ACTOR.GAP_X)
		    ld	    d, 0
		    rla
		    rl	    d
		    ld	    a, d
		    ld	    (ix+ACTOR.NegativeGap), a

		    xor	    a
		    ld	    c, a			    ; Hide flame

SetSprColor_:
		    jp	    SetSprColor


