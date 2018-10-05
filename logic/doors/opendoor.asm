;----------------------------------------------------------------------------
;
; Check	if the player opens the	door depending on how the door is opened
;
;----------------------------------------------------------------------------

ChkOpenDoor:
		    ld	    a, (PlayerAnimation)	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    cp	    7				    ; Box?
		    jr	    nz,	ChkOpenDoor2

		    xor	    a				    ; Snake can't open doors in cardboard mode
		    ret


ChkOpenDoor2:
		    ld	    a, (hl)			    ; +2 = Door	logic
		    and	    1Fh				    ; Keep only	the type of logic to open the door

		    inc	    hl

		    ld	    c, l
		    ld	    b, h			    ; BC = pointer to door render type

		    dec	    a
		    call    JumpIndex

		    dw ChkElevatorDoor
		    dw ChkCard1
		    dw ChkCard2
		    dw ChkCard3
		    dw ChkCard4
		    dw ChkCard5
		    dw ChkCard6
		    dw ChkCard7
		    dw ChkCard8
		    dw ChkPunchDoor			    ; Shot Gunner punch	door
		    dw ChkDoorLorry
		    dw ChkDesertDoorBuild2
		    dw ChkCompassDoor
		    dw ChkBigBossDoor
		    dw ChkPrisonWalls
		    dw ChkBasementWall

;----------------------------------------------------------------------------
;
; Elevator doors and exits (inside elevator rooms)
;
;----------------------------------------------------------------------------

ChkElevatorDoor:
		    ld	    l, c
		    ld	    h, b			    ; HL = pointer to render type

		    ld	    a, (hl)
		    cp	    5				    ; Elevator door?
		    jr	    z, ChkNoCardDoorUp

; It is	an elevator exit door

		    ld	    a, (PlayerDirection)	    ; All elevators room have their exits in the right side
		    sub	    DIR_RIGHT
		    jp	    nz,	DoorLocked

		    jr	    ChkTouchDoor_


ChkNoCardDoorUp:
		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    dec	    a				    ; Going up?
		    jp	    nz,	DoorLocked		    ; No, the player can't open the door

ChkTouchDoor_:
		    jp	    ChkTouchDoor


;----------------------------------------------------------------------------
;
; Doors	that need a card
;
;----------------------------------------------------------------------------

ChkCard1:
		    ld	    d, SELECTED_CARD1
		    jr	    ChkCard


ChkCard2:
		    ld	    d, SELECTED_CARD2
		    jr	    ChkCard


ChkCard3:
		    ld	    d, SELECTED_CARD3
		    jr	    ChkCard


ChkCard4:
		    ld	    d, SELECTED_CARD4
		    jr	    ChkCard


ChkCard5:
		    ld	    d, SELECTED_CARD5
		    jr	    ChkCard


ChkCard6:
		    ld	    d, SELECTED_CARD6
		    jr	    ChkCard


ChkCard7:
		    ld	    d, SELECTED_CARD7
		    jr	    ChkCard


ChkCard8:
		    ld	    d, SELECTED_CARD8

ChkCard:
		    ld	    l, c
		    ld	    h, b			    ; HL = pointer to door type

		    ld	    a, (SelectedItem)
		    cp	    d				    ; Is the player using the right card?
		    jp	    nz,	DoorLocked

		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    cp	    (hl)			    ; Is the player in the right direction to open the door?
							    ; Door render type is equivalent to	player direction.
		    jp	    nz,	DoorLocked

		    jp	    ChkTouchDoor

;----------------------------------------------------------------------------
;
; Shotgunner door
; This door is opened punching on it
;
;----------------------------------------------------------------------------

ChkPunchDoor:
		    ld	    l, c
		    ld	    h, b			    ; HL = door	type

		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    cp	    (hl)			    ; Is the player in the right direction to open the door?
							    ; Door render type is equivalent to	player direction.
		    jp	    nz,	DoorLocked

		    ld	    a, (PlayerControlMod)	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
		    dec	    a				    ; Punching?
		    jp	    nz,	DoorLocked

		    jp	    ChkTouchDoor


;----------------------------------------------------------------------------
;
; (!?) Unused? Lorry's doors are always open
;
;----------------------------------------------------------------------------

ChkDoorLorry:
		    ld	    l, c
		    ld	    h, b			    ; HL = door	type

		    ld	    a, (PlayerShotsList)
		    cp	    PLASTIC_BOMB
		    jr	    nz,	ChkDoorLorry2

		    ld	    a, (PlayerShot1Stat)
		    cp	    2				    ; Exploding?
		    jr	    nz,	ChkDoorLorry2

		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl				    ; HL = Pointer to check area Y
		    jp	    ChkBombLocation


ChkDoorLorry2:
		    ld	    a, (PlayerControlMod)	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
		    dec	    a				    ; Is the player punching?
		    jp	    nz,	DoorLocked		    ; No

		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    cp	    (hl)
		    jp	    nz,	DoorLocked

		    call    ChkTouchDoor
		    ret	    nc

		    ld	    a, (PunchCnt)
		    cp	    8
		    jp	    nz,	DoorLocked

		    jp	    PlayBreakableSfx



;----------------------------------------------------------------------------
;
; Building 2 door (to building 1 desert)
; This door is automatically opened by the desert guards when the player is wearing the	enemy uniform
; From inside the building, this door opens just walking south
;
;----------------------------------------------------------------------------

ChkDesertDoorBuild2:
		    ld	    l, c
		    ld	    h, b			    ; HL = door	type
		    ld	    a, (Room)
		    cp	    73				    ; Building 2 first room (trying to open it from inside?)
		    jr	    nz,	ChkDesertDoorBuild2_

		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    sub	    2				    ; Down?
		    jp	    nz,	DoorLocked

		    jp	    ChkTouchDoor


ChkDesertDoorBuild2_:
		    ld	    a, (DoorBuild2LockedF)	    ; 0	= Entrance door	of building 2 is closed. 1 = Open
		    and	    a
		    jp	    z, DoorLocked		    ; The guards have not opened it

; Enter	the door and lock it again

		    xor	    a
		    ld	    (DoorBuild2LockedF), a	    ; 0	= Entrance door	of building 2 is closed. 1 = Open
		    jp	    DoorUnlocked


;----------------------------------------------------------------------------
;
; This door is opened by Jennifer in order to get the compass
; Room 87. Building 2, floor 2
;
;----------------------------------------------------------------------------

ChkCompassDoor:
		    ld	    l, c
		    ld	    h, b			    ; HL = Pointer to door render type

		    ld	    a, (JeniOpenDoorF)		    ; Flag to open the door to the compass room
		    and	    a
		    jp	    z, DoorLocked

		    xor	    a
		    ld	    (JeniOpenDoorF), a		    ; Flag to open the door to the compass room
		    jp	    DoorUnlocked


;----------------------------------------------------------------------------
;
; Door from Metal Gear to Big Boss room
; Door from Big	Boss room to ladders
;
;----------------------------------------------------------------------------

ChkBigBossDoor:
		    ld	    l, c
		    ld	    h, b			    ; Pointer to door render type

		    ld	    a, (OpenBigBossDoor)	    ; Flag to open door	from Metal Gear	to Big Boss room, and door to escape ladders.
		    and	    a
		    jp	    z, DoorLocked

		    xor	    a
		    ld	    (OpenBigBossDoor), a	    ; Flag to open door	from Metal Gear	to Big Boss room, and door to escape ladders.
		    jp	    DoorUnlocked


;----------------------------------------------------------------------------
;
; Check	if the breakable walls of the prison are punched
; This wall can	be broken by punching them
;
;----------------------------------------------------------------------------

ChkPrisonWalls:
		    ld	    l, c
		    ld	    h, b			    ; Pointer to door render type

		    ld	    a, (hl)
		    sub	    7				    ; 7	= DrawBasemWall60 render type
		    ld	    de,	PunchWallDirs
		    call    ADD_DE_A

		    ld	    a, (de)			    ; Get the right direction to punch the wall
		    ld	    d, a
		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    cp	    d				    ; Is the player in the right direction?
		    jr	    nz,	DoorLocked		    ; No

		    ld	    a, (PlayerControlMod)	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
		    dec	    a				    ; Is the player punching?
		    jr	    nz,	DoorLocked		    ; No

		    call    ChkTouchDoor		    ; Check if the player is near the wall
		    ret	    nc

		    ld	    a, (TempData)
		    cp	    0Ch				    ; Door ID: wall GreyFox cell
		    ld	    hl,	PrisonWall2Life		    ; GreyFox prison wall energy

		    jr	    z, ChkPrisonWalls2

		    ld	    hl,	PrisonWall1Life		    ; Snake prison wall	energy

ChkPrisonWalls2:
		    dec	    (hl)
		    jr	    nz,	PlayBreakableSfx

		    jr	    DoorUnlocked



;----------------------------------------------------------------------------
;
; Check	if the breakable walls in the basement
; Can be broken	using a	plastic	bomb
; Punching them	sounds funny
;
;----------------------------------------------------------------------------

ChkBasementWall:
		    ld	    l, c
		    ld	    h, b			    ; Pointer to door render type

		    ld	    a, (PlayerShotsList)
		    cp	    PLASTIC_BOMB		    ; Is a plastic bomb	in the room?
		    jr	    nz,	ChkPunchBaseWall	    ; No

		    ld	    a, (PlayerShot1Stat)
		    cp	    2				    ; Is the bomb exploding?
		    jr	    nz,	ChkPunchBaseWall	    ; No

		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    jr	    ChkBombLocation


ChkPunchBaseWall:
		    ld	    a, (hl)			    ; Door render type
		    sub	    7				    ; DrawBasemWall60 (Adjust render type to start at 0)
		    ld	    de,	PunchWallDirs
		    call    ADD_DE_A

		    ld	    a, (de)			    ; Get the right direction to punch the wall
		    ld	    d, a
		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    cp	    d				    ; Is the player in the right direction?
		    jr	    nz,	DoorLocked

		    ld	    a, (PlayerControlMod)	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
		    dec	    a				    ; Is the player punching?
		    jr	    nz,	DoorLocked

		    call    ChkTouchDoor		    ; Is the player near the wall?
		    ret	    nc

PlayBreakableSfx:
		    ld	    a, 0Ah			    ; Sfx: Punching a breakable	wall
		    call    SetSoundEntryChk
		    and	    a
		    ret


;----------------------------------------------------------------------------
; List of directions to	punch each breakable wall
;----------------------------------------------------------------------------
PunchWallDirs:	    db DIR_DOWN
		    db DIR_DOWN
		    db DIR_LEFT
		    db DIR_RIGHT
		    db DIR_LEFT
		    db DIR_UP
		    db DIR_DOWN
		    db DIR_LEFT
		    db DIR_RIGHT
		    db DIR_UP
		    db DIR_RIGHT
		    db DIR_RIGHT
		    db DIR_UP
		    db DIR_LEFT


;----------------------------------------------------------------------------
;
; Checks if the	player is in the area that opens the door
;
;----------------------------------------------------------------------------

ChkTouchDoor:
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl				    ; HL = pointer to check area Y

ChkTouchDoor2:
		    ld	    a, (PlayerX)
		    ld	    d, a
		    ld	    a, (PlayerY)

ChkTouchDoor3:
		    sub	    (hl)
		    inc	    hl
		    cp	    (hl)			    ; check area NY
		    inc	    hl
		    inc	    hl
		    jr	    nc,	DoorLocked

		    dec	    hl
		    ld	    a, d			    ; Player X
		    sub	    (hl)			    ; check area X
		    inc	    hl
		    cp	    (hl)			    ; check area NX
		    jr	    c, DoorUnlocked

DoorLocked:
		    and	    a
		    ret


DoorUnlocked:
		    scf
		    ret

;----------------------------------------------------------------------------
;
; Checks if the	plastic	bomb is	near the wall
;
;----------------------------------------------------------------------------

ChkBombLocation:
		    ld	    a, (PlayerShot1X)
		    ld	    d, a
		    ld	    a, (PlayerShot1Y)
		    jr	    ChkTouchDoor3
