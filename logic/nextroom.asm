;----------------------------------------------------------------------------
;
; Select the next room number
;
; The next room	number is calculated in	different ways depending on:
; - Falling in parachute
; - Using a door
; - Room connections
; If the player	is in the desert without the compass, it will get lost on room 103, unless he goes south
;----------------------------------------------------------------------------

SetNextRoom:
		    ld	    a, (Room)
		    cp	    204				    ; Bricks wall parachute
		    jp	    z, NextParachuteRoom

		    ld	    a, (IdDoorEnter)
		    and	    a				    ; Did the player entered a door or jumped from the roof?
		    jp	    nz,	ChkDoorDestination	    ; Yes

		    ld	    a, (NextRoomDirect)		    ; 4=Right, 3=Left, 2=Down, 1=Up
		    and	    a
		    ret	    z				    ; Not a valid direction

		    call    GetNextRoomNum		    ; Get the next room	number depending on how	rooms are connected
		    cp	    0F0h			    ; Elevators
		    jp	    nc,	SetNextRoomElev		    ; Get next elevator	room

		    ld	    hl,	Room
		    ld	    c, (hl)			    ; Previous room

		    ld	    (Room), a
		    ld	    a, c
		    cp	    103				    ; Desert
		    jr	    nz,	SetNextRoom2

		    ld	    a, (SelectedItem)
		    cp	    SELECTED_COMPASS		    ; Is the player using the compass?
		    jr	    z, SetNextRoom2

		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    cp	    DIR_DOWN			    ; Going south
		    jr	    z, SetNextRoom2

		    ld	    a, 103
		    ld	    (Room), a			    ; Get lost in the desert without the compass
		    ld	    c, a

SetNextRoom2:
		    ld	    a, c
		    ld	    (PreviousRoom), a

NormalGameMode:
		    xor	    a
		    ld	    (GameMode),	a		    ; Controlling Snake
		    ret

;---------------------------------------------------------------------------
;
; Sets the next	room when moving the elevator
;
;---------------------------------------------------------------------------

SetNextRoomElev:
		    call    GetNextRoomNum		    ; Get the next room	number depending on how	rooms are connected

		    ld	    hl,	Room
		    ld	    c, (hl)			    ; Previous room

		    ld	    (Room), a			    ; New room
		    ld	    a, c
		    ld	    (PreviousRoom), a

		    call    GetElevatorRoomDat		    ; Set elevator movement limits

		    ld	    a, (NextRoomDirect)		    ; 4=Right, 3=Left, 2=Down, 1=Up
		    dec	    a				    ; Going up or down?
		    ld	    a, 0D0h			    ; Elevator at the bottom
		    jr	    z, SetNextRoomElev2

		    ld	    a, 18h			    ; Elevator at the top

SetNextRoomElev2:
		    ld	    (ElevatorY), a		    ; Sets elevator Y
		    ld	    l, 0
		    sub	    4
		    ld	    h, a
		    ld	    (PlayerYdec), hl		    ; Set player Y

		    call    SetHUDSprMask		    ; Prevents the elevator overlaping the HUD (8 sprites limit	trick)

		    xor	    a
		    ld	    (ElevatorStatus), a		    ; Reset elevator status

		    ld	    a, GAME_MODE_ELEVATOR
		    ld	    (GameMode),	a		    ; Controlling the elevator
		    ret

;---------------------------------------------------------------------------
;
; Sets the destination room number that	the door leads to
; Also in case of jumping/falling from the roof
;
;---------------------------------------------------------------------------

ChkDoorDestination:
		    ld	    a, (IdDoorEnter)
		    cp	    91h				    ; Roof jump
		    ld	    c, 117			    ; Room roof	jump
		    jp	    z, ChkParachute

		    cp	    5Bh
		    ld	    c, 45			    ; Room bridge
		    jp	    z, ChkParachute

		    cp	    81h
		    ld	    c, 46			    ; Room bridge 2
		    jp	    z, ChkParachute

; Search door data
		    ld	    hl,	DoorsList		    ; 0=ID, 1=Open, 2=LogicOpen, 3=Type, 4=Cnt,	5=DrawY, 6=DrawX, 7=OpenOffY, 8=OpenNY,	9=OpenOffX, 10=OpenNX, 11=EnterOffY, 12=EnterNY, 13=EnterOffsetX, 14=EnterNY, 15=Destination room
		    ld	    de,	10h

ChkDoorDest2:
		    cp	    (hl)			    ; Same door	ID?
		    jr	    z, SetDoorDestination	    ; Set destination room. If the player enters the elevator, sets the	Y to match the floor

		    add	    hl,	de
		    jr	    ChkDoorDest2


;---------------------------------------------------------------------------
;
; Set the destination room number
; Stores the current room as previous room
; If the player	enters the elevator room, sets the player and elevator Y to match the floor
;
;---------------------------------------------------------------------------

SetDoorDestination:
		    ld	    a, 15			    ; Door structure +15 = Destination room
		    call    ADD_HL_A

		    ld	    a, (hl)
		    ld	    c, a			    ; Destination room

		    ld	    a, (Room)
		    ld	    (PreviousRoom), a		    ; Stores the room that the player is leaving

		    ld	    a, c
		    ld	    (Room), a
		    cp	    0F0h			    ; Elevator
		    jr	    c, GetDoorDest2		    ; (!?) This	could be changed by a jp c,NormalGameMode

		    jr	    SetElevatorPosY		    ; Set elevator and player Y	coordinate


; This routine does nothing. Just jump to NormalGameMode
; Probably some	code was removed

GetDoorDest2:
		    ld	    a, (Room)
		    and	    0F0h
		    cp	    224				    ; Stairs
		    jp	    z, NormalGameMode_

		    ld	    a, (PreviousRoom)
		    cp	    0F0h
		    jr	    nc,	NormalGameMode__	    ; (!?)

		    jp	    NormalGameMode__

;---------------------------------------------------------------------------
;
; Set elevator and player Y coordinates	to match the floor used	to enter the elevator
;
;---------------------------------------------------------------------------

SetElevatorPosY:
		    call    GetElevatorPosY		    ; Get elevator and player Y	coordinate to match the	floor used to enter the	elevator

		    ld	    e, 0
		    ld	    d, c			    ; Player Y
		    ld	    (PlayerYdec), de

		    ld	    d, 0D8h			    ; Player X
		    ld	    (PlayerXdec), de

		    ld	    e, b			    ; Elevator Y
		    ld	    d, 70h			    ; Elevator X
		    ld	    (ElevatorY), de

		    call    SetHUDSprMask		    ; Put hidden sprites in the	scoreboard to mask the elevator	sprites

NormalGameMode__:
		    jp	    NormalGameMode

;---------------------------------------------------------------------------
;
; Skydive
;
;---------------------------------------------------------------------------

ChkParachute:
		    ld	    a, (SelectedItem)
		    cp	    SELECTED_PARACHUTE		    ; Is wearing the parachute?
		    jr	    nz,	FreeFall

		    ld	    a, 204			    ; Big bricks wall
		    ld	    (Room), a
		    ld	    a, c
		    ld	    (PreviousRoom), a

		    ld	    a, 2			    ; Number of	floors
		    ld	    (HeightParachuteCnt), a

		    call    StopAlert

		    jp	    NormalGameMode

;---------------------------------------------------------------------------
;
; Skydive without parachute: Snake lands dead
;
;---------------------------------------------------------------------------

FreeFall:
		    call    SetLandingRoom

		    xor	    a
		    ld	    (PreviousRoom), a

		    ld	    a, 0FFh
		    ld	    (IdDoorEnter), a		    ; Flag falling without parachute

		    ld	    b, 0FFh			    ; All life
		    jp	    DecrementLife_B		    ; Snake is dead


;---------------------------------------------------------------------------
;
; Sets the next	room when falling with parachute
;
;---------------------------------------------------------------------------

NextParachuteRoom:
		    ld	    hl,	HeightParachuteCnt
		    dec	    (hl)			    ; Landing or falling to next floor?
		    jr	    z, SetLandingRoom

		    ld	    a, 204			    ; Bricks wall
		    ld	    (Room), a			    ; Continue falling
		    ld	    (PreviousRoom), a
		    jp	    NormalGameMode

;---------------------------------------------------------------------------
;
; Sets the landing room	after falling with or without parachute
;
;---------------------------------------------------------------------------

SetLandingRoom:
		    ld	    a, (JumpRoomId)		    ; 1	= From room 45,	2 = From room 46, others = 117
		    dec	    a
		    ld	    c, 5			    ; Room: 3 lorries yard
		    jr	    z, SetLandingRoom2

		    dec	    a
		    ld	    c, 6			    ; Room: dogs yard left
		    jr	    z, SetLandingRoom2

		    ld	    c, 10			    ; Room: dogs yard right

SetLandingRoom2:
		    ld	    a, c
		    ld	    (Room), a

		    ld	    a, 204			    ; Bricks wall
		    ld	    (PreviousRoom), a

		    xor	    a
		    ld	    (JumpRoomId), a		    ; 1	= From room 45,	2 = From room 46, others = 117

NormalGameMode_:
		    jp	    NormalGameMode

;----------------------------------------------------------------------------
;
; Locate the player in the entry point of the room
;
;----------------------------------------------------------------------------

LocatePlayerEntry:
		    ld	    a, (IdDoorEnter)
		    cp	    0FFh			    ; ID falling without parachute
		    jp	    z, SetLandingPos2		    ; Set landing position

		    cp	    91h				    ; Roof jump
		    jp	    z, SetParachuteMode

		    cp	    5Bh				    ; Door ID: Moving bridge room 1 (45)
		    jp	    z, SetParachuteMode

		    cp	    81h				    ; Door ID: Moving bridge room 1 (46)
		    jp	    z, SetParachuteMode

		    cp	    6Bh				    ; Door to ladders from Big Boss room
		    jp	    z, SetLadderRoomEntry

		    and	    a				    ; Any door?
		    jr	    nz,	SetDoorOrElev

		    ld	    a, (PreviousRoom)
		    cp	    204				    ; Brick wall (parachute)
		    jp	    z, ChkParachuteXY		    ; Set snake	coordinates depending on he is still falling or	landing

		    ld	    a, (Room)
		    cp	    240
		    ret	    nc				    ; Elevator

		    jr	    SetRoomEntryXY		    ; Locate the player	in the new room	depending on his position when exiting the previous one


SetDoorOrElev:
		    ld	    a, (Room)
		    cp	    0F0h
		    jr	    nc,	SetElevatorCtrl		    ; Entering in elevator room

		    ld	    a, (PreviousRoom)
		    cp	    0F0h
		    jr	    nc,	SetPlayerInDoor		    ; Exiting from elevator room

		    jp	    SetPlayerInDoor2		    ; From room	to room	through	a door


;----------------------------------------------------------------------------
;
; Adjust the player X or Y when	entering a room	from another room not using a door
;
;----------------------------------------------------------------------------

SetRoomEntryXY:
		    ld	    de,	EntryRoomXY
		    ld	    a, (NextRoomDirect)		    ; 4=Right, 3=Left, 2=Down, 1=Up
		    dec	    a
		    ld	    c, a
		    call    GetPointerDE2A

		    ex	    de,	hl
		    ld	    a, c
		    cp	    2
		    jr	    nc,	SetRoomEntryX

		    ld	    (PlayerYdec), hl
		    ret


SetRoomEntryX:
		    ld	    (PlayerXdec), hl
		    ret

EntryRoomXY:	    dw 0B800h
		    dw 1200h
		    dw 0F200h
		    dw 0C00h


;----------------------------------------------------------------------------
;
; Set elevator mode and	left direction
;
;----------------------------------------------------------------------------

SetElevatorCtrl:
		    ld	    a, 2
		    ld	    (PlayerControlMod),	a	    ; Elevator room mode
		    inc	    a
		    ld	    (PlayerDirection), a	    ; Left

DisableControls:
		    xor	    a
		    ld	    (DirectionMask), a		    ; Bitmask of the last pressed direction control
		    ld	    (DirectionMaskOld),	a	    ; Bitmask of the previous pressed direction	control
		    ret


;----------------------------------------------------------------------------
;
; Locate the player in the door	position
;
;----------------------------------------------------------------------------

SetPlayerInDoor:
		    call    DisableControls
		    ld	    (PlayerControlMod),	a	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk

SetPlayerInDoor2:
		    ld	    a, (IdDoorEnter)		    ; ID of the	door used to enter the room
		    ld	    hl,	DoorsList		    ; Array of doors in	the room

		    ld	    de,	10h			    ; Door structure size

SetPlayerInDoor3:
		    cp	    (hl)			    ; Is the right door?
		    jr	    z, SetPlayerInDoor4

		    add	    hl,	de
		    jr	    SetPlayerInDoor3


;----------------------------------------------------------------------------
;
; Center the player in the door
; Depends on the type of (rendering) door
;
;----------------------------------------------------------------------------

SetPlayerInDoor4:
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    ld	    a, (hl)			    ; Door render type

		    inc	    hl
		    inc	    hl
		    ex	    de,	hl			    ; DE = YX door on screen

		    ld	    hl,	PlayerInDoorDat
		    dec	    a
		    ld	    c, a
		    add	    a, a
		    add	    a, c			    ; x3
		    call    ADD_HL_A

		    ld	    a, (de)
		    add	    a, (hl)			    ; Offset Y
		    ld	    b, a
		    ld	    c, 0			    ; BC = Player Y

		    inc	    de
		    inc	    hl
		    ld	    a, (de)
		    add	    a, (hl)
		    ld	    d, a
		    ld	    e, 0			    ; DE = Player X

		    inc	    hl
		    ld	    a, (hl)			    ; Player direction

		    ld	    (PlayerYdec), bc
		    ld	    (PlayerXdec), de
		    ld	    (PlayerDirection), a	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    ret



;---------------------------------------------------------------------------
;
; Information about how	to center the player in	the doors
; Offset Y, offset X, direction
;
;---------------------------------------------------------------------------
PlayerInDoorDat:    db	28h, 0Ch,   2
		    db 0F8h, 10h,   1
		    db	30h, 10h,   4
		    db	30h,0F6h,   3
		    db	28h, 0Ch,   2
		    db	  0,   0,   0
		    db	28h, 10h,   2
		    db 0F8h, 10h,   1
		    db	30h, 18h,   4
		    db	30h, 10h,   4
		    db	30h,0F6h,   3
		    db	28h, 10h,   2
		    db 0F8h, 10h,   1
		    db	30h, 18h,   4
		    db	30h,0F8h,   3
		    db	30h,0F6h,   3
		    db	30h,0F6h,   3
		    db	30h,0F6h,   3
		    db	30h, 10h,   2


;----------------------------------------------------------------------------
; Set parachute	mode
;----------------------------------------------------------------------------

SetParachuteMode:
		    ld	    a, 3
		    ld	    (PlayerAnimation), a	    ; Parachute	animation
		    inc	    a
		    ld	    (PlayerControlMod),	a	    ; Parachute	control	mode

		    call    DisableControls

		    ld	    hl,	8000h
		    ld	    (PlayerXdec), hl		    ; Center the player	horizontally
		    jr	    SetParachuteStartY		    ; Set player Y (Parachute at the top of the	screen)

;----------------------------------------------------------------------------
;
; Checks if Snake is landing or	skydiving yet
;
;----------------------------------------------------------------------------

ChkParachuteXY:
		    ld	    a, (Room)
		    cp	    10				    ; Room: dogs yard right
		    jr	    z, SetLandingXY

		    cp	    5				    ; Room: lorries yard
		    jr	    z, SetLandingXY

		    cp	    6				    ; Room: dogs yard left
		    jr	    z, SetLandingXY

SetParachuteStartY:
		    ld	    hl,	3000h
		    ld	    (PlayerYdec), hl
		    ret

;----------------------------------------------------------------------------
;
; Set Snake landing location
;
;----------------------------------------------------------------------------

SetLandingXY:
		    call    DisableControls

		    ld	    (PlayerControlMod),	a	    ; Normal mode
		    ld	    (PlayerAnimation), a	    ; Walk animation
		    ld	    (PlayerFrameNum), a
		    ld	    (SnakeSprId), a		    ; Snake up sprite ID

		    ld	    (PlayerAnimWaitCnt), a
		    inc	    a
		    ld	    (PlayerDirection), a	    ; Up

SetLandingPos2:
		    ld	    l, 0
		    ld	    a, (Room)
		    cp	    10				    ; Room: dogs yard right
		    jr	    z, SetLandingDogsR

		    cp	    5				    ; Room: 3 lorries yard
		    jr	    z, SetLandingLorries

		    cp	    6				    ; Room: dogs yard left
		    jr	    z, SetLandingDogsL

SetLandingDogsR:
		    ld	    h, 80h
		    ld	    (PlayerYdec), hl
		    ld	    h, 0A0h
		    ld	    (PlayerXdec), hl
		    ret


SetLandingLorries:
		    ld	    h, 38h
		    ld	    (PlayerYdec), hl
		    ld	    h, 68h
		    ld	    (PlayerXdec), hl
		    ret


SetLandingDogsL:
		    ld	    h, 0A8h
		    ld	    (PlayerYdec), hl
		    ld	    h, 80h
		    ld	    (PlayerXdec), hl
		    ret

;----------------------------------------------------------------------------
;
; Locate the player in the ladders door	(ladders room or Big Boss room)
;
;----------------------------------------------------------------------------

SetLadderRoomEntry:
		    ld	    a, (Room)
		    cp	    119				    ; Entering in Big Boss room?
		    jp	    z, SetPlayerInDoor		    ; Yes, center the player in	the door

		    ld	    a, 6
		    ld	    (PlayerControlMod),	a	    ; Ladders room mode
		    rrca
		    ld	    (PlayerDirection), a	    ; Left

		    call    DisableControls

		    ld	    hl,	9E00h			    ; Floor Y
		    ld	    (PlayerYdec), hl
		    ld	    h, 0D8h
		    ld	    (PlayerXdec), hl		    ; Right of the room	(entrance)
		    ret
