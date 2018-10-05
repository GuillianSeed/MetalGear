;---------------------------------------------------------------------------
;
; Init basement	dog
; There	are two	types: static and spawned
;
;---------------------------------------------------------------------------

InitDogBasement:
		    ld	    a, ID_DOG_BASEMENT
		    call    CountEnemyType
		    cp	    3
		    jp	    nc,	DismissActor0		    ; Too many dogs

		    inc	    (ix+DOG.Moving)		    ; Enable movement

		    ld	    a, (NoEnemiesRoom)		    ; 1=No enemies in the room
		    or	    a				    ; The dog is predefined in the room	or spawned?
		    jr	    z, InitRunningDog		    ; It is an spawned dog (dog	that enters running in the room)

		    ld	    (ix+DOG.Timer), 40h
		    ld	    (ix+DOG.SpriteId), 14h	    ; Dog lying	sprite ID

		    ld	    a, r
		    ld	    (ix+DOG.ANIM_CNT), a

;----------------------------------------------------------------------------
;
; Reset	actor speed
;
;----------------------------------------------------------------------------

ResetActorSpeed:
		    ld	    de,	0
		    ld	    l, e
		    ld	    h, d

SetActorSpeed_:						    ; DE = Speed X, HL = Speed Y
		    jp	    SetActorSpeed


;----------------------------------------------------------------------------
;
; Initialize running dog
;
;----------------------------------------------------------------------------

InitRunningDog:
		    call    SetDogSprColNxStat		    ; Set dog sprites colors and next status

		    ld	    a, (NextRoomDirect)		    ; 4=Right, 3=Left, 2=Down, 1=Up
		    dec	    a
		    bit	    1, a
		    jr	    nz,	SetDogHorSpeed		    ; The player entered from the left or right	side

; The dog moves	in the Y axis

SetVertDogSpeed:
		    ld	    a, (PlayerY)
		    cp	    (ix+DOG.Y)
		    ld	    b, 0			    ; Up
		    ld	    de,	0			    ; Speed X
		    ld	    hl,	-300h			    ; Speed Y
		    jr	    c, SetBaseDogSprSpeed

		    inc	    b				    ; Down
		    ld	    hl,	300h			    ; Speed Y

SetBaseDogSprSpeed:
		    ld	    (ix+DOG.Direction),	b	    ; 0=Up, 1=Down, 2=Left, 3=Right
		    ld	    a, b
		    add	    a, a
		    add	    a, 20h			    ; Dog sprite id
		    ld	    (ix+DOG.SpriteId), a

		    jp	    SetActorSpeed		    ; DE = Speed X, HL = Speed Y

;---------------------------------------------------------------------------
;
; Basement dog logic
;
;---------------------------------------------------------------------------

DogBasementLogic:
		    bit	    1, (ix+DOG.Direction)	    ; Is it moving left	or right?
		    jr	    nz,	DogBasementLogic2	    ; No, moving in Y axis (up or down)

		    ld	    a, 20h			    ; Check left limit
		    cp	    (ix+DOG.X)
		    jr	    c, DogBasementLogic2

		    ld	    (ix+DOG.X),	a		    ; Adjust the dog X to left limit

DogBasementLogic2:
		    ld	    a, (ix+DOG.Status)
		    call    JumpIndex

		    dw DogBaseSleep
		    dw DogBaseRun
		    dw DogBaseChase




;----------------------------------------------------------------------------
;
; BAsement dog chases the player
;
;----------------------------------------------------------------------------

DogBaseChase:
		    call    ChkDogChgDir

		    dec	    (ix+DOG.Timer)
		    ret	    nz

		    ld	    a, 3
		    call    SetSoundEntryChk		    ; Bark sfx

		    ld	    (ix+ACTOR.Cnt_NumPathPoints), 18h
		    bit	    1, (ix+DOG.Direction)	    ; 0=Up, 1=Down, 2=Left, 3=Right
		    jr	    z, SetVertDogSpeed

SetDogHorSpeed:
		    ld	    a, (PlayerX)
		    cp	    (ix+DOG.X)
		    ld	    b, 2			    ; Left
		    ld	    hl,	0			    ; Speed Y
		    ld	    de,	-300h			    ; Speed X
		    jr	    c, SetBaseDogSprSpeed

		    inc	    b				    ; Right
		    ld	    de,	300h			    ; Speed X
		    jr	    SetBaseDogSprSpeed



;----------------------------------------------------------------------------
;
; Dog speeds per direction
;
;----------------------------------------------------------------------------

DogBaseSleep:
		    ld	    b, 1Fh
		    call    Anim2FramesActor		    ; Animate each 32 iterations

		    dec	    (ix+DOG.Timer)
		    ret	    nz				    ; Continue sleeping

		    call    SetVertDogSpeed		    ; Wake up and move towards the player in Y axis

;----------------------------------------------------------------------------
;
; Set sprites colors of	the dog
; Set next status
;
;----------------------------------------------------------------------------

SetDogSprColNxStat:
		    call    NextActorStatus

		    ld	    a, 0Dh
		    ld	    c, 0Fh
		    jp	    SetSprColor




;----------------------------------------------------------------------------
;
; Dog run logic
; Check	if the dog is near the player, and start chasing him
; Update run animation
; Check	collisions
;
;----------------------------------------------------------------------------

DogBaseRun:
		    call    ChkDogNearPlayer		    ; Check if the dog is near the player and starts chasing him

ChkDogChgDir:
		    ld	    b, 7			    ; Animate the dog each 8 iterations
		    call    Anim2FramesActor

		    ld	    l, (ix+DOG.Direction)	    ; 0=Up, 1=Down, 2=Left, 3=Right
		    ld	    h, 0

		    ld	    de,	DogSpeedDat
		    add	    hl,	hl
		    add	    hl,	de
		    ex	    de,	hl			    ; DE = Pointer to dog speed

		    ld	    a, (de)			    ; Speed Y
		    inc	    de
		    add	    a, (ix+DOG.Y)
		    ld	    l, a			    ; New dog Y

		    ld	    a, (de)			    ; Speed X
		    add	    a, (ix+DOG.X)
		    ld	    h, a			    ; New dog X

		    ld	    a, (ix+DOG.Direction)	    ; 0=Up, 1=Down, 2=Left, 3=Right
		    inc	    a
		    cp	    5				    ; (!?) The range in	the dog	is 0-3
		    jr	    c, ChkDogChgDir2

		    xor	    a

ChkDogChgDir2:
		    ld	    c, a			    ; Direction
		    ld	    b, 2
		    call    ChkTileCollision_
		    ret	    nc				    ; Not collision

		    ld	    a, (ix+DOG.X)
		    cp	    242
		    ret	    nc				    ; Ignore the collision. The	dog is leaving the room	(right)

		    cp	    0Ch
		    ret	    c				    ; Ignore the collision. The	dog is leaving the room	(left)

		    ld	    a, (ix+DOG.Y)
		    cp	    28
		    ret	    c				    ; Ignore the collision. The	dog is leaving the room	(up)

		    cp	    180
		    ret	    nc				    ; Ignore the collision. The	dog is leaving the room	(down)

		    bit	    1, (ix+ACTOR.Direction)	    ; Moving Left or right?
		    ld	    a, 0			    ; Up
		    jr	    nz,	ChkDogChgDir3		    ; No, moving up or down

		    ld	    a, 2			    ; Left

ChkDogChgDir3:
		    ld	    (ix+DOG.NextDirection), a

		    ld	    d, 0
		    ld	    e, -19h
		    or	    a				    ; Up
		    jr	    z, ChkDogChgDir4

		    ld	    e, 19h
		    dec	    a				    ; Down
		    jr	    z, ChkDogChgDir4

		    ld	    de,	-1900h
		    dec	    a				    ; Left
		    jr	    z, ChkDogChgDir4

		    ld	    d, 19h			    ; Right

ChkDogChgDir4:
		    ld	    a, d
		    add	    a, (ix+DOG.X)
		    ld	    h, a			    ; New X

		    ld	    a, e
		    add	    a, (ix+DOG.Y)
		    ld	    l, a			    ; New dog Y

		    ld	    a, (ix+DOG.NextDirection)	    ; Dog direction
		    inc	    a
		    cp	    5				    ; Dog uses 0-3 values
		    jr	    c, ChkDogChgDir5

		    ld	    a, DIR_UP

ChkDogChgDir5:
		    ld	    c, a
		    ld	    b, 2			    ; Shape/size
		    call    ChkTileCollision_		    ; Check collisions

ChkDogChgDir6:						    ; The dog collide. Change its direction
		    jr	    c, ChangeDogDir

		    dec	    a
		    ld	    (ix+DOG.Direction),	a	    ; 0=Up, 1=Down, 2=Left, 3=Right

		    ld	    hl,	-300h			    ; Y	Speed
		    ld	    de,	0			    ; X	Speed
		    or	    a				    ; Up
		    jr	    z, ChkDogChgDir7

		    ld	    hl,	300h			    ; Y	Speed
		    dec	    a				    ; Down
		    jr	    z, ChkDogChgDir7

		    ld	    de,	-300h			    ; X	Speed
		    ld	    hl,	0			    ; Y	Speed
		    dec	    a				    ; Left
		    jr	    z, ChkDogChgDir7

		    ld	    de,	300h			    ; X	Speed, right

ChkDogChgDir7:
		    call    SetActorSpeed		    ; Set the new speed	of the dog

		    ld	    a, (ix+DOG.SpriteId)
		    and	    1
		    ld	    b, a			    ; Current frame (1 or 2) of	the running animation

		    ld	    a, (ix+DOG.Direction)	    ; 0=Up, 1=Down, 2=Left, 3=Right
		    add	    a, a
		    add	    a, 20h			    ; Dog running up sprite ID
		    add	    a, b
		    ld	    (ix+DOG.SpriteId), a
		    ret


;----------------------------------------------------------------------------
;
; Select next direction	and checks collisions
;
;----------------------------------------------------------------------------

ChangeDogDir:
		    ld	    a, (ix+DOG.NextDirection)
		    inc	    a
		    and	    3
		    jr	    ChkDogChgDir3


;----------------------------------------------------------------------------
;
; Dog speeds per direction
;
;----------------------------------------------------------------------------
DogSpeedDat:	    db -8
		    db 0
		    db 8
		    db 0
		    db 0
		    db -8
		    db 0
		    db 8



;----------------------------------------------------------------------------
;
; If the dog is	near the player, it starts chasing him (next status)
;
;----------------------------------------------------------------------------

ChkDogNearPlayer:
		    call    GetPlayerXY			    ; D	= Player X, E =	Player Y

		    ld	    h, (ix+DOG.X)
		    ld	    l, (ix+DOG.Y)

		    bit	    1, (ix+DOG.Direction)	    ; Is the dog moving	left or	right?
		    jr	    nz,	ChkDogNearPlayer3	    ; No, up or	down

		    ld	    a, d			    ; Player X
		    sub	    h				    ; Dog X
		    jr	    nc,	ChkDogNearPlayer2

		    neg					    ; Distance to positive

ChkDogNearPlayer2:
		    cp	    30h
		    ret	    nc				    ; Not in the same X	range

		    ld	    a, e			    ; Player Y
		    sub	    18h
		    cp	    l				    ; Dog Y
		    ret	    nc				    ; Not in the same Y	range

		    add	    a, 30h
		    cp	    l				    ; Dog Y
		    ret	    c				    ; Not in the same Y	range

		    ld	    (ix+DOG.Timer), 18h
		    jp	    NextActorStatus		    ; The dog chases the player


ChkDogNearPlayer3:
		    ld	    a, e			    ; Player Y
		    sub	    l				    ; Dog Y
		    jr	    nc,	ChkDogNearPlayer4

		    neg					    ; Distance to positive

ChkDogNearPlayer4:
		    cp	    30h
		    ret	    nc				    ; Not in the same Y	range

		    ld	    a, d			    ; Player X
		    sub	    20h
		    cp	    h				    ; Dog X
		    ret	    nc				    ; Not in the same X	range

		    add	    a, 40h
		    cp	    h				    ; Dog X
		    ret	    c				    ; Not in the same X	range

		    ld	    (ix+DOG.Timer), 18h
		    jp	    NextActorStatus		    ; The dog chases the player

