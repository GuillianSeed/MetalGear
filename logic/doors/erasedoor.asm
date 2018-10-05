;----------------------------------------------------------------------------
;
; Open door animation logic
;
;----------------------------------------------------------------------------

EraseDoorLogic:
		    ld	    a, (OpenDoorStatus)
		    call    JumpIndex

		    dw InitOpenDoor
		    dw EraseDoorNorth
		    dw EraseDoorSouth
		    dw EraseDoorWest
		    dw EraseDoorEast
		    dw EraseDoorElevator
		    dw EraseDoorDummy			    ; Elevator exit. No	need to	draw anything
		    dw EraseBasemWall60
		    dw EraseBasemWall61
		    dw EraseBasemWall59
		    dw EraseBasemWall58
		    dw EraseBasemWall63
		    dw EraseDoorDummy			    ; Prison exterior door (open), isolated room north broken wall.
		    dw EraseWallPrison2
		    dw EraseBasemWall59
		    dw EraseBasemWall93
		    dw EraseWallBuil3_108
		    dw EraseBasemWall93
		    dw EraseBasemWall63
		    dw EraseBasemWall112


;----------------------------------------------------------------------------
;
; Setup	opening	door animation.
; Play open SFX
;
;----------------------------------------------------------------------------

InitOpenDoor:
		    call    SetBankInA0_F

		    call    SwapSprBuffer		    ; Swap sprites buffers

		    call    SetBanks1_2_3

		    call    GetOpeningDoorDat		    ; Get pointer to the door that is being opened
		    inc	    hl
		    inc	    hl
		    inc	    hl

		    ld	    a, (hl)			    ; Door render type (north, west, wall...)
		    ld	    c, a
		    dec	    a
		    ld	    de,	EraseDoorDat		    ; List of door counters/offsets used in the	opening	animation
		    call    ADD_DE_A

		    inc	    hl
		    ld	    a, (de)
		    ld	    (hl), a			    ; Door animation counter

		    ld	    a, c			    ; Door render type
		    ld	    (OpenDoorStatus), a		    ; The status is the	type of	door

		    ld	    hl,	DoorOpenSfxs		    ; List of SFXs for each type of door
		    dec	    a
		    cp	    6				    ; Is it a door or a	breakable wall?
		    ld	    c, 1Eh			    ; SFX break	wall
		    jr	    nc,	InitOpenDoor2

		    call    ADD_HL_A
		    ld	    c, (hl)			    ; Get door SFX

InitOpenDoor2:
		    ld	    a, c
		    jp	    SetSoundEntry		    ; Play SFX

;----------------------------------------------------------------------------
;
; Open door SFXs
;
;----------------------------------------------------------------------------
DoorOpenSfxs:	    db	19h
		    db	19h
		    db	19h
		    db	19h
		    db	1Bh
		    db	1Bh


;----------------------------------------------------------------------------
;
; Open north door animation logic
; Erases the door drawing black	lines from left	to right
;
;----------------------------------------------------------------------------

EraseDoorNorth:
		    call    GetOpeningDoorDat		    ; Get pointer to the door that is being opened
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl				    ; Pointer to door counter

		    inc	    (hl)			    ; Increment	open animation counter

		    ld	    a, (hl)
		    cp	    24				    ; Door width
		    jp	    z, SetDoorOpen		    ; The door has been	fully erased. Mark the door as open and	update collision tiles

		    ld	    c, (hl)			    ; Animation	counter

		    inc	    hl
		    ld	    e, (hl)			    ; Door Y

		    inc	    hl
		    ld	    a, (hl)			    ; Door X

		    add	    a, c			    ; Door X + animation counter
		    ld	    d, a			    ; SX of the	line that will erase the door
		    ex	    de,	hl			    ; HL = SX, SY

		    ld	    b, 20h			    ; Door height (NY)
		    ld	    c, 0			    ; Black color
		    jp	    DrawLineVert		    ; Draw a vertical line



;----------------------------------------------------------------------------
;
; Open south door animation logic
; Erases the door drawing black	lines from right to left
;
;----------------------------------------------------------------------------

EraseDoorSouth:
		    call    GetOpeningDoorDat		    ; Get pointer to the door that is being opened
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl

		    dec	    (hl)			    ; Decrement	open animation counter
		    jp	    z, SetDoorOpen		    ; The door has been	fully erased. Mark the door as open and	update collision tiles

		    ld	    a, (hl)
		    dec	    a				    ; Counter =	X offset

		    inc	    hl
		    ld	    e, (hl)			    ; Door Y

		    inc	    hl
		    add	    a, (hl)			    ; Door X + erase X offset

		    ld	    d, a			    ; D	= SX
		    ex	    de,	hl			    ; HL = SX, SY

		    ld	    b, 8			    ; Door height (NY)
		    ld	    c, 0			    ; Black color
		    jp	    DrawLineVert		    ; Draw a vertical line



;----------------------------------------------------------------------------
;
; Open west door animation logic
; Erases the door drawing black	diagonal lines from down to up (\)
;
;----------------------------------------------------------------------------

EraseDoorWest:
		    call    GetOpeningDoorDat		    ; Get pointer to the door that is being opened
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl

		    dec	    (hl)			    ; Decrement	open animation counter/offset
		    jp	    z, SetDoorOpen		    ; The door has been	fully erased. Mark the door as open and	update collision tiles

		    ld	    a, (hl)			    ; Counter =	Y offset

		    inc	    hl
		    ld	    e, (hl)			    ; Door Y

		    inc	    hl
		    ld	    d, (hl)			    ; Door X

		    add	    a, e
		    ld	    e, a			    ; E	= SY

		    ex	    de,	hl			    ; HL = SX, SY

; Loop to draw a diagonal line

		    ld	    b, 8			    ; Door width

EraseDoorWest2:
		    push    bc
		    push    hl

		    ld	    b, 1			    ; 1	pixel
		    ld	    c, 0			    ; Black color
		    call    DrawLineVert		    ; Draw a 1 pixel line

		    pop	    hl

		    inc	    l
		    inc	    l
		    inc	    l
		    inc	    l				    ; SY + 4

		    inc	    h				    ; SX + 1

		    pop	    bc

		    djnz    EraseDoorWest2
		    ret



;----------------------------------------------------------------------------
;
; Open east door animation logic
; Erases the door drawing black	diagonal lines from up to down (/)
;
;----------------------------------------------------------------------------

EraseDoorEast:
		    call    GetOpeningDoorDat		    ; Get pointer to the door that is being opened
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl

		    inc	    (hl)			    ; Increment	open animation counter

		    ld	    a, (hl)
		    cp	    35
		    jp	    z, SetDoorOpen		    ; The door has been	fully erased. Mark the door as open and	update collision tiles

		    inc	    hl
		    ld	    e, (hl)			    ; Door Y

		    inc	    hl
		    ld	    d, (hl)			    ; Door X

		    add	    a, e			    ; SY + erase Y offset
		    add	    a, 28			    ; Bottom of	the door Y offset
		    ld	    e, a			    ; SY + 28

		    ex	    de,	hl

; Loop to draw a diagonal line

		    ld	    b, 8			    ; Door width

EraseDoorEast2:
		    push    bc
		    push    hl

		    ld	    b, 1			    ; Line lenght
		    ld	    c, 0			    ; Black color
		    call    DrawLineVert		    ; Draw 1 pixel line

		    pop	    hl

		    dec	    l
		    dec	    l
		    dec	    l
		    dec	    l				    ; SY - 4

		    inc	    h				    ; SX + 1

		    pop	    bc
		    djnz    EraseDoorEast2

		    ret



;----------------------------------------------------------------------------
;
; Open elavator	door animation logic
; Erases the door from its center to both sides
;
;----------------------------------------------------------------------------

EraseDoorElevator:
		    call    GetOpeningDoorDat		    ; Get pointer to the door that is being opened
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl

		    dec	    (hl)			    ; Decrement	open animation counter
		    jp	    z, SetDoorOpen		    ; The door has been	fully erased. Mark the door as open and	update collision tiles

		    ld	    a, (hl)			    ; Opening counter

		    inc	    hl
		    ld	    e, (hl)			    ; Door Y

		    inc	    hl
		    dec	    a
		    add	    a, (hl)			    ; Door X + opening counter

		    ld	    d, a
		    ex	    de,	hl			    ; HL = SX, SY

		    ld	    b, 20h			    ; Door height (NY)
		    ld	    c, 0			    ; Black color
		    call    DrawLineVert		    ; Erase left door slide
		    ex	    de,	hl

		    ld	    a, 0Ch			    ; Door slide width
		    dec	    hl
		    dec	    hl
		    sub	    (hl)			    ; Slide width - opening counter

		    ld	    c, a

		    inc	    hl
		    inc	    hl
		    ld	    a, 0Ch
		    add	    a, (hl)			    ; Door X + slide width = center
		    add	    a, c			    ; Add right	door slide offset

		    ld	    d, a			    ; D	= SX
		    ex	    de,	hl			    ; HL = SX, SY

		    ld	    b, 20h			    ; Door height
		    ld	    c, 0			    ; Black color
		    jp	    DrawLineVert		    ; Erase right door slide



;----------------------------------------------------------------------------
;
; Doors	that do	not need opening animation (i.e.: elevator exits, isolated rooms with a	broken wall at the north)
;
;----------------------------------------------------------------------------

EraseDoorDummy:
		    ret



;----------------------------------------------------------------------------
;
; Restore broken wall backgrounds
; BC = Width and height	in tiles
;----------------------------------------------------------------------------

EraseBasemWall60:
		    ld	    bc,	406h
		    jr	    RestoreSavedTiles


EraseBasemWall61:
		    ld	    bc,	401h
		    jr	    RestoreSavedTiles


EraseBasemWall59:
		    ld	    bc,	30Dh
		    jr	    RestoreSavedTiles


EraseBasemWall58:
		    ld	    bc,	50Dh
		    jr	    RestoreSavedTiles


EraseBasemWall63:
		    ld	    bc,	50Ch
		    jr	    RestoreSavedTiles


EraseWallPrison2:
		    ld	    bc,	401h
		    jr	    RestoreSavedTiles


EraseBasemWall93:
		    ld	    bc,	20Ch
		    jr	    RestoreSavedTiles


EraseWallBuil3_108:
		    ld	    bc,	80Ah
		    jr	    RestoreSavedTiles


EraseBasemWall112:
		    ld	    bc,	605h
; Break	wall

RestoreSavedTiles:
		    call    GetOpeningDoorDat		    ; Get pointer to the broken	wall

		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl

		    push    hl

		    ld	    e, (hl)			    ; Wall Y
		    inc	    hl
		    ld	    d, (hl)			    ; DE = Wall	broken render XY
		    ld	    hl,	SavedTilesBuffer	    ; Buffer used to save the background tiles of a tileblock
		    call    DrawTileBlkTimp2		    ; Draw a block of tiles to restore the wall	background

		    pop	    hl

		    dec	    hl


;----------------------------------------------------------------------------
;
; Mark the door	as open
; Update collision map so it is	possible to walk over it
;
;----------------------------------------------------------------------------

SetDoorOpen:
		    ld	    (hl), 0			    ; Open timer

		    dec	    hl
		    ld	    c, (hl)			    ; C	= Type of door

		    dec	    hl
		    ld	    a, (hl)			    ; A	= Open logic ID

		    dec	    hl
		    ld	    (hl), 0			    ; 0	= Open

		    dec	    hl
		    and	    0C0h			    ; Open?
		    jr	    nz,	EraseDoor

		    ld	    a, (hl)			    ; Door ID
		    dec	    a
		    ld	    de,	DoorOpenArray		    ; 0=Open/1=Closed status of	all doors
		    call    ADD_DE_A			    ; Pointer to open/closed status of the door

		    xor	    a
		    ld	    (de), a			    ; Set door as open

		    ld	    a, c			    ; Door type
		    cp	    7				    ; Is it a door or a	breakable wall?
		    jr	    c, EraseDoor		    ; Door

		    jr	    z, SetDoorOpen2		    ; Wall room	60

		    cp	    0Ah
		    jr	    z, SetDoorOpen2		    ; Wall room	58

		    cp	    0Bh				    ; Wall room	63
		    jr	    nz,	EraseDoor

SetDoorOpen2:
		    ld	    (hl), 0			    ; Free door	structure

EraseDoor:
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)			    ; DE = Door	XY on screen

		    ld	    a, c			    ; Door type
		    cp	    3				    ; West door?
		    jr	    nz,	EraseDoor2

		    ld	    a, d
		    sub	    8
		    ld	    d, a			    ; Door X - 8

EraseDoor2:
		    xor	    a
		    ld	    (GameMode),	a		    ; Exit "open door mode" and return to "normal mode"

		    ld	    a, c			    ; Door type
		    cp	    7				    ; Is it a door or a	wall?
		    ret	    nc				    ; Return if	it is a	wall

		    dec	    a
		    ld	    bc,	404h			    ; Width and	height in tiles
		    jr	    z, SetOpenDoorTiles		    ; North door

		    dec	    a
		    ld	    bc,	401h			    ; Width and	height in tiles
		    jr	    z, SetOpenDoorTiles		    ; South door

		    dec	    a
		    ld	    bc,	204h			    ; Width and	height in tiles
		    jr	    z, SetOpenDoorTilesEW	    ; West door

		    dec	    a
		    jr	    z, SetOpenDoorTilesEW	    ; East door

		    ld	    bc,	404h			    ; Width and	height in tiles
		    jr	    SetOpenDoorTiles		    ; Elevator door


;----------------------------------------------------------------------------
;
; Draw transparent tiles on the	door to	change the collision map
; Update the map with that tiles
;
;----------------------------------------------------------------------------

SetOpenDoorTilesEW:
		    ld	    a, 20h
		    add	    a, e
		    ld	    e, a			    ; Door + 32

SetOpenDoorTiles:
		    ld	    hl,	DoorOpenTiles
		    jp	    DrawTileBlkTimp2


;----------------------------------------------------------------------------
;
; Get a	pointer	to the structure of the	door that is opening
;
;----------------------------------------------------------------------------

GetOpeningDoorDat:
		    ld	    a, (idxDoorOpen)		    ; Index of the door
		    ld	    hl,	DoorsList		    ; Array of doors strcutures	in the room
		    add	    a, a
		    add	    a, a
		    add	    a, a
		    jp	    ADD_HL_2A



;----------------------------------------------------------------------------
;
; Values used as counter SY/SX to erase	the doors when opening them
;
;----------------------------------------------------------------------------
EraseDoorDat:	    db -1
		    db 33
		    db 36
		    db -1
		    db 13
		    db 33
