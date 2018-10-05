;---------------------------------------------------------------------------
;
; Check	if a guard or camera sees the player
;
;---------------------------------------------------------------------------

ChkActSeePlayer:
		    ld	    a, (ix+ACTOR.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    h, (ix+ACTOR.X)
		    ld	    l, (ix+ACTOR.Y)

ChkSeePlayer:
		    ld	    (TempData),	a		    ; Look direction
		    ld	    (TempData+1), hl		    ; Actor XY (guard, cam...)

		    ld	    a, (AlertMode)
		    or	    a
		    ret	    nz				    ; In alert mode. They know where he	is

		    ld	    a, (SnakeSprId)
		    ld	    b, 37			    ; Water shadow sprite ID
		    cp	    b
		    ret	    z				    ; Guards can not see Snake in deep water

		    inc	    b				    ; Deep water animation frame 2
		    cp	    b
		    ret	    z				    ; Deep water

		    ld	    a, (PlayerAnimation)	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    cp	    7				    ; Is Snake inside the cardboard box?
		    jr	    nz,	ChkSeePlayer2

; Check	if the cardboard box is	moving

		    ld	    hl,	PlayerSpeedY
		    ld	    a, (hl)
		    inc	    hl
		    or	    (hl)			    ; Is it moving up or down?
		    jr	    nz,	ChkSeePlayer2

		    ld	    hl,	PlayerSpeedX
		    ld	    a, (hl)
		    or	    (hl)			    ; (!?)
		    inc	    hl
		    or	    (hl)
		    or	    a				    ; Is it moving left	or right?
		    ret	    z				    ; Not moving

ChkSeePlayer2:
		    ld	    a, (ix+ACTOR.TOUCH_INFO)	    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
		    bit	    7, a			    ; Is the player touching the enemy?
		    jp	    nz,	GuardSetAlarm

		    ld	    a, (TempData)		    ; Direction	of guard or camera
		    call    JumpIndex

		    dw ChkLookUp
		    dw ChkLookDown
		    dw ChkLookLeft
		    dw ChkLookRight


;----------------------------------------------------------------------------
;
; Check	if the player is above or under	the enemy
;
; Out:
;    A = Distance
;   Cy = Under
;----------------------------------------------------------------------------

ChkPosAboveUnder:
		    ld	    a, (PlayerY)
		    ld	    b, a
		    ld	    a, (TempData+1)		    ; Enemy Y
		    sub	    b
		    ret


;----------------------------------------------------------------------------
;
; Check	if the player is to the	right or to the	left of	the enemy
;
;----------------------------------------------------------------------------

ChkPosLeftRight:
		    ld	    a, (PlayerX)
		    ld	    b, a
		    ld	    a, (TempData2)		    ; Enemy X
		    sub	    b
		    ret


;----------------------------------------------------------------------------
;
; The guard/camera is looking up
;
;----------------------------------------------------------------------------

ChkLookUp:
		    call    ChkViewVertical
		    ret	    nc				    ; Not in the same Y	range

		    call    ChkPosAboveUnder
		    ret	    c				    ; The enemy	is backwards the player, so he can't see it

		    and	    0F8h
		    rra
		    rra
		    rra					    ; Distance in number of tiles
		    jr	    nz,	ChkLookUp2

		    inc	    a				    ; At least 1 tile

ChkLookUp2:
		    ld	    c, -20h			    ; Offset to	next row
		    jr	    ChkViewObstacles


;----------------------------------------------------------------------------
;
; The guard/camera is looking down
;
;----------------------------------------------------------------------------

ChkLookDown:
		    call    ChkViewVertical		    ; Check if the player is same range	Y
		    ret	    nc

		    call    ChkPosAboveUnder
		    ret	    nc				    ; The enemy	is backwards the player, so he can't see it

		    neg					    ; Convert the number to positive
		    and	    0F8h			    ; Adjust to	multiple of 8
		    rra
		    rra
		    rra					    ; Distance in number of tiles
		    jr	    nz,	ChkLookDown2

		    inc	    a				    ; At least 1 tile

ChkLookDown2:
		    ld	    b, a			    ; (!?)
		    ld	    c, 20h			    ; Offset to	next row
		    jr	    ChkViewObstacles


;----------------------------------------------------------------------------
;
; The guard/camera is looking to the left
;
;----------------------------------------------------------------------------

ChkLookLeft:
		    call    ChkViewHorizontal		    ; Check if the player is in	the same range X
		    ret	    nc

		    call    ChkPosLeftRight
		    ret	    c				    ; The enemy	is backwards the player, so he can't see it

		    and	    0F8h			    ; Adjust to	multiple of 8
		    rra
		    rra
		    rra					    ; Distance in number of tiles
		    jr	    nz,	ChkLookLeft2
		    inc	    a

ChkLookLeft2:
		    ld	    c, -1			    ; Offset to	next tile
		    jr	    ChkViewObstacles


;----------------------------------------------------------------------------
;
; The guard/camera is looking to the right
;
;----------------------------------------------------------------------------

ChkLookRight:
		    call    ChkViewHorizontal		    ; Check if the player is in	the same range X
		    ret	    nc

		    call    ChkPosLeftRight
		    ret	    nc				    ; The enemy	is backwards the player, so he can't see it

		    neg					    ; Convert the number to positive
		    and	    0F8h			    ; Adjust to	multiple of 8
		    rra
		    rra
		    rra					    ; Distance in number of tiles
		    jr	    nz,	ChkLookRight2

		    inc	    a

ChkLookRight2:
		    ld	    c, 1			    ; Offset to	next tile


;----------------------------------------------------------------------------
;
; Check	if there is an obstacle	between	the guard/camera and the player
;
; In:
;    C = Offset	to calculate next tile
;
; Out:
;   NZ = There is an obstacle
;
;----------------------------------------------------------------------------


ChkViewObstacles:
		    ld	    b, a			    ; Number of	tiles (distance)
		    ld	    hl,	(TempData+1)		    ; Enemy XY
		    call    CoordToBuffTile		    ; Get pointer to tile

ChkViewObstacles2:
		    ld	    (TempData2+1), hl		    ; Tile address in map

		    ld	    a, (CurrentTileSet)
		    or	    a				    ; Tileset 0	(Building)
		    ld	    a, (hl)
		    jr	    nz,	ChkViewObstacles3	    ; Get collision properties of the tile

		    ld	    e, 68h			    ; Handrails	tile 1
		    cp	    e
		    jr	    z, CalcNextTileAddress

		    inc	    e				    ; Handrails	tile 2
		    cp	    e
		    jr	    z, CalcNextTileAddress

		    inc	    e				    ; Handrails	tile 3
		    cp	    e
		    jr	    z, CalcNextTileAddress

		    inc	    e				    ; Handrails	tile 4
		    cp	    e
		    jr	    z, CalcNextTileAddress

		    inc	    e				    ; Handrails	tile 5
		    cp	    e
		    jr	    z, CalcNextTileAddress

		    inc	    e
		    inc	    e				    ; Handrails	tile 6
		    cp	    e
		    jr	    z, CalcNextTileAddress

		    ld	    e, 8Bh			    ; (!?)
		    cp	    e
		    jr	    z, CalcNextTileAddress

		    inc	    e
		    cp	    e
		    jr	    z, CalcNextTileAddress

		    inc	    e
		    cp	    e
		    jr	    z, CalcNextTileAddress

		    inc	    e
		    cp	    e
		    jr	    z, CalcNextTileAddress

; Check	if the tile is an obstacle

ChkViewObstacles3:
		    ld	    e, a			    ; Tile number
		    ld	    d, 0
		    ld	    hl,	CollisionTiles		    ; Collision	property of the	tiles (bit 0 = 1 collision)
		    add	    hl,	de			    ; HL = Pointer to collision	property of the	tile

		    ld	    a, (hl)
		    or	    a				    ; Is a collision tile?
		    ret	    nz				    ; There is an obstacle in the view

CalcNextTileAddress:
		    ld	    hl,	(TempData2+1)		    ; Enemy XY
		    ld	    e, c			    ; C	= offset to next tile in the map
		    rl	    c				    ; Negative value?
		    ld	    c, e			    ; Restore offset

		    ld	    d, -1
		    jr	    c, CalcNextTileAddress2
		    ld	    d, 0

CalcNextTileAddress2:
		    add	    hl,	de			    ; HL = Pointer to next tile
		    djnz    ChkViewObstacles2


; There	are no obstacles. The enemy can	see the	player

		    ld	    a, (ix+ACTOR.ID)		    ; Check if the enemy is a surveillance camera
		    cp	    ID_CAMERA
		    jr	    nz,	GuardSetAlarm		    ; It is not	a camera

		    ld	    a, 1
		    ld	    (ix+ACTOR.SEE_PLAYER_F), a	    ; This camera has seen/detected the	player
		    ld	    (AlertSignNotOnScreen), a	    ; The alert	is triggered by	a camera, so there is no exclamations sign on screen

		    ld	    a, 28h
		    ld	    (AlertRespawnTimer), a	    ; The surveillance centre alert to other guards, so	they will respawn

SetAlert:
		    call    SetAlertMode

SetAlertRoom:
		    ld	    a, (Room)
		    ld	    (RoomAlertTrigged),	a	    ; This is the room where the alert was triggered

		    ld	    a, 10h
		    ld	    (AlertIconTimer), a		    ; Set alert	sign timer
		    ret


;---------------------------------------------------------------------------
;
; A guard triggers the alarm
; Draw the alert icon next to the guard
; Depending on the room	number,	the alert level	is different and the guards are	respawned
;
;---------------------------------------------------------------------------


GuardSetAlarm:
		    ld	    a, (AlertMode)
		    or	    a
		    ret	    nz				    ; Already in alert mode

		    ld	    a, (Room)
		    ld	    b, a
		    cp	    128				    ; Only the first 128 rooms have a predefined alert level
		    ld	    a, 0			    ; The rest of the rooms have a low level alert (without guards respawning)
		    jr	    nc,	GuardSetAlarm3

		    ld	    a, b
		    srl	    a
		    srl	    a
		    srl	    a				    ; Room number / 8

		    ld	    hl,	RedAlertRooms
		    call    ADD_HL_A			    ; Pointer to alert data

		    ld	    c, (hl)			    ; C	= Alert	data

		    ld	    a, b			    ; Room number
		    and	    7
		    inc	    a				    ; A	= Bit number to	read
		    ld	    b, a
		    xor	    a

GuardSetAlarm2:
		    rl	    c				    ; Set the right bit	in the carry flag
		    djnz    GuardSetAlarm2

		    rla					    ; Carry flag -> A

GuardSetAlarm3:
		    ld	    (RedAlertFlag), a

		    ld	    a, (PlayerX)
		    ld	    b, a

		    ld	    a, (ix+ACTOR.X)
		    ld	    c, 8			    ; Offset to	draw the alert icon on the right of the	guard
		    cp	    b				    ; Is the player to the right or to the left	of the enemy?
		    jr	    c, GuardSetAlarm4

		    ld	    c, -8			    ; C	= Offset to draw the alert icon	on the left of the guard
							    ; The value	should be -24

GuardSetAlarm4:
		    add	    a, 8			    ; (!?) This	should be ADD A,C
		    and	    0F8h			    ; Adjust the X to multiple of 8
		    ld	    d, a			    ; D	= Alert	sign X

		    ld	    a, (ix+ACTOR.Y)
		    sub	    24				    ; To locate	the sign at the	enemy's head height
		    and	    0F8h			    ; Adjust to	multiple of 8
		    ld	    e, a
		    cp	    0BFh			    ; Is the alert sign	inside the screen?
		    jr	    c, GuardSetAlarm5		    ; Yes

		    ld	    e, 0			    ; No, set the alert	icon Y to 0

GuardSetAlarm5:
		    ld	    hl,	XY_AlertIcon
		    ld	    (hl), e
		    inc	    hl
		    ld	    (hl), d			    ; Save alert icon coordinates

		    ex	    de,	hl			    ; HL = SX, SY
		    call    SaveAlertIconBacknd		    ; Save alert icon background

		    ld	    a, (RedAlertFlag)
		    or	    a				    ; High alert mode?

		    ld	    hl,	80h			    ; Alert sign icon VRAM coordinates
		    ld	    b, 0			    ; No guard respawn
		    jr	    z, GuardSetAlarm6		    ; No high alert

		    ld	    h, 10h			    ; Red Alert	sign icon VRAM X coordinate
		    ld	    b, 1Eh			    ; Guards respawn timer

GuardSetAlarm6:
		    ld	    a, b
		    ld	    (AlertRespawnTimer), a	    ; Set guards respawn time

		    ld	    a, e			    ; (!?) Why checking	the Y boundaries again?	X boundaries should be checked.
		    cp	    0BFh
		    jr	    c, GuardSetAlarm7

		    ld	    e, 0
		    ld	    a, e
		    ld	    (XY_AlertIcon), a		    ; Modify alert icon	Y

GuardSetAlarm7:
		    call    Draw16x16			    ; Draw the alert icon
		    call    SetAlert			    ; Enable alet mode

		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    cp	    ID_CAMERA
		    ret	    z

		    jp	    TransformAlertGuard


;-------------------------------------------------------------------------------
;
; Read Alert rooms
; Each bit define the type of alert of a room (only the	first 128 rooms)
;
;-------------------------------------------------------------------------------
RedAlertRooms:	    db	  1, 1Ch,   3,	 0,0A3h, 10h, 58h,   0,	  4,   1, 9Fh,	 0,   0,   8,	0,   1


;----------------------------------------------------------------------------
;
; Check	if the player is in the	enemy's view range Y
;
; Out:
;   Cy = Yes
;----------------------------------------------------------------------------

ChkViewVertical:
		    ld	    hl,	810h			    ; H	= View width/2,	L = View width
		    ld	    de,	(TempData+1)		    ; Enemy XY

		    ld	    a, (PlayerX)
		    sub	    h				    ; Width / 2
		    cp	    d				    ; Enemy X
		    ret	    nc

		    add	    a, l			    ; Wiew width
		    ld	    e, a
		    ld	    a, d			    ; Enemy X
		    cp	    e
		    ret



;----------------------------------------------------------------------------
;
; Check	if the player is in the	enemy's view range X
;
; Out:
;   Cy = Yes
;----------------------------------------------------------------------------

ChkViewHorizontal:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    cp	    ID_CAMERA

		    ld	    hl,	408h			    ; Camera: H	= View width/2,	L = View width
		    jr	    z, ChkViewHorizontal2
		    ld	    hl,	60Ch			    ; H	= View width/2,	L = View width

ChkViewHorizontal2:
		    ld	    de,	(TempData+1)		    ; Enemy XY
		    ld	    a, (PlayerY)
		    sub	    h				    ; Height / 2
		    cp	    e				    ; Enemy Y
		    ret	    nc

		    add	    a, l			    ; View width
		    ld	    d, a
		    ld	    a, e			    ; Enemy Y
		    cp	    d
		    ret

;----------------------------------------------------------------------------
;
; Checks if the	player is discovered by	touching an enemy or making noise by firing a weapon
;
; Out:
;   Cy = Discovered
;
;----------------------------------------------------------------------------

ListenShotsChkTouch:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    cp	    ID_CAMERA
		    ret	    z				    ; Cameras can not be touched

		    ld	    a, (ix+ACTOR.TOUCH_INFO)	    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
		    bit	    7, a			    ; Is the player touching the enemy?
		    jr	    nz,	ChkDiscoverPlayer6

		    ld	    a, (SelectedWeapon)
		    sub	    GRENADE_LAUNCHER
		    jr	    nc,	ChkDiscoverPlayer2	    ; It is not	a handgun or SMG, so no	need to	check the supressor

		    ld	    a, (InvSupressor)
		    or	    a
		    ret	    nz				    ; Using the	supressor

ChkDiscoverPlayer2:
		    xor	    a
		    ld	    hl,	PlayerShotsList
		    ld	    de,	40h			    ; Shot structure size
		    ld	    b, 6			    ; Max. number of player shots

ChkDiscoverPlayer3:
		    cp	    (hl)
		    jr	    nz,	ChkDiscoverPlayer5	    ; There is a shot from player

ChkDiscoverPlayer4:
		    add	    hl,	de
		    djnz    ChkDiscoverPlayer3

		    or	    a
		    ret


ChkDiscoverPlayer5:
		    inc	    hl
		    ld	    a, (hl)			    ; Is the shot exploding?
		    dec	    hl
		    dec	    a
		    jr	    nz,	ChkDiscoverPlayer4

ChkDiscoverPlayer6:
		    scf					    ; Discovered!
		    ret
