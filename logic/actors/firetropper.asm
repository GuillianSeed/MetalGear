;----------------------------------------------------------------------------
;
; Fire Trooper logic
;
;----------------------------------------------------------------------------

FireTrooperLoogic:
		    ld	    a, (ix+FIRE_TROPPER.Status)
		    call    JumpIndex

		    dw FireTrooperIntro			    ; Intro speech
		    dw FT_GetFlames			    ; Get pointers to the flames actors	in the room
		    dw FT_Walk				    ; Walk towards the player and locate all flames in the flamethrower
		    dw FT_ThrowFlames			    ; Throw flames
		    dw FT_MoveFlames			    ; Move flamethrower	jet
		    dw FT_BringInFlames			    ; Bring in the flames


;----------------------------------------------------------------------------
;
; Intro	speech
;
;----------------------------------------------------------------------------

FireTrooperIntro:
		    dec	    (ix+FIRE_TROPPER.DUMMY_CNT)	    ; Initial value is 2
		    ret	    nz

		    inc	    (ix+FIRE_TROPPER.Status)

		    ld	    a, 108			    ; TEXT: I'm fire trooper. Burn alive
		    jp	    SetTextUnskip2


;----------------------------------------------------------------------------
;
; Check	how many flames	are active and add to the actor	structure pointers to them
; The flames are created as default actors in the room
;
;----------------------------------------------------------------------------

FT_GetFlames:
		    ld	    hl,	EnemyList		    ; Array of enemies in the room
		    ld	    de,	80h			    ; Actor sctructure size
		    ld	    bc,	1000h			    ; B	= Max. number of enemies, C = Flames counter
		    ld	    a, ID_FLAME

FT_GetFlames2:
		    cp	    (hl)			    ; Is it a flame?
		    jr	    nz,	FT_GetFlames3

		    inc	    c				    ; Increment	number of flames actors
		    push    hl				    ; Save pointer to flame object

FT_GetFlames3:
		    add	    hl,	de			    ; Pointer to next actor
		    djnz    FT_GetFlames2



		    ld	    a, c
		    or	    a				    ; Number of	flames found
		    jr	    z, FT_MoveToPlayer_		    ; No flames	found

		    push    ix
		    pop	    hl				    ; HL = Pointer to Fire Tropper actor

		    ld	    a, 3Fh
		    or	    l
		    ld	    l, a
		    ld	    b, c
		    ld	    (hl), b			    ; Actor +3F	= Number of flames
		    inc	    l

FT_GetFlames4:
		    pop	    de				    ; Pointer to flame actor

		    ld	    (hl), e
		    inc	    l
		    ld	    (hl), d			    ; Save flame pointers in actor #40-...
		    inc	    l
		    djnz    FT_GetFlames4

FT_MoveToPlayer_:
		    call    FT_MoveToPlayer
		    jp	    FT_NextStatus		    ; Init flames



;----------------------------------------------------------------------------
;
; Setup	the actor to move to the left or to the	right, depending on where the player is
;
;----------------------------------------------------------------------------

FT_MoveToPlayer:
		    ld	    (ix+FIRE_TROPPER.MOVING), 1	    ; Enable movement

		    ld	    a, (PlayerX)
		    cp	    (ix+FIRE_TROPPER.X)

		    ld	    b, 2Ch			    ; Fire Tropper to the right	sprite ID
		    ld	    de,	200h			    ; Speed to the right
		    jr	    nc,	FT_MoveToPlayer2

		    ld	    b, 28h			    ; Fire Tropper to the left sprite ID
		    ld	    de,	-200h			    ; Speed to the left

FT_MoveToPlayer2:
		    ld	    (ix+FIRE_TROPPER.SpriteId),	b   ; Set Fire Tropper sprite
		    jp	    SetActorSpeedX



;----------------------------------------------------------------------------
;
; Move towards the player to fire the flamethrower
;
;----------------------------------------------------------------------------

FT_Walk:
		    ld	    b, 3
		    call    Anim2FramesActor		    ; Update walk animation each 4 iterations

		    ld	    a, (ix+FIRE_TROPPER.X)
		    ld	    b, 80h			    ; Right limit
		    cp	    b
		    jr	    nc,	FT_InitFlames2

		    ld	    b, 60h			    ; Left limit
		    cp	    b
		    ret	    nc

FT_InitFlames2:
		    ld	    (ix+FIRE_TROPPER.X), b

		    ld	    e, (ix+FIRE_TROPPER.Y)
		    ld	    (ix+FIRE_TROPPER.START_Y), e
		    ld	    (ix+FIRE_TROPPER.START_X), b

		    ld	    (ix+FIRE_TROPPER.SpriteId),	2Fh ; Fire Tropper firing down sprite ID

		    ld	    a, e			    ; Fire Trooper Y
		    add	    a, 0Bh			    ; Flames Y offset from Fire	Tropper

		    ld	    c, b			    ; Fire Trooper X

; Locate all flames in the flamethrower

		    ld	    b, (ix+FIRE_TROPPER.NUM_FLAMES)
		    ld	    hl,	 EnemyListEntry1+3	    ; Pointer to flame 1 actor,	Y property
		    ld	    de,	7Eh			    ; Offset to	next actor

FT_InitFlames3:
		    ld	    (hl), a			    ; Flame Y
		    inc	    l
		    inc	    l
		    ld	    (hl), c			    ; Flame X

		    add	    hl,	de
		    djnz    FT_InitFlames3


		    ld	    de,	0
		    ld	    h, d
		    ld	    l, e
		    call    SetActorSpeed		    ; Fire Tropper stops moving

		    ld	    c, 3Eh			    ; Offset to	flame pointers -2
		    ld	    b, (ix+FIRE_TROPPER.NUM_FLAMES)
		    push    ix
		    pop	    hl				    ; HL = Pointer to Fire Tropper actor
		    ld	    (TempData),	hl

FT_InitFlames4:
		    ld	    a, b			    ; Index of the flame
		    sla	    a				    ; x2
		    add	    a, c			    ; Offset to	pointers of flame actors
		    ld	    hl,	(TempData)		    ; Pointer to Fire Tropper actor
		    call    ADD_HL_A
		    ld	    e, (hl)
		    inc	    l
		    ld	    d, (hl)			    ; DE = Pointer to flame actor

		    push    de
		    pop	    ix				    ; IX = Pointer to flame actor

		    ld	    (ix+ACTOR.HiddenFlame), 0
		    ld	    (ix+ACTOR.COLLISION_CFG), 3	    ; Enable collisions	with the player	and his	shots

		    push    bc
		    call    SetFlameSprColor		    ; Make the flame visible setting its color
		    pop	    bc

		    djnz    FT_InitFlames4		    ; Next flame

		    ld	    ix,	(TempData)
		    ld	    (ix+FIRE_TROPPER.FLAME_JET_CNT), 10h

FT_NextStatus:
		    inc	    (ix+FIRE_TROPPER.Status)
		    ret




;----------------------------------------------------------------------------
;
; Throw	flames logic
; The flames move from Fire Tropper to the bottom of the screen
;
;----------------------------------------------------------------------------

FT_ThrowFlames:
		    dec	    (ix+FIRE_TROPPER.FLAME_JET_CNT)
		    jr	    nz,	FT_ThrowFlames2		    ; Thowring flames

		    ld	    (ix+FIRE_TROPPER.FLAME_JET_CNT), 50h
		    jr	    FT_NextStatus


FT_ThrowFlames2:
		    ld	    a, (ix+FIRE_TROPPER.FLAME_JET_CNT)
		    neg
		    add	    a, 10h			    ; Invert the range (16-0 ->	0-16)

		    ld	    c, a

		    push    ix
		    pop	    de				    ; DE = Pointer to Fire Tropper actor

		    ld	    a, FIRE_TROPPER.FLAME1_GAP_Y    ; Flames gaps
		    add	    a, e
		    ld	    e, a			    ; DE = Pointer Fire	Tropper	field #50

		    ld	    b, (ix+FIRE_TROPPER.NUM_FLAMES)
		    xor	    a
		    ex	    de,	hl

FT_ThrowFlames3:
		    add	    a, c			    ; Add gap value
		    ld	    (hl), a			    ; Distance Y from Fire Tropper to the flame
		    inc	    l
		    ld	    (hl), 0			    ; Distance X
		    inc	    l
		    djnz    FT_ThrowFlames3

		    jp	    FT_MoveFlames11



;----------------------------------------------------------------------------
;
; Move the flames
;
;----------------------------------------------------------------------------

FT_MoveFlames:
		    dec	    (ix+FIRE_TROPPER.FLAME_JET_CNT)
		    jr	    nz,	FT_MoveFlames2

		    ld	    a, (ix+FIRE_TROPPER.NUM_FLAMES)
		    inc	    a
		    ld	    (ix+FIRE_TROPPER.FLAME_JET_CNT), a ; Number	of steps to reduce the flamethrower jet
		    jr	    FT_NextStatus		    ; Status to	bring the flames in


FT_MoveFlames2:
		    ld	    d, (ix+FIRE_TROPPER.DELTA_)
		    ld	    a, d
		    add	    a, (ix+FIRE_TROPPER.ANGLE)
		    ld	    (ix+FIRE_TROPPER.ANGLE), a

		    ld	    c, 18h
		    cp	    c
		    jr	    c, FT_MoveFlames3

		    ld	    c, 3Fh
		    cp	    c
		    jr	    c, FT_MoveFlames4

FT_MoveFlames3:
		    ld	    (ix+FIRE_TROPPER.ANGLE), c
		    ld	    a, d
		    neg
		    ld	    (ix+FIRE_TROPPER.DELTA_), a

		    ld	    a, (ix+FIRE_TROPPER.FLAME_MOV_ID)
		    inc	    a
		    and	    3
		    ld	    (ix+FIRE_TROPPER.FLAME_MOV_ID), a

FT_MoveFlames4:
		    ld	    c, 2Fh			    ; Fire Tropper fire	left sprite ID
		    ld	    a, (ix+FIRE_TROPPER.ANGLE)
		    cp	    2Ch
		    jr	    nc,	FT_MoveFlames5

		    ld	    c, 2Eh			    ; Fire Tropper fire	left sprite ID
		    ld	    a, (ix+FIRE_TROPPER.FLAME_MOV_ID)
		    dec	    a
		    jr	    z, FT_MoveFlames5

		    dec	    a
		    jr	    z, FT_MoveFlames5
		    ld	    c, 30h			    ; Fire Tropper fire	left sprite ID

FT_MoveFlames5:
		    ld	    (ix+FIRE_TROPPER.SpriteId),	c
		    call    GetFlameSinCos		    ; B	= Cosine
		    ld	    a, b
		    srl	    a
		    srl	    a
		    srl	    a
		    srl	    a
		    ld	    b, a			    ; Cosine / 16 (0-15)

		    ld	    a, (ix+FIRE_TROPPER.FLAME_MOV_ID)
		    dec	    a
		    jr	    z, FT_MoveFlames6

		    dec	    a
		    ld	    a, b
		    jr	    nz,	FT_MoveFlames7

FT_MoveFlames6:
		    ld	    a, b
		    neg
		    ld	    b, a

FT_MoveFlames7:
		    ld	    (ix+FIRE_TROPPER.FLAME1_GAP_X), b

		    ld	    a, c			    ; C	= Sine
		    srl	    a
		    srl	    a
		    srl	    a
		    srl	    a
		    ld	    c, a			    ; Sine / 16	(0-15)

		    ld	    a, (ix+FIRE_TROPPER.FLAME_MOV_ID)
		    sub	    2
		    jr	    c, FT_MoveFlames8		    ; (!?)

FT_MoveFlames8:
		    ld	    (ix+FIRE_TROPPER.FLAME1_GAP_Y), c

		    ld	    h, (ix+FIRE_TROPPER.NUM_FLAMES)

		    push    ix
		    pop	    de

		    ld	    a, FIRE_TROPPER.FLAME1_GAP_Y
		    add	    a, e
		    ld	    e, a			    ; DE = Pointer to flame 1 gap

		    ld	    a, (de)
		    ld	    c, a
		    inc	    e
		    inc	    e				    ; DE = Pointer to next flame gap

		    ld	    a, c			    ; A	= Flame	gap
		    ld	    b, h			    ; Number of	flames

FT_MoveFlames9:
		    add	    a, c
		    ld	    (de), a			    ; Update next flames gaps
		    inc	    e
		    inc	    e				    ; Pointer to next flame gap
		    djnz    FT_MoveFlames9

		    ld	    b, (ix+FIRE_TROPPER.NUM_FLAMES)
		    ld	    a, b
		    sla	    a				    ; x2
		    neg
		    add	    a, e
		    ld	    e, a
		    inc	    e				    ; DE = Pointer to flame 2 gap X

		    ld	    c, (ix+FIRE_TROPPER.FLAME1_GAP_X)
		    ld	    a, c

		    ld	    b, h			    ; Number of	flames

FT_MoveFlames10:
		    add	    a, c
		    ld	    (de), a			    ; Update flames gaps X
		    inc	    e
		    inc	    e
		    djnz    FT_MoveFlames10

FT_MoveFlames11:
		    push    ix
		    pop	    hl

		    ld	    a, FIRE_TROPPER.FLAME1_GAP_Y
		    or	    l
		    ld	    l, a

		    push    hl

		    ld	    a, -11h			    ; Offset to	number of flames
		    add	    a, l
		    ld	    l, a
		    ld	    b, (hl)			    ; Number of	flames
		    inc	    l				    ; HL = Pointer to pointers of flames

		    push    bc
		    exx
		    pop	    bc				    ; B	= Number of flames

FT_MoveFlames12:
		    exx
		    ld	    e, (hl)
		    inc	    l
		    ld	    d, (hl)
		    inc	    l
		    ex	    de,	hl			    ; HL = Pointer to flame actor

		    push    hl
		    pop	    iy				    ; IY = Pointer to flame actor

		    ld	    b, d
		    ld	    c, e			    ; BC = Pointer to next flame pointer

		    inc	    l
		    inc	    l
		    inc	    l				    ; Pointer to flame Y

		    pop	    de				    ; Pointer to flames	gaps

		    ld	    a, (de)			    ; Flame 1 gap
		    ld	    (iy+ACTOR.GAP_Y), a
		    inc	    e
		    add	    a, (ix+FIRE_TROPPER.START_Y)
		    ld	    (hl), a			    ; Flame Y

		    inc	    l
		    inc	    l				    ; Pointer to flame X

		    ld	    a, (de)			    ; Flame gap	X
		    ld	    (iy+ACTOR.GAP_X), a		    ; Fire Tropper Y + flame distance Y
		    inc	    e				    ; Pointer to next flame gaps

		    push    de
		    add	    a, (ix+FIRE_TROPPER.START_X)    ; Fire Tropper X + flame distance X
		    ld	    (hl), a			    ; Flame X

		    ld	    h, b
		    ld	    l, c

		    exx
		    djnz    FT_MoveFlames12

		    exx
		    pop	    de
		    ret




;----------------------------------------------------------------------------
;
; Bring	the flames in logic
;
;----------------------------------------------------------------------------

FT_BringInFlames:
		    dec	    (ix+FIRE_TROPPER.FLAME_JET_CNT)
		    jr	    z, RestartFireTropper

		    ld	    a, (ix+FIRE_TROPPER.FLAME_JET_CNT)
		    dec	    a
		    sla	    a
		    add	    a, FIRE_TROPPER.POINTERS	    ; Pointer to flames	actors

		    push    ix
		    pop	    hl

		    push    hl

		    call    ADD_HL_A
		    ld	    e, (hl)
		    inc	    l
		    ld	    d, (hl)			    ; DE = Pointer to flame actor

		    push    de
		    pop	    ix				    ; IX = Pointer to flame actor

		    ld	    (ix+FIRE_TROPPER.field_72),	1
		    ld	    (ix+FIRE_TROPPER.COLLISION_CFG), 0 ; Bit0 =	Check collision	with player, Bit1 = Check player shots,	bit2 = Pitfall is closed

		    xor	    a
		    ld	    c, a
		    call    SetSprColor			    ; Hide flame sprites

		    pop	    ix
		    ret


RestartFireTropper:
		    call    InitFireTrooper2
		    call    FT_MoveToPlayer
		    ld	    a, 1
		    jp	    SetActorStatus		    ; Walk towards the player status



; (!?) Not used
		    ld	    b, 2
		    push    ix

loc_106472:
		    ld	    e, (ix+ACTOR.speedYdec)
		    ld	    d, (ix+ACTOR.SpeedY)
		    ld	    l, (ix+ACTOR.DestinationX)
		    ld	    h, (ix+ACTOR.PointerL)
		    add	    hl,	de
		    ld	    (ix+ACTOR.DestinationX), l
		    ld	    (ix+ACTOR.PointerL), h
		    inc	    ix
		    inc	    ix
		    djnz    loc_106472
		    pop	    ix
		    ld	    a, (ix+ACTOR.NextPointOffset)
		    cp	    80h
		    jr	    c, loc_106499
		    ld	    de,	-200h
		    jr	    loc_10649F


loc_106499:
		    cp	    60h
		    ret	    nc
		    ld	    de,	200h

loc_10649F:
		    jp	    SetActorSpeedX



;----------------------------------------------------------------------------
;
; Initialize Fire Tropper
;
;----------------------------------------------------------------------------

InitFireTrooper:
		    ld	    a, (FireTrooper_KO)
		    or	    a
		    jr	    nz,	InitFlame2		    ; Jump to dismiss actor

		    ld	    (ix+FIRE_TROPPER.DUMMY_CNT), 2

		    ld	    a, ID_GREY_FOX		    ; (!?) Why does it count Grey Fox actors? Perhaps it wanted	to count ID_FIRE_TROPPER
		    call    CountEnemyType
		    cp	    2
		    jp	    nc,	DismissActor0		    ; Only one Fire trooper (?)

		    call    SetBossMusic

InitFireTrooper2:
		    ld	    (ix+FIRE_TROPPER.DELTA_), 4
		    ld	    (ix+FIRE_TROPPER.ANGLE), 3Fh
		    ld	    (ix+FIRE_TROPPER.FLAME_MOV_ID), 2
		    ld	    (ix+FIRE_TROPPER.SpriteId),	2Ch

		    ld	    e, (ix+FIRE_TROPPER.Y)
		    ld	    d, (ix+FIRE_TROPPER.X)
		    ld	    (ix+FIRE_TROPPER.START_Y), e
		    ld	    (ix+FIRE_TROPPER.START_X), d

		    ld	    de,	-200h
		    ld	    hl,	0
		    jr	    jpSetActorSpeed


