;---------------------------------------------------------------------------
;
; Coward Duck logic
;
; Introduces himself
; Moves	left or	right towards the player
; Shots	and waits
; Moves	to his start position
;
;---------------------------------------------------------------------------

CowardDuckLogic:
		    ld	    a, (ix+ACTOR.Status)
		    call    JumpIndex

		    dw CowardDuckIntro
		    dw CD_ChoseLR
		    dw CD_MoveAndShot
		    dw CD_ChoseLRCenter
		    dw CW_MoveRestart


;---------------------------------------------------------------------------
;
; Coward Duck introduction
;
;---------------------------------------------------------------------------

CowardDuckIntro:
		    dec	    (ix+COWARD_D.TIMER)
		    ret	    nz				    ; Wait before talking

		    ld	    hl,	CowardDuckSpeech
		    ld	    a, (hl)
		    or	    a				    ; Has said the intro speech?
		    jr	    nz,	CowardDuckIntro2	    ; Yes

		    ld	    (hl), 1			    ; Flag that	indicates that Coward Duck has introduced himself

		    ld	    a, 139			    ; TEXT: I'm Coward Duck...
		    call    SetTextUnskippable

CowardDuckIntro2:
		    ld	    (ix+COWARD_D.TIMER), 10h	    ; Wait time	after the speech
		    jr	    CowDuckNextStat		    ; Next status


;---------------------------------------------------------------------------
;
; Choose to move left or right depending on the	position of the	player
;
;---------------------------------------------------------------------------


CD_ChoseLR:
		    dec	    (ix+COWARD_D.TIMER)
		    ret	    nz				    ; Wait before moving

		    ld	    (ix+COWARD_D.TIMER), 8	    ; Iterations that will move

		    ld	    a, (PlayerX)
		    cp	    (ix+COWARD_D.X)		    ; Is the player to the right or to the left?

		    ld	    de,	200h			    ; Speed to move to the right
		    jr	    nc,	CD_ChoseLR2

		    ld	    de,	-200h			    ; To the left

CD_ChoseLR2:
		    call    SetActorSpeedX

CowDuckNextStat:
		    inc	    (ix+COWARD_D.Status)	    ; Next status
		    ret


;---------------------------------------------------------------------------
;
; Moves	and then shot
;
;---------------------------------------------------------------------------


CD_MoveAndShot:
		    ld	    b, 7			    ; Animation	timer mask
		    call    Anim2FramesActor		    ; Animate while moving

		    dec	    (ix+COWARD_D.TIMER)
		    ret	    nz				    ; Decrement	time in	movement

		    ld	    (ix+COWARD_D.TIMER), 5	    ; Wait time	after throwing a boomerang
		    ld	    (ix+COWARD_D.SpriteId), 1Ah	    ; Coward Duck launch boomerang sprite ID

		    ld	    de,	0
		    call    SetActorSpeedX		    ; Stop the actor
		    call    CowDuckNextStat		    ; Next status

		    ld	    a, (ix+COWARD_D.Y)
		    sub	    10h
		    ld	    e, a			    ; Boomerang	Y
		    ld	    d, (ix+COWARD_D.X)		    ; Boomerang	X
		    ld	    c, ID_BOOMERANG
		    jp	    AddEnemy			    ; Throw a boomerang


;---------------------------------------------------------------------------
;
; Wait and chose to his	start position
;
;---------------------------------------------------------------------------

CD_ChoseLRCenter:
		    dec	    (ix+COWARD_D.TIMER)
		    ret	    nz				    ; Wait

		    ld	    (ix+COWARD_D.TIMER), 8
		    ld	    (ix+ACTOR.SpriteId), 18h	    ; Coward Duck walk sprite ID

		    ld	    a, (ix+COWARD_D.X)
		    cp	    80h				    ; Should he	move to	the right or to	the left to return to his initial position?

		    ld	    de,	-200h			    ; To the left
		    jr	    nc,	CD_ChoseLRCenter2
		    ld	    de,	200h			    ; To the right

CD_ChoseLRCenter2:
		    call    SetActorSpeedX		    ; Set the actor's speed to move to the centre of the room
		    jr	    CowDuckNextStat		    ; Next status


;---------------------------------------------------------------------------
;
; Moves	to the centre of the room and restart movement logic
;
;---------------------------------------------------------------------------


CW_MoveRestart:
		    ld	    b, 7
		    call    Anim2FramesActor		    ; Animate while moving
		    dec	    (ix+COWARD_D.TIMER)
		    ret	    nz				    ; Continue moving

		    ld	    (ix+COWARD_D.TIMER), 8	    ; Wait time	before moving again

		    ld	    de,	0
		    call    SetActorSpeedX		    ; Stop the actor

		    ld	    (ix+COWARD_D.Status), 1
		    ret

;---------------------------------------------------------------------------
;
; Init boomerang (Coward Duck shot)
; It can move clockwise	or anti	clockwise depending on where it	is thrown
; Some boomerangs have shorter Y range
;
;---------------------------------------------------------------------------

InitBoomerang:
		    ld	    a, 6			    ; SFX throw	boomerang
		    call    SetSoundEntryChk

		    ld	    a, (ix+BOOMERANG.Y)
		    ld	    (ix+BOOMERANG.START_Y), a	    ; Set start	point Y

		    ld	    a, (ix+BOOMERANG.X)
		    ld	    (ix+BOOMERANG.START_X), a	    ; Set start	point X

		    cp	    80h				    ; Left or right part of the	room?
		    ld	    a, 0			    ; Clockwise
		    jr	    nc,	InitBoomerang2
		    ld	    a, 2			    ; Anticlockwise

InitBoomerang2:
		    ld	    (ix+BOOMERANG.COUNTER), a

		    ld	    a, r
		    and	    1				    ; Random range
		    ld	    (ix+BOOMERANG.SHORT_RANGE),	a

		    ld	    (ix+BOOMERANG.SpriteId), 77h    ; Boomerang	sprite ID
		    ld	    (ix+BOOMERANG.ANGLE_Y), 64
		    ld	    (ix+BOOMERANG.ANGLE_DELTA_Y), -2
		    ld	    (ix+BOOMERANG.ANGLE_X), 64
		    ld	    (ix+BOOMERANG.ANGLE_DELTA_X), -4
		    ret

;----------------------------------------------------------------------------
;
; Boomerang logic
; Start	points are used	as center of the eliptic movement
; Sine and cosine values (0-255) are used as radius of the elipse
;
;----------------------------------------------------------------------------

BoomerangLogic:
		    ld	    a, (ix+BOOMERANG.ANIM_CNT)
		    and	    1
		    jr	    nz,	BoomerangLogic3		    ; Animate the boomerang each two iterations

		    inc	    (ix+BOOMERANG.SPIN_CNT)	    ; Increment	spin counter

		    ld	    a, (ix+BOOMERANG.SPIN_CNT)
		    cp	    3				    ; There are	4 spin frames
		    jr	    c, BoomerangLogic2		    ; Do not reset the counter yet

		    xor	    a
		    ld	    (ix+BOOMERANG.SPIN_CNT), a	    ; Reset spin counter

BoomerangLogic2:
		    add	    a, 77h			    ; Boomerang	sprite ID + spin counter
		    ld	    (ix+BOOMERANG.SpriteId), a	    ; Animate boomerang	sprite

BoomerangLogic3:
		    ld	    a, (ix+BOOMERANG.ANGLE_Y)
		    add	    a, (ix+BOOMERANG.ANGLE_DELTA_Y)
		    ld	    (ix+BOOMERANG.ANGLE_Y), a	    ; New Y angle

		    cp	    64				    ; Angles have a range from 0 to 63 (0 to 90	degrees)
		    call    nc,	BoomInvertYSpeed

		    call    GetSinCos			    ; B	= Cosine, C = Sine

		    srl	    b				    ; Cosine / 2 (Range	127)

		    ld	    a, (ix+BOOMERANG.SHORT_RANGE)
		    or	    a				    ; Short range boomerang?
		    jr	    z, BoomerangLogic4

		    srl	    b				    ; Cosine / 4 (Range	 63)

BoomerangLogic4:
		    ld	    a, (ix+BOOMERANG.START_Y)
		    add	    a, b			    ; Boomerang	start point + cosine
		    ld	    (ix+BOOMERANG.Y), a		    ; Boomerang	Y

		    ld	    a, (ix+BOOMERANG.ANGLE_X)
		    add	    a, (ix+BOOMERANG.ANGLE_DELTA_X)
		    ld	    (ix+BOOMERANG.ANGLE_X), a	    ; New X angle

		    cp	    40h
		    call    nc,	BoomChgXDelta

		    call    GetSinCos			    ; B	= Cosine, C = Sine

		    srl	    b
		    srl	    b				    ; Cosine / 4 (Range	63)

		    ld	    a, (ix+BOOMERANG.COUNTER)
		    cp	    2
		    jr	    c, BoomerangLogic5		    ; 0-1 Right	side, 2-3 Left side

		    cp	    4
		    jr	    nc,	BoomerangLogic5		    ; 4-5 Left side

		    ld	    a, b
		    neg
		    jr	    BoomerangLogic6


BoomerangLogic5:
		    ld	    a, b

BoomerangLogic6:
		    add	    a, (ix+BOOMERANG.START_X)
		    ld	    (ix+BOOMERANG.X), a
		    ret


;----------------------------------------------------------------------------
;
; Change Y direction of	the boomerang
; Moves	down ->	moves up -> dismissed (returns to Coward Duck)
;
;----------------------------------------------------------------------------

BoomInvertYSpeed:
		    ld	    a, (ix+BOOMERANG.ANGLE_DELTA_Y)
		    neg
		    ld	    (ix+BOOMERANG.ANGLE_DELTA_Y), a

		    inc	    a
		    inc	    a
		    ret	    nz

DismissActor_:
		    jp	    DismissActor0


BoomChgXDelta:
		    ld	    a, (ix+BOOMERANG.ANGLE_DELTA_X)
		    neg
		    ld	    (ix+BOOMERANG.ANGLE_DELTA_X), a

		    inc	    (ix+BOOMERANG.COUNTER)
		    ret

;---------------------------------------------------------------------------
;
; Init Coward Duck
; If CARD8 was not taken, he will appear again
;
;---------------------------------------------------------------------------

InitCowardDuck:
		    ld	    a, (Card8Taken)
		    or	    a				    ; Card 8 taken?
		    jr	    nz,	DismissActor_

		    ld	    (ix+COWARD_D.SpriteId), 18h	    ; Coward Duck walk sprite ID
		    ld	    (ix+COWARD_D.TIMER), 3
		    inc	    (ix+COWARD_D.MOVING)	    ; He can move
		    jp	    SetBossMusic
