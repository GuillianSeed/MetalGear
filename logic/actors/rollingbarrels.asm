;---------------------------------------------------------------------------
;
; Rolling barrel logic
; (!?) Most part of the	logic is not used
;
;---------------------------------------------------------------------------

RollingBarrelLogic:
		    ld	    b, 3			    ; Animation	mask. Animate each 4 iterations
		    call    Anim2FramesActor

		    call    ChkBarrelBounce		    ; Checks if	the barrel bounces in a	wall

		    ld	    a, (ix+ROLLING_BARREL.Status)
		    dec	    a
		    jr	    nz,	RB_IncrementSpeed	    ; (!?) It seems only status	0 is used

; (!?) Not used

		    ld	    a, (ix+ROLLING_BARREL.START_X)
		    cp	    80h
		    jr	    c, RollingBarrelLogic2	    ; The start	position of the	barrel was in the left part of the room

		    ld	    a, (ix+ROLLING_BARREL.X)
		    cp	    200				    ; Right room limit/wall
		    jp	    nc,	NextActorStatus

		    cp	    56				    ; Left room	limit/wall
		    jp	    c, NextActorStatus

		    ret


; (!?) Not used


RollingBarrelLogic2:
		    call    GetPlayerXY			    ; D	= Player X, E =	Player Y
		    ld	    a, e			    ; Player Y
		    cp	    80h
		    ret	    nc				    ; Player in	the lower half of the screen

		    ld	    a, d			    ; Player X
		    cp	    (ix+ACTOR.X)

		    ld	    de,	80h			    ; Speed to the right
		    ld	    b, DIR_DOWN
		    jr	    c, RollingBarrelLogic3

		    ld	    de,	-80h
		    ld	    b, DIR_LEFT

RollingBarrelLogic3:
		    ld	    (ix+ACTOR.Direction), b	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    SetActorSpeedX
		    jp	    NextActorStatus

;---------------------------------------------------------------------------
;
; Increment barrels speed
;
;---------------------------------------------------------------------------

RB_IncrementSpeed:
		    ld	    a, (ix+ACTOR.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    rra
		    ld	    de,	-8			    ; Acceleration value (left)
		    jr	    nc,	RB_IncrementSpeed2	    ; Moving left

		    ld	    de,	8			    ; Acceleration value (right)

RB_IncrementSpeed2:
		    jp	    AddActorSpeedX

;---------------------------------------------------------------------------
;
; Check	if the rolling barrel bounces against a	wall
; Change its speed and direction
;
;---------------------------------------------------------------------------

ChkBarrelBounce:
		    ld	    a, (ix+ROLLING_BARREL.X)
		    ld	    h, 200			    ; Right X limit
		    ld	    c, h
		    dec	    h
		    cp	    c
		    ld	    de,	-80h			    ; New speed	X if the barren	bounces	against	the right wall
		    ld	    b, DIR_DOWN
		    jr	    nc,	ChangeBarrelDir		    ; Has reached the right limit/wall

		    ld	    h, 56			    ; Left X Limit
		    ld	    c, h
		    inc	    h
		    cp	    c
		    ret	    nc

		    ld	    b, DIR_LEFT
		    ld	    de,	80h			    ; New speed	X if the barrel	bounces	against	the left wall

ChangeBarrelDir:
		    ld	    (ix+ROLLING_BARREL.X), h	    ; Adjust the X
		    ld	    (ix+ROLLING_BARREL.Direction), b ; Set new direction
		    call    SetActorSpeedX		    ; Change the speed X

		    ld	    a, 1Dh			    ; SFX Rolling barrel hits the wall
		    jp	    SetSoundEntryChk

;---------------------------------------------------------------------------
;
; Inititialize rolling barrel actor
;
;---------------------------------------------------------------------------

InitRollingBarrel:
		    ld	    a, (PlayerX)
		    ld	    (ix+ROLLING_BARREL.START_X), a  ; This value is checked but	not used

		    ld	    de,	80h			    ; Speed X moving to	the right
		    ld	    hl,	0			    ; Speed Y =	0
		    ld	    a, (PlayerX)
		    cp	    80h
		    jr	    c, InitRollingBarrel2	    ; Is the rolling barrel in the right or in the left	part of	the room?

		    ld	    de,	-80h			    ; Speed X moving to	the left

InitRollingBarrel2:
		    call    SetActorSpeed		    ; DE = Speed X, HL = Speed Y

		    inc	    (ix+ROLLING_BARREL.MOVING)	    ; 0=Does not move
		    ld	    (ix+ROLLING_BARREL.SpriteId), 36h ;	Rolling	barrel sprite ID
		    ret
