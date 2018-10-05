;---------------------------------------------------------------------------
;
; Bullet moving	in the X axis
; It moves a bit in the	Ys
;
;---------------------------------------------------------------------------


InitBulletHor:
		    ld	    hl,	-40h
		    ld	    a, r
		    and	    7Fh
		    ld	    d, 0
		    ld	    e, a
		    add	    hl,	de			    ; Random Y speed

		    bit	    7, (ix+ACTOR.X)		    ; Is the actor in the right	or left	part of	the screen?
		    ld	    de,	-500h			    ; Speed X to the left
		    jp	    nz,	InitBulletVert2

		    ld	    d, 5			    ; Speed X to the right
		    jp	    InitBulletVert2

;---------------------------------------------------------------------------
;
; Bullet moving	in the Y axis
; It moves a bit in the	Xs
;
;---------------------------------------------------------------------------

InitBulletVert:
		    ld	    de,	-40h
		    ld	    a, r
		    and	    7Fh
		    ld	    h, 0
		    ld	    l, a
		    add	    hl,	de
		    ex	    de,	hl			    ; Random X speed (+/- #40)

		    bit	    7, (ix+ACTOR.Y)		    ; Is the actor in the upper	or lower part of the screen?
		    ld	    hl,	-500h			    ; Speed to move up
		    jp	    nz,	InitBulletVert2
		    ld	    h, 5			    ; Speed to move down

InitBulletVert2:
		    call    SetActorSpeed		    ; Set the speed of the bullet

		    ld	    (ix+ACTOR.Moving), 1	    ; Enable movement
		    ld	    (ix+ACTOR.COLLISION_CFG), 1	    ; Check collisions with the	player
		    ld	    (ix+ACTOR.SpriteId), 72h	    ; Bullet sprite ID

		    ld	    a, 5			    ; SFX bullet shot
		    jp	    SetSoundEntryChk



