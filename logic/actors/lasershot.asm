;---------------------------------------------------------------------------
;
; Initialize laser shot
;
;---------------------------------------------------------------------------

InitLaserShot:
		    ld	    a, (Room)
		    cp	    111				    ; Building 3 basement cameras (door	to gas room)
							    ; The lasers of these cameras are shorter
		    jr	    nz,	InitLaserShot2

		    push    ix
		    pop	    hl				    ; HL = Pointer to the actor

		    set	    5, l			    ; HL = Pointer to number of	sprites	in actor structure

		    ld	    (hl), 3			    ; +20 = Number of sprites

		    ld	    b, 7			    ; Number of	sprites
		    ld	    de,	10h
		    add	    hl,	de			    ; HL = Pointer to 4th sprite attributes in the structure

		    call    SetSpritesFree		    ; Set free/hide the	sprites

InitLaserShot2:
		    ld	    (ix+ACTOR.SpriteId), 61h	    ; Laser sprite ID
		    ld	    (ix+ACTOR.COUNTER),	0Bh
		    ld	    (ix+ACTOR.LASER_WAIT), 1	    ; bit1:0=Red laser,1=White laser

		    ld	    a, 4			    ; SFX laser	shot
		    jp	    SetSoundEntryChk




;---------------------------------------------------------------------------
;
; Laser	shot logic
;
;---------------------------------------------------------------------------

LaserShotLogic:
		    ld	    a, (ix+ACTOR.Status)
		    call    JumpIndex

		    dw LaserIncrease
		    dw LaserDecrease
		    dw LaserShotDummy



;---------------------------------------------------------------------------
;
; Increase laser lenght
;
;---------------------------------------------------------------------------

LaserIncrease:
		    dec	    (ix+ACTOR.LASER_WAIT)	    ; bit1:0=Red laser,1=White laser
		    ret	    nz

		    ld	    (ix+ACTOR.LASER_WAIT), 1	    ; bit1:0=Red laser,1=White laser
		    dec	    (ix+ACTOR.COUNTER)
		    jr	    nz,	LaserSetSprColor

		    ld	    (ix+ACTOR.COUNTER),	0Bh
		    ld	    (ix+ACTOR.LASER_WAIT), 1	    ; bit1:0=Red laser,1=White laser

		    jp	    NextActorStatus


LaserSetSprColor:
		    ld	    a, 0Bh			    ; Max. number of sprites used to draw a laser
		    sub	    (ix+ACTOR.COUNTER)
		    ld	    b, a			    ; Laser lenght (number of sprites)

		    ld	    c, 8			    ; Red color

LaserSetSprColor2:
		    push    ix
		    pop	    hl

		    ld	    de,	ACTOR.NumSprites
		    add	    hl,	de			    ; HL = Pointer to number of	sprites	in actor structure

		    ld	    de,	5			    ; Number of	sprite attributes (layer, y, x,	pattern, color)

LaserSetSprColor3:
		    add	    hl,	de
		    djnz    LaserSetSprColor3

		    ld	    (hl), c			    ; Set sprite color
		    ret



;---------------------------------------------------------------------------
;
; Decrease laser shot
; (!?) This rutine is weird. It	seems the laser	could be gray or red. Also the "erase laser" logic seems buggy
;
;---------------------------------------------------------------------------

LaserDecrease:
		    ld	    a, (ix+ACTOR.LASER_WAIT)	    ; (!?) This	field is used to set only bit0.	Perhaps	was LASER_CNT?
		    rra
		    rra
		    ld	    c, 0Eh			    ; White color
		    jr	    c, LaserDecrease2

		    ld	    c, 8			    ; Red color

LaserDecrease2:
		    call    LaserSetSprColor		    ; (!?) The colors are ignored. Red color is	always selected!
							    ; Removing this call the laser looks better

		    dec	    (ix+ACTOR.LASER_WAIT)	    ; bit1:0=Red laser,1=White laser
		    ret	    nz

		    ld	    (ix+ACTOR.LASER_WAIT), 1	    ; bit1:0=Red laser,1=White laser
		    dec	    (ix+ACTOR.COUNTER)
		    jr	    nz,	EraseLaserTrace

		    jp	    DismissActor0


EraseLaserTrace:
		    ld	    a, 0Bh
		    sub	    (ix+ACTOR.COUNTER)
		    ld	    b, a			    ; Laser lenght (in sprites number)

		    ld	    c, 0			    ; Color 0 =	remove sprite
		    jr	    LaserSetSprColor2


LaserShotDummy:
		    ret
