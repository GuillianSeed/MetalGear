;----------------------------------------------------------------------------
;
; ROM header
;
;----------------------------------------------------------------------------


		    org	#4000

		    db	41h, 42h
		    dw Start
		    dw 0
		    dw 0
		    dw 0
		    dw 0
		    dw 0
		    dw 0

		    db	43h, 44h			    ; RC id
		    db	  7, 50h			    ; RC750
		    dw 0
		    dw 0
		    dw 0
		    dw 0
		    dw 0
		    dw 0

		    dw 0
		    dw 0
		    dw 0
		    dw 0
		    dw 0
		    dw 0
		    dw 0
		    dw 0

		    ; These pointers are not used by the game.
		    ; Since they are related to the sound driver, probably were added to be used by a future cartridge (i.e.: Game Master 2) in order to play musics and SFXs from the game

		    dw MuteSoundFlag			    ; 1	= Mute
		    dw SoundWorkArea+2
		    dw SoundWorkAreaB+2
		    dw SoundWorkAreaC+2
		    dw SoundWorkArea
		    dw SoundWorkArea+1
		    dw SoundWorkAreaB
		    dw SoundWorkAreaB+1
		    dw SoundWorkAreaC
		    dw SoundWorkAreaC+1
		    dw idxSoundData
		    dw SoundDataSaved
		    dw MusicToSet			    ; New music	to play	(fade out current one)
		    dw SoundWorkAreaSfx+2
		    dw SoundWorkAreaSfx
		    dw SoundWorkAreaSfx+1


;----------------------------------------------------------------------------
;
; Functions entry points
;
;----------------------------------------------------------------------------

ADD_HL_A_:
		    call    ADD_HL_A
		    jr	    SetBanks_1_2_X___


ADD_DE_A__:
		    call    ADD_DE_A
		    jr	    SetBanks_1_2_X___


SetSoundEntry__:
		    call    SetSoundEntryChk
		    jr	    SetBanks_1_2_X___


SetText_:
		    call    SetText
		    jr	    SetBanks_1_2_X___


ChkControlPlayer_:
		    call    ChkControlPlayer
		    jr	    SetBanks_1_2_X___


ControlPlayerV_:
		    call    ControlPlayerV
		    jr	    SetBanks_1_2_X___


ChkPlayerColl_:
		    call    ChkPlayerColl
		    jr	    SetBanks_1_2_X___


ChkExitScreen_:
		    call    ChkExitRoom
		    jr	    SetBanks_1_2_X___


SetPlayerSpr_:
		    call    AnimatePlayer
		    jr	    SetBanks_1_2_X___


DrawRadio_:
		    call    DrawRadio
		    jr	    SetBanks_1_2_X___


RadioSignalUp_:
		    call    RadioSignalUp
		    jr	    SetBanks_1_2_X___


ExitRadio_:
		    call    ExitRadio
		    jr	    SetBanks_1_2_X___


Load1bppGFX_:
		    call    Load1bppTiles
		    jr	    SetBanks_1_2_X___


Load2bppTile_:
		    call    Load2bppTile
		    jr	    SetBanks_1_2_X___


FillRect_:
		    call    FillRect
		    jr	    SetBanks_1_2_X___


ClearScreen_:
		    call    ClearScreen
		    jr	    SetBanks_1_2_X___


DisableScreenBnk:
		    call    DisableScreen

SetBanks_1_2_X___:
		    jr	    SetBanks_1_2_X____


VDP_Copy_Dot_:
		    call    VDP_Copy_Dot
		    jr	    SetBanks_1_2_X____


EnableScreenBnk:
		    call    EnableScreen
		    jr	    SetBanks_1_2_X____


PrintTextXY_:
		    call    PrintTextXY
		    jr	    SetBanks_1_2_X____


DrawTileP1_:
		    call    DrawTile_P1
		    jr	    SetBanks_1_2_X____


GetDirLeftRight_:
		    call    GetDirLeftRight
		    jr	    SetBanks_1_2_X____


GetPointerDE2A_:
		    call    GetPointerDE2A
		    jr	    SetBanks_1_2_X____


SetVRAMAddWR_:
		    call    SetVramAddressWR
		    jr	    SetBanks_1_2_X____


RAMtoVRAM__:
		    call    RAMtoVRAM
		    jr	    SetBanks_1_2_X____


SetPaletteColor_:
		    call    SetPaletteColor
		    jr	    SetBanks_1_2_X____


GetItemInvAdd_:
		    call    GetItemInvAdd
		    jr	    SetBanks_1_2_X____


IncClassLv_:
		    call    IncClassLv
		    jr	    SetBanks_1_2_X____


EraseTextXY_:
		    call    EraseTextXY
		    jr	    SetBanks_1_2_X____


InitGameArea:
		    call    InitGame4
		    jr	    SetBanks_1_2_X____


DrawChar_:
		    call    DrawChar
		    jr	    SetBanks_1_2_X____


ClearSprites_:
		    call    ClearSprAttr
		    jr	    SetBanks_1_2_X____


DrawMetalGear_:
		    call    DrawMetalGear

SetBanks_1_2_X____:
		    jr	    SetBanks_1_2_X__


ClearPage0_:
		    call    ClearPage0
		    jr	    SetBanks_1_2_X__


LoadRoomTiles_:
		    call    LoadRoomTiles
		    jr	    SetBanks_1_2_X__


ChkRoomPal_:
		    call    SetRoomPal
		    jr	    SetBanks_1_2_X__


DrawTileBlock_:
		    call    DrawTileBlkTimp
		    jr	    SetBanks_1_2_X__


EraseMetalGear_:
		    call    EraseMetalGear
		    jr	    SetBanks_1_2_X__


StoreControls__:
		    call    StoreControls_
		    jr	    SetBanks_1_2_X__


SetDefaultPal_:
		    call    SetDefaultPal
		    jr	    SetBanks_1_2_X__


SetPalette_:
		    call    SetPalette
		    jr	    SetBanks_1_2_X__


SetUpKonamiLogo_:
		    call    SetUpKonamiLogo
		    jr	    SetBanks_1_2_X__


VdpCopyByteBnks:
		    call    VDP_Copy_Byte
		    jr	    SetBanks_1_2_X__


SetTextUnskip_:
		    call    SetTextUnskippable
		    jr	    SetBanks_1_2_X__


DrawDestrucTimer_:
		    call    DrawDestrucTimer
		    jr	    SetBanks_1_2_X__


DrawLineVert_:
		    call    DrawLineVert
		    jr	    SetBanks_1_2_X__


DrawLineHoriz_:
		    call    DrawLineHoriz
		    jr	    SetBanks_1_2_X__


DismissActor2_:
		    call    DismissActor
		    jr	    SetBanks_1_2_X__


SetSound_:
		    call    SetSoundEntry

SetBanks_1_2_X__:
		    jr	    SetBanks_1_2_X_


SetRoomPal_:
		    call    SetRoomPal2
		    jr	    SetBanks_1_2_X_


TextBoxLogic_:
		    call    TextBoxLogic
		    jr	    SetBanks_1_2_X_


DrawRecv_:
		    call    PrintRecv
		    jr	    SetBanks_1_2_X_


DrawSend_:
		    call    PrintSend
		    jr	    SetBanks_1_2_X_


InitGame_:
		    call    InitGame
		    jr	    SetBanks_1_2_X_


GameLogic_:
		    call    GameLogic			    ; ;
		    jr	    SetBanks_1_2_X_


ClearPage_:
		    call    ClearPage
		    jr	    SetBanks_1_2_X_


Load3pppTile_:
		    call    Load3bppTiles
		    jr	    SetBanks_1_2_X_


SetMenuWeaponPal_:
		    call    SetMenuWeaponPal
		    jr	    SetBanks_1_2_X_


LoadGameGfx_:
		    call    LoadGameGfx
		    jr	    SetBanks_1_2_X_


CopyPalToRAM_:
		    call    CopyPalToRAM
		    jr	    SetBanks_1_2_X_


FadeOutLogic_:
		    call    FadeOutLogic
		    jr	    SetBanks_1_2_X_


DrawRadioFreq_:
		    call    DrawRadioFreq
		    jr	    SetBanks_1_2_X_


SetSnakeSprAttr_:
		    call    SetSnakeSprAtt
		    jr	    SetBanks_1_2_X_


SetSnakeSprPatt_:
		    call    SetSnakeSprPatt
		    jr	    SetBanks_1_2_X_


EraseSprAttRAM_:
		    call    EraseSprAttRAM

SetBanks_1_2_X_:
		    jr	    SetBanks_1_2_X


ClearGameVars_:
		    call    ClearGameVars

;----------------------------------------------------------------------------
;
; Set banks 1, 2, (3)
;
; #6000-#7FFF: Bank 1
; #8000-#9FFF: Bank 2
; #A000-#BFFF: Bank 3 or (BankInA0Fixed)
;
; Bank 3 will be set to	the value (BankInA0Fixed) when it is not 0
;----------------------------------------------------------------------------

SetBanks_1_2_X:
		    call    SetBanks1_2_3

		    push    af
		    ld	    a, (BankInA0Fixed)
		    and	    a
		    jr	    z, SetBanks_1_2_X2

		    di
		    ld	    (0A000h), a
		    ld	    (BankInA0),	a
		    ei

SetBanks_1_2_X2:
		    pop	    af
		    ret




;----------------------------------------------------------------------------
;
; Interrupt handler
;
; Update the sound
; Execute a game iteration if the previous one has finished
;
;----------------------------------------------------------------------------

InterruptTick:
		    di
		    call    RDVDP			    ; Read VDP status register to clear	interrupt flag

		    ld	    a, 4
		    ld	    (6000h), a			    ; Mapper register: bank at #6000-#7FFF
		    inc	    a
		    ld	    (8000h), a			    ; Mapper register: bank at #8000-#9FFF

		    call    UpdateSound			    ; Update sound: music and sfx

		    ld	    a, (BankIn60)
		    ld	    (6000h), a
		    ld	    a, (BankIn80)
		    ld	    (8000h), a			    ; Restore previous banks in	#4000-#9FFF

		    ld	    hl,	TickInProgress
		    bit	    0, (hl)
		    jp	    nz,	InterruptTick2		    ; There was	an game	iteration in progess. Skip this	iteration

		    inc	    (hl)			    ; Set "iteration in progress" flag

		    ei					    ; Enable interrupts
		    call    GameStatusLogic		    ; Main logic

		    xor	    a
		    ld	    (TickInProgress), a		    ; Erase "iteration in progress flag"

InterruptTick2:
		    call    RDVDP			    ; Read VDP status register to clear	interrupt flag
		    ei
		    ret


;----------------------------------------------------------------------------
;
; HL = HL + (A - 1) * 2
;
;----------------------------------------------------------------------------

ADD_HL_2A_DEC:
		    dec	    a

;----------------------------------------------------------------------------
;
; HL = HL + (A * 2)
;
;----------------------------------------------------------------------------

ADD_HL_2A:
		    add	    a, a

;----------------------------------------------------------------------------
;
; ADD HL,A
; HL = HL + A
;
;----------------------------------------------------------------------------

ADD_HL_A:
		    add	    a, l
		    ld	    l, a
		    ret	    nc

		    inc	    h
		    ret


;----------------------------------------------------------------------------
;
; DE = DE + A
;
;----------------------------------------------------------------------------

ADD_DE_A:
		    add	    a, e
		    ld	    e, a
		    ret	    nc

		    inc	    d
		    ret


;----------------------------------------------------------------------------
;
; Jump index
;
; In:
;	A = Pointer index
;    (SP) = Pointer to jump addresses list
;
;----------------------------------------------------------------------------

JumpIndex:
		    pop	    hl				    ; Pointer to list

		    call    ADD_HL_2A
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)			    ; DE = Address to jump
		    ex	    de,	hl
		    jp	    (hl)


;----------------------------------------------------------------------------
;
;
; ROM entry point
;
;
;----------------------------------------------------------------------------

Start:
		    di
		    ld	    sp,	Stack

		    call    RSLREG			    ; Read primary slot	register
		    rrca
		    rrca
		    and	    3				    ; Main slot	of the cartridge
		    ld	    c, a
		    ld	    b, 0
		    ld	    hl,	EXPTBL			    ; Expanded slot table
		    add	    hl,	bc
		    ld	    a, (hl)
		    and	    80h				    ; Expanded flag
		    or	    c
		    ld	    c, a
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    ld	    a, (hl)
		    and	    1100b			    ; Subslot in page 1	#4000-#7FFF
		    or	    c
		    ld	    h, 80h
		    call    ENASLT			    ; Set cartridge slot in page 2 (#8000-#BFFF)

		    ld	    hl,	GameStatus
		    ld	    de,	GameSubstatus
		    ld	    bc,	30EFh
		    ld	    (hl), l
		    ldir				    ; Clear RAM	area used as variables

		    call    SetBanks1_2_3
		    call    RegionLock			    ; In the japanese version, this is the region lock check

		    xor	    a
		    ld	    hl,	BankIn60Fixed
		    ld	    (hl), a
		    inc	    hl
		    ld	    (hl), a
		    inc	    hl
		    ld	    (hl), a

		    call    InitHardware		    ; Initialize PSG, VDP, VRAM

		    di
		    ld	    a, 0C3h			    ; Z80 opcode: JP
		    ld	    (HTIMI), a
		    ld	    hl,	InterruptTick
		    ld	    (HTIMI+1), hl		    ; Set interrupt hook

		    xor	    a
		    ld	    (CLIKSW), a			    ; Disable key click	sound
		    ei

DummyLoop:
		    jr	    $				    ; All the logic is handled in the interrupt	routine


;----------------------------------------------------------------------------
;
; Set banks 1, 2, 3
;
; #6000-#7FFF: Bank 1
; #8000-#9FFF: Bank 2
; #A000-#BFFF: Bank 3
;
;----------------------------------------------------------------------------

SetBanks1_2_3:
		    di
		    push    af
		    ld	    a, 1
		    jr	    SetBanks

;----------------------------------------------------------------------------
;
; Set banks 4,5,6
;
; #6000-#7FFF: Bank 4
; #8000-#9FFF: Bank 5
; #A000-#BFFF: Bank 6
;
;----------------------------------------------------------------------------

SetBanks_4_5_6:
		    di
		    push    af
		    ld	    a, 4
;----------------------------------------------------------------------------
;
; Set banks
;
; In:
;    A = Bank number
;
; #6000-#7FFF: Bank number
; #8000-#9FFF: Bank number + 1
; #A000-#BFFF: Bank number + 2
;
;----------------------------------------------------------------------------

SetBanks:
		    push    hl
		    ld	    hl,	BankIn60
		    ld	    (6000h), a
		    ld	    (hl), a
		    inc	    a
		    inc	    hl
		    ld	    (8000h), a
		    ld	    (hl), a
		    inc	    a
		    inc	    hl
		    ld	    (0A000h), a
		    ld	    (hl), a
		    pop	    hl
		    pop	    af
		    ei
		    ret


;----------------------------------------------------------------------------
;
; Set banks 7,8,9
;
; #6000-#7FFF: Bank 7
; #8000-#9FFF: Bank 8
; #A000-#BFFF: Bank 9
;
;----------------------------------------------------------------------------

SetBanks_7_8_9:
		    di
		    push    af
		    ld	    a, 7
		    jr	    SetBanks


;----------------------------------------------------------------------------
;
; Set banks A,B,C
;
; #6000-#7FFF: Bank #A
; #8000-#9FFF: Bank #B
; #A000-#BFFF: Bank #C
;
;----------------------------------------------------------------------------

SetBanks_A_B_C:
		    di
		    push    af
		    ld	    a, 0Ah
		    jr	    SetBanks

;----------------------------------------------------------------------------
;
; Set banks D,E,F
;
; #6000-#7FFF: Bank #D
; #8000-#9FFF: Bank #E
; #A000-#BFFF: Bank #F
;
;----------------------------------------------------------------------------

SetBanks_D_E_F:
		    di
		    push    af
		    ld	    a, 0Dh
		    jr	    SetBanks



;----------------------------------------------------------------------------
;
; Set sound entry
;
; If sound is enabled, select sound driver banks and play a sound/music
;
; In:
;    A = Sound ID
;
;----------------------------------------------------------------------------

SetSoundEntryChk:
		    push    hl
		    ld	    hl,	ControlConfig		    ; Bit6: 1=Enable music/Player control
		    bit	    6, (hl)
		    pop	    hl
		    ret	    z				    ; Sound disabled

SetSoundEntry:
		    di
		    push    hl
		    push    de
		    push    bc				    ; Save BC, DE, HL

		    ld	    hl,	(BankIn60)
		    push    hl				    ; Save current banks at #6000-#7FFF	and #8000-#9FFF

		    push    af
		    ld	    a, 4
		    ld	    (6000h), a
		    ld	    (BankIn60),	a
		    inc	    a
		    ld	    (BankIn80),	a
		    ld	    (8000h), a			    ; Set sound	driver banks
		    pop	    af

		    call    SetSound

		    pop	    hl
		    ld	    (BankIn60),	hl
		    ld	    a, l
		    ld	    (6000h), a
		    ld	    a, h
		    ld	    (8000h), a			    ; Restore previous banks at	#6000-#7FFF and	#8000-#9FFF

		    pop	    bc
		    pop	    de
		    pop	    hl				    ; Restore BC, DE, HL
		    ei
		    ret


;----------------------------------------------------------------------------
;
; Get a	pointer	from an	array of pointers depending on the room	number
;
; In:
;    DE	= Array	of pointers
;
; Out:
;    DE	= Pointer
;
;----------------------------------------------------------------------------

GetRoomPointer:
		    ld	    a, (Room)

GetPointerDE2A:
		    ld	    l, a
		    ld	    h, 0
		    add	    hl,	hl
		    add	    hl,	de
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)
		    ret


;----------------------------------------------------------------------------
;
; HL = (A-1) * 4
;
;----------------------------------------------------------------------------

DEC_A_HL_4xA:
		    dec	    a

HL_4xA:
		    ld	    l, a
		    ld	    h, 0
		    add	    hl,	hl
		    add	    hl,	hl
		    ret


;----------------------------------------------------------------------------
;
; Set the 8 colors numbers used	by tilesets
; These	colors are used	when decoding 3	or 2 bits per pixel graphics
;
;----------------------------------------------------------------------------

SetTilesetColors:
		    ld	    hl,	ColorsTileset

SetColorsIndexes:
		    ld	    c, 8

SetColorsIndexes2:
		    ld	    de,	BufferColor		    ; Buffer used to store the colors' indexes for decoding 2/3bpp graphics
		    ld	    b, 0
		    ldir
		    ret


;----------------------------------------------------------------------------
;
; Get a	nibble from HL array depending on the room number
;
; in:
;    HL	= Pointer to array of nibbles
;----------------------------------------------------------------------------

GetNibbleRoom:
		    ld	    a, (Room)

;----------------------------------------------------------------------------
;
; Get a	nibble from HL array
;
; in:
;     A	= Position
;    HL	= Pointer to array of nibbles
;----------------------------------------------------------------------------

GetNibbleHL_A2:
		    ld	    c, a
		    srl	    a
		    call    ADD_HL_A
		    bit	    0, c
		    ld	    a, (hl)
		    jr	    nz,	GetNibbleHL_A3

		    rra
		    rra
		    rra
		    rra

GetNibbleHL_A3:
		    and	    0Fh
		    ret


;----------------------------------------------------------------------------
;
; Get next room	number using room's connections
;
; In:
;    (Room) = current room
; (NextRoomDirect) = Exit direction
;
; Out:
;    A = Room number (#FF = undefined)
;----------------------------------------------------------------------------

GetNextRoomNum:
		    call    SetBanks_4_5_6

		    ld	    c, 0FFh
		    ld	    a, (Room)
		    cp	    126				    ; First lorry room
		    jr	    c, GetNextRoomNum3		    ; Rooms 0-125 have 1:1 exit	table index relation

		    cp	    208
		    jr	    c, GetNextRoomNum4		    ; Rooms 126-207 (loories and isolated rooms) are not connected to other rooms (only	using a	door)

		    cp	    228
		    jr	    c, GetNextRoomNum2		    ; Rooms 208-227 use	exit table (126-145)
							    ; Probably room 227	was another ladder. Room connections seem right
							    ; Rooms 227-239 are	undefined

		    cp	    241				    ; Elevators	rooms 241-250
							    ; Room 240 (first elevator)	does not use room connections
		    jr	    c, GetNextRoomNum4

		    sub	    13

GetNextRoomNum2:
		    sub	    82

GetNextRoomNum3:
		    ld	    de,	RoomConnections
		    call    HL_4xA
		    add	    hl,	de
		    ld	    a, (NextRoomDirect)		    ; 4=Right, 3=Left, 2=Down, 1=Up
		    dec	    a
		    call    ADD_HL_A
		    ld	    c, (hl)

GetNextRoomNum4:
		    ld	    a, c
		    jp	    SetBanks1_2_3



;----------------------------------------------------------------------------
;
; Get elevator and player Y coordinate to match	the floor used to enter	the elevator
;
; Out:
;    C = Player	Y
;    B = Elevator Y
;----------------------------------------------------------------------------

GetElevatorPosY:
		    call    GetElevatorRoomDat		    ; Get elevator data	and set	movement limits

		    call    SetBanks_4_5_6

		    inc	    hl
		    ld	    a, (PreviousRoom)		    ; Get the room used	to enter the elevator

GetElevatorPos2:
		    cp	    (hl)			    ; search the same room in the elevator data
		    jr	    z, GetElevPlayerY

		    inc	    hl
		    inc	    hl
		    inc	    hl
		    jr	    GetElevatorPos2


; Sets the player and elevator Y coordinates to	match the floor	used to	enter

GetElevPlayerY:
		    inc	    hl
		    ld	    c, (hl)			    ; Player Y
		    inc	    hl
		    ld	    b, (hl)			    ; Elevator Y
		    jr	    SetBanks_1_2_3_

;----------------------------------------------------------------------------
;
; Get elevator data and	set movement limits
;
; In:
;    (Room) = Elevator room
; Out:
;    HL	= Elevator data	+ 1
;
; +0 = Elevator	Limit up, limit	down
; +2 = previous	room (room used	to enter the elevator)
; +3 = Y player, Y elevator
; (repeat +2, +3) depending on the number of exits
;----------------------------------------------------------------------------

GetElevatorRoomDat:
		    call    SetBanks_4_5_6

		    ld	    a, (Room)
		    sub	    0F0h			    ; First elevator room
		    ld	    de,	idxElevatorRoom
		    call    GetPointerDE2A

		    ex	    de,	hl
		    ld	    a, (hl)
		    ld	    (ElevatorLimitUp), a	    ; Set elevator top limit

		    inc	    hl
		    ld	    a, (hl)
		    ld	    (ElevatorLimitDown), a	    ; Set elevator bottom limit

		    jr	    SetBanks_1_2_3_


;----------------------------------------------------------------------------
;
; Initializes the default statuses of the doors: open or locked
;
;----------------------------------------------------------------------------

SetDefaultDoorLock:
		    call    SetBanks_D_E_F


		    ld	    de,	IdDoorsLogic		    ; Array that defines the open logic	of each	door and its default status (open/closed)
		    ld	    hl,	DoorOpenArray		    ; 0=Open/1=Closed status of	all doors
		    ld	    b, 160			    ; (!?) 156 datas

SetDefaultDoorLock2:
		    ld	    a, (de)
		    and	    0C0h			    ; Mask bits	7-6
		    sub	    80h				    ; Bits 7-6 = #80 = open
		    jr	    z, SetDefaultDoorLock3

		    ld	    a, 1			    ; Closed

SetDefaultDoorLock3:
		    ld	    (hl), a
		    inc	    de
		    inc	    hl
		    djnz    SetDefaultDoorLock2

		    jr	    SetBanks_1_2_3_


;----------------------------------------------------------------------------
;
; Check	whether	a room is isolated or not
;
; In isolated rooms binoculars can not be used,	and shooting does not trigger the alarm
;
;----------------------------------------------------------------------------

ChkIsolatedRoom:
		    call    SetBanks_A_B_C

		    ld	    a, (Room)
		    ld	    hl,	RoomsMusic
		    call    ADD_HL_A

		    ld	    a, (hl)
		    and	    7
		    ld	    (IsolatedRoom), a		    ; Can't use binoculars. Shooting does not trigger the alarm

		    jr	    SetBanks_1_2_3_


;----------------------------------------------------------------------------
;
; Set radio coverage area
;
; The game map is divided in several radio coverage areas
;
;----------------------------------------------------------------------------

SetRadioArea:
		    call    SetBanks_A_B_C

		    ld	    hl,	idxMapZones
		    call    GetNibbleRoom

		    ld	    (MapZone), a		    ; Values of	5 or more need the antenna

		    jr	    SetBanks_1_2_3_

;----------------------------------------------------------------------------
;
; Get a	pointer	to damages values caused by the	weapon to each type of enemy
;
; In:
;    A = Weapon
; Out:
;    A = Maximum number	of active bullets
; (TempPointer)	= Pointer to damage data
;----------------------------------------------------------------------------

GetWeaponDamages:
		    call    SetBanks_4_5_6

		    dec	    a
		    ld	    de,	idxWeaponPow
		    call    GetPointerDE2A

		    ld	    (TempData),	de
		    dec	    de				    ; Pointer to maximum number	of simultaneous	'bullets'

GET_DE_A:
		    ld	    a, (de)
		    jr	    SetBanks_1_2_3_


;----------------------------------------------------------------------------
;
; Get (TempPointer)+A
;
;----------------------------------------------------------------------------

GetTempPHL_A:
		    call    SetBanks_4_5_6
		    ld	    hl,	(TempData)


;----------------------------------------------------------------------------
;
; Get (HL + A)
;
;----------------------------------------------------------------------------

Get_HL_A:
		    call    ADD_HL_A
		    ld	    a, (hl)

SetBanks_1_2_3_:
		    jp	    SetBanks1_2_3



;----------------------------------------------------------------------------
;
; Get (HL + A -	1)
;
;----------------------------------------------------------------------------

GET_HL_A_DEC:
		    call    SetBanks_4_5_6
		    dec	    a
		    jr	    Get_HL_A



;----------------------------------------------------------------------------
;
; Get the units/amount added when picking an item
; In the case of the cards, the	amount is the card identificacion number
;
; In:
;    A = Item ID
; Out:
;    A = Amount
;----------------------------------------------------------------------------

GetItemAmount:
		    call    SetBanks_4_5_6

		    ld	    de,	ItemTakeAmount
		    call    ADD_DE_A
		    jr	    GET_DE_A


;----------------------------------------------------------------------------
;
; Get information about	an actor's shape/size
;
; In:
;    A = Shape ID
; Out:
;   HL = Pointer to data (Offset Y, distance Y,	offset X, distance X)
;----------------------------------------------------------------------------

GetShapeInfo:
		    call    SetBanks_4_5_6

		    call    DEC_A_HL_4xA

		    ld	    de,	ImpactAreasInfo
		    add	    hl,	de
		    ld	    de,	TempImpactInfo		    ; Buffer used to store the shape/size of an	actor
		    push    de
		    ld	    bc,	4
		    ldir
		    pop	    hl

		    jr	    SetBanks_1_2_3_


;----------------------------------------------------------------------------
;
; Get cursor coorinates	for selected weapon
;
;----------------------------------------------------------------------------

CalcCursorXYWeapon:
		    ld	    de,	WeaponArrowXY
		    jr	    CalcCursorXY


;----------------------------------------------------------------------------
;
; Get cursor coordinates for selected item
;
;----------------------------------------------------------------------------

CalcCursorXYEquip:
		    ld	    de,	ItemEquipXY

CalcCursorXY:
		    call    SetBanks_4_5_6

		    ld	    a, (SelectIdx)
		    call    GetPointerDE2A
		    ld	    (MenuCursorXY), de		    ; Coordinates

		    jr	    SetBanks_1_2_3_


;----------------------------------------------------------------------------
;
; Get a	pointer	to item	data in	inventory
;
; In:
;  A = Item ID
;
; Out:
;  HL =	Inventory address (+0 Item ID, +1 tens/units, +2 hundreds, +3 unused)
;  Cy =	Item not in inventory
;
;----------------------------------------------------------------------------


GetItemInvAdd:
		    ld	    hl,	Equipment		    ; +0 Item ID, +1 tens/units, +2 hundreds, +3 unused
		    ld	    b, 25			    ; Max. number of items
		    jr	    GetInventoryAdd


;----------------------------------------------------------------------------
;
; Get a	pointer	to weapon data in inventory
;
; In:
;  A = Weapon ID
;
; Out:
;  HL =	Inventory address (+0 Item ID, +1 tens/units, +2 hundreds, +3 unused)
;  Cy =	Weapon not in inventory
;
;----------------------------------------------------------------------------


GetWeaponInvAdd:
		    ld	    hl,	Weapons
		    ld	    b, 7			    ; Max. number of weapons

GetInventoryAdd:
		    ld	    c, 0
		    ld	    de,	4

GetInventoryAdd2:
		    cp	    (hl)
		    ret	    z

		    add	    hl,	de
		    inc	    c
		    djnz    GetInventoryAdd2

		    scf
		    ret


;----------------------------------------------------------------------------
;
; Update doors information in current room
;
;----------------------------------------------------------------------------

AddDoorsData:
		    ld	    ix,	DoorsInRoom		    ; Number of	doors in the room
		    ld	    (ix+0), 0			    ; No doors by default

		    ld	    a, (Room)
		    cp	    225				    ; Second ladders room
		    jr	    c, AddDoorsData2

		    cp	    240				    ; Elevators
		    ret	    c				    ; There are	no doors in rooms 225-239

		    sub	    15				    ; Skip rooms 225-239

AddDoorsData2:
		    call    SetBanks_D_E_F

		    ld	    de,	idxDoors
		    call    GetPointerDE2A		    ; DE = Pointer to doors data in current room

		    ld	    hl,	DoorsList		    ; 0=ID, 1=Open, 2=LogicOpen, 3=Type, 4=Cnt,	5=DrawY, 6=DrawX, 7=OpenOffY, 8=OpenNY,	9=OpenOffX, 10=OpenNX, 11=EnterOffY, 12=EnterNY, 13=EnterOffsetX, 14=EnterNY, 15=Destination room

AddDoorsData3:
		    ld	    a, (de)
		    inc	    a				    ; #FF = End	data
		    jp	    z, SetBanks1_2_3		    ; No more doors in this room

		    inc	    (ix+0)			    ; Increment	number of doors	in the room

		    ld	    a, (de)
		    ld	    (hl), a			    ; +0 ID

		    ld	    c, a			    ; C	= ID

		    inc	    hl				    ; HL+1
		    inc	    de				    ; DE+1



		    push    de

		    dec	    a
		    ld	    de,	DoorOpenArray		    ; 0=Open/1=Closed status of	all doors
		    call    ADD_DE_A

		    ld	    a, (de)			    ; Door open/close status
		    ld	    (hl), a			    ; +1: Open/Closed

		    inc	    hl				    ; HL+2

		    ld	    a, c			    ; C	= Door ID
		    dec	    a
		    ld	    de,	IdDoorsLogic
		    call    ADD_DE_A

		    ld	    a, (de)
		    ld	    (hl), a			    ; +2 Open logic type (Card,	punch, plastic bomb...)

		    inc	    hl				    ; HL+3

		    pop	    de



		    ld	    a, (de)			    ; DE+1
		    ld	    (hl), a			    ; +3 (ID) Render type (door, wall...)

		    ld	    c, a
		    sub	    6				    ; Dummy door (does not draw	anything)
		    jr	    nz,	AddDoorsData4

		    dec	    hl
		    dec	    hl
		    ld	    (hl), a			    ; +1 Door open

		    inc	    hl
		    inc	    hl

AddDoorsData4:
		    inc	    hl
		    inc	    de
		    ld	    (hl), 0			    ; +4 Open counter

		    inc	    hl				    ; HL+5
		    ld	    a, (de)
		    ld	    (hl), a			    ; +5 = drawY (DE +2)

		    inc	    hl				    ; HL+6
		    inc	    de				    ; DE+3
		    ld	    a, (de)
		    ld	    (hl), a			    ; +6 = drawX (DE+3)

		    inc	    hl				    ; HL+7
		    push    hl
		    ld	    a, c			    ; Door render type
		    call    DEC_A_HL_4xA

		    add	    hl,	hl			    ; x8
		    push    de
		    ld	    de,	DoorOpenEnterDat
		    add	    hl,	de
		    pop	    de

		    push    hl
		    pop	    iy

		    pop	    hl				    ; HL+7

		    dec	    de				    ; DE+2
		    ld	    a, (de)			    ; draw Y
		    ld	    c, a
		    add	    a, (iy+0)			    ; Open offset Y
		    ld	    (hl), a			    ; +7 Open trigger Y

		    inc	    hl
		    ld	    a, (iy+1)			    ; Open NY
		    ld	    (hl), a			    ; +8 Open NY

		    inc	    de				    ; DE+3
		    inc	    hl				    ; HL+8
		    ld	    a, (de)			    ; drawX
		    ld	    b, a
		    add	    a, (iy+2)			    ; Open offset X
		    ld	    (hl), a			    ; +9 Open trigger X

		    inc	    hl
		    ld	    a, (iy+3)			    ; Open NX
		    ld	    (hl), a			    ; +10 Open NX

		    inc	    de				    ; DE+4
		    inc	    hl
		    ld	    a, c			    ; DrawY
		    add	    a, (iy+4)			    ; Enter offset Y
		    ld	    (hl), a			    ; +11 Enter	area Y

		    inc	    hl
		    ld	    a, (iy+5)			    ; Enter NY
		    ld	    (hl), a			    ; +12 Enter	NY

		    inc	    hl
		    ld	    a, b
		    add	    a, (iy+6)			    ; Enter offset X
		    ld	    (hl), a			    ; +13 Enter	trigger	X

		    inc	    hl
		    ld	    a, (iy+7)			    ; Enter NX
		    ld	    (hl), a			    ; +14 Enter	trigger	NX

		    inc	    hl
		    ld	    a, (de)
		    ld	    (hl), a			    ; +15 = DE+4 = Destination room

		    inc	    hl
		    inc	    de
		    jp	    AddDoorsData3



;---------------------------------------------------------------------------
;
; Draw a block of tiles
;
; In:
;    HL	= Pointer to tiles data	(NY, NX, tiles...)
; (TilesetBank)	= TilesetBank 0:Main
;
;---------------------------------------------------------------------------

DrawTilesBlock:
		    call    SetBanks_D_E_F
		    ld	    c, (hl)			    ; NY
		    inc	    hl
		    ld	    b, (hl)			    ; NX
		    inc	    hl
		    jr	    DrawTileBlkTimp3




;---------------------------------------------------------------------------
;
; Draw Metal Gear in the room
;
;---------------------------------------------------------------------------

DrawMetalGear:
		    ld	    hl,	MetalGearTileMap
		    jr	    DrawTileBlkTimp



;---------------------------------------------------------------------------
;
; Restore Metal	Gear background
;
;---------------------------------------------------------------------------

EraseMetalGear:
		    ld	    hl,	MetalGearTileMap2


;---------------------------------------------------------------------------
;
; Draw a block of tiles	and update the map
; Main tilseset	bank is	used (0-255)
;
; In:
;   DE = X,Y
;   HL = Pointer to block of tiles
;---------------------------------------------------------------------------

DrawTileBlkTimp:
		    call    SetBanks_D_E_F
		    ld	    c, (hl)			    ; Num. tiles Y
		    inc	    hl
		    ld	    b, (hl)			    ; Num. tiles X
		    inc	    hl

DrawTileBlkTimp2:
		    xor	    a
		    ld	    (TilesetBank), a		    ; 0=First bank of 256 tiles, 1=Second bank

DrawTileBlkTimp3:
		    call    SetBanks_D_E_F

		    push    de				    ; X,Y
		    exx
		    pop	    hl
		    call    CoordToBuffTile		    ; HL = Pointer to tile position in tile buffer
		    exx

DrawTileBlkTimp4:
		    push    bc
		    push    de
		    exx
		    push    hl
		    exx

DrawTileBlkTimp5:
		    ld	    a, (hl)
		    exx
		    ld	    (hl), a
		    inc	    hl
		    exx
		    inc	    hl
		    call    DrawTileTIMP
		    ld	    a, d
		    add	    a, 8
		    ld	    d, a
		    djnz    DrawTileBlkTimp5

		    exx
		    pop	    hl
		    ld	    a, 20h			    ; Next tiles row
		    call    ADD_HL_A
		    exx
		    pop	    de
		    ld	    a, e
		    add	    a, 8
		    ld	    e, a
		    pop	    bc
		    dec	    c
		    jr	    nz,	DrawTileBlkTimp4

		    jp	    SetBanks1_2_3


;----------------------------------------------------------------------------
;
; Set area music and check for incoming	calls
;
; Triggers the alert if	the bug	is in the equipment. Except:
; - in Building	1 basement
; - in building	3
; - in a secure	room
; - in an elevator room
; - in the desert
;----------------------------------------------------------------------------

SetAreaMusic:
		    xor	    a
		    ld	    (AlertMode), a		    ; Stop alert mode

SetAreaMusic2:
		    ld	    a, (GameMode)		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late
		    cp	    GAME_MODE_BINOCULARS
		    ret	    z				    ; Binoculars mode. Do not change music or check for	incoming calls

;
; Checks if the	bug/transmissor	triggers the alert
;
		    ld	    c, 0			    ; Alert mode off

		    ld	    a, (MapZone)		    ; Values of	5 or more need the antenna
		    cp	    4				    ; Building 1 basement?
		    jr	    z, SetAreaMusic5

		    cp	    8
		    jr	    nc,	SetAreaMusic5		    ; Desert to	building 3 and building	3

; The alert is not triggered in	some rooms (e.g.: moving lorries, courtyard...)

		    ld	    a, (Room)
		    ld	    hl,	RoomsNoAlert
		    ld	    b, 11h

SetAreaMusic3:
		    cp	    (hl)
		    jr	    z, SetAreaMusic5
		    inc	    hl
		    djnz    SetAreaMusic3

		    cp	    64				    ; Desert to	second building	1st screen
		    jr	    c, SetAreaMusic4		    ; Check the	bug if the player is anywhere in Building 1

		    cp	    69				    ; Desert to	second building	last screen
		    jr	    c, SetAreaMusic5		    ; Do not check the bug in desert to	building 2

		    cp	    0F0h			    ; Elevators	rooms
		    jr	    nc,	SetAreaMusic5

SetAreaMusic4:
		    ld	    a, (TransmiTaken)
		    and	    a				    ; Has the transmissor?
		    jr	    z, SetAreaMusic6

		    inc	    c				    ; Set alert	mode

SetAreaMusic5:
		    ld	    a, c
		    ld	    (AlertMode), a
		    ld	    a, 1Eh
		    ld	    (AlertRespawnTimer), a


;
; Checks the music for this area
;

SetAreaMusic6:
		    ld	    a, (SoundWorkAreaSfx+2)
		    cp	    22h				    ; Sfx incoming call
		    ld	    a, 28h			    ; Stop sfx
		    call    z, SetSoundEntryChk		    ; Stop incoming call sfx

		    call    SetBanks_A_B_C

		    ld	    a, (Room)
		    ld	    hl,	RoomsMusic
		    call    ADD_HL_A			    ; A	= Default music	for this area

		    ld	    a, (DestructionTimerOn)
		    and	    a
		    ld	    c, 3Bh			    ; Music: Escape beyond Big Boss
		    jr	    nz,	SetAreaMusic8

		    ld	    a, (AlertMode)
		    and	    a
		    jr	    z, SetAreaMusic7

		    ld	    a, (AreaMusic)
		    cp	    2Fh				    ; Music: (Alarm) Red alert
		    jr	    z, ChkRadioCalls

		    cp	    32h				    ; Music: (Sfx surprise) Red	alert
		    jr	    z, ChkRadioCalls

SetAreaMusic7:
		    ld	    b, 10h
		    ld	    a, (hl)
		    and	    0F0h
		    ld	    c, 2Ch			    ; Music: Theme of Tara
		    jr	    z, SetAreaMusic8

		    sub	    b
		    ld	    c, 35h			    ; Music: Sneaking mission (basement)
		    jr	    z, SetAreaMusic8

		    sub	    b
		    ld	    c, 38h			    ; Music: TX	55 Metal Gear
		    jr	    z, SetAreaMusic8

		    sub	    b
		    ld	    c, 3Bh			    ; Music: Escape beyond Big Boss
		    jr	    z, SetAreaMusic8

		    ld	    c, 32h			    ; Music: (Sfx surprise) Red	alert

SetAreaMusic8:
		    ld	    a, (AlertMode)
		    and	    a				    ; Is the alert active?
		    ld	    a, 32h			    ; Music: (Sfx surprise) Red	alert
		    jr	    nz,	SetAreaMusic9

		    ld	    a, (AreaMusic)		    ; Current area music
		    cp	    c				    ; New area music
		    jr	    z, ChkRadioCalls		    ; Are the same

		    ld	    a, c

SetAreaMusic9:
		    ld	    c, a

		    ld	    a, (DestructionTimerOn)
		    and	    a				    ; Is the destruction countdown running?
		    jr	    z, SetAreaMusic10		    ; No

		    ld	    c, 3Bh			    ; Music: Escape beyond Big Boss

SetAreaMusic10:
		    ld	    a, c
		    ld	    (AreaMusic), a
		    ld	    (MusicToSet), a		    ; New music	to play	(fade out current one)

;
; Checks for incoming calls.
; Skip Schneider (he never calls) and Jeniffer if Snake	is not 4 stars or her brother is dead
; From building	2 on, Snake needs the antenna
;

ChkRadioCalls:
		    ld	    c, 2			    ; Stop incoming call by default

		    ld	    a, (SchneiderCaptured)
		    and	    a
		    jr	    z, ChkRadioCalls2		    ; Skip Scheneider. He is captured

		    ld	    a, (RadioPersonsDat)	    ; 0=Frequency, 1=dummy, 2=bit0:autoreply 1:autotune, 3=Text	id
		    cp	    FREQ_SCHNEIDER
		    jr	    z, ChkRadioCalls5		    ; Schneider	never calls

		    cp	    FREQ_SCHNEIDER_BUILDING2
		    jr	    z, ChkRadioCalls5		    ; Schneider	never calls

ChkRadioCalls2:
		    ld	    a, (RadioPersonsDat)	    ; 0=Frequency, 1=dummy, 2=bit0:autoreply 1:autotune, 3=Text	id
		    cp	    FREQ_JENIFFER
		    jr	    nz,	ChkRadioCalls3

		    ld	    a, (Class)			    ; Logo end flag
		    cp	    3
		    jr	    nz,	ChkRadioCalls5		    ; Snake needs 4 stars rank to receive calls	from Jeniffer

		    ld	    a, (JennifBrotherDead)
		    and	    a
		    jr	    nz,	ChkRadioCalls5		    ; If Jeniffer's brother is dead, she will not call

;
; From building	2, you need the	antenna	to receive incoming calls
;

ChkRadioCalls3:
		    ld	    a, (MapZone)		    ; Values of	5 or more need the antenna
		    cp	    5
		    jr	    c, ChkRadioCalls4

		    ld	    a, (AntennaTaken)
		    and	    a				    ; Does the player have the radio antenna?
		    jr	    z, ChkRadioCalls5

ChkRadioCalls4:
		    ld	    a, (hl)			    ; Area music, radio	call info of this room
		    and	    8				    ; Incoming call in this room?
		    ld	    c, 2
		    jr	    z, ChkRadioCalls5

		    add	    a, a
		    add	    a, a
		    ld	    (IncomingCallTimer), a	    ; waits 32 iterations before receiving the radio call

		    ld	    c, 0

ChkRadioCalls5:
		    ld	    a, c
		    ld	    (RadioCallFlag), a		    ; 1=Start incoming call, 2=Stop incoming call
		    jp	    SetBanks1_2_3


;----------------------------------------------------------------------------
;
; Rooms	without	alert
;
; Alert	stops when entering in them
; Also does not	trigger	the alert when carring the enemy transmissor
;
;----------------------------------------------------------------------------

RoomsNoAlert:	    db	  6,   9,  10
							    ; Building 1 courtyard
		    db 20				    ; Machine Gun Kid room
		    db	102, 103, 120			    ; Desert tanks shells
		    db	173, 174, 175			    ; Lorries
		    db	208, 209			    ; Desert scorpions
		    db	135, 199			    ; Moving lorries
		    db 133				    ; Dr. Prettrovich is too late
		    db 129				    ; Isolated room. Prisoner informs Dr. Pettrovich was moved to building 2
		    db 143				    ; Parachute	cell


;----------------------------------------------------------------------------
;
; Save background tiles	of a tileblock (e.g.: broken wall)
;
; In:
;   DE = Pointer to tileblock
;----------------------------------------------------------------------------

SaveBackgTiles:
		    call    SetBanks_D_E_F

		    ld	    a, (de)			    ; NY
		    ld	    c, a
		    inc	    de
		    ld	    a, (de)			    ; NX
		    ld	    b, a

		    call    SetBanks1_2_3

		    ld	    de,	SavedTilesBuffer	    ; Buffer used to save the background tiles of a tileblock
		    call    CoordToBuffTile

SaveBckgTiles2:
		    push    bc
		    push    hl

SaveBckgTiles3:
		    ld	    a, (hl)
		    ld	    (de), a
		    inc	    hl
		    inc	    de
		    djnz    SaveBckgTiles3

		    pop	    hl
		    ld	    a, 20h
		    call    ADD_HL_A
		    pop	    bc
		    dec	    c
		    jr	    nz,	SaveBckgTiles2

		    ret


;----------------------------------------------------------------------------
;
; Decrement item count or ammo
;
; If there are no more units, the item is erased from inventory	and HUD
;
; In:
;    C = 0 Item	is not removed (e.g.: weapon)
;    C = 1 Item	is consumable (e.g.: ration)
;    C = 2 Item	in equipment select screen
;
;----------------------------------------------------------------------------

DecItemUnits:
		    ld	    a, (hl)
		    sub	    1
		    daa
		    ld	    (hl), a

		    inc	    hl
		    jr	    nc,	DecItemUnits2

		    dec	    (hl)			    ; Decrement	thousands

DecItemUnits2:
		    ld	    a, c
		    and	    a				    ; Is a weapon?
		    jp	    z, RenderAmmoHUD

		    dec	    c				    ; Is a consumable?
		    jr	    nz,	DecItemUnits3

		    ld	    a, (hl)			    ; Hundreds
		    dec	    hl
		    or	    (hl)			    ; Tens and units
		    inc	    hl
		    jp	    nz,	RenderAmmoHUD		    ; Some units lefts

		    dec	    hl
		    dec	    hl
		    call    RemoveItem

		    xor	    a
		    ld	    (SelectedWeapon), a
		    jp	    DrawWeaponHUD


DecItemUnits3:
		    ld	    a, (hl)
		    dec	    hl
		    or	    (hl)			    ; Units left?

		    push    af
		    dec	    hl
		    ld	    a, (hl)			    ; Item ID
		    call    GetItemInvAdd		    ; Get a pointer to the item	(!?) HL	should be already pointing to the item
		    pop	    af
		    jp	    nz,	DrawItemAmountInv	    ; Draw item	amount number

		    call    RemoveItem			    ; Remove item from inventory

		    call    SetBanks_4_5_6

		    ld	    a, c
		    inc	    a
		    ld	    de,	ItemEquipXY
		    call    GetPointerDE2A		    ; DE = Item's X,Y

		    ex	    de,	hl
		    dec	    l
		    dec	    l
		    dec	    l
		    dec	    l				    ; Y	= Y - 4

		    ld	    a, 8			    ; Arrow width
		    add	    a, h
		    ld	    h, a

		    ld	    bc,	4810h			    ; NX, NY
		    xor	    a				    ; Black color
		    ld	    d, a			    ; Page 0
		    call    FillRect			    ; Erase item icon and name

		    xor	    a
		    ld	    (SelectedItem), a
		    jp	    DrawItemHUD			    ; Erase item in HUD


;----------------------------------------------------------------------------
; Remove item from inventory
; Erase	item ID	and amount
;----------------------------------------------------------------------------

RemoveItem:
		    xor	    a
		    ld	    (hl), a			    ; Erase ID
		    inc	    hl
		    ld	    (hl), a			    ; Erase tens/units
		    inc	    hl
		    ld	    (hl), a			    ; Erase hundred
		    inc	    hl
		    ld	    (hl), a			    ; Erase dummy
		    ret


;----------------------------------------------------------------------------
;
; Set the colors of the	sprites	of an actor in the actor structure
;
; In:
;    IX	= Pointer to actor
;
;----------------------------------------------------------------------------

SetActorSprColors:
		    ld	    a, (ix+ACTOR.ID)		    ; Actor ID

SetActorSprColors2:
		    call    SetBanks_4_5_6

		    add	    a, a
		    ld	    e, a
		    ld	    d, 0
		    ld	    hl,	idxActorSprCols-2
		    add	    hl,	de

		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)			    ; DE = Pointer to sprites colors (RAM buffer)

		    push    ix
		    pop	    hl
		    ld	    a, ACTOR.Spr1Color		    ; Actor+#25	= Spr1 color
		    call    ADD_HL_A

		    ld	    b, (ix+ACTOR.NumSprites)

SetActorSprColors3:
		    ld	    a, (de)
		    inc	    de
		    ld	    (hl), a
		    inc	    l				    ; Spr. layer
		    inc	    l				    ; Spr. Y
		    inc	    l				    ; Spr. X
		    inc	    l				    ; Spr. pattern
		    inc	    l				    ; Spr. color
		    djnz    SetActorSprColors3

		    jp	    SetBanks1_2_3


;----------------------------------------------------------------------------
;
; Draw weapons menu screen
;
;----------------------------------------------------------------------------

DrawWeaponMenu:
		    call    SetBanks_4_5_6

		    ld	    hl,	txtWeaponSelect
		    call    PrintTextXY			    ; Prints the title

		    ld	    a, (EquipRemoved)		    ; The equipment and	weapons	have been removed by the enemy (captured)
		    and	    a				    ; Was the equipment	removed	by the enemy?
		    jp	    nz,	SetBanks1_2_3

		    ld	    hl,	1828h
		    ld	    (TempData2+1), hl		    ; First weapon DX,DY
		    ld	    a, 18h			    ; Next weapon Y offset
		    ld	    (TempData3+1), a		    ; MetaTiles, Enemy

		    ld	    hl,	Weapons
		    ld	    b, 8			    ; 7	weapons	+ supressor

DrawWeaponMenu2:
		    push    bc
		    push    hl

		    ld	    a, (hl)
		    and	    a				    ; Empty slot?
		    jr	    z, DrawWeaponMenu4

		    ld	    (TempData),	a		    ; Weapon ID
		    inc	    hl
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)			    ; DE = Amount of ammo
		    ld	    (TempData+1), de

		    ld	    a, (TempData)
		    ld	    hl,	WeaponGfxXY
		    call    ADD_HL_2A_DEC		    ; HL = Pointer to weapong gfx coordinates in VRAM

		    ld	    c, (hl)			    ; X
		    ld	    de,	(TempData2+1)		    ; DX, DY
		    rr	    c				    ; odd number?
		    ld	    bc,	2010h			    ; NX, NY (32x16)
		    jr	    nc,	DrawWeaponMenu3

		    ld	    b, c			    ; NX = NY (16x16)

		    ld	    a, 8
		    add	    a, d
		    ld	    d, a			    ; DX = DX +	8 (to center the 16x16 icon)

DrawWeaponMenu3:
		    ld	    a, (hl)			    ; X
		    inc	    hl
		    ld	    l, (hl)			    ; Y
		    ld	    h, a
		    ld	    a, 1
		    call    VDP_Copy_Byte

		    ld	    de,	idxWeaponName
		    ld	    a, (TempData)		    ; Weapon ID
		    dec	    a
		    call    GetPointerDE2A		    ; DE = Pointer to weapon's name

		    ld	    hl,	(TempData2+1)		    ; Enemy XY,	MetaTileSetAddr
		    ld	    a, 32
		    add	    a, h
		    ld	    h, a			    ; DX = DX +	32 (name to the	right of weapon's icon)
		    ex	    de,	hl
		    call    PrintText			    ; Print weapon's name

		    ld	    a, (TempData)
		    cp	    SUPRESSOR			    ; Is the supressor?
		    jr	    z, DrawWeaponMenu4		    ; Skip printing ammo amount

		    ld	    hl,	(TempData2+1)		    ; Enemy XY,	MetaTileSetAddr
		    ld	    de,	5008h			    ; Ammo amount XY offset (+80,+8)
		    add	    hl,	de
		    ld	    de,	TempData2		    ; Enemy XY,	MetaTileSetAddr
		    ex	    de,	hl

		    call    SetBanks1_2_3
		    call    Render3Numbers		    ; Print ammo amount
		    call    SetBanks_4_5_6

DrawWeaponMenu4:
		    ld	    a, (TempData2+1)		    ; Enemy XY,	MetaTileSetAddr
		    ld	    hl,	 TempData3+1		    ; MetaTiles, Enemy
		    add	    a, (hl)
		    ld	    (TempData2+1), a		    ; Enemy XY,	MetaTileSetAddr

		    pop	    hl
		    ld	    a, 4
		    call    ADD_HL_A			    ; HL = Pointer to next weapon

		    pop	    bc
		    ld	    a, b
		    cp	    5				    ; only 4 weapons in	left column
		    jr	    nz,	DrawWeaponMenu5

		    ld	    de,	8828h			    ; XY Right weapons column
		    ld	    (TempData2+1), de		    ; Next weapon coordinates
		    jr	    DrawWeaponMenu6


DrawWeaponMenu5:
		    cp	    2
		    jr	    nz,	DrawWeaponMenu6

		    ld	    de,	60A8h			    ; Supressor	coordinates
		    ld	    (TempData2+1), de		    ; Enemy XY,	MetaTileSetAddr

DrawWeaponMenu6:
		    dec	    b
		    jp	    nz,	DrawWeaponMenu2

SetBanks_1_2_3__:
		    jp	    SetBanks1_2_3


;----------------------------------------------------------------------------
;
; Draw selected	weapon in the HUD
;
;----------------------------------------------------------------------------

DrawWeaponHUD:
		    call    SetBanks_4_5_6

		    ld	    hl,	9FC1h			    ; XY
		    ld	    de,	3A12h			    ; Width and	height
		    ld	    c, 0Eh			    ; White color
		    call    DrawRect			    ; Draw weapon box

		    call    EraseWeaponBox		    ; Erase the	selected weapon	box

		    ld	    a, (SelectedWeapon)
		    and	    a				    ; Any weapon selected?
		    jr	    z, SetBanks_1_2_3__

		    ld	    a, (SelectedWeapon)
		    ld	    hl,	WeaponGfxXY
		    call    ADD_HL_2A_DEC		    ; Pointer to weapon	gfx coordinates

		    ld	    c, (hl)
		    ld	    de,	0A0C2h			    ; Coordinates to draw the weapon
		    rr	    c				    ; Is it a big weapon?
		    ld	    bc,	2010h			    ; 32x16
		    jr	    nc,	DrawWeapon2

		    ld	    b, c			    ; 16x16

		    ld	    a, 8
		    add	    a, d
		    ld	    d, a			    ; DX=DX+8

DrawWeapon2:
		    ld	    a, (hl)			    ; SX
		    inc	    hl
		    ld	    l, (hl)			    ; SY
		    ld	    h, a
		    ld	    a, 1
		    call    VDP_Copy_Byte		    ; Draw weapon

		    call    SetBanks1_2_3

		    ld	    a, (SelectedWeapon)
		    call    GetWeaponInvAdd		    ; Get pointer to weapon data in inventory

		    inc	    hl
		    inc	    hl				    ; Pointer to ammo

RenderAmmoHUD:
		    ld	    de,	0C0C8h			    ; Coordinates
		    jp	    Render3Numbers		    ; Draw ammo	amount



;----------------------------------------------------------------------------
;
; Erase	the content of the weapon box in HUD
;
;----------------------------------------------------------------------------

EraseWeaponBox:
		    ld	    hl,	0A0C2h			    ; XY
		    ld	    bc,	3810h			    ; Width and	height
		    xor	    a				    ; Black color
		    ld	    d, a			    ; Page 0
		    jp	    FillRect



;----------------------------------------------------------------------------
;
; Draw equipment screen
;
;----------------------------------------------------------------------------

DrawEquipMenu:
		    call    SetBanks_4_5_6

		    ld	    hl,	txtEquipmentSel
		    call    PrintTextXY			    ; Print title

		    ld	    a, (EquipRemoved)		    ; The equipment and	weapons	have been removed by the enemy (captured)
		    and	    a
		    jr	    nz,	SetBanks_1_2_3__	    ; Don't show the equipment screen

		    ld	    hl,	1828h
		    ld	    (TempData2+1), hl		    ; Firts item DX, DY

		    ld	    hl,	Equipment		    ; +0 Item ID, +1 tens/units, +2 hundreds, +3 unused
		    ld	    b, 25

DrawEquipMenu2:
		    push    bc
		    push    hl

		    ld	    a, (hl)			    ; Item ID
		    and	    a				    ; Empty slot?
		    jr	    z, DrawEquipMenu3

		    ld	    (TempData),	a
		    inc	    hl
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)			    ; DE = amount
		    ld	    (TempData+1), de

		    ld	    a, (TempData)
		    ld	    de,	ItemGfxXY
		    dec	    a
		    call    GetPointerDE2A		    ; DE = Item	coordinates in VRAM page 1

		    ld	    bc,	1010h			    ; (16x16)
		    res	    0, e
		    ld	    l, d
		    ld	    h, e
		    ld	    de,	(TempData2+1)		    ; Enemy XY,	MetaTileSetAddr
		    ld	    a, 1			    ; From VRAM	page 1 to 0
		    call    VDP_Copy_Byte		    ; Draw item

		    ld	    de,	idxItemName
		    ld	    a, (TempData)		    ; Item ID
		    dec	    a
		    call    GetPointerDE2A		    ; DE = Pointer to item name

		    ld	    hl,	(TempData2+1)		    ; Item DX, DY
		    ld	    a, 16
		    add	    a, h
		    ld	    h, a			    ; DX = DX +	8 (Print the name to the right of the item)
		    ex	    de,	hl
		    call    PrintText			    ; Print item name

		    ld	    a, (TempData)
		    cp	    16h
		    jr	    nz,	DrawEquipMenu3

		    ld	    hl,	(TempData2+1)		    ; Enemy XY,	MetaTileSetAddr
		    ld	    de,	2808h
		    add	    hl,	de
		    ld	    de,	TempData2		    ; Enemy XY,	MetaTileSetAddr
		    ex	    de,	hl
		    call    SetBanks1_2_3
		    call    Render3Numbers
		    call    SetBanks_4_5_6

DrawEquipMenu3:
		    ld	    a, (TempData2+1)		    ; Enemy XY,	MetaTileSetAddr
		    add	    a, 10h
		    ld	    (TempData2+1), a		    ; Next item	DY

		    pop	    hl
		    ld	    a, 4
		    call    ADD_HL_A			    ; HL = Pointer to next item	data

		    pop	    bc
		    ld	    a, b
		    cp	    17				    ; First column full	of items?
		    ld	    de,	6828h			    ; Coordinates to 2nd (centre) items	colum
		    jr	    z, DrawEquipMenu4

		    cp	    8				    ; Second colum full	of items?
		    jr	    nz,	DrawEquipMenu5

		    ld	    d, 0B8h			    ; X	coordinate for 3rd (right) items column

DrawEquipMenu4:
		    ld	    (TempData2+1), de		    ; Enemy XY,	MetaTileSetAddr

DrawEquipMenu5:
		    dec	    b
		    jp	    nz,	DrawEquipMenu2

		    jp	    SetBanks1_2_3


;----------------------------------------------------------------------------
;
; Draw in the HUD the selected item
;
;----------------------------------------------------------------------------

DrawItemHUD:
		    call    SetBanks_4_5_6

		    ld	    hl,	0DEC1h			    ; XY
		    ld	    de,	1B12h			    ; NX,NY
		    ld	    c, 0Eh			    ; White color
		    call    DrawRect			    ; Draw item	box

		    call    EraseItemBox		    ; Erase item in HUD

		    ld	    a, (SelectedItem)
		    and	    a				    ; Any item selected?
		    jp	    z, SetBanks1_2_3		    ; No

		    ld	    de,	ItemGfxXY
		    dec	    a
		    call    GetPointerDE2A		    ; DE = SX,SY

		    ld	    bc,	1010h			    ; (16x16)
		    res	    0, e
		    ld	    l, d
		    ld	    h, e
		    ld	    de,	0E0C2h			    ; DX,DY
		    ld	    a, 1			    ; From VRAM	page 1 to 0
		    call    VDP_Copy_Byte		    ; Draw item

		    call    SetBanks1_2_3

		    ld	    c, 0
		    ld	    a, (SelectedItem)
		    cp	    SELECTED_CARD1
		    ret	    c

		    cp	    SELECTED_RATION
		    ret	    nc				    ; It is not	a card

		    call    GetItemInvAdd
		    inc	    hl
		    ld	    a, (hl)			    ; Item amount = card number
		    ld	    de,	0F0C8h			    ; card number X,Y
		    ld	    c, 0FFh			    ; Draw chararacter flag
		    jp	    DrawChar			    ; Render card number

;----------------------------------------------------------------------------
;
; Erase	item in	the HUD
;
;----------------------------------------------------------------------------

EraseItemBox:
		    ld	    hl,	0E0C2h			    ; XY
		    ld	    bc,	1810h			    ; width, height

FillRectBlack:
		    xor	    a				    ; Black color
		    ld	    d, a			    ; Page 0
		    jp	    FillRect


;----------------------------------------------------------------------------
;
; Draw item amount in equipment	screen
;
; In:
;   HL = Pointer to item
;    C = Item ID
;
;----------------------------------------------------------------------------

DrawItemAmountInv:
		    push    hl
		    call    SetBanks_4_5_6

		    ld	    de,	ItemEquipXY
		    ld	    a, c
		    inc	    a
		    call    GetPointerDE2A		    ; Get item location	(cursor)

		    call    SetBanks1_2_3

		    ex	    de,	hl

		    ld	    a, 4			    ; Y	offset
		    add	    a, l
		    ld	    l, a

		    ld	    a, 48			    ; X	offset
		    add	    a, h
		    ld	    h, a

		    push    hl
		    ld	    bc,	1808h			    ; NX,NY
		    call    FillRectBlack		    ; Erase actual printed amount
		    pop	    de

		    pop	    hl				    ; Pointer to item

		    inc	    hl
		    inc	    hl				    ; Pointer to item amount
		    jp	    Render3Numbers



;----------------------------------------------------------------------------
;
; Setup	radio frequencies availables in	the room
;
;----------------------------------------------------------------------------

UpdateRadio:
		    call    SetBanks_D_E_F		    ; Setup radio frequencies and characters available


		    ld	    de,	idxRoomRadio
		    call    GetRoomPointer		    ; DE = Pointer to radio data

		    ex	    de,	hl

		    ld	    a, (hl)
		    and	    a				    ; 0	= No radio listeners
		    ld	    c, 0			    ; Number of	persons	available on the radio
		    jr	    z, SetNumRadioPers

		    ld	    de,	RadioPersonsDat		    ; 0=Frequency, 1=dummy, 2=bit0:autoreply 1:autotune, 3=Text	id

UpdateRadio2:
		    ld	    a, (hl)
		    rra
		    rra
		    rra
		    rra					    ; high nibble
		    and	    0Fh				    ; Person ID
		    dec	    a

		    push    de
		    ld	    de,	RadioFreqs
		    call    ADD_DE_A
		    ld	    a, (de)			    ; Get the character's frequency
		    pop	    de

		    ld	    (de), a			    ; Frequency
		    ld	    b, a

		    ld	    a, (hl)			    ; Bits 3-2:	3=Auto reply, 2=Player needs to	call before getting an answer
		    rra
		    rra
		    and	    3
		    inc	    de
		    inc	    de
		    ld	    (de), a

		    bit	    1, a			    ; Auto tune	(set correct radio frequency)
		    jr	    z, UpdateRadio3

		    ld	    a, b
		    ld	    (RadioFreq), a		    ; Set the right frequency

UpdateRadio3:
		    inc	    de
		    ld	    b, (hl)
		    inc	    hl

		    ld	    a, (hl)			    ; Text ID
		    ld	    (de), a

		    inc	    c				    ; Num. radio listeners
		    bit	    0, b			    ; Another character	available in the radio?
		    jr	    nz,	SetNumRadioPers

		    inc	    hl
		    ld	    a, 1Dh
		    call    ADD_DE_A			    ; DE = Pointer to next available character on radio
		    jr	    UpdateRadio2


SetNumRadioPers:
		    ld	    a, c			    ; Number of	available characters on	radio
		    ld	    (NumRadioPersons), a
		    jp	    SetBanks1_2_3



;----------------------------------------------------------------------------
; Radio	frequencies
;----------------------------------------------------------------------------
RadioFreqs:	    db FREQ_BIGBOSS			    ; Big Boss
		    db FREQ_SCHNEIDER			    ; Schneider
		    db FREQ_DIANE			    ; Diane
		    db FREQ_SCHNEIDER_BUILDING2		    ; Schneider	building 2
		    db FREQ_DIANE_BUILDING2		    ; Diane building 2
		    db FREQ_JENIFFER			    ; Jeniffer
		    db FREQ_BIGBOSS_BUILDING2		    ; Big boss building	2


;----------------------------------------------------------------------------
;
; Set bank 6 in	#A000-#BFFF
;
;----------------------------------------------------------------------------

SetBankInA0_6:
		    di
		    push    af
		    ld	    a, 6
		    jr	    SetBankInA0



;----------------------------------------------------------------------------
;
; Set bank 9 in	#A000-#BFFF
;
;----------------------------------------------------------------------------

SetBankInA0_9:
		    di
		    push    af
		    ld	    a, 9
		    jr	    SetBankInA0


;----------------------------------------------------------------------------
;
; Set bank #C in #A000-#BFFF
;
;----------------------------------------------------------------------------

SetBankInA0_C:
		    di
		    push    af
		    ld	    a, 0Ch
		    jr	    SetBankInA0



;----------------------------------------------------------------------------
;
; Set bank #F in #A000-#BFFF
;
;----------------------------------------------------------------------------

SetBankInA0_F:
		    di
		    push    af
		    ld	    a, 0Fh


;----------------------------------------------------------------------------
;
; Set bank in #A000-#BFFF
;
; In: A	= Bank
;
;----------------------------------------------------------------------------

SetBankInA0:
		    ld	    (BankInA0),	a
		    ld	    (0A000h), a
		    ld	    (BankInA0Fixed), a
		    pop	    af
		    ei
		    ret


;----------------------------------------------------------------------------
;
; Load room tileset and	collision properties
;
;----------------------------------------------------------------------------

LoadRoomTiles:
		    call    SetTilesetColors		    ; set the 8	colors used for	the tilesets

		    call    SetBanks_7_8_9

		    ld	    hl,	RoomGfxSetIds
		    call    GetNibbleRoom		    ; Get tileset ID of	current	room

		    ld	    hl,	CurrentTileSet
		    cp	    (hl)			    ; Already loaded?
		    jp	    z, SetBanks1_2_3

		    ld	    e, (hl)			    ; (!?)
		    ld	    (hl), a			    ; Update current tileset graphics ID

		    push    af
		    call    LoadPowSwitTiles		    ; Load power switch	and elevator control panel tiles
		    call    SetBanks_7_8_9
		    pop	    af

		    cp	    6				    ; Metal Gear tileset?
		    jr	    z, LoadRoomTiles2		    ; Yes, don't load the crates

		    push    af
		    call    LoadGfxCrates		    ; Load wood	crates tiles
		    call    SetBanks_7_8_9
		    pop	    af

LoadRoomTiles2:
		    ld	    de,	idxTileSets
		    call    GetPointerDE2A

		    push    de
		    pop	    ix				    ; IX = Pointer to tileset data

		    ld	    b, 3			    ; Thre blocks os tiles

LoadRoomTiles3:
		    ld	    a, (ix+0)
		    rla					    ; Bit 7 = 1. Load collison tiles?
		    jr	    c, LoadColliTiles

		    call    LoadTileset			    ; Load tileset

		    ld	    de,	5
		    add	    ix,	de
		    djnz    LoadRoomTiles3

; Load collision tiles of current tileset

LoadColliTiles:
		    call    SetBanks1_2_3		    ; (!?)

		    ld	    a, (CurrentTileSet)
		    call    SetBanks_7_8_9

		    ld	    hl,	CollisionTiles		    ; Collision	property of the	tiles (bit 0 = 1 collision)
		    exx
		    ld	    hl,	IdxColisTiles
		    call    ADD_HL_2A			    ; Pointer to collision data	of current tileset

		    ld	    a, (hl)
		    inc	    hl
		    ld	    h, (hl)
		    ld	    l, a
		    ld	    c, 32			    ; 32 * 8 = 256 tiles

LoadColliTiles2:
		    ld	    a, (hl)
		    exx
		    ld	    b, 8			    ; Each bit defines the collision property of a tile

LoadColliTiles3:
		    rlca				    ; Bit 7 -> bit 0
		    ld	    d, a
		    and	    1				    ; Mask bit 0
		    ld	    (hl), a			    ; Collision	property of the	tile
		    ld	    a, d
		    inc	    l				    ; Next tile
		    djnz    LoadColliTiles3

		    exx
		    inc	    hl				    ; Next collision data byte
		    dec	    c
		    jr	    nz,	LoadColliTiles2

		    jp	    SetBanks1_2_3



;----------------------------------------------------------------------------
;
; Load tileset
;
; In:
;   IX = Pointer to tileset data
;   +0:	bit6 = flip tiles
;   +1:	Number of tiles	to load
;   +2:	Tile number to start loading the graphics
;   +3:	Pointer	to graphics
;----------------------------------------------------------------------------

LoadTileset:
		    push    bc
		    bit	    6, (ix+0)			    ; Flip tiles?
		    jr	    nz,	LoadTilesFlip

		    ld	    b, (ix+1)			    ; Number of	tiles
		    ld	    a, b
		    ld	    (TempData),	a

		    ld	    a, (ix+2)			    ; Destination tile number
		    call    TileToVramAdd		    ; Calculate	destination VRAM address

		    ld	    e, (ix+3)
		    ld	    d, (ix+4)			    ; DE = Pointer to graphics data
		    ld	    (TempData+1), de
		    ex	    de,	hl
		    call    Load3bppTiles
		    pop	    bc
		    ret


LoadTilesFlip:
		    ld	    a, (TempData)
		    ld	    b, a			    ; Number of	tiles
		    ld	    a, (ix+1)			    ; Destination tile number
		    call    TileToVramAdd

		    ld	    de,	(TempData+1)
		    ex	    de,	hl			    ; HL = Pointer to graphics data
		    call    Load3bppTileFlip
		    pop	    bc
		    ret


;----------------------------------------------------------------------------
;
; Tile number to VRAM address in page 1
;
; In:
;    A = Tile number
; Out:
;   HL = VRAM address in page 1	of the tile
;
;----------------------------------------------------------------------------

TileToVramAdd:
		    ld	    c, a
		    and	    0E0h
		    call    HL_4xA
		    add	    hl,	hl
		    add	    hl,	hl
		    add	    hl,	hl
		    ld	    a, c
		    and	    1Fh
		    add	    a, a
		    call    ADD_HL_2A
		    ld	    de,	8000h			    ; Start of VRAM page 1
		    add	    hl,	de
		    ret


;----------------------------------------------------------------------------
;
; Load doors graphics
; The graphics are ready to copy as a block to the active VRAM page
;
;----------------------------------------------------------------------------

LoadGfxDoors:
		    call    SetBanks_7_8_9

		    ld	    hl,	GfxDoorFront
		    ld	    de,	0D060h			    ; VRAM address
		    ld	    bc,	404h			    ; NX,NY in tiles (4x4)
		    push    bc
		    call    LoadTilesGfxBlk
		    pop	    bc

		    ld	    hl,	GfxDoorElevator
		    ld	    de,	0E060h			    ; VRAM address
		    call    LoadTilesGfxBlk

		    ld	    hl,	GfxDoorLeft
		    ld	    de,	0D070h			    ; VRAM address
		    ld	    bc,	104h			    ; NX,NY in tiles (1x4)
		    push    bc
		    call    LoadTilesGfxBlk
		    pop	    bc

		    ld	    hl,	GfxDoorRight
		    ld	    de,	0D074h			    ; VRAM address
		    call    LoadTilesGfxBlk

		    ld	    hl,	GfxDoorDown
		    ld	    de,	0E070h			    ; VRAM address
		    ld	    bc,	401h			    ; NX,NY in tiles (4x1)
		    call    LoadTilesGfxBlk

		    jr	    RestoreBanks1_2_3


;-------------------------------------------------------------------------------
;
; Load tiles gfx from ROM/RAM to VRAM in a block (e.g.:	a door)
;
; In:
;    HL	= Source address
;    DE	= Destination address
;     B	= Number of X tiles
;     C	= Number of Y tiles
;-------------------------------------------------------------------------------

LoadTilesGfxBlk:
		    push    bc

		    push    de
		    call    LoadTilesGfx		    ; Load tiles gfx from ROM/RAM to VRAM
		    pop	    de

		    ex	    de,	hl
		    ld	    bc,	400h			    ; Y=Y+8 (#400 bytes)
		    add	    hl,	bc
		    ex	    de,	hl

		    pop	    bc
		    dec	    c
		    jr	    nz,	LoadTilesGfxBlk
		    ret


;-------------------------------------------------------------------------------
;
; Load the sprites used	in the room
;
;-------------------------------------------------------------------------------

LoadRoomSpr:
		    call    SetBanks_A_B_C

		    ld	    a, (Room)			    ; Current room
		    ld	    hl,	SpritesetRooms
		    call    ADD_HL_A			    ; A	= Spriteset ID of the room

		    ld	    a, (hl)
		    ld	    de,	idxSprSet
		    call    GetPointerDE2A		    ; DE = Pointer to spriteset

LoadRoomSpr2:
		    ld	    a, (de)
		    inc	    a				    ; #FF = End	data
		    jr	    z, RestoreBanks1_2_3

		    dec	    a				    ; (!?)

		    push    de
		    call    LoadRoomSpr3
		    pop	    de

		    inc	    de
		    inc	    de
		    inc	    de
		    jr	    LoadRoomSpr2


RestoreBanks1_2_3:
		    jp	    SetBanks1_2_3


LoadRoomSpr3:
		    ld	    a, (de)
		    call    HL_4xA
		    add	    hl,	hl			    ; Sprite pattern * 8 = offset in sprite pattern table

		    inc	    de
		    ld	    a, (de)
		    ld	    c, a
		    inc	    de
		    ld	    a, (de)

		    ld	    de,	0F800h			    ; Sprite pattern generator table
		    add	    hl,	de			    ; Pointer to VRAM sprite pattern
		    ld	    d, a
		    ld	    e, c			    ; DE = Pointer to sprites gfx
		    jp	    UnpackGfx1


;-------------------------------------------------------------------------------
;
; Draw pitfall in VRAM page 1
; Create an image of the pitfall fully open
;
;-------------------------------------------------------------------------------

DrawPitfall_:
		    call    SetBanks_7_8_9
		    jr	    DrawPitfall



;-------------------------------------------------------------------------------
;
; Set up pitfall
;
; Unpack pitfall tiles
; Create an image of the pitfall fully open in VRAM buffer
;
; In:
;   DE = RAM Buffer to unpack pitfall tiles
;   HL = Pointer to pitfall graphics
;
;-------------------------------------------------------------------------------

SetupPitfall:
		    call    SetBanks_7_8_9
		    call    Load2bppTile

; Draws	pitfall	in page	1 buffer

DrawPitfall:
		    ld	    hl,	PitfallTileMap
		    ld	    de,	40A0h			    ; VRAM buffer coordinates
		    call    DrawPitfallTiles
		    jr	    RestoreBanks1_2_3


;----------------------------------------------------------------------------
;
; Set equipment	and weapon menu	palette
;
;----------------------------------------------------------------------------

SetMenuWeaponPal:
		    call    SetBanks_4_5_6
		    ld	    hl,	PalMenuWeapon
		    call    SetPalette
		    jr	    RestoreBanks1_2_3


;----------------------------------------------------------------------------
;
; Set Solid Snake palette
;
;----------------------------------------------------------------------------

SetSnakePal:
		    ld	    hl,	SnakePal
		    jp	    SetPalette

SnakePal:	    db	  7, 12h,   2
		    db	0Ah, 63h,   4
		    db 0FFh


;----------------------------------------------------------------------------
;
; Set radio screen palette
;
;----------------------------------------------------------------------------

SetRadioPal:
		    call    SetBanks_4_5_6
		    ld	    hl,	RadioPalette
		    call    SetPalette
		    jr	    SetBanks1_2_3_d



;----------------------------------------------------------------------------
;
; Set spriteset	palette
;
;----------------------------------------------------------------------------

SetSprPal:
		    call    SetBanks_A_B_C

		    ld	    hl,	SpritesetRooms
		    ld	    a, (Room)
		    call    ADD_HL_A

		    ld	    a, (hl)			    ; A	= Spriteset ID

		    call    SetBanks_4_5_6

		    ld	    de,	idxSprSetPals
		    jp	    SetRoomPal3

;----------------------------------------------------------------------------
;
; Sets the palette used	in the room
; In dark rooms, you need the flash light
; When wearing goggles,	the palette will use gray colors
;
;----------------------------------------------------------------------------

SetRoomPal:
		    ld	    hl,	IdsRoomPal
		    call    SetBanks_4_5_6

		    ld	    a, (Room)
		    ld	    b, a
		    cp	    251				    ; Ending
		    jr	    z, SetRoomPal1

		    cp	    220				    ; Dark room	trap holes 1
		    jr	    z, ChkFlashLight

		    cp	    221				    ; Dark room	trap holes 2
		    jr	    z, ChkFlashLight

		    cp	    126				    ; Lorry
		    jr	    nc,	ChkGogglesPal

		    cp	    123				    ; First dark room
		    jr	    c, ChkGogglesPal

ChkFlashLight:
		    ld	    a, (SelectedItem)
		    cp	    SELECTED_FLASHLIGHT		    ; Flash light
		    jr	    z, ChkGogglesPal

		    ld	    a, 0Bh			    ; Black palette
		    jr	    SetRoomPal2


ChkGogglesPal:
		    ld	    a, (SelectedItem)
		    cp	    SELECTED_GOGGLES		    ; Goggles
		    jr	    nz,	SetRoomPal1

		    ld	    a, 0Ah
		    jr	    SetRoomPal2			    ; Set gray colors to simulate infrared


SetRoomPal1:
		    ld	    a, b
		    call    GetNibbleHL_A2

SetRoomPal2:
		    call    SetBanks_4_5_6
		    ld	    de,	idxRoomPalettes

SetRoomPal3:
		    call    GetPointerDE2A
		    ex	    de,	hl
		    call    SetPalette

SetBanks1_2_3_d:
		    jp	    SetBanks1_2_3


;----------------------------------------------------------------------------
;
; Color	numbers	used when decoding 2/3 bpp graphics
;
;----------------------------------------------------------------------------
ColorsTileset:	    db	  1,   3,   5,	 8,   9, 0Ch, 0Eh, 0Fh
ColorsItems:	    db	  0,   6,   7,	 8, 0Ah, 0Ch, 0Eh, 0Fh
ColorsCameras:	    db	  0,   2, 0Dh, 0Fh
ColorsPitfall:	    db	  0,   5,   9, 0Fh
ColSnakePic:	    db	  2,   4,   8, 0Bh, 0Dh, 0Ch, 0Eh, 0Fh


;----------------------------------------------------------------------------
;
; Load common game graphics
;
; Crates, items, alert icons, radio, cameras, Snake portrait
;
;----------------------------------------------------------------------------

LoadGameGfx:
		    call    LoadGfxCrates

		    call    SetBanks_4_5_6

		    ld	    hl,	ColorsItems
		    call    SetColorsIndexes
		    ld	    hl,	GfxItems		    ; Items and	weapons
		    ld	    de,	0B000h
		    ld	    b, 84h			    ; Number of	tiles
		    call    Load3bppTiles

		    ld	    hl,	gfxAlertIcon
		    ld	    de,	0C400h
		    ld	    b, 4			    ; Number of	tiles
		    call    Load3bppTiles		    ; Alert exclamation	mark icon

		    ld	    hl,	ColorsTileset
		    call    SetColorsIndexes
		    ld	    hl,	gfxRadio		    ; Radio tiles
		    ld	    de,	0C804h
		    ld	    b, 1Fh			    ; Number of	tiles
		    call    Load3bppTiles

		    ld	    hl,	gfxRadio2		    ; Some radio tiles flipped
		    ld	    de,	0CC00h
		    ld	    b, 7			    ; Number of	tiles
		    call    Load3bppTileFlip

		    ld	    hl,	ColorsCameras
		    ld	    c, 4
		    call    SetColorsIndexes2
		    ld	    hl,	gfxCameraV		    ; Surveillance camera (facing up and down)
		    ld	    de,	0C010h
		    ld	    b, 8			    ; Number of	tiles
		    call    Load2bppTile

		    ld	    hl,	gfxCameraH
		    ld	    de,	0C410h
		    ld	    b, 8
		    call    Load2bppTile		    ; Surveillance camera (facing left and right)

		    call    SetBanks_7_8_9

		    ld	    hl,	ColSnakePic
		    call    SetColorsIndexes
		    ld	    hl,	gfxSnakePortrait
		    ld	    de,	0C040h
		    ld	    b, 10h
		    call    Load3bppTiles		    ; Snake radio portrait

		    ld	    hl,	gfxSnakePortrait2
		    ld	    de,	0C440h
		    ld	    b, 3
		    call    Load3bppTiles		    ; Eye and mouth animation

SetBanks_1_2_3_a:
		    jp	    SetBanks1_2_3


;----------------------------------------------------------------------------
;
; Print	TRANSCEIVER title and RECV
;
;----------------------------------------------------------------------------

PrintTransceiv:
		    call    SetBanks_4_5_6
		    ld	    hl,	txtTransceiv
		    call    PrintTextXY
		    jr	    SetBanks_1_2_3_a


;----------------------------------------------------------------------------
;
; Load Power switch and	elevator button	panel tiles
;
;----------------------------------------------------------------------------

LoadPowSwitTiles:
		    call    SetBanks_D_E_F

		    call    SetTilesetColors		    ; Set the color numbers used to decode the graphics

		    ld	    hl,	gfxPowSwitch
		    ld	    de,	9048h			    ; VRAM address
		    ld	    b, 4			    ; Number of	tiles
		    call    Load3bppTiles		    ; Decode and load 3bpp tiles

		    jr	    SetBanks_1_2_3_a


;----------------------------------------------------------------------------
;
; Load crate tiles
;
;----------------------------------------------------------------------------

LoadGfxCrates:
		    call    SetBanks_7_8_9

		    call    SetTilesetColors

		    ld	    hl,	GfxCrates
		    ld	    de,	9400h
		    ld	    b, 8
		    push    hl
		    call    Load3bppTiles
		    pop	    hl

		    ld	    de,	9840h
		    ld	    b, 8
		    call    Load3bppTileFlip

SetBanks_1_2_3_b:
		    jr	    SetBanks_1_2_3_a

;----------------------------------------------------------------------------
;
; Load proyectile sprites (bullets, grenade, rocket...)
;
;----------------------------------------------------------------------------

LoadSprProjectile:
		    call    SetBanks_A_B_C

		    ld	    a, (SelectedWeapon)
		    and	    a				    ; Any weapon selected?
		    jr	    z, SetBanks_1_2_3_b		    ; None

		    push    af
		    cp	    ROCKET_LAUNCHER
		    jr	    z, LoadSprProjectile2

		    cp	    MISSILE
		    jr	    z, LoadSprProjectile2

		    dec	    a
		    ld	    de,	idxSprWeapon
		    call    GetPointerDE2A

		    ld	    hl,	0F880h			    ; VRAM address
		    call    UnpackGfx1

LoadSprProjectile2:
		    pop	    af
		    sub	    GRENADE_LAUNCHER
		    jr	    c, SetBanks_1_2_3_b

		    jr	    z, LoadSprExplosionS	    ; Grenade launcher

		    dec	    a
		    jr	    z, LoadSprExplosionBig	    ; Rocket launcher

		    dec	    a
		    jr	    z, LoadSprExplosionBig	    ; Plastic bomb

		    dec	    a
		    jr	    z, LoadSprExplosionS	    ; Land mine

;----------------------------------------------------------------------------
;
; Load big explosion sprites
;
;----------------------------------------------------------------------------

LoadSprExplosionBig:
		    ld	    hl,	0F8C0h
		    ld	    de,	SprExplosionB
		    jr	    LoadSprAmmo4


;----------------------------------------------------------------------------
;
; Load small explosion sprites
;
;----------------------------------------------------------------------------

LoadSprExplosionS:
		    ld	    hl,	0F900h
		    ld	    de,	SprExplosionS

LoadSprAmmo4:
		    call    UnpackGfx1
		    jr	    SetBanks_1_2_3_b

;----------------------------------------------------------------------------
;
; Load rocket/missile sprites depending	on its direction
;
; In:
;    DE	= Pointer to sprites index
;----------------------------------------------------------------------------

LoadSprMissilRocket:
		    call    SetBanks_A_B_C

		    ld	    a, (ix+PLAYER_SHOT.Direction)
		    dec	    a				    ; Direction
		    call    GetPointerDE2A

		    ld	    hl,	0F880h			    ; VRAM address
		    call    UnpackGfx1

		    jr	    SetBanks_1_2_3_b


;----------------------------------------------------------------------------
;
; Load target sprite
;
;----------------------------------------------------------------------------

LoadSprTarget:
		    call    SetBanks_4_5_6

		    ld	    de,	SprTarget
		    call    UnpackGfx

		    jr	    SetBanks_1_2_3_b

;----------------------------------------------------------------------------
;
; Set up Konami	logo
;
; Load logo tiles and draw logo
;
;----------------------------------------------------------------------------

SetUpKonamiLogo:
		    call    SetBanks_7_8_9

		    ld	    hl,	gfxKonamiLogo
		    ld	    de,	800h			    ; DE = XY
		    ld	    bc,	0D01h			    ; B	= Number of tiles, C = Color
		    call    Load1bppTiles

		    ld	    hl,	gfxKonamiLogo2
		    ld	    de,	7000h			    ; DE = XY
		    ld	    bc,	0D02h			    ; B	= Number of tiles, C = Color
		    call    Load1bppTiles

		    ld	    hl,	gfxKonami
		    ld	    de,	0D800h			    ; DE = XY
		    ld	    bc,	1A03h			    ; B	= Number of tiles, C = Color
		    call    Load1bppTiles

		    ld	    de,	4040h			    ; XY
		    ld	    hl,	KonamiLogoTiles
;----------------------------------------------------------------------------
;
; Draw tiles
;
; In:
;    DE	= XY
;    HL	= Tiles	data
;   #FF	= End
;   #FE	= Next line, Set new X (add offset)
;
;----------------------------------------------------------------------------

DrawTileList:
		    push    de

DrawTileList2:
		    ld	    a, (hl)
		    inc	    hl
		    ld	    c, a
		    inc	    a				    ; FF = End
		    jr	    z, DrawTileList4

		    inc	    a
		    jr	    nz,	DrawTileList3		    ; FE = Move	next row and relocate X

		    pop	    de

		    ld	    a, (hl)
		    inc	    hl

		    add	    a, d			    ; Increment	DX
		    ld	    d, a
		    ld	    a, 8
		    add	    a, e			    ; Increment	DY
		    ld	    e, a
		    jr	    DrawTileList


DrawTileList3:
		    ld	    a, c
		    call    DrawTile_P1
		    call    CalcNextCharPos
		    jr	    DrawTileList2


DrawTileList4:
		    pop	    de
		    jp	    SetBanks1_2_3



;----------------------------------------------------------------------------
;
; Unpack a row of metatiles into normal	tiles
;
; DE = Room tiles buffer
; HL = Room metatiles map
;----------------------------------------------------------------------------


UnpackMetatiles:
		    ld	    a, 8
		    ld	    (MetatilesNX), a		    ; Number of	X metatiles in a room
		    ld	    (TempData),	de
		    ld	    (TempData3), hl		    ; MetaTiles, Enemy

		    ld	    hl,	MetaTileSetIDs
		    call    GetNibbleRoom		    ; Get metatileset ID

		    dec	    a
		    ld	    de,	idxMetatileSet
		    call    GetPointerDE2A
		    ld	    (TempData2), de		    ; Pointer to metatiles definition

UnpackMetatiles2:
		    ld	    hl,	(TempData3)		    ; Pointer to room metatile
		    ld	    a, (hl)			    ; Metatile ID
		    inc	    hl
		    ld	    (TempData3), hl		    ; MetaTiles, Enemy

		    ld	    de,	(TempData2)		    ; Pointer to metatiles
		    call    DEC_A_HL_4xA

		    add	    hl,	hl
		    add	    hl,	hl
		    add	    hl,	de			    ; HL = Pointer to the tiles	of the metatile

		    ld	    de,	(TempData)		    ; Room tiles buffer

		    ld	    c, 4			    ; 4	tiles height

UnpackMetatiles3:
		    ld	    b, 4			    ; 4	tiles width

UnpackMetatiles4:
		    ld	    a, (hl)
		    ld	    (de), a			    ; Transfer tiles of	the metatile
		    inc	    hl
		    inc	    de
		    djnz    UnpackMetatiles4

		    ld	    a, 1Ch
		    call    ADD_DE_A
		    dec	    c
		    jr	    nz,	UnpackMetatiles3

		    ex	    de,	hl
		    and	    a
		    ld	    de,	7Ch
		    sbc	    hl,	de
		    ld	    (TempData),	hl

		    ld	    hl,	MetatilesNX
		    dec	    (hl)
		    jr	    nz,	UnpackMetatiles2
		    ret



;----------------------------------------------------------------------------
;
; Render room tiles
;
; A room is defined by 8x6 metatiles
; A metatiles is defined by 8x8	tiles
; Unpack room metatiles	into normal tiles and draw them
;
;----------------------------------------------------------------------------

RenderRoom:
		    call    SetBanks_D_E_F

		    call    ClearPage0

		    ld	    hl,	RoomTileBuffer		    ; Buffer to	store the tiles	of the room
		    ld	    (TempData),	hl

		    ld	    de,	idxRooms
		    call    GetRoomPointer
		    ex	    de,	hl			    ; HL = Room	pointer

; Unpack the metatiles

		    ld	    b, 6			    ; Number of	Y metatiles

RenderRoom2:
		    push    bc
		    ld	    de,	(TempData)

		    push    de
		    push    hl
		    call    UnpackMetatiles		    ; Unpack a row of metatiles
		    pop	    hl
		    pop	    de

		    ld	    a, 80h			    ; 32 tiles (NX room) * 4 (metatile NY)
		    call    ADD_DE_A
		    ld	    (TempData),	de		    ; Pointer to next row

		    ld	    a, 8			    ; Number of	metatiles in a row
		    call    ADD_HL_A
		    pop	    bc
		    djnz    RenderRoom2

		    call    SetBanks1_2_3

; Render the room

		    ld	    hl,	RoomTileBuffer
		    ld	    de,	0
		    ld	    bc,	300h

RenderRoom3:
		    push    bc

		    ld	    a, (hl)
		    inc	    hl
		    call    DrawTile
		    call    CalcNextCharPos

		    pop	    bc

		    dec	    bc
		    ld	    a, c
		    or	    b
		    jr	    nz,	RenderRoom3
		    ret



;----------------------------------------------------------------------------
;
; Transfer from	VRAM to	RAM
;
; In:
;   HL = Source	VRAM address
;   DE = Destination RAM address
;   BC = Number	of bytes
;----------------------------------------------------------------------------

VRAMtoRAM:
		    call    SetVramAddressRD		    ; Set VRAM source address
		    call    PrepareOtirRegs

		    ex	    af,	af'
		    ld	    a, (VDP_DR)
		    ld	    c, a
		    ex	    af,	af'

VRAMtoRAM2:
		    inir
		    dec	    a
		    jr	    nz,	VRAMtoRAM2

		    ex	    de,	hl
		    ret

;----------------------------------------------------------------------------
;
; Prepare OTIR registers
;
; In:
;    DE	= Source address
;    BC	= Number of bytes
;
; Out:
;    HL	= Source address
;     B	= Number of bytes in the first OTIR
;     A	= OTIR	iterations
;----------------------------------------------------------------------------

PrepareOtirRegs:
		    ex	    de,	hl			    ; Swap HL and DE

		    ld	    a, c
		    or	    a				    ; C	= 0?

		    ld	    a, b			    ; OTIR iterations
		    ld	    b, c			    ; Number of	bytes to transfer by the OTIR
		    ret	    z				    ; C	= 0

		    inc	    a
		    ret

;-------------------------------------------------------------------------------
;
; Transfer from	RAM to VRAM
;
; In:
;    HL	= Source RAM address
;    DE	= Destination VRAM address
;    BC	= Number of bytes
;-------------------------------------------------------------------------------

RAMtoVRAM:
		    ex	    de,	hl			    ; HL = VRAM	address
		    call    SetVramAddressWR		    ; Set VRAM destination address

		    call    PrepareOtirRegs

		    ex	    af,	af'
		    ld	    a, (VDP_DW)
		    ld	    c, a
		    ex	    af,	af'

RAMtoVRAM2:
		    otir				    ; Transfer B bytes from HL to VRAM
		    dec	    a				    ; Decrement	iteration counter
		    jr	    nz,	RAMtoVRAM2		    ; Next iteration. B=0 so transfer 256 bytes
		    ret



;----------------------------------------------------------------------------
;
; Fill VRAM
;
; In:
;   HL = Destionation VRAM address
;   BC = Number	of bytes
;    A = Value
;
;----------------------------------------------------------------------------

FillVRAM:
		    push    de

		    push    af
		    call    SetVramAddressWR		    ; Set VRAM address

		    ld	    d, c

		    ld	    a, c
		    or	    a				    ; low byte = 0?
		    jr	    z, FillVRAM2

		    inc	    b

FillVRAM2:
		    ld	    a, (VDP_DW)
		    ld	    c, a
		    pop	    af

FillVRAM3:
		    out	    (c), a
		    dec	    d
		    jr	    nz,	FillVRAM3

		    djnz    FillVRAM3

		    pop	    de
		    ret



;
; Unused
;

WriteVRAM:
		    push    bc
		    push    af
		    call    SetVramAddressWR
		    ld	    a, (VDP_DW)
		    ld	    c, a
		    pop	    af
		    out	    (c), a
		    pop	    bc
		    ret



;-------------------------------------------------------------------------------
;
; Set VRAM address (Write)
;
; In:
;   HL = VRAM Address
;
;-------------------------------------------------------------------------------

SetVramAddressWR:
		    push    bc

		    ld	    a, (VDP_DW)
		    inc	    a
		    ld	    c, a

		    ld	    a, h
		    rlca
		    rlca
		    and	    3
		    di
		    out	    (c), a			    ; A16-A14

		    ld	    a, 8Eh			    ; VDP R#14
		    out	    (c), a

		    ld	    a, l
		    out	    (c), a			    ; A7-A0

		    ld	    a, h
		    and	    3Fh
		    or	    40h				    ; Read mode
		    out	    (c), a			    ; A13-A8

		    pop	    bc
		    ei
		    ret



;-------------------------------------------------------------------------------
; Set VRAM address (Read)
;
; HL = VRAM Address
;
;-------------------------------------------------------------------------------

SetVramAddressRD:
		    push    bc

		    ld	    a, (VDP_DW)
		    inc	    a
		    ld	    c, a

		    ld	    a, h
		    rlca
		    rlca
		    and	    3
		    di
		    out	    (c), a			    ; A16-A14

		    ld	    a, 8Eh			    ; VDP R#14
		    out	    (c), a

		    ld	    a, l
		    out	    (c), a			    ; A7-A0

		    ld	    a, h
		    and	    3Fh
		    out	    (c), a			    ; A13-A8

		    pop	    bc
		    ei
		    ret


;-------------------------------------------------------------------------------
;
; Unpack graphics
;
; In:
;   DE = Gfx data
;   +0:	dw VRAM	address
;   +1:	db SIZE	(bit7: 1=Uncompressed /	0=Compressed)
;	#80 = Set new VRAM address
;	#00 = End
;   +2:	Uncompressed data SIZE long
;   +2:	Data to	repeat SIZE times
;-------------------------------------------------------------------------------

UnpackGfx:
		    ex	    de,	hl
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)			    ; DE = VRAM	address
		    inc	    hl
		    ex	    de,	hl

UnpackGfx1:
		    call    SetVramAddressWR		    ; Set VRAM destination address
		    ld	    a, (VDP_DW)
		    ld	    c, a

UnpackGfx2:
		    ld	    a, (de)
		    and	    a				    ; End of data?
		    ret	    z				    ; Yes

		    inc	    de
		    ld	    b, a
		    and	    7Fh
		    cp	    b
		    jr	    z, UnpackGfx3		    ; Fill

		    and	    a
		    jr	    z, UnpackGfx		    ; #80 = New	VRAM address

		    ex	    de,	hl
		    ld	    b, a
		    otir
		    ex	    de,	hl
		    jr	    UnpackGfx2


UnpackGfx3:
		    ld	    a, (de)
		    inc	    de

UnpackGfx4:
		    out	    (c), a
		    djnz    UnpackGfx4
		    jr	    UnpackGfx2

;----------------------------------------------------------------------------
;
; Clear	screen
;
; Clear	page 0,	sprite patterns	and attributes
;----------------------------------------------------------------------------

ClearScreen:
		    call    ClearSprAttr		    ; Clear sprites attributes in VRAM buffers
		    call    DisableScreen		    ; Disable screen rendering
		    call    ClearPage0			    ; Erase VRAM page 0

;----------------------------------------------------------------------------
;
; Enable screen	and sprites display
;
;----------------------------------------------------------------------------

EnableScreen:
		    ld	    a, (RG1SAV)
		    or	    40h
		    ld	    b, a
		    ld	    c, 1
		    call    WRTVDP
		    jr	    EnableSprites


;----------------------------------------------------------------------------
;
; Disable screen and sprites display
;
;----------------------------------------------------------------------------

DisableScreen:
		    ld	    a, (RG1SAV)
		    and	    10111111b
		    ld	    b, a
		    ld	    c, 1
		    call    WRTVDP
		    jr	    DisableSprites



;----------------------------------------------------------------------------
;
; Clear	page 0 and reset vertical scroll register
;
;----------------------------------------------------------------------------

ClearPage0:
		    ld	    d, 0
;----------------------------------------------------------------------------
; Clear	page and reset vertical	scroll register
;
; In: D	= VRAM page
;----------------------------------------------------------------------------

ClearPage:
		    xor	    a
		    ld	    h, a
		    ld	    l, a
		    ld	    b, a
		    ld	    c, a
		    call    FillRect

		    ld	    b, 0
		    ld	    c, 23
		    jp	    WRTVDP			    ; Reset vertical scroll register

;----------------------------------------------------------------------------
;
; Clear	sprite attributes in VRAM (the game uses double	buffer)
;
;----------------------------------------------------------------------------

ClearSprAttr:
		    ld	    hl,	0F600h			    ; VRAM address of sprite attributes	buffer 1
		    ld	    a, 0E0h			    ; Y	coordinate to hide the sprite
		    ld	    bc,	80h			    ; 32 sprites x 4 bytes of attributes
		    call    FillVRAM

		    ld	    hl,	0F200h			    ; VRAM address of sprite attributes	buffer 2
		    ld	    a, 0E0h			    ; Y	coordinate to hide the sprite
		    ld	    bc,	80h			    ; 32 sprites x 4 bytes of attributes
		    jp	    FillVRAM


;----------------------------------------------------------------------------
;
; Clear	sprite attributes in RAM buffer
;
;----------------------------------------------------------------------------

EraseSprAttRAM:
		    ld	    de,	 SprAttRAM+1
		    ld	    hl,	SprAttRAM
		    ld	    bc,	7Fh
		    ld	    (hl), 0E0h
		    ldir
		    ret


;----------------------------------------------------------------------------
;
; Disable sprites
;
;----------------------------------------------------------------------------

DisableSprites:
		    ld	    a, (RG08SAV)
		    or	    2
		    ld	    b, a
		    ld	    c, 8
		    jp	    WRTVDP


;----------------------------------------------------------------------------
;
; Enable sprites
;
;----------------------------------------------------------------------------

EnableSprites:
		    ld	    a, (RG08SAV)
		    and	    0FDh
		    ld	    b, a
		    ld	    c, 8
		    jp	    WRTVDP



;-------------------------------------------------------------------------------
;
; Set palette color
;
; In:
;     A	= Color	number
;    DE	= RGB value
;
; Stores in VRAM #f680 current palette values
;-------------------------------------------------------------------------------

SetPaletteColor:
		    push    bc
		    push    hl

		    ld	    b, a
		    ld	    a, (VDP_DW)
		    inc	    a
		    ld	    c, a

		    di
		    out	    (c), b			    ; Color number
		    ld	    a, 90h
		    out	    (c), a

		    inc	    c
		    out	    (c), d			    ; Red Blue
		    push    af
		    pop	    af
		    out	    (c), e			    ; Green
		    dec	    c

		    ld	    hl,	0F680h			    ; Palette VRAM address
		    ld	    a, b
		    add	    a, a			    ; Color number x 2 bytes
		    add	    a, l
		    ld	    l, a
		    call    SetVramAddressWR		    ; Set VRAM destination address
		    dec	    c
		    out	    (c), d			    ; Red Blue
		    out	    (c), e			    ; Green

		    pop	    hl
		    pop	    bc
		    ei
		    ret


;----------------------------------------------------------------------------
;
; Set default palette
;
;----------------------------------------------------------------------------

SetDefaultPal:
		    ld	    hl,	DefaultPalette
		    ld	    b, 16			    ; Number of	colors
		    ld	    a, 0			    ; First color number

SetDefaultPal2:
		    ld	    d, (hl)
		    inc	    hl
		    ld	    e, (hl)			    ; DE = RB0G
		    inc	    hl

		    push    af
		    call    SetPaletteColor
		    pop	    af

		    inc	    a				    ; Next color

		    djnz    SetDefaultPal2
		    ret

;----------------------------------------------------------------------------
; Default palette
;----------------------------------------------------------------------------
DefaultPalette:	    db	  0,   0
		    db	  0,   0
		    db	11h,   6
		    db	33h,   7
		    db	17h,   1
		    db	27h,   3
		    db	51h,   1
		    db	27h,   6
		    db	71h,   1
		    db	73h,   3
		    db	61h,   6
		    db	64h,   6
		    db	11h,   4
		    db	65h,   2
		    db	55h,   5
		    db	77h,   7

;----------------------------------------------------------------------------
;
; Set palette data
;
; In:
;    HL	= Pointer to palette data (color, red|blue, green)
;
;----------------------------------------------------------------------------

SetPalette:
		    ld	    a, (hl)
		    inc	    hl
		    inc	    a				    ; #FF end palette data
		    ret	    z

		    dec	    a				    ; A	= Color	number
		    ld	    d, (hl)
		    inc	    hl
		    ld	    e, (hl)			    ; DE = RB0G
		    inc	    hl
		    call    SetPaletteColor
		    jr	    SetPalette


;-------------------------------------------------------------------------------
;
; Wait until VDP command finishes
;
;-------------------------------------------------------------------------------

WaitVdpCmd:
		    ld	    a, 2
		    call    ReadStatusReg
		    rra
		    jp	    c, WaitVdpCmd
		    ret


;-------------------------------------------------------------------------------
;
; Read VDP status register
;
; In:
;    A = Status	register
;
; Out:
;    A = Result
;-------------------------------------------------------------------------------

ReadStatusReg:
		    push    bc
		    push    hl

		    ld	    hl,	(VDP_DR)
		    inc	    h
		    inc	    l
		    ld	    c, h

		    di
		    out	    (c), a			    ; Status register number
		    ld	    a, 8Fh			    ; Status register pointer
		    out	    (c), a
		    ld	    c, l
		    in	    a, (c)			    ; Read status register

		    push    af
		    xor	    a				    ; Status register 0
		    ld	    c, h
		    out	    (c), a
		    ld	    a, 8Fh			    ; Status register pointer
		    out	    (c), a
		    pop	    af

		    pop	    hl
		    pop	    bc
		    ei
		    ret


;-------------------------------------------------------------------------------
;
; Draw horizontal line
;
;
; In:
;   H =	SX
;   L =	SY
;   B =	NX
;   C =	Color
;-------------------------------------------------------------------------------

DrawLineHoriz:
		    call    WaitVdpCmd

		    push    bc

		    ld	    a, (VDP_DW)
		    inc	    a
		    ld	    c, a

		    ld	    a, 24h
		    di
		    out	    (c), a
		    ld	    a, 91h
		    out	    (c), a
		    inc	    c
		    inc	    c
		    out	    (c), h			    ; SX
		    xor	    a
		    out	    (c), a
		    out	    (c), l			    ; SY
		    out	    (c), a

		    pop	    hl

		    dec	    h
		    out	    (c), h			    ; NX
		    xor	    a
		    out	    (c), a
		    xor	    a
		    out	    (c), a
		    out	    (c), a
		    out	    (c), l			    ; Color
		    out	    (c), a
		    ld	    a, 70h
		    out	    (c), a
		    ei
		    ret


;-------------------------------------------------------------------------------
;
; Draw vertical	line
;
;
; In:
;   H =	SX
;   L =	SY
;   B =	NY
;   C =	Color
;-------------------------------------------------------------------------------


DrawLineVert:
		    call    WaitVdpCmd

		    push    bc

		    ld	    a, (VDP_DW)
		    inc	    a
		    ld	    c, a

		    ld	    a, 24h
		    di
		    out	    (c), a
		    ld	    a, 91h
		    out	    (c), a
		    inc	    c
		    inc	    c
		    out	    (c), h			    ; SX
		    xor	    a
		    out	    (c), a
		    out	    (c), l			    ; SY
		    out	    (c), a

		    pop	    hl

		    dec	    h
		    out	    (c), h			    ; NY
		    xor	    a
		    out	    (c), a
		    xor	    a
		    out	    (c), a
		    out	    (c), a
		    out	    (c), l			    ; Color
		    inc	    a
		    out	    (c), a
		    ld	    a, 70h
		    out	    (c), a
		    ei
		    ret


;-------------------------------------------------------------------------------
;
; Draw rectangle
;
; In:
;   H =	SX
;   L =	SY
;   D =	NX
;   E =	NY
;   C =	Color
;-------------------------------------------------------------------------------


DrawRect:
		    ld	    b, e
		    call    DrawLineVer_
		    ld	    b, d
		    call    DrawLineHor_

		    push    hl
		    ld	    a, l
		    dec	    a
		    add	    a, e
		    ld	    l, a			    ; SY = SY +	NY
		    ld	    b, d
		    call    DrawLineHor_
		    pop	    hl

		    ld	    a, h
		    dec	    a
		    add	    a, d
		    ld	    h, a			    ; SX = SX +	NX
		    ld	    b, e
		    jp	    DrawLineVer_


;-------------------------------------------------------------------------------
;
; Draw vertical	line (do not modify BC,	DE, HL)
;
;
; In:
;   H =	SX
;   L =	SY
;   B =	NY
;   C =	Color
;-------------------------------------------------------------------------------


DrawLineVer_:
		    push    hl
		    push    de
		    push    bc
		    call    DrawLineVert
		    pop	    bc
		    pop	    de
		    pop	    hl
		    ret



;-------------------------------------------------------------------------------
;
; Draw horizontal line (do not modify BC, DE, HL)
;
;
; In:
;   H =	SX
;   L =	SY
;   B =	NX
;   C =	Color
;-------------------------------------------------------------------------------

DrawLineHor_:
		    push    hl
		    push    de
		    push    bc
		    call    DrawLineHoriz
		    pop	    bc
		    pop	    de
		    pop	    hl
		    ret


;-------------------------------------------------------------------------------
;
; Fill rectangle
;
; A = Color
; H = DX
; L = DY
; D = Page
; B = NX (0 = 256)
; C = NY (0 = 256)
;-------------------------------------------------------------------------------

FillRect:
		    ex	    af,	af'

		    call    WaitVdpCmd			    ; Wait until the previous VDP command is finished

		    push    bc

		    ld	    a, (VDP_DW)
		    inc	    a
		    ld	    c, a

		    ld	    a, 36			    ; VDP register: Destination	X low
		    di
		    out	    (c), a
		    ld	    a, 91h			    ; Control register pointer:	VDP indirect access
		    out	    (c), a
		    inc	    c
		    inc	    c
		    out	    (c), h			    ; DX
		    xor	    a
		    out	    (c), a			    ; DX high
		    out	    (c), l			    ; DY
		    out	    (c), d			    ; DY high

		    pop	    hl

		    out	    (c), h			    ; NX
		    cp	    h
		    jr	    nz,	FillRect2
		    inc	    a				    ; if NX=0 then NX =	256

FillRect2:
		    out	    (c), a
		    xor	    a
		    out	    (c), l			    ; NY
		    cp	    l
		    jr	    nz,	FillRect3
		    inc	    a				    ; if NY=0 then NY =	256

FillRect3:
		    out	    (c), a

		    ex	    af,	af'

		    out	    (c), a
		    xor	    a
		    out	    (c), a
		    ld	    a, 0C0h
		    out	    (c), a
		    ei
		    ret



;-------------------------------------------------------------------------------
;
; HMMM command
;
; In:
;   BC = NX, NY
;    H = SX
;    L = SY
;    A = Pagina	Org/des	xxxxDDOO
;    D = DX
;    E = DY
;-------------------------------------------------------------------------------

VDP_Copy_Byte:
		    ex	    af,	af'

		    call    WaitVdpCmd

		    push    bc

		    ld	    a, (VDP_DW)
		    inc	    a
		    ld	    c, a

		    ld	    a, 32			    ; Control register pointer
		    di
		    out	    (c), a
		    ld	    a, 91h
		    out	    (c), a
		    inc	    c
		    inc	    c
		    out	    (c), h			    ; SXl
		    xor	    a
		    out	    (c), a			    ; SXh
		    out	    (c), l			    ; SYl

		    ex	    af,	af'

		    ld	    l, a
		    and	    3
		    out	    (c), a			    ; SYh
		    out	    (c), d			    ; DXl
		    xor	    a
		    out	    (c), a			    ; DXh
		    out	    (c), e			    ; DYl
		    ld	    a, l
		    rra
		    rra
		    and	    3
		    out	    (c), a			    ; DYh

		    pop	    hl

		    out	    (c), h			    ; NXl
		    xor	    a
		    out	    (c), a			    ; NXh
		    out	    (c), l			    ; NYl
		    out	    (c), a			    ; NYh
		    out	    (c), a			    ; Color
		    out	    (c), a			    ; Argument
		    ld	    a, 0D0h			    ; HMMM VDP Command
		    out	    (c), a
		    ei
		    ret


;-------------------------------------------------------------------------------
;
; LMMM / LMMV command
;
; In:
;   BC = NX, NY
;    H = SX
;    L = SY
;    A = Pagina	Org/des	OODDLLLL (LLLL = Logical operation)
;    D = DX
;    E = DY
;    Si	el destino es la 1, modifica el	color
;-------------------------------------------------------------------------------

VDP_Copy_Dot:
		    ex	    af,	af'

		    call    WaitVdpCmd

		    push    bc

		    ld	    a, (VDP_DW)
		    inc	    a
		    ld	    c, a
		    ld	    a, 20h
		    di
		    out	    (c), a
		    ld	    a, 91h			    ; Control register pointer
		    out	    (c), a
		    inc	    c
		    inc	    c
		    out	    (c), h			    ; SX
		    xor	    a
		    out	    (c), a			    ; SXh
		    out	    (c), l			    ; SY

		    ex	    af,	af'

		    rlca
		    rlca
		    ld	    l, a
		    and	    3
		    out	    (c), a			    ; SYh
		    out	    (c), d			    ; DX
		    xor	    a
		    out	    (c), a			    ; DXh
		    out	    (c), e			    ; DY
		    ld	    a, l
		    ld	    e, a
		    rlca
		    rlca
		    and	    3
		    out	    (c), a			    ; DYh

		    pop	    hl

		    out	    (c), h			    ; NX
		    xor	    a
		    out	    (c), a			    ; NXh
		    out	    (c), l			    ; NY
		    out	    (c), a			    ; NYh
		    out	    (c), a			    ; Color
		    out	    (c), a			    ; Argument
		    ld	    a, e
		    rra
		    rra
		    and	    0Fh				    ; Logical operation
		    or	    90h				    ; LMMM
		    out	    (c), a
		    ei
		    ret

;-------------------------------------------------------------------------------
; Load 1bpp graphic
;
; In:
;   HL = Source	data
;    D = DX
;    E = DY
;    C = Color
;    B = Number	of tiles
;-------------------------------------------------------------------------------

Load1bppTiles:
		    call    Load1bppTile
		    call    CalcNextCharPos
		    djnz    Load1bppTiles
		    ret


Load1bppTile:
		    push    bc
		    push    de
		    push    hl

		    push    de
		    call    Decode1bppTile
		    pop	    de

; Convert DX,DY	coordinates to VRAM address in page 1
		    ld	    b, d
		    ld	    d, e
		    ld	    e, b			    ; D	= DY, E	= DX
		    srl	    d
		    rr	    e				    ; Each byte	represent 2 pixels. So divide by 2
		    ld	    a, d
		    add	    a, 80h			    ; #8000 = VRAM address page	1
		    ld	    d, a			    ; DE = VRAM	address	of (DX,	DY)

		    ld	    hl,	DecodeTileBuf
		    call    LoadTileGfx			    ; Transfer one tile	from RAM to VRAM

		    pop	    hl
		    ld	    bc,	8			    ; 8	bytes =	8 lines
		    add	    hl,	bc			    ; HL = Pointer to the next 1bpp tile
		    pop	    de
		    pop	    bc
		    ret

;-------------------------------------------------------------------------------
;
; Transfer one tile from RAM (linear) to VRAM
;
; In:
;   HL = Source	address
;   DE = Destination VRAM address
;
;-------------------------------------------------------------------------------

LoadTileGfx:
		    push    de
		    ld	    b, 8			    ; 8	lines per tile

LoadTileGfx2:
		    push    bc

		    ld	    bc,	4			    ; 4	bytes =	8 pixels in screen 5 (1	line of	the 8x8	tile)
		    call    RAMtoVRAM			    ; Transfer 8 pixels

		    ex	    de,	hl
		    ld	    bc,	80h			    ; #80 bytes	= 256 pixels. Next row.
		    add	    hl,	bc
		    ex	    de,	hl			    ; DE = Next	row VRAM address of the	tile

		    pop	    bc
		    djnz    LoadTileGfx2		    ; Transfer another line of the tile

		    pop	    de				    ; Restore destination address
		    ret

;-------------------------------------------------------------------------------
; Load tiles gfx from ROM/RAM to VRAM
;
; In:
;    HL	= Source address
;    DE	= Destination address
;     B	= Number of tiles
;-------------------------------------------------------------------------------

LoadTilesGfx:
		    push    bc

		    call    LoadTileGfx			    ; Transfer one tile	from RAM (linear) to VRAM

		    ld	    a, 4			    ; 4	bytes =	8 pixels in SCREEN 5 mode
		    add	    a, e			    ; VRAM address + 4 (next tile address)
		    cp	    80h				    ; End of line? (DX = 256)
		    jr	    nz,	LoadTilesGfx2

		    ld	    a, 4			    ; 4	* 256 =	8 VRAM lines
		    add	    a, d			    ; Calc. the	address	of the next row	of tiles (DY = DY + 8)
		    ld	    d, a
		    xor	    a				    ; X	= 0

LoadTilesGfx2:
		    ld	    e, a

		    pop	    bc				    ; B	= Number of tiles
		    djnz    LoadTilesGfx
		    ret


;-------------------------------------------------------------------------------
; Load flipped tiles gfx from RAM to VRAM
;
; In:
;    HL	= Source address
;    DE	= Destination address
;     B	= Number of tiles
;-------------------------------------------------------------------------------

LoadTilesGfxFlip:
		    push    bc
		    push    de

		    ld	    de,	 DecodeTileBuf+3
		    ld	    c, 8			    ; 8	lines

LoadTilesGfxFlip2:
		    ld	    b, 4			    ; 4	bytes =	8 pixels

LoadTilesGfxFlip3:
		    ld	    a, (hl)
		    rrca
		    rrca
		    rrca
		    rrca				    ; swap nibbles
		    ld	    (de), a			    ; Save the result in the gfx buffer
		    dec	    de				    ; Previous gfx buffer address
		    inc	    hl
		    djnz    LoadTilesGfxFlip3		    ; Next byte	/ two pixels

		    ld	    a, 8
		    call    ADD_DE_A
		    dec	    c
		    jr	    nz,	LoadTilesGfxFlip2

		    pop	    de				    ; Destination VRAM address

		    push    hl
		    ld	    hl,	DecodeTileBuf
		    call    LoadTileGfx			    ; Transfer the flipped tile	from RAM to VRAM
		    pop	    hl

		    ld	    a, 4			    ; Destination +8 pixels (next tile address)
		    add	    a, e
		    cp	    80h				    ; X	= 256?
		    jr	    nz,	LoadTilesGfxFlip4

		    ld	    a, 4			    ; 4	* 256 =	8 VRAM lines.
		    add	    a, d			    ; Next row of tiles
		    ld	    d, a			    ; Y	= Y + 8
		    xor	    a				    ; X	= 0

LoadTilesGfxFlip4:
		    ld	    e, a			    ; DE = VRAM	address
		    pop	    bc

		    djnz    LoadTilesGfxFlip
		    ret


;-------------------------------------------------------------------------------
; Decode a tile	(8x8 pixels) in	1bpp format
;
; In:
;   HL = Gfx data address
;    C = Color
;
;-------------------------------------------------------------------------------

Decode1bppTile:
		    ld	    b, 8			    ; 8	lines
		    ld	    de,	DecodeTileBuf

Decode1bppTile2:
		    push    bc
		    push    hl

		    ex	    de,	hl			    ; DE = data	address

		    ld	    a, (de)
		    ld	    d, a			    ; D	= Pixels in 1bbp

		    ld	    b, 4			    ; 4	bytes =	8 pixels

Decode1bppTile3:
		    ld	    a, c			    ; A	= Color	number
		    rl	    d				    ; rotate left D register bit7 -> bit0 & (carry flag)
		    jr	    c, Decode1bppTile4

		    xor	    a				    ; Color 0

Decode1bppTile4:
		    rld					    ; 4bit rotation A(HL)
							    ; A	low nibble -> (HL) -> low nibble
							    ; (HL) low nibble -> (HL) -> high nibble
							    ; (HL) high	nibble -> A -> low nibble
		    ld	    a, c			    ; A	= Color
		    rl	    d				    ; Check next bit
		    jr	    c, Decode1bppTile5

		    xor	    a				    ; Color 0

Decode1bppTile5:
		    rld					    ; Set result in (HL)
		    inc	    hl
		    djnz    Decode1bppTile3

		    ex	    de,	hl

		    pop	    hl
		    inc	    hl				    ; Pointer to next data byte
		    pop	    bc

		    djnz    Decode1bppTile2
		    ret


;-------------------------------------------------------------------------------
;
; Print	white text
;
; In:
;   HL = Pointer to text data
;   +0:	XY
;   +2:	text
;  ...:	FF = End, FE = Set new XY
;
;-------------------------------------------------------------------------------

PrintTextXY:
		    ld	    c, 0FFh
		    jr	    PrintTextGetXY


;-------------------------------------------------------------------------------
;
; Erase	text
;
;-------------------------------------------------------------------------------

EraseTextXY:
		    ld	    c, 0

PrintTextGetXY:
		    ld	    d, (hl)
		    inc	    hl
		    ld	    e, (hl)			    ; DE = XY
		    inc	    hl

PrintText:
		    ld	    a, (hl)
		    inc	    hl
		    cp	    0FFh
		    ret	    z				    ; FF = End of text

		    cp	    0FEh
		    jr	    z, PrintTextGetXY		    ; Set new XY

		    push    af
		    call    DrawChar
		    pop	    af

		    ld	    b, 8			    ; char width
		    cp	    97h
		    jr	    z, PrintText2

		    sub	    98h
		    jr	    nz,	PrintText3

PrintText2:
		    ld	    b, 4			    ; char width

PrintText3:
		    ld	    a, d
		    add	    a, b
		    ld	    d, a
		    jr	    PrintText

;----------------------------------------------------------------------------
;
; Print	char
;
; In:
;    A = Char (A=0 or C=0 : Erase char)
;   DE = XY
;
;----------------------------------------------------------------------------

DrawChar:
		    push    bc
		    push    hl
		    push    de

		    and	    a				    ; Char = 0?
		    ld	    hl,	0			    ; XY = 0
		    jr	    z, DrawChar2

		    dec	    c
		    inc	    c				    ; C=0? Erase char
		    jr	    z, DrawChar2

		    add	    a, 10h			    ; "0" (#30) + #10 = tile #40
		    call    GetTileXY			    ; Get tile coordinates

		    ld	    a, 30h
		    add	    a, l
		    ld	    l, a			    ; SY = SY +	#30 -> Font SY in VRAM page 1

DrawChar2:
		    ld	    bc,	808h			    ; (8x8)
		    ld	    a, 1			    ; From page	1 to page 0
		    call    VDP_Copy_Byte

		    pop	    de
		    pop	    hl
		    pop	    bc
		    ret


;----------------------------------------------------------------------------
;
; Draw tile from page 1	to page	0
;
; In:
;    A = Tile
;    D = X
;    E = Y
;----------------------------------------------------------------------------

DrawTile:
		    push    bc
		    push    hl
		    push    de

		    call    GetTileXY			    ; Get tile coordinates
		    ld	    bc,	808h			    ; 8x8

		    ld	    a, 1			    ; From VRAM	page 1 to 0
		    call    VDP_Copy_Byte

		    pop	    de
		    pop	    hl
		    pop	    bc
		    ret


;----------------------------------------------------------------------------
;
; Draw tile with transparency from page	1 to page 0
;
; In:
;    A = Tile
;    D = X
;    E = Y
;----------------------------------------------------------------------------

DrawTileTIMP:
		    push    bc
		    push    hl
		    push    de

		    ld	    hl,	TilesetBank		    ; 0=First bank of 256 tiles, 1=Second bank

		    bit	    0, (hl)
		    jr	    z, DrawTileTIMP2		    ; Main bank

		    call    GetTileXY_B2		    ; Get the tile coordinates in bank 2
		    jr	    DrawTileTIMP3


DrawTileTIMP2:
		    call    GetTileXY			    ; Get tile coordinates

DrawTileTIMP3:
		    ld	    bc,	808h
		    ld	    a, 48h			    ; Page 1 to	0, TIMP	operation
		    call    VDP_Copy_Dot
		    call    WaitVdpCmd

		    pop	    de
		    pop	    hl
		    pop	    bc
		    ret


;-------------------------------------------------------------------------------
;
; Draw tile from page 1	to page	1
;
; In:
;    A = Tile
;    D = X
;    E = Y
;-------------------------------------------------------------------------------

DrawTile_P1:
		    push    bc
		    push    hl
		    push    de

		    call    GetTileXY			    ; Get tile coordinates

		    ld	    bc,	808h
		    ld	    a, 101b
		    call    VDP_Copy_Byte

		    pop	    de
		    pop	    hl
		    pop	    bc
		    ret



;-------------------------------------------------------------------------------
;
; Draw a tile in the pitfall buffer
;
; In:
;    A = Tile
;    D = X
;    E = Y
;-------------------------------------------------------------------------------

DrawPitfallTile:
		    push    bc
		    push    hl
		    push    de

		    call    GetPitfallXY		    ; The tiles	of the pitfall are not in a tile bank but in an	empty VRAM area

		    ld	    bc,	808h
		    ld	    a, 101b
		    call    VDP_Copy_Byte

		    pop	    de
		    pop	    hl
		    pop	    bc
		    ret


;-------------------------------------------------------------------------------
;
; Get tile coordinates in tileset
;
; In:
;    A = Tile
; Out:
;    H = X
;    L = Y
;
;-------------------------------------------------------------------------------

GetTileXY:
		    ld	    b, a			    ; Get tile coordinates
		    and	    1Fh
		    add	    a, a
		    add	    a, a
		    add	    a, a
		    ld	    h, a
		    ld	    a, b
		    and	    0E0h
		    rrca
		    rrca
		    ld	    l, a
		    ret


;-------------------------------------------------------------------------------
;
; Get tile coordinates in tileset 2
;
; In:
;    A = Tile
; Out:
;    H = X
;    L = Y
;
;-------------------------------------------------------------------------------

GetTileXY_B2:
		    call    GetTileXY			    ; Get tile coordinates (2nd	bank)
		    ld	    a, 80h
		    add	    a, l
		    ld	    l, a			    ; Y	= Y + 128
		    ret


;-------------------------------------------------------------------------------
;
; Get pitfall tile coordinates
;
; In:
;    A = Tile
; Out:
;    H = X
;    L = Y
;
;-------------------------------------------------------------------------------

GetPitfallXY:
		    ld	    b, a
		    and	    1Fh
		    add	    a, a
		    add	    a, a
		    add	    a, a
		    add	    a, 38h			    ; Offset x to pitfall tiles
		    ld	    h, a
		    ld	    a, b
		    and	    0E0h
		    rrca
		    rrca
		    ld	    l, a
		    ld	    a, 98h			    ; Offset Y to pitfall tiles
		    add	    a, l
		    ld	    l, a
		    ret



;-------------------------------------------------------------------------------
;
; Calculate the	coordinates of the next	tile to	draw
; X = X	+ 8. If	X = 0 then Y = Y + 8
;
;-------------------------------------------------------------------------------

CalcNextCharPos:
		    ld	    a, d
		    add	    a, 8
		    ld	    d, a
		    ret	    nz

		    ld	    a, e
		    add	    a, 8
		    ld	    e, a
		    ret



;-------------------------------------------------------------------------------
;
; Draw pitfall tiles
;
; In:
;   HL = Pointer to pitfall tiles map
;
;-------------------------------------------------------------------------------

DrawPitfallTiles:
		    push    de

DrawPitfallTiles2:
		    ld	    a, (hl)
		    inc	    hl
		    ld	    c, a
		    inc	    a
		    jr	    z, DrawPitfallTiles4	    ; FF = end

		    inc	    a				    ; FE = Next	row
		    jr	    nz,	DrawPitfallTiles3

		    pop	    de

		    ld	    a, 8
		    add	    a, e
		    ld	    e, a
		    jr	    DrawPitfallTiles


DrawPitfallTiles3:
		    ld	    a, c
		    call    DrawPitfallTile
		    call    CalcNextCharPos
		    jr	    DrawPitfallTiles2


DrawPitfallTiles4:
		    pop	    de
		    ret

;-------------------------------------------------------------------------------
;
; Load 2bpp tiles gfx
;
; In:
;   HL = 2bpp gfx
;   DE = Destination address
;    B = Number	of tiles
;-------------------------------------------------------------------------------

Load2bppTile:
		    push    bc
		    exx
		    ld	    hl,	BufferGfx		    ; Buffer used to decode 2bpp and 3bpp graphics
		    exx

		    push    de
		    call    Decode2bppTile		    ; Decode a tile in 2 bits per pixel	format
		    pop	    de

		    push    hl
		    ld	    hl,	BufferGfx		    ; Buffer used to decode 2bpp and 3bpp graphics
		    ld	    b, 1			    ; 1	tile
		    call    LoadTilesGfx		    ; Transfer tiles from RAM to VRAM
		    pop	    hl

		    pop	    bc
		    djnz    Load2bppTile
		    ret



;----------------------------------------------------------------------------
;
; Decode a tile	in 2 bit per pixel format
;
; In:
;   HL = Gfx data
;    B = Number	of tiles
; exHL = Gfx RAM buffer
;----------------------------------------------------------------------------

Decode2bppTile:
		    ld	    b, 8

Decode2bppTile2:
		    push    bc
		    call    Decode2bppRow
		    pop	    bc
		    djnz    Decode2bppTile2
		    ret



;----------------------------------------------------------------------------
;
; Decode 8 pixels in 2 bit per pixel format
;
; In:
;   HL = Gfx data
; exHL = Gfx RAM buffer
;----------------------------------------------------------------------------

Decode2bppRow:
		    ld	    b, 4
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)			    ; DE = 2bpp	data
		    inc	    hl

Decode2bppRow2:
		    xor	    a
		    rl	    d
		    rla
		    rl	    e
		    rla					    ; A	= 2 bits color index

		    exx
		    ld	    e, a
		    ld	    d, BufferColor/256;		0E7h			    ; (!?) #E700 (BufferColor) + color index
		    ld	    a, (de)
		    add	    a, a
		    add	    a, a
		    add	    a, a
		    add	    a, a
		    ld	    c, a			    ; C	= Color	pixel 1	(high nible)
		    exx

		    xor	    a
		    rl	    d
		    rla
		    rl	    e
		    rla					    ; A	= 2 bits color index

		    exx
		    ld	    e, a
		    ld	    d, BufferColor/256;		0E7h			    ; (!?) #E700 (BufferColor) + color index
		    ld	    a, (de)			    ; A	= Color	pixel 2	(low nibble)
		    or	    c
		    ld	    (hl), a
		    inc	    hl
		    exx
		    djnz    Decode2bppRow2
		    ret


;----------------------------------------------------------------------------
;
; Decode 3 bit per pixel tiles
;
; In:
;   HL = Gfx data
;   DE = VRAM address
;    B = Number	of tiles
;----------------------------------------------------------------------------

Load3bppTiles:
		    push    bc

		    exx
		    ld	    hl,	BufferGfx		    ; Buffer used to decode 2bpp and 3bpp graphics
		    exx

		    push    de
		    call    Decode3bppTile
		    pop	    de

		    push    hl
		    ld	    hl,	BufferGfx		    ; Buffer used to decode 2bpp and 3bpp graphics
		    ld	    b, 1
		    call    LoadTilesGfx
		    pop	    hl

		    pop	    bc				    ; Number of	tiles
		    djnz    Load3bppTiles
		    ret


Load3bppTileFlip:
		    push    bc

		    exx
		    ld	    hl,	BufferGfx		    ; Buffer used to decode 2bpp and 3bpp graphics
		    exx

		    push    de
		    call    Decode3bppTile		    ; Decode a tile in 3 bits per pixel	format
		    pop	    de

		    push    hl
		    ld	    hl,	BufferGfx		    ; Buffer used to decode 2bpp and 3bpp graphics
		    ld	    b, 1
		    call    LoadTilesGfxFlip
		    pop	    hl

		    pop	    bc
		    djnz    Load3bppTileFlip
		    ret


;----------------------------------------------------------------------------
;
; Decode a tile	in 3 bits per pixel format
;
; In:
;   HL = Gfx data
;    B = Number	of tiles
; exHL = Gfx RAM buffer
;----------------------------------------------------------------------------

Decode3bppTile:
		    ld	    b, 8			    ; Number of	lines

Decode3bppTile2:
		    push    bc
		    call    Decode3bpp			    ; Decode a line of the tile	(8 pixels)
		    pop	    bc

		    djnz    Decode3bppTile2
		    ret


;----------------------------------------------------------------------------
;
; Decode 8 pixels in 3 bits per	pixel format
;
; In:
;   HL = Gfx data
; exHL = Gfx RAM buffer
;----------------------------------------------------------------------------

Decode3bpp:
		    ld	    b, 4			    ; 4	bytes =	8 pixels in SCREEN 5 mode

		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)
		    inc	    hl
		    ld	    c, (hl)
		    inc	    hl				    ; CDE = 3bpp data

Decode3bpp2:
		    xor	    a
		    rl	    c
		    rla
		    rl	    d
		    rla
		    rl	    e
		    rla					    ; A	= 3 bits color index

		    exx
		    ld	    e, a
		    ld	    d, BufferColor/256;		0E7h			    ; (!?) #E700 (BufferColor) + color index
		    ld	    a, (de)
		    add	    a, a
		    add	    a, a
		    add	    a, a
		    add	    a, a			    ; x16 = high nible
		    ld	    c, a			    ; C	= Color	pixel 1	(high nible)
		    exx

		    xor	    a
		    rl	    c
		    rla
		    rl	    d
		    rla
		    rl	    e
		    rla					    ; A	= 3 bits color index

		    exx
		    ld	    e, a
		    ld	    d, BufferColor/256;		0E7h			    ; (!?) #E700 (BufferColor) + color index
		    ld	    a, (de)			    ; A	= Color	pixel 2	(low nibble)
		    or	    c				    ; A	= Both pixels colors
		    ld	    (hl), a			    ; Store the	result in the gfx buffer
		    inc	    hl				    ; Next buffer address
		    exx

		    djnz    Decode3bpp2
		    ret

;----------------------------------------------------------------------------
;
; Get pointer to text and text box type
;
; In:
;  (TextId) = Text number ID
;
; Out:
;  (TextPointer) = Pointer to text
;  (TextBoxType) = Type	of text	box
;
;    High nibble = Show	prompt icon, low nibble	= text box type
;    Types:
;    0 = 1 line	x 7 characters
;    1 = 3 lines x 19 characters
;    2 = 5 lines x 16 characters
;    3 = 5 lines x 23 characters
;    4 = 2 lines x 17 characters
;----------------------------------------------------------------------------

GetText:
		    call    SetBanks_A_B_C

		    xor	    a
		    ld	    (SkipTextF), a

		    ld	    a, (TextId)			    ; Text ID
		    dec	    a
		    ld	    de,	idxTexts
		    call    GetPointerDE2A


		    ld	    (TextPointer), de		    ; Pointer to text

		    ld	    a, (de)
		    ld	    (TextBoxType), a		    ; Text box type

SetBanks1_2_3_e:
		    jp	    SetBanks1_2_3

;----------------------------------------------------------------------------
;
; Decode text and put it in the	text buffer.
; The text can include tokens that are replaced	by predefined words/text fragments
;
; Out:
;    A = 0 Text	finished
;    A = 1 Wait	next page
;
;----------------------------------------------------------------------------

DecodeText:
		    call    SetBanks_A_B_C

		    ld	    de,	TextBuffer		    ; Pointer to text buffer
		    ld	    hl,	(TextPointer)		    ; Pointer to text to decode

DecodeText2:
		    ld	    a, (hl)
		    inc	    a				    ; FF = End
		    jr	    z, DecodeTextEnd

		    inc	    a				    ; FE = New line
		    jr	    z, DecodeText3

		    inc	    a				    ; FD = Next	page
		    jr	    z, DecodeTextEnd2

		    ld	    a, (hl)
		    cp	    0A1h			    ; Is it a dictionary word?
		    jp	    nc,	AddDictEntry		    ; Yes, decode token

DecodeText3:
		    ld	    a, (hl)
		    ld	    (de), a			    ; Add character to text buffer

		    inc	    de
		    inc	    hl
		    jr	    DecodeText2


DecodeTextEnd:
		    xor	    a
		    jr	    DecodeTextEnd3


DecodeTextEnd2:
		    ld	    a, 1

DecodeTextEnd3:
		    jr	    SetBanks1_2_3_e

;----------------------------------------------------------------------------
;
; Replace a token by a dictionary entry
;
;----------------------------------------------------------------------------

AddDictEntry:
	if	(JAPANESE)
		    cp     #d9        
		    ld     c,a        
		    jr     nz,AddDictEntry1   
		    
		    ld     a,#01      
		    ld     (flagTxtItem),a
AddDictEntry1:
		    ld     a,c 
	ENDIF
		    sub	    0A1h			    ; A	= Dictionary index

		    inc	    hl

		    push    hl
		    push    de

		    ld	    de,	idxDictionary		    ; Index of dictionary entries
		    call    GetPointerDE2A
		    ex	    de,	hl			    ; HL = Pointer to dictionary entry

		    pop	    de

AddDictEntry2:
		    ld	    a, (hl)			    ; Transfer dictionary entry
		    inc	    a				    ; FF = End
		    jr	    z, AddDictEntry3

		    dec	    a
		    ld	    (de), a			    ; Add character to text buffer

		    inc	    de
		    inc	    hl
		    jr	    AddDictEntry2


AddDictEntry3:
		    pop	    hl
		    jr	    DecodeText2


	
	include	"logic/regionlock.asm"


;----------------------------------------------------------------------------
;
; Update Solid Snake sprite attributes depending on current animation frame
; Sprites position and pattern
;
;----------------------------------------------------------------------------

SetSnakeSprAtt:
		    call    SetBanks_A_B_C

		    ld	    de,	SnakeSprAttIds		    ; List of attributes sets IDs
		    ld	    a, (SnakeSprId)		    ; Current Snake sprite ID
		    call    ADD_DE_A
		    ld	    a, (de)			    ; Sprites attributes ID

		    ld	    de,	idxSnakeSprAttr
		    call    GetPointerDE2A		    ; DE = Pointer to attributes for current frame

		    ld	    a, (Room)			    ; Current room
		    cp	    240				    ; Elevator?
		    ld	    hl,	SprAttRAM		    ; Use sprite layer 0 by default
		    jr	    c, SetSnakeSprAtt2

		    cp	    251				    ; Ending?
		    jr	    z, SetSnakeSprAtt2

		    ld	    hl,	SnakeAttrLow		    ; Sprite layer 16 in elevator rooms

SetSnakeSprAtt2:
		    ex	    de,	hl

		    ld	    b, (hl)			    ; Number of	sprites
		    inc	    hl
		    ld	    c, 0FFh			    ; Used for the LDI

SetSnakeSprAtt3:
		    ld	    a, (hl)
		    cp	    80h
		    ld	    a, 0E0h			    ; Hidden Y
		    jr	    z, SetSnakeSprAtt4

		    ld	    a, (PlayerY)
		    add	    a, (hl)			    ; Add Y offset

SetSnakeSprAtt4:
		    ld	    (de), a

		    inc	    hl
		    inc	    e
		    ld	    a, (PlayerX)
		    add	    a, (hl)			    ; Add X offset
		    ld	    (de), a

		    inc	    hl
		    inc	    e
		    ldi					    ; Sprite pattern number

		    inc	    hl
		    inc	    e
		    djnz    SetSnakeSprAtt3

		    jr	    SetSnakeSprEnd

;----------------------------------------------------------------------------
;
; Update player's sprites colors depending on current animation frame
; Each sprite has the same color in its	16 lines
;
;----------------------------------------------------------------------------

SetSnakeSprCol:
		    call    SetBanks_A_B_C

		    ld	    de,	SnakeSprAttIds		    ; List of attributes sets IDs
		    ld	    a, (SnakeSprId)
		    call    ADD_DE_A
		    ld	    a, (de)			    ; Sprites attributes set ID

		    ld	    de,	idxSnakeSprAttr
		    call    GetPointerDE2A		    ; DE = Pointer to attributes for current frame

		    ld	    a, (Room)
		    cp	    240				    ; Elevator?
		    ld	    hl,	0E800h			    ; Sprite color table address (layer	0)

		    jr	    c, SetSnakeSprCol2
		    ld	    hl,	0E900h			    ; Sprite color table address (layer	16)

SetSnakeSprCol2:
		    ex	    de,	hl

		    ld	    a, (DamageDelayTimer)
		    and	    a				    ; flashing colors to show damage?
		    jr	    z, SetSnakeSprCol3

		    ld	    a, (TickCounter)
		    bit	    0, a			    ; One frame	red, one frame normal
		    jr	    nz,	SetSnakeSprCol3

		    ld	    hl,	SnakeAttrDamage		    ; Red color	to show	damage

SetSnakeSprCol3:
		    ld	    c, (hl)			    ; Number of	sprites	used
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl

SetSnakeSprCol4:
		    ld	    a, (hl)			    ; Color
		    ld	    b, 16			    ; 16 lines

SetSnakeSprCol5:
		    ld	    (de), a
		    inc	    de
		    djnz    SetSnakeSprCol5

		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl				    ; Pointer to nexr sprite color
		    dec	    c				    ; Decrement	number of sprites
		    jr	    nz,	SetSnakeSprCol4

SetSnakeSprEnd:
		    jp	    SetBanks1_2_3



;----------------------------------------------------------------------------
;
; Update Snake sprite attributes and colors
;
;----------------------------------------------------------------------------

UpdateSnakeSpr:
		    call    SetSnakeSprAtt		    ; Update Snake sprite attributes (position and pattern)
		    call    SetSnakeSprCol		    ; Update Snake sprite colors

;----------------------------------------------------------------------------
;
; Load Snake sprite patterns depending on current animation frame
;
;----------------------------------------------------------------------------

SetSnakeSprPatt:
		    ld	    hl,	0F800h			    ; Sprite pattern generator address
		    call    SetVramAddressWR		    ; Set destination VRAM address

		    ld	    de,	idxSnakeSpr		    ; Index of Snake sprites graphics
		    ld	    a, (SnakeSprId)		    ; Current sprite ID
		    call    SetBanks_A_B_C
		    call    GetPointerDE2A		    ; Pointer to packed	sprite

		    ex	    de,	hl
		    ld	    a, (VDP_DW)
		    ld	    c, a

SetSnakeSprPatt2:
		    ld	    a, (hl)
		    and	    7Fh
		    jr	    z, SetSnakeSprEnd		    ; #00 or #80 End of	data

		    cp	    (hl)			    ; <#80 = Repeat value
		    jr	    z, SetSnakeSprPatt3

		    ld	    b, a			    ; bit7=1, transfer bit6-0 bytes
		    inc	    hl
		    otir
		    jr	    SetSnakeSprPatt2


SetSnakeSprPatt3:
		    ld	    b, a			    ; Number of	equal bytes
		    inc	    hl
		    ld	    a, (hl)			    ; Byte to repeat
		    inc	    hl

SetSnakeSprPatt4:
		    out	    (c), a
		    djnz    SetSnakeSprPatt4
		    jr	    SetSnakeSprPatt2



;----------------------------------------------------------------------------
;
; Add to a shot	structure the attributes of the	sprites	used
;
; In:
;   IX = Pointer to shot structure
;----------------------------------------------------------------------------

SetShotSpr:
		    call    SetBanks_A_B_C

		    ld	    a, (ix+PLAYER_SHOT.SpriteID)
		    ld	    de,	idxShotSprAtt
		    call    GetPointerDE2A

		    push    ix
		    pop	    hl				    ; Pointer to shot structure

		    ld	    a, ACTOR.Spr1Y		    ; Offset to	shot sprite1 Y
		    call    ADD_HL_A

		    ld	    a, (ix+PLAYER_SHOT.NumSprites)
		    ld	    b, a			    ; Number of	sprites	used by	the shot

SetShotSpr2:
		    ld	    a, (de)
		    cp	    80h
		    jr	    nz,	SetShotSpr3

		    ld	    (hl), 0E1h			    ; Hidden
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    jr	    SetShotSpr4


SetShotSpr3:
		    add	    a, (ix+PLAYER_SHOT.Y)
		    ld	    (hl), a			    ; Shot sprite Y

		    inc	    de
		    inc	    hl
		    ld	    a, (de)
		    add	    a, (ix+PLAYER_SHOT.X)
		    ld	    (hl), a			    ; Shot sprite X

		    inc	    de
		    inc	    hl
		    ld	    a, (de)
		    ld	    (hl), a			    ; Shot sprite pattern

		    inc	    hl
		    inc	    de
		    ld	    a, (de)
		    ld	    (hl), a			    ; Shot sprite color

SetShotSpr4:
		    inc	    hl
		    inc	    hl
		    inc	    de
		    djnz    SetShotSpr2
		    jp	    SetBanks1_2_3


;----------------------------------------------------------------------------
;
; Initialize lasers actor structures
;
;----------------------------------------------------------------------------

InitLaserRoom:
		    ld	    a, (AlertMode)
		    and	    a
		    jp	    nz,	DismissActor		    ; There are	no laser beams in alert	mode

		    ld	    a, (Room)
		    sub	    24				    ; Lasers room 1 (24)
		    ld	    de,	LasersRoom24
		    jr	    z, InitLaserRoom2

		    dec	    a				    ; Lasers room 2 (25)
		    ld	    de,	LasersRoom25
		    jr	    z, InitLaserRoom2

		    ld	    de,	LasersRoom72

InitLaserRoom2:
		    call    SetBanks_A_B_C

		    ld	    hl,	EnemyList		    ; Array of enemies in the room
		    ld	    a, (de)			    ; Number of	laser beans
		    ld	    (NumEnemies), a
		    inc	    de
		    ld	    b, a

InitLaserRoom3:
		    push    bc
		    push    hl
		    push    de

		    ld	    (hl), ID_LASER		    ; 0	= ID


		    inc	    hl
		    ld	    a, (de)			    ; 1	= Status
		    ld	    (hl), a
		    ld	    (TempData),	a

		    inc	    de
		    inc	    hl
		    ld	    (hl), 0			    ; 2	= YDec

		    inc	    hl
		    ld	    a, (de)			    ; 3	= Y
		    ld	    (hl), a
		    ld	    c, a

		    inc	    de
		    inc	    hl
		    ld	    (hl), 0			    ; 4	= XDec

		    inc	    hl
		    ld	    a, (de)			    ; 5	= X
		    ld	    (hl), a
		    ld	    b, a
		    ld	    (TempData+1), bc		    ; XY

		    inc	    de
		    inc	    hl
		    ld	    (hl), 0			    ; 6	= Disable movement

		    ld	    a, 7
		    call    ADD_HL_A
		    ld	    (hl), 1			    ; 13 = Life

		    inc	    hl
		    ld	    a, (TempData)
		    ld	    (hl), a			    ; 14 = Collisions config. =	status (Check collisions with the player ON/OFF)

		    inc	    hl
		    inc	    hl
		    ld	    (hl), 0			    ; 16

		    inc	    hl
		    inc	    hl
		    inc	    hl
		    ld	    a, (de)
		    ld	    (hl), a			    ; 19 = DY VRAM buffer
		    ld	    c, a

		    inc	    de
		    inc	    hl
		    ld	    a, (de)
		    ld	    (hl), a			    ; 20 = DX VRAM buffer
		    ld	    b, a
		    ld	    (TempData2+1), bc		    ; Enemy XY,	MetaTileSetAddr

		    inc	    de
		    inc	    hl
		    ld	    a, (de)
		    ld	    (hl), a			    ; 21 = Lenght
		    ld	    b, a

		    inc	    de
		    inc	    hl
		    ld	    a, (de)
		    ld	    (hl), a			    ; 22 = Vert/Horiz

		    ld	    c, 2
		    ld	    hl,	(TempData+1)		    ; SX,SY
		    ld	    de,	(TempData2+1)		    ; DX,DY
		    rra
		    jr	    c, InitLaserRoom4

		    ld	    a, b
		    ld	    b, c
		    ld	    c, a

InitLaserRoom4:
		    ld	    a, 4
		    call    VDP_Copy_Byte		    ; Save background

		    pop	    de
		    pop	    hl
		    pop	    bc

		    ld	    a, 7
		    call    ADD_DE_A			    ; Next beam	data

		    ld	    a, 80h
		    call    ADD_HL_A			    ; Pointer to next actor structure

		    djnz    InitLaserRoom3
		    jr	    SetBanks1_2_3___


;----------------------------------------------------------------------------
;
; Moving lasers	logic
;
;----------------------------------------------------------------------------

DrawMovingLasers:
		    ld	    a, (Room)
		    cp	    72				    ; Laser room (1st floor building 2)
		    ret	    nz

		    ld	    a, (SelectedItem)
		    cp	    SELECTED_GOGGLES		    ; Goggles
		    ret	    nz

		    ld	    hl,	LaserRoomTimer		    ; Wait time	before moving lasers
		    inc	    (hl)
		    ld	    a, (hl)
		    cp	    0C0h
		    ret	    nz				    ; Wait before moving

		    ld	    (hl), 0			    ; Reset timer

		    inc	    hl
		    inc	    (hl)			    ; LaserRoomCnt

		    ld	    a, (hl)
		    sub	    5
		    jr	    nz,	DrawMovingLasers2

		    ld	    (hl), a

DrawMovingLasers2:
		    call    SetBankInA0_F

		    call    RestLasersBack		    ; Restore laser background tiles

		    call    SetBanks1_2_3		    ; (!?)
		    call    SetBanks_A_B_C

		    ld	    a, (LaserRoomCnt)		    ; Laser position counter
		    ld	    de,	idxLaserOnOff
		    call    GetPointerDE2A

		    ld	    hl,	 EnemyList+1		    ; Array of enemies in the room
		    ld	    a, (NumEnemies)
		    ld	    b, a

DrawMovingLasers3:
		    ld	    a, (de)
		    ld	    (hl), a			    ; Switch on	or off the laser

		    inc	    de
		    ld	    c, a
		    ld	    a, 0Dh
		    call    ADD_HL_A

		    ld	    (hl), c
		    ld	    a, 73h
		    call    ADD_HL_A

		    djnz    DrawMovingLasers3

		    call    SetBanks1_2_3		    ; (!?)
		    call    SetBankInA0_F
		    call    DrawLaserBeams

SetBanks1_2_3___:
		    jp	    SetBanks1_2_3


;----------------------------------------------------------------------------
;
; Update the attributes	of the sprites in the actor structure
; Set the sprite patterns depending on the SpriteId of the actor
; Set as many sprites attributes as used by the	actor
;
;----------------------------------------------------------------------------

UpdateActorSprDat:
		    ld	    a, (ix+ACTOR.NumSprites)
		    or	    a
		    ret	    z				    ; This actor has no	sprites

		    call    SetBanks_4_5_6

		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    cp	    0F0h
		    jr	    nc,	UpdateActorSpr4

		    ld	    a, (ix+ACTOR.SpriteId)
		    ld	    de,	idxSprites
		    call    GetPointerDE2A

		    push    ix
		    pop	    hl				    ; HL = Pointer to actor

		    set	    5, l			    ; Actor+#20	= Number of sprites used in the	actor
		    ld	    b, (hl)
		    inc	    l				    ; Sprite layer
		    inc	    l				    ; 1st sprite Y

UpdateActorSpr2:
		    ld	    a, (de)			    ; Offset Y
		    ld	    c, a
		    inc	    de
		    sub	    91h				    ; #91-#A5 =	Common attributes
		    jr	    c, UpdateActorSpr3

		    cp	    15h
		    jr	    c, UpdateActorSpr5		    ; Use predefined/common sprite offsets

UpdateActorSpr3:
		    ld	    a, c
		    add	    a, (ix+ACTOR.Y)
		    ld	    (hl), a			    ; Sprite Y

		    inc	    l
		    ld	    a, (de)
		    add	    a, (ix+ACTOR.X)
		    ld	    (hl), a			    ; Sprite X

		    inc	    de
		    inc	    l
		    ld	    a, (de)
		    ld	    (hl), a			    ; Sprite pattern

		    inc	    de
		    inc	    l
		    inc	    l
		    inc	    l
		    djnz    UpdateActorSpr2

UpdateActorSpr4:
		    jp	    SetBanks1_2_3


; Add common sprite offsets

UpdateActorSpr5:
		    exx
		    ld	    de,	idxSprOffsets
		    call    GetPointerDE2A
		    ex	    de,	hl
		    exx

UpdateActorSpr6:
		    exx
		    ld	    a, (hl)
		    inc	    hl
		    add	    a, (ix+ACTOR.Y)
		    exx

		    ld	    (hl), a			    ; Sprite Y

		    inc	    l
		    exx
		    ld	    a, (hl)
		    inc	    hl
		    add	    a, (ix+ACTOR.X)
		    exx

		    ld	    (hl), a			    ; Sprite X
		    inc	    l

		    ld	    a, (de)
		    ld	    (hl), a			    ; Sprite pattern

		    inc	    de
		    inc	    l
		    inc	    l
		    inc	    l
		    djnz    UpdateActorSpr6

		    jp	    SetBanks1_2_3


;----------------------------------------------------------------------------
;
; Index	of shared sprites offsets
;
;----------------------------------------------------------------------------
idxSprOffsets:	    dw SprOffsets1
		    dw SprOffsets2
		    dw SprOffsets3
		    dw SprOffsets4
		    dw SprOffsets5
		    dw SprOffsets6
		    dw SprOffsets7
		    dw SprOffsets8
		    dw SprOffsets9
		    dw SprOffsets10
		    dw SprOffsets11
		    dw SprOffsets12
		    dw SprOffsets13
		    dw SprOffsets14
		    dw SprOffsets15
		    dw SprOffsets16
		    dw SprOffsets17
		    dw SprOffsets18
		    dw SprOffsets19
		    dw SprOffsets19
		    dw SprOffsets20


;----------------------------------------------------------------------------
;
; Update enemy sprite attributes and colors in RAM
; Add all the sprites used by the enemies actors
;
;----------------------------------------------------------------------------

UpdateEnemySprRAM:
		    ld	    hl,	EnemyList		    ; Array of enemies in the room
		    ld	    b, 10h

UpdateEnemySprRAM2:
		    push    bc
		    push    hl

		    ld	    a, (hl)
		    and	    a				    ; Active enemy?
		    call    nz,	UpdateEnemySprRAM3

		    pop	    hl
		    pop	    bc

		    ld	    de,	80h
		    add	    hl,	de			    ; Pointer to next enemy structure
		    djnz    UpdateEnemySprRAM2
		    ret


UpdateEnemySprRAM3:
		    set	    5, l
		    ld	    b, (hl)			    ; hl+20 = Num. sprites
		    ld	    a, b
		    and	    a
		    ret	    z				    ; No sprites used

		    inc	    l

UpdateEnemySprRAM4:
		    push    bc
		    ld	    a, (hl)			    ; Sprite layer
		    ld	    b, a

		    inc	    l
		    ld	    de,	EnemySprAttRAM
		    ld	    a, b
		    add	    a, a
		    add	    a, a			    ; Sprite layer x 4
		    add	    a, e
		    ld	    e, a			    ; DE= Sprite attributes

		    ld	    c, 0FFh			    ; To avoid modifying B using LDI
		    ldi					    ; Spr. Y
		    ldi					    ; Spr. X
		    ldi					    ; Spr. pattern

		    ld	    a, (hl)
		    and	    a				    ; Is color 0?
		    jr	    nz,	UpdateEnemySprRAM5

		    dec	    e
		    dec	    e
		    dec	    e
		    ld	    a, 0E1h			    ; Hidden Y
		    ld	    (de), a			    ; Spr. Y
		    inc	    e
		    inc	    e
		    inc	    e

; Set enemy sprite color RAM

UpdateEnemySprRAM5:
		    ex	    de,	hl
		    ld	    hl,	#E8A0 / 2;	7450h			    ; (!?) #E8A0 / 2
		    ld	    a, b			    ; B= Sprite	layer
		    add	    a, a
		    add	    a, a
		    add	    a, a
		    ld	    c, a
		    ld	    b, 0
		    add	    hl,	bc
		    add	    hl,	hl			    ; HL = Sprite color	RAM
		    ex	    de,	hl

		    ld	    a, (hl)			    ; Sprite color
		    ld	    b, 16			    ; Each sprite has 16 lines

UpdateEnemySprRAM6:
		    ld	    (de), a
		    inc	    e
		    djnz    UpdateEnemySprRAM6

		    pop	    bc
		    inc	    l
		    djnz    UpdateEnemySprRAM4
		    ret



;----------------------------------------------------------------------------
;
; Add the actors/enemies of current room
;
;----------------------------------------------------------------------------

SetupEnemyRoom:
		    call    ChkAlarmEnd			    ; Check if the alarm ends

		    ld	    a, (AlertMode)
		    ld	    (AlertModeCopy), a		    ; Save the alert mode

		    xor	    a
		    ld	    (PowerSwitchOn), a		    ; Power switch status 1=On,	0=Off/destroyed
		    ld	    (AlertSignNotOnScreen), a	    ; 1	= No need to erase the alert sign. The alert was triggered by a	camera

		    ld	    hl,	AlertIconTimer
		    ld	    (hl), a
		    inc	    hl
		    ld	    (hl), a			    ; No alert icon on screen

		    ld	    hl,	PowerSwitchY
		    ld	    (hl), a
		    inc	    hl
		    ld	    (hl), a			    ; No power switch by default

		    ld	    a, (Room)
		    cp	    83				    ; Arnolds
		    jr	    nz,	SetupEnemyRoom2

		    ld	    hl,	ArnoldsCnt
		    ld	    (hl), 2			    ; Two Arnolds

SetupEnemyRoom2:
		    ld	    a, (Room)
		    cp	    150				    ; Supressor	room (3rd floor	building 1)
		    jr	    nz,	SetupEnemyRoom3

		    ld	    hl,	GuardSilencerCnt	    ; Four soldiers (supressor room)
		    ld	    (hl), 4			    ; Four guards in the supressor room

SetupEnemyRoom3:
		    ld	    a, ID_DOG_BASEMENT
		    call    CountEnemyType
		    ld	    (NumBasementDogs), a	    ; Number of	dogs in	the room

		    ld	    hl,	EnemyList		    ; Array of enemies in the room
		    ld	    de,	 EnemyList+1		    ; Array of enemies in the room
		    ld	    bc,	7FFh
		    ld	    (hl), 0
		    ldir				    ; Erase enemies

		    call    HideEnemySprs		    ; Hide the sprites used by the enemies

		    call    SetBanks_4_5_6

		    ld	    a, 1
		    ld	    (NoEnemiesRoom), a		    ; No enemies in the	room by	default

		    ld	    a, (Room)
		    cp	    222
		    jp	    nc,	SetBanks1_2_3		    ; Ladders or elevator rooms

		    ld	    de,	idxActorsRooms
		    call    GetPointerDE2A
		    ex	    de,	hl			    ; HL = Pointer to actors/enemies in	current	room

		    ld	    a, (hl)			    ; Number of	enemies/actors in the room
		    and	    0Fh
		    ld	    b, a
		    or	    a
		    jp	    z, SetBanks1_2_3		    ; No enemies

		    inc	    hl

SetupEnemyRoom4:
		    call    SetBanks_4_5_6
		    push    bc				    ; B	= Number of enemies/actors in the room

		    ld	    c, (hl)			    ; Actor ID
		    inc	    hl
		    ld	    e, (hl)			    ; Y
		    inc	    hl
		    ld	    d, (hl)			    ; X
		    inc	    hl

		    push    hl
		    call    AddEnemy
		    pop	    hl

		    pop	    bc
		    djnz    SetupEnemyRoom4

		    xor	    a
		    ld	    (NoEnemiesRoom), a		    ; There is at least	one actor/enemy	in the room

		    jp	    SetBanks1_2_3



;----------------------------------------------------------------------------
;
; Hide the sprites used	by the enemies
;
;----------------------------------------------------------------------------

HideEnemySprs:
		    ld	    hl,	EnemySprAttRAM
		    ld	    de,	 EnemySprAttRAM+1
		    ld	    bc,	57h
		    ld	    (hl), 0E0h
		    ldir
		    ret


;
; (!?) Unused code
;
		    inc	    hl
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)
		    ex	    de,	hl
		    ld	    b, (hl)
		    inc	    hl

loc_10168A:
		    ld	    c, (hl)
		    inc	    hl
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)
		    inc	    hl
		    push    hl
		    push    bc
		    call    AddEnemy
		    pop	    bc
		    pop	    hl
		    djnz    loc_10168A
		    ret


;----------------------------------------------------------------------------
;
; Add actor
;
; In:
;   C =	Actor ID
;  DE =	XY
;
; Out:
;  HL =	New actor
;
; Try to find a	free entry in the enemy	list
; Then try to reserve as many sprites as the actor needs
; If it	is not possible	to reserve enough sprites/layers, free sprites reserved	by the actor
; If the actor does not	use sprites, or	can reserve enough sprites, creates the	new actor
;
;----------------------------------------------------------------------------

AddEnemy:
		    ld	    a, c
		    ld	    (TempData),	a		    ; Actor ID
		    ld	    (TempData2), de		    ; Actor XY

		    ld	    hl,	EnemyList		    ; Array of enemies in the room

		    ld	    b, 10h			    ; Max. number of enemies
		    xor	    a
		    ld	    de,	80h			    ; Enemy data size

AddEnemy2:
		    cp	    (hl)
		    jr	    nz,	AddEnemy3		    ; This entry is not	free. Move to the next one

		    push    ix
		    call    AddEnemy4			    ; Try to reserve the sprite	layers and add the actor


		    push    ix
		    pop	    hl				    ; HL = Pointer to new actor	structure


		    pop	    ix				    ; Restore IX
		    ret


AddEnemy3:
		    add	    hl,	de
		    djnz    AddEnemy2

		    xor	    a
		    ret


AddEnemy4:
		    ld	    (TempData3), hl		    ; MetaTiles, Enemy

		    push    hl
		    pop	    ix

		    call    SetBanks_4_5_6

		    ld	    a, (TempData)		    ; Actor ID
		    ld	    hl,	NumSprEnemies-1
		    call    ADD_HL_A

		    ld	    a, (hl)			    ; Number of	sprites	used by	the enemy
		    ld	    (ix+ACTOR.NumSprites), a

		    ld	    c, a
		    call    SetBanks1_2_3
		    or	    a				    ; Does it need to reserve sprites?
		    jr	    z, SetupActor

		    ld	    de,	0
		    ld	    hl,	EnemySprAttRAM
		    ld	    b, 22			    ; Max. sprite layers reserved for enemies

AddEnemy5:
		    ld	    a, (hl)
		    cp	    0E0h			    ; Is this sprite layer free?
		    jr	    nz,	AddEnemy6		    ; No, it is	used

		    inc	    (hl)			    ; Mark as reserved/used
		    call    SetSpriteLayer
		    inc	    e				    ; E	= Number of reserved layers/sprites
		    dec	    c				    ; Decrement	sprite count
		    jr	    z, SetupActor		    ; Has reserved all needed sprites?

AddEnemy6:
		    inc	    d				    ; D	= Number of checked sprites/layers
		    inc	    l
		    inc	    l
		    inc	    l
		    inc	    l				    ; Next sprite layer/attributes
		    djnz    AddEnemy5

		    ld	    a, (ix+ACTOR.NumSprites)
		    sub	    c
		    ret	    z				    ; No sprites were reserved

; Set free all reserved	sprites	by the actor

		    ld	    b, a			    ; B=Sprites	reserved for the actor

		    push    ix
		    pop	    hl

		    set	    5, l			    ; +20 = Number of sprites
		    inc	    l				    ; Sprite layer

SetSpritesFree:
		    ld	    a, (hl)			    ; Sprite layer

		    ld	    de,	EnemySprAttRAM
		    add	    a, a
		    add	    a, a			    ; 4	bytes per sprite attributes
		    call    ADD_DE_A

		    ld	    a, 0E0h			    ; Hide sprite
		    ld	    (de), a			    ; Sprite Y

		    ld	    de,	5			    ; Number of	sprite attributes (layer, Y, X,	pattern, color)
		    add	    hl,	de			    ; Pointer to next sprite

		    djnz    SetSpritesFree
		    ret


;----------------------------------------------------------------------------
;
; Set up actor
;
;----------------------------------------------------------------------------

SetupActor:
		    ld	    hl,	(TempData3)		    ; Pointer to actor in EnemyList
		    ld	    a, (TempData)		    ; Actor ID

		    ld	    (hl), a			    ; Actor ID
		    xor	    a
		    inc	    l
		    ld	    (hl), a			    ; Status = 0

		    ld	    de,	(TempData2)		    ; DE = Actor XY
		    inc	    l
		    ld	    (hl), a			    ; Y	dec.
		    inc	    l
		    ld	    (hl), e			    ; Y
		    inc	    l
		    ld	    (hl), a			    ; X	dec.
		    inc	    l
		    ld	    (hl), d			    ; X
		    inc	    l
		    ld	    (hl), a

		    ld	    (ix+ACTOR.ANIM_CNT), a
		    ld	    (ix+ACTOR.PunchesCnt), a
		    ld	    (ix+ACTOR.COLLISION_CFG), 3	    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
		    ld	    (ix+ACTOR.TOUCH_INFO), a	    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
		    ld	    (ix+ACTOR.ZzzSignSprIdx), 1
		    ld	    (ix+ACTOR.StunnedCnt), a

		    call    SetBanks_4_5_6

		    ld	    de,	idxActorSprCols-2
		    call    SetActorSprCols

		    ld	    a, (TempData)		    ; Actor ID
		    ld	    de,	idxActorLife-1
		    call    ADD_DE_A

		    ld	    a, (de)
		    ld	    (ix+ACTOR.LIFE), a		    ; 0=Kill the actor

		    call    SetBanks1_2_3

		    ld	    a, (ix+ACTOR.ID)		    ; Actor ID
		    dec	    a
		    call    JumpIndex			    ; Init actor

		    dw InitBridge
		    dw InitBridge
		    dw InitEllenVoice
		    dw InitGuardSlow
		    dw InitGuardMedium
		    dw InitCamera
		    dw InitMines
		    dw InitGas
		    dw InitTank
		    dw InitGuardAlert
		    dw InitGuardAlert
		    dw InitTankShell
		    dw InitShooter
		    dw InitGuardElevat
		    dw InitRollingBarrel
		    dw InitPitfall			    ; #10
		    dw InitMetalGear
		    dw InitBulldozer
		    dw InitGuardLorry
		    dw InitJetpackTakeoff
		    dw InitJetpackSwitch
		    dw InitJetpack
		    dw InitTankShellBoss
		    dw InitGuardSwitch			    ; #18
		    dw InitDog
		    dw InitArnold
		    dw InitDogBasement
		    dw InitLorryShooter
		    dw InitSpawnDog
		    dw InitGuardFast
		    dw InitScorpion
		    dw InitBigBoss			    ; #20
		    dw InitShotGunner
		    dw InitMachGunKid
		    dw InitLaserRoom
		    dw InitFireTrooper
		    dw InitFlame
		    dw InitHindD
		    dw InitSpawnTankShell
		    dw InitSpawnGuardElev		    ; #28
		    dw InitCowardDuck
		    dw InitDummy
		    dw InitShotGunnerShot
		    dw InitPowerSwitch
		    dw InitCaptureScene
		    dw InitDesertSecurity		    ; Guards at	2nd building entrance
		    dw InitGuardShot
		    dw InitSentinel			    ; #30
		    dw InitPrisoner
		    dw InitPrisoner
		    dw InitPrisoner			    ; Grey Fox
		    dw InitPrisoner
		    dw InitCameraLaser
		    dw InitLaserShot
		    dw InitPrisoner
		    dw InitPrisoner			    ; #38
		    dw InitGuardSilencer
		    dw InitBulletHor
		    dw InitBulletVert
		    dw InitMGunKidShot
		    dw InitShotToPlayer
		    dw InitTankShot
		    dw InitBoomerang
		    dw InitSnoringSymbol


InitDummy:
		    ret



;----------------------------------------------------------------------------
;
; Init Metal Gear entry	call
;
;----------------------------------------------------------------------------

InitMetalGear:
		    call    SetBankInA0_C
		    call    InitMetalGear_
		    jp	    SetBanks1_2_3


;----------------------------------------------------------------------------
;
; Add to actor structure the colors of the sprites used
;
; In:
;   DE = Pointer to index of sprites colors
;   IX = Actor structure
;
;----------------------------------------------------------------------------

SetActorSprCols:
		    ld	    a, (ix+ACTOR.NumSprites)
		    and	    a
		    ret	    z				    ; Does not use sprites

		    ld	    a, (ix+ACTOR.ID)		    ; Actor ID
		    call    GetPointerDE2A

		    ld	    hl,	(TempData3)		    ; Pointer to actor structure
		    set	    5, l			    ; +#20 = Number of sprites

		    ld	    b, (hl)			    ; B	= Number of sprites used by the	actor
		    ld	    a, 5			    ; Offset to	color field
		    add	    a, l
		    ld	    l, a			    ; HL = Spr1	color

SetActorSprCols2:
		    ld	    a, (de)
		    inc	    de
		    ld	    (hl), a			    ; Sprite color
		    ld	    a, l
		    add	    a, 5			    ; Number of	attributes per sprite (layer, y, x, pattern, color)
		    ld	    l, a			    ; Next sprite attributes
		    djnz    SetActorSprCols2
		    ret


;----------------------------------------------------------------------------
;
; Add to actor structure the layer number used by one of its sprites
;
; In:
;    E = Sprite	idx
;    D = Sprite	layer
;----------------------------------------------------------------------------

SetSpriteLayer:
		    push    hl

		    ld	    hl,	(TempData3)		    ; Pointer to actor structure
		    ld	    a, e			    ; Sprite index
		    add	    a, a
		    add	    a, a
		    add	    a, e			    ; x5 (layer, y, x, pattern,	color)

		    add	    a, ACTOR.Spr1Layer		    ; Actor+#21	= Sprite layer
		    call    ADD_HL_A

		    ld	    (hl), d			    ; Set sprite layer

		    pop	    hl
		    ret


;----------------------------------------------------------------------------
;
; Respawn enemy	logic
;
; While	in alert, enemies are respawn in some rooms
;
;----------------------------------------------------------------------------

ChkRespawnEnemy:
		    ld	    a, (AlertMode)
		    or	    a
		    ret	    z				    ; Not in alert

		    ld	    hl,	AlertRespawnTimer
		    ld	    a, (hl)
		    or	    a
		    ret	    z				    ; No more respawning

		    dec	    (hl)			    ; Decrement	respawn	delay
		    ret	    nz				    ; Do not respawn in	this iteration

		    ld	    hl,	TickCounter
		    ld	    a, r
		    xor	    (hl)
		    and	    0Fh
		    add	    a, 14h
		    ld	    (AlertRespawnTimer), a	    ; Next respawn time

		    ld	    a, (Room)
		    cp	    188				    ; From this	room on, there is no respawning
		    ret	    nc

		    call    HL_3xA
		    call    SetBanks_4_5_6

		    ld	    de,	RespawnInfo
		    add	    hl,	de
		    ld	    a, (hl)
		    or	    a				    ; Enemy to respawn
		    jp	    z, SetBanks1_2_3

		    ld	    c, a
		    cp	    ID_GUARD_REDALERT
		    ld	    b, 3			    ; Max. number of same enemy
		    jr	    z, ChkRespawnEnemy2

		    cp	    ID_JETPACK
		    jr	    z, ChkRespawnEnemy2
		    inc	    b				    ; Increment	the limit

ChkRespawnEnemy2:
		    exx
		    call    CountEnemyType		    ; How many enemies of that type are	in the room?
		    exx
		    cp	    b
		    jp	    nc,	SetBanks1_2_3		    ; Too many

		    inc	    hl				    ; Pointer to respawn location 1

		    ld	    a, (TickCounter)
		    rra
		    jr	    nc,	ChkRespawnEnemy3

		    inc	    hl				    ; Pointer to respawn location 2

ChkRespawnEnemy3:
		    ld	    a, (hl)			    ; A	= Respawn location.
		    and	    0F0h
		    ld	    e, a
		    ld	    a, (hl)
		    add	    a, a
		    add	    a, a
		    add	    a, a
		    add	    a, a			    ; x16
		    ld	    d, a			    ; DE = enemy XY
		    call    SetBanks1_2_3
		    jp	    AddEnemy

;---------------------------------------------------------------------------
;
; Check	alarm end
;
;---------------------------------------------------------------------------

ChkAlarmEnd:
		    ld	    a, (TransmiTaken)
		    or	    a
		    ret	    nz				    ; When carrying the	transmitter the	alarm never ends

		    ld	    a, (AlertMode)
		    or	    a
		    ret	    z				    ; Not in alert

		    ld	    a, (Room)
		    cp	    0F0h			    ; Elevators?
		    jr	    nc,	StopAlert		    ; Entering in an elevator ends the alert

		    ld	    hl,	AlertRespawnTimer
		    ld	    a, (hl)
		    or	    a
		    jr	    z, ChkAlarmEnd2		    ; No more respawning

		    inc	    hl
		    ld	    a, (hl)
		    or	    a				    ; Any guard	left to	respawn?
		    ret	    nz

		    ld	    (AlertRespawnTimer), a	    ; Disable respawn

		    ld	    a, (Room)
		    ld	    (RoomAlert), a		    ; Set current room in alert
		    ret


ChkAlarmEnd2:
		    ld	    a, (Room)
		    ld	    hl,	RoomAlert
		    cp	    (hl)
		    jr	    nz,	StopAlert		    ; Current room is not in alert

		    ld	    b, a
		    cp	    216				    ; 4th lorry	in desert (building 3)
		    ld	    a, ID_GUARD_REDALERT
		    jr	    z, ChkEnemyCount

		    ld	    a, b
		    cp	    188				    ; Left room	from fake Madnar (basement building 2)
		    jr	    nc,	StopAlert

		    call    HL_3xA			    ; A	= room x 3

		    call    SetBanks_4_5_6

		    ld	    de,	RespawnInfo
		    add	    hl,	de
		    ld	    a, (hl)			    ; Respawn enemy ID

		    call    SetBanks1_2_3

ChkEnemyCount:
		    call    CountEnemyType
		    cp	    10h
		    jr	    z, StopAlert		    ; Too many enemies

		    or	    a				    ; Any enemy?
		    ret	    nz				    ; Yes, do not stop the alert yet

StopAlert:
		    ld	    hl,	AlertMode
		    ld	    (hl), 0
		    ld	    de,	AlertMode+1
		    ldi
		    ldi
		    ldi
		    ldi
		    ldi					    ; Clear alert data

		    ld	    a, (ControlConfig)		    ; Bit6: 1=Enable music/Player control
		    bit	    6, a
		    ret	    z				    ; Music disabled

		    jp	    SetAreaMusic2		    ; Restore area mucis



; (!?) Not used
		    ld	    a, 1
		    ld	    (AlertRespawnTimer), a

;----------------------------------------------------------------------------
;
; In alert mode, some guards change to "alert guard" type
;
;----------------------------------------------------------------------------

TransformAlertGuard:
		    ld	    a, (Room)
		    cp	    188				    ; Left room	from fake Madnar (basement building 2)
		    ret	    nc

		    call    HL_3xA			    ; Room number x 3 (enemy ID, respawn location 1, respawn location 2)
		    call    SetBanks_4_5_6

		    ld	    de,	RespawnInfo		    ; Respawn information for each room
		    add	    hl,	de
		    ld	    a, (hl)
		    call    SetBanks1_2_3

TransformAlertGuard2:
		    ld	    (ix+ACTOR.ID),	a		    ; Change the actor to the type defined in the respawn info
		    ld	    (ix+ACTOR.Status), 0

		    call    ResetActorSpeed		    ; Stop guard

		    ld	    (ix+ACTOR.Moving), 1	    ; Enable movement
		    ld	    (ix+ACTOR.Wait), 1
		    ld	    (ix+ACTOR.COLLISION_CFG), 3	    ; Enable collision detection with the player and his shots
		    res	    0, (ix+ACTOR.Y)
		    res	    0, (ix+ACTOR.X)		    ; Adjust coordinates to even

		    call    GetDirToPlayer		    ; Get the direction	towards	the player
		    ld	    (ix+ACTOR.Direction), a	    ; 1=Up, 2=Down, 3=Left, 4=Right

		    call    AnimateGuard2		    ; Set walk sprite
		    jp	    SetActorSprColors		    ; Update sprites colors


;----------------------------------------------------------------------------
;
; HL = A * 3
;
;----------------------------------------------------------------------------

HL_3xA:
		    ld	    l, a
		    ld	    h, 0
		    ld	    e, a
		    ld	    d, h
		    add	    hl,	hl
		    add	    hl,	de
		    ret


GetPathPoint_:
		    call    SetBanks_4_5_6
		    jp	    GetPathPoint


;----------------------------------------------------------------------------
;
; Initialize fast guard
;
;----------------------------------------------------------------------------

InitGuardFast:
		    ld	    b, 8			    ; Guard speed
		    jr	    InitGuard


;----------------------------------------------------------------------------
;
; Initialize medium speed guard
;
;----------------------------------------------------------------------------

InitGuardMedium:
		    ld	    b, 4			    ; Guard speed
		    jr	    InitGuard


;----------------------------------------------------------------------------
;
; Initialize slow guard
;
;----------------------------------------------------------------------------

InitGuardSlow:
		    ld	    b, 0

InitGuard:
		    ld	    (ix+ACTOR.IdxGuardSpeed), b

		    ld	    b, 0			    ; Non sleepy flag

		    ld	    a, (Room)
		    cp	    26
		    jr	    z, MarkAsSleepy

		    cp	    85
		    jr	    z, MarkAsSleepy

		    cp	    138				    ; Gas mask room
		    jr	    nz,	SetSleepyFlag

MarkAsSleepy:
		    inc	    b				    ; Set sleepy flag

SetSleepyFlag:
		    ld	    a, b
		    ld	    (SleepyGuardFlag), a

		    ld	    a, r
		    and	    1
		    ld	    a, 5
		    jr	    z, InitGuard2		    ; Select "short" or "long" awake time

		    ld	    a, 40h

InitGuard2:
		    ld	    (ix+ACTOR.AwakeTime), a	    ; Set how much time	the guard will be awake

		    call    InitGuardPath
		    jp	    ChangeGuardSprDir


;----------------------------------------------------------------------------
;
; Initialize guard path
;
;----------------------------------------------------------------------------

InitGuardPath:
		    inc	    (ix+ACTOR.Moving)		    ; Enable movement

		    ld	    a, ID_GUARD_SLOW
		    call    CountEnemyType
		    ld	    b, a
		    push    bc

		    ld	    a, ID_CAMERA
		    call    CountEnemyType

		    pop	    bc
		    add	    a, b
		    ld	    b, a
		    ld	    a, ID_SENTINEL
		    push    bc

		    call    CountEnemyType

		    pop	    bc
		    add	    a, b
		    ld	    b, a
		    ld	    a, ID_GUARD_MEDIUM
		    push    bc

		    call    CountEnemyType

		    pop	    bc
		    add	    a, b
		    ld	    b, a
		    ld	    a, ID_GUARD_FAST
		    push    bc

		    call    CountEnemyType

		    pop	    bc
		    add	    a, b			    ; A	= Number of guards and cameras -> Index	of path	to use

InitGuardPath2:
		    ld	    b, a			    ; B	= Amount of guards and cameras
		    ld	    a, (NextRoomDirect)		    ; 4=Right, 3=Left, 2=Down, 1=Up
		    ld	    d, a
		    ld	    a, (PreviousRoom)
		    ld	    e, a

		    ld	    a, (Room)
		    dec	    a
		    call    z, HideGuardRoom1

		    sub	    12
		    call    z, HideGuardRoom13

		    sub	    2
		    call    z, HideGuardRoom15

		    sub	    2
		    call    z, HideGuardRoom17

		    dec	    a
		    call    z, HideGuardRoom18

		    dec	    a
		    call    z, HideGuardRoom19

		    sub	    3
		    call    z, HideGuardRoom22

		    cp	    13
		    call    z, HideGuardRoom35

		    ld	    (ix+ACTOR.SpriteId), 0	    ; Guard up sprite ID

GetPathPoints:
		    ld	    (ix+ACTOR.idxPathPoint), 0	    ; Init path	point index

		    call    SetBanks_4_5_6

		    ld	    a, (Room)
		    ld	    l, a
		    ld	    h, 0
		    ld	    de,	idxRoomPaths		    ; Index of paths
		    add	    hl,	hl
		    add	    hl,	de
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)
		    ex	    de,	hl			    ; HL = Pointer to paths in this room

		    dec	    b
		    ld	    a, b			    ; A=Guard/camera index
		    call    ADD_HL_2A

		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)			    ; DE = Pointer to the path of this actor in	this room

		    ld	    (ix+ACTOR.PointerL), e
		    ld	    (ix+ACTOR.PointerH), d	    ; Pointer to path points data

		    ld	    a, (de)			    ; Number of	path points
		    ld	    (ix+ACTOR.Cnt_NumPathPoints), a

		    inc	    de

GetPathPoint:
		    ld	    a, (de)			    ; Path point Y
		    ld	    (ix+ACTOR.DestinationY), a
		    inc	    de
		    ld	    a, (de)			    ; Path point X
		    ld	    (ix+ACTOR.DestinationX), a

		    ld	    (ix+ACTOR.NextPointOffset),	1   ; Path point offset	(next path point)

SetDirToPoint:
		    ld	    a, (ix+ACTOR.Y)
		    sub	    (ix+ACTOR.DestinationY)
		    ld	    de,	0
		    ld	    b, 0
		    jr	    z, SetDirToPoint2		    ; Same Y than destination point

		    ld	    e, 2			    ; Select negative speed X
		    jr	    nc,	SetDirToPoint2		    ; Up

		    ld	    e, 1			    ; Select positive speed X
		    inc	    b				    ; Down

SetDirToPoint2:
		    ld	    a, (ix+ACTOR.X)
		    sub	    (ix+ACTOR.DestinationX)
		    ld	    c, 0
		    jr	    z, SetDirToPoint3		    ; Same X than destination

		    ld	    d, 2			    ; Select negative speed Y
		    ld	    c, 2
		    jr	    nc,	SetDirToPoint3		    ; Left

		    ld	    d, 1			    ; Select positive speed Y
		    inc	    c				    ; Right

SetDirToPoint3:
		    ld	    a, b
		    or	    c
		    ld	    (ix+ACTOR.Direction), a	    ; 1=Up, 2=Down, 3=Left, 4=Right

		    ld	    bc,	0			    ; Speed X =	0
		    ld	    a, d
		    add	    a, a			    ; Check if the speed X is positive,	negative or neutral
		    jr	    z, GetSpeedToPoint		    ; Neutral

		    add	    a, (ix+ACTOR.IdxGuardSpeed)	    ; Add speed	type offset (slow, medium, fast)
		    ld	    hl,	WalkSpeeds-2
		    call    ADD_HL_A
		    ld	    c, (hl)
		    inc	    hl
		    ld	    b, (hl)			    ; BC = Speed X

GetSpeedToPoint:
		    ld	    hl,	0			    ; Speed Y =	0
		    ld	    a, e
		    ld	    d, b
		    ld	    e, c			    ; DE = Speed X

		    add	    a, a			    ; Check if the speed Y is positive,	negative or neutral
		    jr	    z, GetSpeedToPoint2		    ; Neutral

		    add	    a, (ix+ACTOR.IdxGuardSpeed)	    ; Add speed	type offset (slow, medium, fast)

		    ld	    hl,	WalkSpeeds-2
		    call    ADD_HL_A
		    ld	    c, (hl)
		    inc	    hl
		    ld	    b, (hl)
		    ld	    h, b
		    ld	    l, c			    ; HL = Speed Y

GetSpeedToPoint2:
		    call    SetBanks1_2_3

dummyAddr5:
		    jp	    SetActorSpeed		    ; DE = Speed X, HL = Speed Y


;----------------------------------------------------------------------------
;
; Enemy	speeds:	slow, medium, fast
;
;----------------------------------------------------------------------------
WalkSpeeds:	    dw 100h
		    dw -100h

		    dw 140h
		    dw -140h

		    dw 180h
		    dw -180h

;----------------------------------------------------------------------------
;
; Locate the actor at current path point
; Set the next path point
; Decide to stop and wait (change to status 1) or not at current path point
;
;----------------------------------------------------------------------------

UpdateActorPath:
		    call    SetBanks_4_5_6
		    ld	    e, (ix+ACTOR.DestinationY)
		    ld	    d, (ix+ACTOR.DestinationX)	    ; DE = Current destination point

; Locate the actor at current destination point

		    xor	    a
		    ld	    (ix+ACTOR.Y), e		    ; Destination Y
		    ld	    (ix+ACTOR.Ydec), a
		    ld	    (ix+ACTOR.X), d		    ; Destination X
		    ld	    (ix+ACTOR.Xdec), a

		    ld	    c, (ix+ACTOR.Cnt_NumPathPoints) ; Number of	path points

		    ld	    a, (ix+ACTOR.idxPathPoint)	    ; Index of current path point
		    add	    a, (ix+ACTOR.NextPointOffset)   ; Next pathpoint offset
		    jr	    c, SetLastPathPoint		    ; Not enough path points. Set the last one

		    cp	    c				    ; Has reached the last path	point?
		    jr	    nz,	SetNextPathPoint

		    xor	    a				    ; First path point
		    jr	    SetNextPathPoint


SetLastPathPoint:
		    ld	    a, c			    ; Number of	path points
		    dec	    a

SetNextPathPoint:
		    ld	    (ix+ACTOR.idxPathPoint), a	    ; Set current point	of this	path

		    ld	    e, (ix+ACTOR.PointerL)
		    ld	    d, (ix+ACTOR.PointerH)	    ; DE = Pointer to path points data

		    inc	    de				    ; Skip number of path points

		    ld	    a, (ix+ACTOR.idxPathPoint)
		    add	    a, a
		    call    ADD_DE_A			    ; DE = pointer to current path point

		    ld	    a, (de)			    ; Path point Y
		    ld	    (ix+ACTOR.DestinationY), a

		    inc	    de
		    ld	    a, (de)			    ; Path point X
		    ld	    (ix+ACTOR.DestinationX), a

		    call    SetDirToPoint		    ; Set the direction	to the new destination point

		    ld	    a, (ix+ACTOR.ID)		    ; Actor ID
		    sub	    ID_GUARD_SLOW
		    jr	    z, ChkWaitPathPoint		    ; Guard slow

		    dec	    a
		    jr	    z, ChkWaitPathPoint		    ; Guard

		    dec	    a
		    jr	    z, SetCamRndWait		    ; Camera

		    sub	    13
		    jr	    z, ChkWaitPathPoint		    ; Dog

		    sub	    11				    ; Spawn guard elevator
		    ret	    nz

; Chooses if the enemy waits or	not at the path	point

ChkWaitPathPoint:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    cp	    ID_GUARD_EXIT_LORRY
		    call    z, ChkWaitGuardLorry

		    ld	    a, r
		    rra
		    ret	    nc				    ; Do not stop and wait

		    pop	    hl				    ; Return address

		    dec	    (ix+ACTOR.Moving)		    ; Disable movement
		    ld	    (ix+ACTOR.Wait), 10h	    ; Wait time
		    ld	    (ix+ACTOR.GuardStatus), 1	    ; Set guard	wait status

		    ld	    a, r
		    and	    6				    ; 6	= Guard	idle up	sprite ID
		    add	    a, (ix+ACTOR.Direction)	    ; Calculate	sprite ID
		    ld	    (ix+ACTOR.SpriteId), a	    ; Guard idle looking in the	same direction
		    jp	    SetBanks1_2_3



;----------------------------------------------------------------------------
;
; The guard that exits the lorry does not wait at the first path point (just after exiting the lorry)
;
;----------------------------------------------------------------------------

ChkWaitGuardLorry:
		    ld	    a, (ix+ACTOR.idxPathPoint)
		    dec	    a
		    ret	    nz

		    pop	    hl				    ; Remove return address. Do	not wait at that point
		    ret


;----------------------------------------------------------------------------
;
; Set camera random wait
;
;----------------------------------------------------------------------------

SetCamRndWait:
		    ld	    (ix+ACTOR.Moving), 0	    ; Disable movement
		    ld	    a, r
		    srl	    a
		    jr	    nz,	SetCamRndWait2

		    inc	    a

SetCamRndWait2:
		    ld	    (ix+ACTOR.Wait), a
		    jp	    SetBanks1_2_3


;----------------------------------------------------------------------------
;
; Setup	the sentinel (directions he will look at)
;
;----------------------------------------------------------------------------

GetSentinelLookDirs:
		    call    SetBanks_4_5_6

		    ld	    a, ID_SENTINEL
		    call    CountEnemyType
		    ld	    (ix+ACTOR.IDX_SAME_ID), a
		    ld	    b, a			    ; This index is used to select the path data for this actor

		    ld	    a, (Room)
		    ld	    l, a
		    ld	    h, 0
		    ld	    de,	idxRoomPaths
		    add	    hl,	hl
		    add	    hl,	de
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)
		    ex	    de,	hl			    ; HL Idx. Pointers paths in	the room

		    dec	    b				    ; B	= Idx. same actor ID
		    ld	    a, b
		    call    ADD_HL_2A
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)			    ; DE = Pointer to path data

		    ld	    a, (de)			    ; Number of	path points
		    inc	    de
		    ld	    (ix+ACTOR.Cnt_NumPathPoints), a ; Path points
		    ld	    (ix+ACTOR.LookDirPointerLow), e ; Pointer to look directions. Used by ID_SENTINEL
		    ld	    (ix+ACTOR.LookDirPointerHigh), d

SetSentinelLookDir:
		    ld	    a, (de)
		    ld	    (ix+ACTOR.Direction), a	    ; Set the direction	he is looking at

		    add	    a, 8			    ; Sentinel up sprite ID + direction
		    ld	    (ix+ACTOR.SpriteId), a	    ; Update the sprite	to match the direction

		    ld	    a, r
		    ld	    (ix+ACTOR.SENTINEL_WAIT), a	    ; Random time looking in the same direction
		    jp	    SetBanks1_2_3


SetSentinelLookDir_:
		    call    SetBanks_4_5_6
		    jr	    SetSentinelLookDir

;----------------------------------------------------------------------------
;
; Get player coordinates
;
; Out:
;    E = Player	Y
;    D = Player	X
;
;----------------------------------------------------------------------------

GetPlayerXY:
		    ld	    a, (PlayerY)		    ; D	= Player X, E =	Player Y
		    ld	    e, a
		    ld	    a, (PlayerX)
		    ld	    d, a
		    ret

;----------------------------------------------------------------------------
;
; Set actor speed Y
;
; In:
;    E = Speed Y dec
;    D = Speed Y
;
;----------------------------------------------------------------------------

SetActorSpeedY:
		    ld	    (ix+ACTOR.speedYdec), e
		    ld	    (ix+ACTOR.SpeedY), d
		    ret

;----------------------------------------------------------------------------
;
; Increment actor speed	X
;
; In:
;   DE = Speed increment
;
;----------------------------------------------------------------------------

AddActorSpeedX:
		    ld	    l, (ix+ACTOR.SpeedXdec)
		    ld	    h, (ix+ACTOR.SpeedX)
		    add	    hl,	de
		    ex	    de,	hl
;----------------------------------------------------------------------------
;
; Set actor speed X
;
; In:
;    E = Speed X dec
;    D = Speed X
;
;----------------------------------------------------------------------------

SetActorSpeedX:
		    ld	    (ix+ACTOR.SpeedXdec), e
		    ld	    (ix+ACTOR.SpeedX), d
		    ret

;----------------------------------------------------------------------------
;
; Set actor speed
;
; In:
;   DE = SpeedX
;   HL = SpeedY
;
;----------------------------------------------------------------------------

SetActorSpeed:
		    call    SetActorSpeedX		    ; DE = Speed X, HL = Speed Y
		    ex	    de,	hl
		    jr	    SetActorSpeedY


;----------------------------------------------------------------------------
;
; Animate actor
;
; Alternates two frames
;
; In:
;    B = Timer mask
;
;----------------------------------------------------------------------------

Anim2FramesActor:
		    ld	    a, (ix+ACTOR.ANIM_CNT)
		    and	    b
		    ret	    nz				    ; Do not animate in	this iteration

		    ld	    a, 1
		    xor	    (ix+ACTOR.SpriteId)
		    ld	    (ix+ACTOR.SpriteId), a
		    ret

;----------------------------------------------------------------------------
;
; Animate sleeping sign	(Zzz)
;
; In:
;    B = Wait bit mask
;    C = Zzz sprite Id
;
;----------------------------------------------------------------------------

AnimZzzSign:
		    ld	    a, (ix+ACTOR.ANIM_CNT)
		    and	    b				    ; B	= Bit mask (e.g.: #F)
		    ret	    nz

		    ld	    a, (ix+ACTOR.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    b, a
		    add	    a, a
		    add	    a, b
		    ld	    b, a			    ; B	= Direction x 3	(!?) This is not used

		    dec	    (ix+ACTOR.ZzzSignSprIdx)

		    ld	    a, (ix+ACTOR.ZzzSignSprIdx)
		    jr	    nz,	AnimZzzSign2

		    ld	    a, 4
		    ld	    (ix+ACTOR.ZzzSignSprIdx), a

AnimZzzSign2:
		    ld	    hl,	AnimZzzFrames-1
		    call    ADD_HL_A
		    ld	    a, (hl)			    ; Get frame	animation index

		    add	    a, b			    ; (!?) Direction must be 0
		    add	    a, c			    ; C	= Sleeping sign	frame 1	sprite ID
		    ld	    (ix+ACTOR.SpriteId), a	    ; Update the sprite	ID to animate the sign

dummyAddr6:
		    ret
AnimZzzFrames:
		    db	  1				    ; AnimZzzFrames
		    db	  2
		    db	  1
		    db	  0

;----------------------------------------------------------------------------
;
; Actor	status control:	next, reset and	set
;
;----------------------------------------------------------------------------

NextActorStatus:
		    inc	    (ix+ACTOR.Status)
		    ret


ResetActorStatus:
		    ld	    (ix+ACTOR.Status), 0
		    ret


SetActorStatus:
		    ld	    (ix+ACTOR.Status), a
		    ret

;----------------------------------------------------------------------------
;
; Count	actor type
;
; In:
;    A = Actor ID
; Out:
;    A = Number	of actors
;
;----------------------------------------------------------------------------

CountEnemyType:
		    ld	    bc,	1000h			    ; B	= Max. number of actors, C = Actor counter
		    ld	    hl,	EnemyList		    ; Array of enemies in the room
		    ld	    de,	80h

CountEnemyType2:
		    cp	    (hl)			    ; Same ID?
		    jr	    nz,	CountEnemyType3

		    inc	    c				    ; Increment	number of actors

CountEnemyType3:
		    add	    hl,	de
		    djnz    CountEnemyType2

		    ld	    a, c
		    ret

;----------------------------------------------------------------------------
;
; Hide a sprite	seting its color to 0
;
; In:
;   IX = Pointer to actor
;
;----------------------------------------------------------------------------

HideSprColor:
		    xor	    a
		    ld	    c, a
;----------------------------------------------------------------------------
;
; Set the color	of the sprites of an actor
; Sprites are combined to get 3	colors per line	+ transparent
;
; In:
;   IX = Pointer to actor
;    A = Sprite	1 color
;    C = Sprite	2 color
;
;----------------------------------------------------------------------------

SetSprColor:
		    push    ix
		    pop	    hl

		    set	    5, l			    ; +#20
		    ld	    b, a

		    ld	    a, (hl)			    ; Num. sprites
		    or	    a
		    ret	    z				    ; There are	no sprites in this actor

		    ld	    a, b
		    ld	    b, (hl)
		    rrc	    b				    ; B	= Num. sprites / 2
		    inc	    l
		    inc	    l
		    inc	    l
		    inc	    l
		    inc	    l				    ; HL points	to actor sprite1 color
		    ld	    de,	5			    ; (layer, y, x, pattern, color)

SetSprColor2:
		    ld	    (hl), a
		    add	    hl,	de
		    ld	    (hl), c
		    add	    hl,	de
		    djnz    SetSprColor2
		    ret


GetFlameSinCos:
		    ld	    a, (ix+FIRE_TROPPER.ANGLE)
;----------------------------------------------------------------------------
;
; Get sine and cosine
;
; In:
;    A = Angle (0-63 ->	0-90)
; Out:
;    B = Cos
;    C = Sin
;    Range from	0 to 255 (0 to 1)
;----------------------------------------------------------------------------

GetSinCos:
		    call    SetBanks_4_5_6

		    and	    3Fh
		    ld	    e, a
		    ld	    d, 0			    ; D	= Angle	for sine

		    sub	    3Fh
		    neg					    ; A	= Angle	for cosine

		    ld	    hl,	SinTable		    ; Array of sine values

		    push    hl

		    add	    hl,	de			    ; Add angle
		    ld	    c, (hl)			    ; Sine value

		    pop	    hl

		    ld	    e, a
		    add	    hl,	de			    ; Add cosine angle
		    ld	    b, (hl)			    ; Cosine value

		    jp	    SetBanks1_2_3

;----------------------------------------------------------------------------
;
; Change DE sign
;
; In:
;   DE = value
; Out:
;   DE = -value
;
;----------------------------------------------------------------------------

ChangeSignDE:
		    ex	    de,	hl
		    call    ChangeSignHL
		    ex	    de,	hl
		    ret

;----------------------------------------------------------------------------
;
; Change HL sign
;
; In:
;   HL = value
; Out:
;   HL = -value
;
;----------------------------------------------------------------------------

ChangeSignHL:
		    xor	    a
		    sub	    l
		    ld	    l, a
		    ld	    a, 0
		    sbc	    a, h
		    ld	    h, a
		    ret

;----------------------------------------------------------------------------
;
; Gets the tile	buffer address of HL coordinates
;
; In:
;   HL = XY
; Out:
;   HL = Tile address
;
;----------------------------------------------------------------------------

CoordToBuffTile:
		    ld	    a, l
		    rra
		    rra
		    rra
		    rra
		    rr	    h
		    rra
		    rr	    h
		    rra
		    rr	    h
		    ld	    l, h
		    and	    3
		    add	    a, RoomTileBuffer/256;	0E0h			    ; (!?) #e000
		    ld	    h, a
		    ret

;----------------------------------------------------------------------------
;
; Pause	text
;
;----------------------------------------------------------------------------
txtPause:	    dw 586Ch
		    db	"PAUSE"
		    db 0FFh


;----------------------------------------------------------------------------
;
; Calculate shot speed towards the player
;
; In:
;   IX = Pointer to actor (source of the shot)
;
; Out:
;   HL = Speed Y
;   DE = Speed X
;
;----------------------------------------------------------------------------

CalcShot:
		    ld	    a, 80h			    ; Default shot speed

CalcShot2:
		    ld	    e, (ix+ACTOR.Y)
		    ld	    d, (ix+ACTOR.X)		    ; DE = Source XY

		    ld	    c, a
		    ld	    a, (Dificulty)
		    add	    a, a
		    add	    a, a
		    add	    a, a
		    add	    a, c
		    ld	    (ShotSpeed), a

		    call    CalcQuadrantDegree		    ; Calculate	the angle degree from source to	target.	Also vertical and horizontal directions

		    ld	    a, (QuadranDegree)
		    ld	    e, a			    ; E	= Sin degree
		    ld	    d, 0
		    ld	    a, e			    ; (!?)
		    sub	    3Fh
		    neg					    ; A	= Cos degree

		    ld	    hl,	SinTable
		    call    SetBanks_4_5_6

		    push    hl
		    add	    hl,	de
		    ld	    c, (hl)			    ; Sin
		    pop	    hl

		    ld	    e, a
		    add	    hl,	de
		    ld	    a, (hl)			    ; Cos
		    ld	    (TmpShotCos), a

		    call    SetBanks1_2_3

		    ld	    e, c			    ; Sin
		    call    CalShootSpeed		    ; Get Y axis speed

		    ld	    a, (ShotDirectionV)
		    and	    a				    ; Up or down?
		    call    nz,	ChangeSignDE		    ; Change direction

		    ld	    (TmpShootSpeedY), de

		    ld	    a, (TmpShotCos)
		    ld	    e, a			    ; Cos
		    call    CalShootSpeed		    ; Get X axis speed

		    ld	    a, (ShotDirectionH)
		    and	    a				    ; Left or right?
		    call    nz,	ChangeSignDE		    ; Change direction

		    ld	    hl,	(TmpShootSpeedY)
		    ret

;----------------------------------------------------------------------------
;
; The screen is	divided	in 64 quadrants	of 32x32
; The "QuadrantDegree" is calculated depending on the source and target quadrant
;
; In:
;   DE = source	XY
; Out:
;   (QuadrantDegree) = Degree of the angle formed by both quadrants
;
;----------------------------------------------------------------------------

CalcQuadrantDegree:
		    ld	    a, (PlayerY)
		    ld	    (TempData),	a

		    ld	    a, (PlayerX)
		    ld	    (TempData+1), a

		    ld	    hl,	ShotDirectionV
		    ld	    (hl), 0			    ; Down

		    ld	    a, (TempData)		    ; Target Y
		    sub	    e				    ; Source Y
		    jr	    nc,	CalcQuadrantDegree2

		    neg
		    inc	    (hl)			    ; Up

CalcQuadrantDegree2:
		    inc	    hl				    ; ShotDirectionH
		    ld	    (hl), 0			    ; Horizontal direction = right

		    rra
		    rra					    ; /4
		    and	    111000b
		    ld	    e, a			    ; E	bit5-3 = Distance Y in 32 pixels blocks

		    ld	    a, (TempData+1)		    ; Target X
		    sub	    d				    ; Source X
		    jr	    nc,	CalcQuadrantDegree3

		    neg
		    inc	    (hl)			    ; Horizontal direction = left

CalcQuadrantDegree3:
		    rlca
		    rlca
		    rlca
		    and	    7
		    add	    a, e			    ; bit5-3 = Distance	Y in 32	pixels blocks
							    ; bit2-0 = Distance	X in 32	pixels blocks

		    ld	    hl,	QuadrantDegrees
		    call    ADD_HL_A

		    call    SetBanks_4_5_6

		    ld	    a, (hl)
		    ld	    (QuadranDegree), a

		    jp	    SetBanks1_2_3

;----------------------------------------------------------------------------
;
; Get shot speed
;
; In:
; (ShotSpeed) =	Linear speed
;  E = axis factor
;
; Out:
;  DE =	axis speed
;
;----------------------------------------------------------------------------

CalShootSpeed:
		    ld	    a, (ShotSpeed)
		    ld	    h, a
		    call    Multiply8			    ;  Multiply	H * E

		    xor	    a
		    add	    hl,	hl
		    adc	    a, a
		    add	    hl,	hl
		    adc	    a, a
		    add	    hl,	hl
		    adc	    a, a			    ; x8
		    ld	    l, h
		    ld	    h, a
		    ex	    de,	hl
		    ret

;----------------------------------------------------------------------------
;
; Multiply H * E
;
; In:
;   H =	number1
;   E =	number 2
;
; Out:
;  HL =	H*E
;
;----------------------------------------------------------------------------

Multiply8:
		    ld	    b, 8
		    ld	    l, 0
		    ld	    d, l

Multiply8Loop:
		    add	    hl,	hl
		    jr	    nc,	Multiply8Skip
		    add	    hl,	de

Multiply8Skip:
		    djnz    Multiply8Loop
		    ret

;----------------------------------------------------------------------------
;
; Set text
;
; In:
;    A = Text ID
;
;----------------------------------------------------------------------------

SetTextUnskippable:
		    ld	    c, 2			    ; Text can not be skipped. Next text is automatically show after a pause
		    jr	    SetText2


SetTextUnskip2:
		    ld	    c, 1			    ; Text can not be skipped. Waits key to show next text
		    jr	    SetText2


SetText:
		    ld	    c, 0			    ; Text can be skipped

SetText2:
		    ld	    (TextId), a			    ; Text ID
		    ld	    a, c
		    ld	    (SkipTextMode), a		    ; 0	= Text can be skipped. Need to press a key to read next	text box
							    ; 1	= Text can not be skipped. Need	to press a key to read next text box
							    ; 2	= Text can not be skipped. Need	to wait	to read	next text box

		    ld	    hl,	PrevGameMode
		    ld	    de,	TextWindowStatus
		    ld	    bc,	1Eh
		    ld	    (hl), 0
		    ldir				    ; Init print status

		    ld	    a, (GameMode)		    ; Current game mode
		    ld	    (PrevGameMode), a		    ; Save current game	mode

		    ld	    a, GAME_MODE_TEXT_BOX
		    ld	    (GameMode),	a		    ; Set show text game mode
		    ret

;----------------------------------------------------------------------------
;
; Text box logic
;
;----------------------------------------------------------------------------

TextBoxLogic:
		    ld	    a, (PrevGameMode)
		    cp	    GAME_MODE_RADIO		    ; Is the game in radio mode?
		    jr	    nz,	TextBoxLogic2		    ; No, skip checking	F4 key

		    ld	    a, (FKeysTrigger)		    ; 0	0 RET F5 F4 F3 F2 F1
		    and	    8				    ; F4 key pressed?
		    jr	    z, TextBoxLogic2		    ; Do not exit radio	mode

		    call    TextBoxExit
		    jp	    ExitRadio


TextBoxLogic2:
		    ld	    a, (TextWindowStatus)
		    call    JumpIndex

		    dw TW_Init
		    dw TextBoxAppear
		    dw TW_PrintChar
		    dw TW_Wait
		    dw TW_GetTextPage
		    dw TextBox_End

;----------------------------------------------------------------------------
;
; Text box set up
;
;----------------------------------------------------------------------------

TW_Init:
		    call    GetText			    ; Get text pointer and window type

		    and	    0Fh
		    add	    a, a
		    ld	    c, a
		    add	    a, a			    ; x4

		    push    af
		    push    bc

		    ld	    hl,	TextBoxEffectDat
		    call    ADD_HL_2A

		    ld	    de,	TextBoxEff_Cnt
		    ld	    bc,	8
		    ldir				    ; Set text box animation data

		    pop	    bc
		    pop	    af

		    add	    a, c

		    ld	    hl,	TextXYSize
		    call    ADD_HL_A

		    call    GetTextBoxXYSize2

		    ld	    (TextY), de
		    ld	    (TextNY), bc
		    inc	    hl
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)
		    ld	    (PromptXY),	de		    ; Intro char coordinates

		    ld	    a, (TextId)
		    cp	    2				    ; Text: Operation intrude N313...
		    jr	    z, NextTextStatus		    ; No need to save the text box background

		    ld	    a, (PrevGameMode)
		    cp	    GAME_MODE_RADIO
		    jr	    z, NextTextStatus		    ; No need to save the text box background

		    ld	    a, (PlayerControlMod)	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
		    cp	    CONTROL_INTRO
		    jr	    z, NextTextStatus		    ; No need to save the text box background

		    call    GetTextBoxXYSize		    ; Get text box location and	size
		    ex	    de,	hl
		    ld	    de,	0A0h
		    ld	    a, 4			    ; From page	0 to 1
		    call    VDP_Copy_Byte		    ; Save text	box background

NextTextStatus:
		    ld	    hl,	TextWindowStatus
		    inc	    (hl)
		    ret

;----------------------------------------------------------------------------
;
; Text box appear logic
;
;----------------------------------------------------------------------------

TextBoxAppear:
		    call    DrawTextBoxIn		    ; Text box appears effect
		    ret	    nc				    ; Has not finished

		    ld	    hl,	(TextPointer)
		    inc	    hl
		    ld	    (TextPointer), hl		    ; Skip textbox type	byte

		    ld	    a, 4
		    ld	    (TextWindowStatus),	a	    ; Set the status to	decode the text
		    ld	    a, 1
		    ld	    (PendingTextFlag), a	    ; There is text to show
		    ret

;----------------------------------------------------------------------------
;
; Print	character logic
;
;----------------------------------------------------------------------------

TW_PrintChar:
		    ld	    a, (SkipTextMode)		    ; 0	= Text can be skipped. Need to press a key to read next	text box
							    ; 1	= Text can not be skipped. Need	to press a key to read next text box
							    ; 2	= Text can not be skipped. Need	to wait	to read	next text box
		    dec	    a
		    jr	    z, TW_PrintChar2		    ; Do not check keys	to skip	the text

		    dec	    a
		    jr	    z, TW_PrintChar2		    ; Do not check keys	to skip	the text

		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    20h				    ; M/N
		    jp	    nz,	SkipText

		    ld	    a, (FKeysTrigger)		    ; 0	0 RET F5 F4 F3 F2 F1
		    and	    20h				    ; RET
		    jp	    nz,	SkipText

	IF (JAPANESE)
		    ld      a, (flagTxtItem)
		    and     a
		    jr      z, TW_PrintChar2

		    ld      a, (ControlsHold)
		    and     0Fh
		    jp      nz, SkipText
	ENDIF

TW_PrintChar2:
	IF (JAPANESE)
		    ld      a, (flagTxtItem)
		    and     a
		    jr      nz, TW_PrintChar3b
	ENDIF

		    ld	    a, (TextId)
		    cp	    45				    ; Text: Now	we intruduce staff (STAFF)
		    ld	    c, 3			    ; Print delay mask (fast)
		    jr	    nz,	TW_PrintChar3

		    ld	    c, 7			    ; Print delay mask (normal)

TW_PrintChar3:
		    ld	    a, (TickCounter)
		    and	    c
		    ret	    nz				    ; Wait
TW_PrintChar3b:
		    ld	    hl,	(pTexBuffer)		    ; Pointer to unpacked text
		    ld	    de,	(TextCharXY)		    ; Next character location

TW_PrintChar4:
		    ld	    a, (hl)
		    inc	    a				    ; FF = Text	end
		    jp	    z, TW_TextEnd

		    inc	    a				    ; FE = New line
		    jp	    z, TW_PrintNewLine

		    ld	    a, (TextX)
		    ld	    b, a
		    ld	    a, (TextNX)
		    add	    a, b
		    sub	    8
		    cp	    d				    ; Is the character inside the text box?
		    jr	    c, TW_PrintNewLine2		    ; No, change line

		    ld	    a, (hl)			    ; Character
		    push    af
		    ld	    c, 1
		    call    DrawChar
		    pop	    af

		    push    af
		    ld	    b, 8			    ; Char. width
		    cp	    97h				    ; Apostrophe?
		    jr	    z, TW_PrintChar5

		    sub	    98h				    ; Dakuten?
		    jr	    nz,	TW_PrintChar6

TW_PrintChar5:
		    ld	    b, 4			    ; Char. width

TW_PrintChar6:
		    pop	    af
		    and	    a				    ; Space?
		    jr	    z, TW_PrintChar7		    ; Do not play print	SFX

		    ld	    a, (EndingStatus)
		    cp	    10				    ; Ending staff?
		    ld	    a, 23h			    ; Print SFX
		    call    nz,	SetSoundEntry		    ; There is no print	sfx in the staff

TW_PrintChar7:
		    ld	    a, d			    ; Char X
		    add	    a, b			    ; char width
		    ld	    d, a			    ; Next char	X
		    inc	    hl				    ; Pointer to next char
		    ld	    (pTexBuffer), hl
		    ld	    (TextCharXY), de
	IF (JAPANESE)
		    ld      a, (flagTxtItem)
		    and     a
		    jp      nz, TW_PrintChar
	ENDIF
	
; Check	if Snake is talking
		    ld	    a, (TextId)
		    cp	    10				    ; TEXT: This is Solid Snake... Your	reply, please
		    jr	    z, DrawSnakeFrame

		    cp	    155				    ; TEXT: This is Solid Snake... I destroyed Metal Gear. OPERATION INTRUDE N313 accomplished!
		    ret	    nz
;----------------------------------------------------------------------------
;
; Draw and animate Solid Snake portrait	(mouth and eyes)
;
;----------------------------------------------------------------------------

DrawSnakeFrame:
		    ld	    a, (TickCounter)
		    and	    1Ch
		    ld	    hl,	SnakePicture1
		    jr	    z, DrawSnakeFrame2

		    bit	    2, a
		    ld	    hl,	SnakePicture2
		    jr	    nz,	DrawSnakeFrame2

DrawSnakeFrame1:
		    ld	    hl,	SnakePicture0

DrawSnakeFrame2:
		    ld	    a, (PrevGameMode)
		    cp	    GAME_MODE_RADIO
		    ret	    nz				    ; Not in radio mode. The portrait is not visible (!?)

		    ld	    a, (EndingStatus)
		    cp	    8				    ; Ending radio news
		    ret	    nc

		    ld	    a, 1
		    ld	    (TilesetBank), a		    ; 0=First bank of 256 tiles, 1=Second bank
		    ld	    de,	0D030h
		    jp	    DrawTilesBlock

;----------------------------------------------------------------------------
; Text end
;----------------------------------------------------------------------------

TW_TextEnd:
		    call    DrawSnakeFrame1

		    ld	    a, 60h
		    ld	    (WaitTextCnt), a
		    jp	    NextTextStatus

;----------------------------------------------------------------------------
; New text line
;----------------------------------------------------------------------------

TW_PrintNewLine:
		    inc	    hl

TW_PrintNewLine2:
		    ld	    a, (TextCharXY)
		    add	    a, 12
		    ld	    (TextCharXY), a		    ; Next text	line Y

		    ld	    e, a			    ; Next char	Y
		    ld	    a, (TextX)			    ; Text box X
		    ld	    d, a			    ; Next char	X
		    jp	    TW_PrintChar4		    ; Print next char

;----------------------------------------------------------------------------
; Skip text
;----------------------------------------------------------------------------

SkipText:
		    ld	    a, 1
		    ld	    (SkipTextF), a

		    call    DrawSnakeFrame1
		    call    NextTextStatus
		    jr	    EraseWinText

;----------------------------------------------------------------------------
; Waits	after printing a text box
; Depending on the type	of text, the next text is shown	after pressing a key or	after a	fixed time
;----------------------------------------------------------------------------

TW_Wait:
		    ld	    a, (SkipTextMode)		    ; 0	= Text can be skipped. Need to press a key to read next	text box
							    ; 1	= Text can not be skipped. Need	to press a key to read next text box
							    ; 2	= Text can not be skipped. Need	to wait	to read	next text box
		    cp	    2
		    jr	    z, TW_Wait2			    ; Wait. Do not check the keys that skip the	text

		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    20h				    ; M/N
		    jr	    nz,	EraseWinText

		    ld	    a, (FKeysTrigger)		    ; 0	0 RET F5 F4 F3 F2 F1
		    and	    20h				    ; RET?
		    jp	    nz,	EraseWinText

	IF (JAPANESE)
		    ld      a, (flagTxtItem)
		    and     a
		    jr      z, TW_Wait1
		    
		    ld      a, (ControlsHold)
		    and     0Fh
		    jr      nz, EraseWinText
TW_Wait1:
	ENDIF
	
		    ld	    a, (SkipTextMode)		    ; 0	= Text can be skipped. Need to press a key to read next	text box
							    ; 1	= Text can not be skipped. Need	to press a key to read next text box
							    ; 2	= Text can not be skipped. Need	to wait	to read	next text box
		    dec	    a
		    jr	    z, TW_Wait2

		    ld	    a, (TextId)
		    cp	    10				    ; TEXT: This is Solid Snake... Your	reply, please
		    jr	    z, TW_Wait2

		    ld	    a, (PendingTextFlag)
		    and	    a
		    ret	    z				    ; There are	no more	texts

		    ld	    a, (TextBoxType)		    ; High nibble = Show prompt	icon, low nibble = Window type
		    and	    0F0h			    ; Show prompt icon?
		    jr	    nz,	DrawEnterIcon

TW_Wait2:
		    ld	    hl,	WaitTextCnt
		    dec	    (hl)
		    ret	    nz

EraseWinText:
		    ld	    hl,	(TextY)
		    ld	    bc,	(TextNY)
		    xor	    a
		    ld	    d, a
		    call    FillRect
		    jp	    NextTextStatus


;----------------------------------------------------------------------------
;
; Draw blinking	"enter" character
;
;----------------------------------------------------------------------------

DrawEnterIcon:
		    ld	    a, (TickCounter)
		    bit	    4, a
		    ld	    c, 0			    ; Erase char
		    jr	    z, DrawEnterIcon2

		    inc	    c				    ; Draw char

DrawEnterIcon2:
		    ld	    de,	(PromptXY)		    ; Intro char coordinates
		    ld	    a, 3Fh			    ; Enter icon character
		    jp	    DrawChar


;----------------------------------------------------------------------------
;
; Get the text to show in the window
;
;----------------------------------------------------------------------------

TW_GetTextPage:
	IF (JAPANESE)
		    ld      a, (TextId)
		    sub     62              ; TEXT: Gear taken!!
		    ld      a, 0
		    jr      nz, TW_GetTextPage1
		    
		    inc     a

TW_GetTextPage1:
		    ld      (flagTxtItem), a
	ENDIF
	
		    ld	    a, (PendingTextFlag)
		    and	    a				    ; Is there more text?
		    jp	    z, NextTextStatus

		    call    DecodeText			    ; Decode the next chunk of text

		    ld	    (PendingTextFlag), a	    ; Store if there is	more text to show

		    inc	    hl
		    ld	    (TextPointer), hl		    ; Pointer to next chunk of text to decode

		    ld	    a, 2
		    ld	    (TextWindowStatus),	a

		    ld	    a, 0FFh
		    ld	    (de), a			    ; End of text token	in text	buffer

		    ld	    hl,	TextBuffer
		    ld	    (pTexBuffer), hl

		    ld	    de,	(TextY)
		    ld	    (TextCharXY), de
		    ret


;----------------------------------------------------------------------------
;
; Text window end logic
;
;----------------------------------------------------------------------------

TextBox_End:
		    call    GetTextBoxXYSize		    ; Get text box location and	size

		    ld	    a, (TextId)
		    cp	    2				    ; TEXT: Operation intrude N313...
		    jr	    z, EraseTextBox

		    ld	    a, (PrevGameMode)
		    cp	    GAME_MODE_RADIO
		    jr	    z, EraseTextBox

		    ld	    a, (EndingStatus)
		    and	    a				    ; Ending? No need to restore the background
		    jr	    nz,	EraseTextBox

		    ld	    hl,	0A0h
		    ld	    a, 1
		    call    VDP_Copy_Byte		    ; Restore text box background

		    call    DrawOpenPitfalls		    ; Draw the pitfalls	that are open

		    jr	    TextBoxExit


EraseTextBox:
		    ex	    de,	hl
		    xor	    a
		    ld	    d, a
		    call    FillRect			    ; Erase text box

TextBoxExit:
		    ld	    a, (PrevGameMode)
		    ld	    (GameMode),	a		    ; Restore the previous game	mode

		    ld	    a, (SkipTextF)
		    and	    a
		    ret	    nz				    ; This text	is being skipped. Do not mark the next messages	as read, so the	player do not miss it accidentaly

		    ld	    hl,	JeniRocketF
		    ld	    a, (TextId)
		    cp	    117				    ; THIS IS JENNIFER... WILL ARRANGE A ROCKET	LAUNCHER.
		    jr	    z, TextBoxExit2

		    ld	    hl,	JeniOpenDoorF		    ; Flag to open the door to the compass room
		    cp	    118				    ; THIS IS JENNIFER... WILL OPEN THE	DOOR.
		    jr	    z, TextBoxExit2

		    ld	    hl,	SchneiderCaptured
		    cp	    138				    ; THIS IS MR. SCHNEIDER... I HAVE DISCOVERED WHO THE BOSS OF OUTER HEAVEN IS.
		    ret	    nz

TextBoxExit2:
		    ld	    (hl), 1			    ; Set event	flag
		    ret

;----------------------------------------------------------------------------
;
; Get text box size and	location
;
; Out:
;    E = Y
;    D = X
;    C = NY
;    B = NX
;
;----------------------------------------------------------------------------

GetTextBoxXYSize:
		    ld	    a, (TextBoxType)		    ; High nibble = Show prompt	icon, low nibble = Window type
							    ; Window types:
							    ; 0	- 1 line 7 characters wide 'RELIEVE' (7)
							    ; 1	- 3 lines 19 characters	wide (57)
							    ; 2	- 5 lines 16 characters	wide (80)
							    ; 3	- 5 lines, 23 characters wide [transceiver only] (115)
							    ; 4	- 2 LINES 17 CHARACTERS	WIDE (34)
		    and	    0Fh
		    add	    a, a
		    ld	    hl,	TextBoxXYSize
		    call    ADD_HL_2A

GetTextBoxXYSize2:
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)
		    inc	    hl
		    ld	    c, (hl)
		    inc	    hl
		    ld	    b, (hl)
		    ret


;----------------------------------------------------------------------------
; Iterations, SY, SX, StepY, StepX, StepNY, StepNX, Color
;----------------------------------------------------------------------------
TextBoxEffectDat:   db	  8, 1Fh,0BCh,	 1,   4,   2,	8, 0Eh
		    db	13h, 1Ah, 78h,	 1,   4,   4, 10h, 0Eh
		    db	1Eh, 22h, 94h,	 1,   2,   4, 10h, 0Eh
		    db	21h, 94h, 80h,	 1,   3,   1,	3, 0Eh
		    db	0Ch, 1Ah, 78h,	 1,   6,   4, 10h, 0Eh

;----------------------------------------------------------------------------
; textY, textX,	clearNY, clearNY, IntroY, introX
;----------------------------------------------------------------------------
TextXYSize:	    db	1Ch,0A4h,   8, 38h, 1Ch,0D4h
		    db	0Ch, 34h, 20h, 98h, 24h,0C4h
		    db	  8, 5Ch, 38h, 80h, 38h,0D4h
		    db	78h, 24h, 38h,0B8h,0A8h,0D4h
		    db	12h, 38h, 14h, 88h, 1Eh,0B8h

;----------------------------------------------------------------------------
; window Y, window X, window NY, window	NX
;----------------------------------------------------------------------------
TextBoxXYSize:	    db	18h,0A0h, 11h, 40h
		    db	  8, 30h, 29h,0A0h
		    db	  4, 58h, 40h, 88h
		    db	74h, 20h, 48h,0C8h
		    db	  8, 30h, 29h,0A0h

;----------------------------------------------------------------------------
;
; Initialize player variables
;
; Set player palette/sprite/position/speed
; Set default life value and rank
;----------------------------------------------------------------------------

InitPlayerVars:
		    call    SetSnakePal			    ; Set Solid	Snake palette

		    ld	    a, 18h
		    ld	    (Life), a			    ; LogoCnt
		    ld	    (MaxLife), a		    ; Default life

		    xor	    a
		    ld	    (Class), a			    ; Rank
		    ld	    (PlayerFrameNum), a
		    ld	    (PlayerAnimation), a	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    ld	    (PlayerControlMod),	a	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
		    inc	    a
		    ld	    (StopPlayerFlag), a		    ; Stop the player
		    inc	    a
		    ld	    (PlayerDirection), a	    ; Down
		    inc	    a
		    ld	    (SnakeSprId), a		    ; Stand down
		    ld	    hl,	200h
		    ld	    (PlayerMovSpeed), hl

		    ld	    a, (ControlConfig)		    ; Bit6: 1=Enable music/Player control
		    bit	    6, a			    ; Demo mode?
		    ret	    z				    ; Yes

		    ld	    a, 4
		    ld	    (PlayerAnimation), a	    ; Player in	deep water
		    rlca
		    ld	    (PlayerControlMod),	a	    ; 8	= Intro	scene control

		    ld	    a, 25h			    ; Sprite water shadow
		    ld	    (SnakeSprId), a

		    ld	    hl,	0B800h
		    ld	    (PlayerYdec), hl
		    ld	    h, 0C0h
		    ld	    (PlayerXdec), hl		    ; Intro start location

		    ld	    hl,	100h
		    ld	    (PlayerMovSpeed), hl
		    ld	    a, 40h
		    ld	    (IntroSceneCnt), a
		    ret

;----------------------------------------------------------------------------
;
; Player control logic
;
;----------------------------------------------------------------------------

PlayerControlLogic:
		    ld	    a, (PlayerControlMod)	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
		    call    JumpIndex

		    dw NormalCtrl
		    dw PunchLogic
		    dw ElevatorCtrl
		    dw Dead
		    dw ParachuteLogic
		    dw AirFlowLogic
		    dw LaddersWalk
		    dw LaddersClimb
		    dw IntroScene

;----------------------------------------------------------------------------
;
; Player control: normal
;
;----------------------------------------------------------------------------

NormalCtrl:
		    ld	    a, (PlayerShotsList)
		    cp	    7
		    ret	    z				    ; Too many shots. Ignore player controls.

		    call    GetPlayerDir		    ; Check the	direction of the player	depending on which controls are	pressed
		    call    ChkWater			    ; Check if the player is in	water

		    ld	    a, (PlayerControlMod)	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
		    cp	    CONTROL_DEAD
		    jp	    z, AnimatePlayer		    ; Do not check controls and	update the sprite

		    call    ChkRoofAirFlow		    ; Checks if	the player is in the air flow on the roof, and wearing the bomb	suit

		    ld	    a, (PlayerControlMod)	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
		    cp	    CONTROL_AIR_FLOW
		    jp	    z, AnimatePlayer		    ; He is in the air flow. Just update the sprite

		    call    chkPunch			    ; Check punch action
		    call    ChkControlPlayer		    ; Update player speed depending on the pressed controls
		    call    ChkPlayerColl		    ; Check player/punch collisions with tiles

		    ld	    a, (PlayerAnimation)	    ; Current player animation
		    dec	    a				    ; Punch
		    jr	    z, SetAnimation

		    dec	    a				    ; Water
		    jr	    z, SetAnimation

		    sub	    2				    ; Deep water
		    jr	    z, SetAnimation

		    ld	    a, (SelectedItem)
		    cp	    SELECTED_BOX		    ; Cardboard	box
		    ld	    a, 7
		    jr	    z, NormalCtrl2

		    xor	    a				    ; Switch to	normal mode

NormalCtrl2:
		    ld	    (PlayerAnimation), a	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box

SetAnimation:
		    call    AnimatePlayer
		    jp	    ChkExitRoom

;----------------------------------------------------------------------------
;
; Player control: punch
;
;----------------------------------------------------------------------------

PunchLogic:
		    call    GetDirLeftRight
		    call    PunchLogic2			    ; Decrement	punch timer and	restore	normal status when finished



;----------------------------------------------------------------------------
;
; Player control: dead
; Just update te animation
;
;----------------------------------------------------------------------------

Dead:
		    jp	    AnimatePlayer

;----------------------------------------------------------------------------
;
; Player control: elevator room
;
;----------------------------------------------------------------------------

ElevatorCtrl:
		    call    ChkCtrlElevator		    ; Check if the player moves	the elevator

		    ld	    a, (GameMode)		    ; Game mode	can be changed in the previous call
		    cp	    GAME_MODE_ELEVATOR
		    jp	    z, SetSprIdle		    ; Set Snake	idle sprite

		    call    GetDirLeftRight		    ; Check if the player change his derection to the left or right
		    call    ControlPlayerH		    ; Check if the player moves	to the left or right
		    call    ChkPlayerColl		    ; Check collision with tiles

		    xor	    a
		    ld	    (PlayerAnimation), a	    ; Walk animation
		    call    AnimatePlayer		    ; Update player sprite
		    jp	    ChkLimitXElevator		    ; Update player's position and check elevator room X boundaries

;----------------------------------------------------------------------------
;
; Player control: parachute
; Move left and	right while falling
;
;----------------------------------------------------------------------------

ParachuteLogic:
		    ld	    hl,	100h			    ; Move to the right
		    ld	    (PlayerSpeedY), hl

		    ld	    a, (TickCounter)
		    bit	    4, a
		    jr	    z, ParachuteLogic2

		    ld	    h, -1			    ; To the left

ParachuteLogic2:
		    ld	    (PlayerSpeedX), hl

		    ld	    a, 3
		    ld	    (PlayerAnimation), a	    ; Parachute	animation
		    jp	    SetAnimation

;----------------------------------------------------------------------------
;
; Player control: roof air flow
;
;----------------------------------------------------------------------------

AirFlowLogic:
		    ld	    hl,	PlayerY
		    ld	    a, (hl)
		    cp	    30h
		    jr	    c, ExitAirFlow

		    dec	    (hl)
		    dec	    (hl)
		    dec	    (hl)			    ; Move the player up
		    ret


ExitAirFlow:
		    xor	    a
		    ld	    (PlayerControlMod),	a	    ; Walk mode
		    ret

;----------------------------------------------------------------------------
;
; Player control: scape	ladders	room
;
;----------------------------------------------------------------------------

LaddersWalk:
		    call    GetDirLeftRight		    ; Check if the player change his direction (left or	right)
		    call    ControlPlayerH		    ; Check if the player moves	left or	right
		    call    ChkPlayerColl		    ; Check collisions with tiles
		    call    ChkStartClimb		    ; Check if the player stars	climbing a ladder

		    ld	    a, (PlayerControlMod)	    ; The previous call	can change the control mode
		    cp	    CONTROL_LADDER_CLIMB	    ; On a ladder?
		    ret	    z

		    xor	    a
		    ld	    (PlayerAnimation), a	    ; Set walk animation
		    jp	    SetAnimation

;----------------------------------------------------------------------------
;
; Player control: scape	ladders	climb
;
;----------------------------------------------------------------------------

LaddersClimb:
		    call    GetDirUpDown		    ; Check if the player change his direction (up or down)
		    call    ControlPlayerV		    ; Check if the player moves	up or down
		    call    ChkPlayerColl		    ; Check collisions
		    call    ChkExitLadders		    ; Check if the player gets off the ladder

		    ld	    a, (PlayerControlMod)	    ; The previous call	can change the control mode
		    cp	    CONTROL_LADDER_WALK
		    ret	    z				    ; The player is not	on the ladders

		    ld	    a, 5
		    ld	    (PlayerAnimation), a	    ; Set climbing animation
		    call    AnimatePlayer
		    jp	    ChkLadderLimits		    ; Check ladders boundaries.	Trigger	the ending if the player exits Outher Heaven

;----------------------------------------------------------------------------
;
; Player control: intro	scene
;
;----------------------------------------------------------------------------

IntroScene:
		    call    SetBankInA0_9
		    call    IntroSceneLogic		    ; Intro demo logic
		    call    SetBanks1_2_3

		    ld	    a, (PlayerControlMod)	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
		    and	    a
		    ret	    nz				    ; The demo has not finished	yet

		    call    SetBankInA0_6
		    call    ChkSaveGameStatus		    ; Create checkpoint	/ save state
		    jp	    SetBanks1_2_3



;----------------------------------------------------------------------------
;
; Check	player up/down direction
; New pressed directions have priority over old	ones
; If two directions are	pressed	and then one is	released, the player will move in the still pressed one
;
;----------------------------------------------------------------------------

GetDirUpDown:
		    ld	    c, 3
		    jr	    GetPlayerDir2



;----------------------------------------------------------------------------
;
; Check	player left/right direction
; New pressed directions have priority over old	ones
; If two directions are	pressed	and then one is	released, the player will move in the still pressed one
;
;----------------------------------------------------------------------------

GetDirLeftRight:
		    ld	    c, 0Ch
		    jr	    GetPlayerDir2



;----------------------------------------------------------------------------
;
; Check	player direction
; New pressed directions have priority over old	ones
; If two directions are	pressed	and then one is	released, the player will move in the still pressed one
;
;----------------------------------------------------------------------------

GetPlayerDir:
		    ld	    c, 0Fh			    ; Controls mask: directions	only

GetPlayerDir2:
		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    c
		    jr	    nz,	GetPlayerDir3		    ; A	new direction has been pressed

		    ld	    hl,	DirectionMask		    ; Bitmask of the last pressed direction control
		    ld	    a, (ControlsHold)		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    c				    ; Controls mask
		    ld	    b, a
		    and	    (hl)			    ; Same direction that was pressed?
		    ld	    a, b
		    jr	    nz,	GetPlayerDir5		    ; Yes, it is still pressed

		    ld	    hl,	DirectionMaskOld	    ; Bitmask of the previous pressed direction	control
		    ld	    a, (ControlsHold)		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    c
		    and	    (hl)
		    ld	    a, b
		    jr	    z, GetPlayerDir5		    ; The old one also is no pressed

		    ld	    a, (hl)
		    ld	    (hl), 0			    ; Erase DirectionMaskOld
		    jr	    GetPlayerDir4


GetPlayerDir3:
		    ld	    a, (DirectionMask)		    ; Bitmask of the last pressed direction control
		    ld	    (DirectionMaskOld),	a	    ; Bitmask of the previous pressed direction	control

		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    c				    ; Controls mask
		    ld	    c, a
		    and	    1				    ; Up
		    jr	    nz,	GetPlayerDir4

		    ld	    a, c
		    and	    2				    ; Down
		    jr	    nz,	GetPlayerDir4

		    ld	    a, c
		    and	    4				    ; Left
		    jr	    nz,	GetPlayerDir4

		    ld	    a, c
		    and	    8				    ; Right

GetPlayerDir4:
		    ld	    (DirectionMask), a		    ; Bitmask of the last pressed direction control

GetPlayerDir5:
		    ld	    hl,	IdsDirection
		    call    ADD_HL_A
		    ld	    a, (hl)
		    ld	    (PlayerDirectionNew), a	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    ret


;----------------------------------------------------------------------------
;
; Directions
;
;----------------------------------------------------------------------------
IdsDirection:	    db 0
		    db DIR_UP
		    db DIR_DOWN
		    db 0
		    db DIR_LEFT
		    db 0
		    db 0
		    db 0
		    db DIR_RIGHT
		    db 0
		    db 0
		    db 0
		    db 0
		    db 0
		    db 0
		    db 0


;----------------------------------------------------------------------------
;
; Check	up and down controls
;
;----------------------------------------------------------------------------

ControlPlayerV:
		    xor	    a
		    ld	    (InAirFlow), a		    ; 1	= Snake	is being pushed	by the air floor in the	roof

		    ld	    a, (ControlsHold)		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    3				    ; Mask up and down
		    jr	    nz,	ControlPlayer		    ; Up or down pressed

		    jr	    SetStopPlayer


;----------------------------------------------------------------------------
;
; Check	left and right controls
;
;----------------------------------------------------------------------------

ControlPlayerH:
		    xor	    a
		    ld	    (InAirFlow), a		    ; 1	= Snake	is being pushed	by the air floor in the	roof

		    ld	    a, (ControlsHold)		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    0Ch				    ; Mask left	and right
		    jr	    nz,	ControlPlayer		    ; Left or right pressed

		    jr	    SetStopPlayer


;----------------------------------------------------------------------------
;
; Move or stop the player depending on the pressed controls
;
;----------------------------------------------------------------------------

ChkControlPlayer:
		    ld	    a, (PlayerControlMod)	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
		    cp	    CONTROL_PUNCH		    ; Is punching?
		    ret	    z				    ; Can't be controlled while punching

		    ld	    a, (ControlsHold)		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    0Fh				    ; Any direction pressed?
		    jr	    nz,	ControlPlayer		    ; Yes

SetStopPlayer:
		    inc	    a
		    ld	    (StopPlayerFlag), a		    ; The player is not	moving
		    jr	    ControlPlayer2


ControlPlayer:
		    xor	    a
		    ld	    (StopPlayerFlag), a		    ; The player is moving

		    ld	    a, (PlayerDirectionNew)	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    and	    a				    ; A	new direction was selected?
		    jr	    z, ControlPlayer2		    ; No

		    ld	    (PlayerDirection), a	    ; Set player direction

ControlPlayer2:
		    ld	    hl,	(PlayerMovSpeed)
		    ld	    e, l
		    ld	    d, h			    ; Same speed X and Y

		    ld	    a, (StopPlayerFlag)		    ; 1=The player is not moving
		    and	    a				    ; Should the player	stop moving?
		    jr	    nz,	StopPlayer		    ; Yes

		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    dec	    a
		    jr	    z, PlayerMovUp

		    dec	    a
		    jr	    z, PlayerMovDown

		    dec	    a
		    jr	    z, PlayerMovLeft

		    ld	    hl,	0
		    jr	    PlayerMovRight


;----------------------------------------------------------------------------
;
; Stop the player
;
;----------------------------------------------------------------------------

StopPlayer:
		    ld	    hl,	0
		    jr	    PlayerMovDown


;----------------------------------------------------------------------------
;
; Move the player up or	down
;
;----------------------------------------------------------------------------

PlayerMovUp:
		    call    ChangeSignHL

PlayerMovDown:
		    ld	    de,	0			    ; Speed X =	0
		    jr	    UpdatePlayerSpd


;----------------------------------------------------------------------------
;
; Move the player left or right
;
;----------------------------------------------------------------------------

PlayerMovLeft:
		    call    ChangeSignDE

PlayerMovRight:
		    ld	    hl,	0
;----------------------------------------------------------------------------
;
; Update player's speed
;
;----------------------------------------------------------------------------

UpdatePlayerSpd:
		    ld	    (PlayerSpeedY), hl
		    ld	    (PlayerSpeedX), de

		    ld	    a, (InAirFlow)		    ; 1	= Snake	is being pushed	by the air floor in the	roof
		    and	    a
		    ret	    z				    ; Not in air flow

		    ld	    hl,	0
		    ld	    (PlayerSpeedY), hl		    ; Discard Y	speed when in air flow
		    ret

;----------------------------------------------------------------------------
;
; Check	punch action
; Can not punch	in water or inside the cardboard box
;
;----------------------------------------------------------------------------

chkPunch:
		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    20h				    ; M	or fire?
		    ret	    z				    ; Punch button not pressed

		    ld	    a, (PlayerAnimation)	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    cp	    2				    ; In water?
		    ret	    z				    ; Can not punch in water

		    cp	    4				    ; In deep water?
		    ret	    z				    ; Can't puch in deep water

		    cp	    7				    ; Inside the box?
		    ret	    z				    ; Can't punch inside the box

		    ld	    a, 8
		    ld	    (PunchCnt),	a

		    ld	    a, 1
		    ld	    (PlayerAnimation), a	    ; Set punch	animation
		    ld	    (PlayerControlMod),	a	    ; Set punch	control	mode

ResetPlayerSpd:
		    ld	    hl,	0

SetPlayerSpeed:
		    ld	    (PlayerSpeedY), hl
		    ld	    (PlayerSpeedX), hl
		    ret



;----------------------------------------------------------------------------
;
; Check	player collisions with tiles
;
;----------------------------------------------------------------------------

ChkPlayerColl:
		    ld	    a, (PlayerControlMod)	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
		    dec	    a				    ; Punching?
		    jr	    z, ChkPunchColl

		    ld	    hl,	(PlayerYdec)
		    ld	    de,	(PlayerSpeedY)
		    add	    hl,	de
		    ld	    a, h			    ; Next player Y location

		    ld	    hl,	(PlayerXdec)
		    ld	    de,	(PlayerSpeedX)
		    add	    hl,	de
		    ld	    l, a			    ; Next player X

		    ld	    b, 0			    ; Size/shape
		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    ld	    c, a

		    push    bc
		    push    hl
		    call    ChkTileCollision_
		    pop	    hl
		    pop	    bc

		    jr	    c, ResetPlayerSpd		    ; Collision

		    ld	    a, (Room)
		    cp	    78				    ; Ditch/water channel entrance room
		    ret	    nz

		    ld	    b, 2
		    call    ChkTileCollision_
		    ret	    nc

		    jr	    ResetPlayerSpd



;----------------------------------------------------------------------------
;
; Check	punch collision	with tiles
;
;----------------------------------------------------------------------------

ChkPunchColl:
		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    dec	    a
		    ld	    bc,	-200h			    ; BC = Y offset up
		    ld	    d, c
		    ld	    e, c			    ; DE = X offset 0
		    jr	    z, ChkPunchColl2		    ; Up

		    dec	    a
		    ld	    b, 2			    ; BC = Y offset down
		    jr	    z, ChkPunchColl2		    ; Down

		    dec	    a
		    ld	    b, d
		    ld	    c, d			    ; BC = Y offset 0
		    ld	    d, -2			    ; DE = X offset left
		    jr	    z, ChkPunchColl2		    ; Left

		    ld	    d, 2			    ; DE = X offset right

ChkPunchColl2:
		    ld	    hl,	(PlayerYdec)
		    add	    hl,	bc
		    ld	    a, h

		    ld	    hl,	(PlayerXdec)
		    add	    hl,	de			    ; H	= X tile to check
		    ld	    l, a			    ; L	= Y tile
		    ld	    b, 0
		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    ld	    c, a
		    call    ChkTileCollision_

		    ld	    a, 9			    ; Sfx: punch wall
		    call    c, SetSoundEntryChk
		    ret



;----------------------------------------------------------------------------
;
; Decrement punch timer	and restore normal mode	after finishing	the punch action
;
;----------------------------------------------------------------------------

PunchLogic2:
		    ld	    hl,	PunchCnt
		    dec	    (hl)
		    ret	    nz				    ; Not finished

		    xor	    a
		    ld	    (PlayerAnimation), a	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    ld	    (PlayerControlMod),	a	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
		    ret




;----------------------------------------------------------------------------
;
; Check	if the player is inside	the elevator cabin and moves it
; Some elevator	only moves up or down
;
;----------------------------------------------------------------------------

ChkCtrlElevator:
		    ld	    a, (PlayerX)
		    cp	    78h
		    ret	    nc				    ; Player not inside	elevator cabin

		    ld	    c, 3			    ; Up/Down control mask
		    ld	    a, (Room)
		    cp	    243				    ; Room < 243
		    jr	    c, ChkCtrlElevator2		    ; Can move up and down

		    cp	    247				    ; Room >= 247 (Metal Gear elevator)
		    jr	    nc,	ChkCtrlElevator2	    ; Can move up and down

		    ld	    c, 1			    ; Up control mask
		    cp	    245
		    jr	    c, ChkCtrlElevator2		    ; Can move only up

		    inc	    c				    ; Down control mask

ChkCtrlElevator2:
		    ld	    a, (ControlsHold)		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    c				    ; Control mask
		    ret	    z				    ; Not valid	control

		    ld	    hl,	ElevatorY
		    rra					    ; Control UP?
		    jr	    c, ChkCtrlElevator3

		    ld	    c, 2			    ; Elevator down
		    ld	    a, (ElevatorLimitDown)
		    jr	    ChkCtrlElevator4


ChkCtrlElevator3:
		    ld	    c, 1			    ; Elevator up
		    ld	    a, (ElevatorLimitUp)

ChkCtrlElevator4:
		    cp	    (hl)			    ; Elevator Y
		    ret	    z

		    ld	    a, c
		    ld	    (ElevatorDir), a		    ; 1=up, 2=down

		    ld	    hl,	ElevatorStatus
		    ld	    (hl), 0

		    ld	    a, GAME_MODE_ELEVATOR
		    ld	    (GameMode),	a		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late
		    ret


;----------------------------------------------------------------------------
;
; Check	if the player is in water
; Decrement life If he is in deep water	and not	using the oxygen tank
;
;----------------------------------------------------------------------------

ChkWater:
		    ld	    a, (Room)			    ; Current room number
		    ld	    hl,	RoomsWater		    ; List of rooms with water
		    ld	    b, 10			    ; Number of	rooms with water

ChkWater2:
		    cp	    (hl)			    ; Does the current room have water?
		    jr	    z, ChkWaterTiles		    ; Yes

		    inc	    hl
		    djnz    ChkWater2

		    ld	    a, (PlayerAnimation)	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    cp	    7				    ; Player in	cardboard box mode?
		    ret	    z				    ; No

		    xor	    a
		    ld	    (PlayerAnimation), a	    ; Set walking mode
		    ret


ChkWaterTiles:
		    call    GetTilePlayer

		    ld	    a, h			    ; Right tile
		    cp	    6Fh				    ; Water related tile?
		    jr	    c, ChkWaterTiles2		    ; No

		    cp	    73h				    ; 6F-72 Shadow water tiles
		    jr	    c, ChkDeepShadow		    ; Check if the shadow tile is normal or deep water

		    cp	    75h				    ; 73-74 normal water tiles
		    jr	    c, SetInWaterMode

		    cp	    77h				    ; 75-76 deep water tiles
		    jr	    c, SetDeepWaterMode

ChkWaterTiles2:
		    ld	    a, l			    ; Left tile
		    cp	    6Fh				    ; Water related tiles?
		    jr	    c, ChkWaterTiles3

		    cp	    73h				    ; 6F-72 Shadow water tiles
		    jr	    c, ChkDeepShadow		    ; Check if the shadow tile is normal or deep water

		    cp	    75h				    ; 73-74 normal water tiles
		    jr	    c, SetInWaterMode

		    cp	    77h				    ; 75-76 deep water tiles
		    jr	    c, SetDeepWaterMode

ChkWaterTiles3:
		    ld	    a, h
		    cp	    6Dh				    ; Bricks tile
		    jr	    z, SetInWaterMode

		    ld	    a, l
		    cp	    6Dh				    ; Bricks tile
		    jr	    z, SetInWaterMode

		    ld	    a, (SelectedItem)
		    cp	    SELECTED_BOX		    ; Box
		    ld	    a, 7			    ; Box animation mode
		    jr	    z, SetInWaterMode2

		    xor	    a				    ; Normal mode. Not in water
		    jr	    SetInWaterMode2



;----------------------------------------------------------------------------
;
; Chech	is shadow water	tile is	related	to normal or deep water
; The last four	rooms in "RoomsWater" list are all deep water
;
;----------------------------------------------------------------------------

ChkDeepShadow:
		    ld	    a, (Room)
		    ld	    hl,	RoomsWater
		    ld	    b, 6

ChkDeepShadow2:
		    cp	    (hl)
		    jr	    z, SetInWaterMode

		    inc	    hl
		    djnz    ChkDeepShadow2

SetDeepWaterMode:
		    ld	    a, 4			    ; Deep water mode
		    jr	    SetInWaterMode2


SetInWaterMode:
		    ld	    a, 2			    ; In water mode

SetInWaterMode2:
		    ld	    hl,	PlayerAnimation		    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    cp	    (hl)
		    ld	    (PlayerAnimation), a	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    jr	    z, SetInWaterMode3

		    xor	    a
		    ld	    (PlayerAnimWaitCnt), a
		    ld	    (PlayerFrameNum), a

SetInWaterMode3:
		    ld	    a, (hl)
		    cp	    4				    ; Is player	in deep	water?
		    ret	    nz

		    ld	    a, (SelectedItem)
		    cp	    SELECTED_OXYGEN		    ; Oxygen tank selected?
		    ret	    z				    ; No problem, he is	using the oxygen tank

		    ld	    c, 8			    ; Damage delay
		    jp	    DecrementLife_C		    ; Decrement	life


;----------------------------------------------------------------------------
;
; List of rooms	with water
; The last four	rooms are deep water
;
;----------------------------------------------------------------------------
RoomsWater:	    db 70
		    db 73
		    db 74
		    db 77
		    db 78
		    db 107
		    db 105
		    db 106
		    db 211
		    db 212

;----------------------------------------------------------------------------
;
; Check	if the player is in the	air flow of the	roof
;
;----------------------------------------------------------------------------

ChkRoofAirFlow:
		    xor	    a
		    ld	    (InAirFlow), a		    ; Not in the air flow by default

		    ld	    a, (Room)
		    cp	    53				    ; Roof elevator
		    ret	    nz				    ; The player is not	in the room of the air flow

		    ld	    a, (SelectedItem)
		    cp	    SELECTED_BOMB_SUIT		    ; Bomb blast suit
		    ret	    z				    ; He is wearing the	bomb suit

		    ld	    a, (PlayerY)
		    cp	    50h
		    ret	    c

		    cp	    60h
		    ret	    nc

		    ld	    a, (PlayerX)
		    cp	    48h
		    ret	    c

		    cp	    0C0h
		    ret	    nc				    ; Not in the air flow area

		    ld	    a, (ControlsHold)		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    2				    ; Holding down?
		    jr	    z, ChkRoofAirFlow2

		    ld	    a, 1
		    ld	    (InAirFlow), a		    ; 1	= Snake	is being pushed	by the air floor in the	roof
		    ret


ChkRoofAirFlow2:
		    ld	    a, CONTROL_AIR_FLOW
		    ld	    (PlayerControlMod),	a	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk

		    ld	    a, 11h			    ; Sfx Snake	pushed back by the air
		    jp	    SetSoundEntryChk

;----------------------------------------------------------------------------
;
; Checks if the	player starts climbing a ladder
;
;----------------------------------------------------------------------------

ChkStartClimb:
		    call    GetTilePlayer
		    ld	    a, h
		    cp	    8				    ; Ladder left tile
		    ret	    nz				    ; Not on a ladder

		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    rra					    ; Up
		    ret	    nc				    ; Not pressing up

		    ld	    a, 99h
		    ld	    (PlayerY), a

		    ld	    a, CONTROL_LADDER_CLIMB	    ; Climb ladder mode
		    ld	    (PlayerControlMod),	a	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk

		    ld	    a, 5
		    ld	    (PlayerAnimation), a	    ; Climb ladder animation

		    xor	    a
		    ld	    l, a
		    ld	    (DirectionMaskOld),	a	    ; Bitmask of the previous pressed direction	control
		    ld	    (PlayerAnimWaitCnt), a
		    ld	    (PlayerFrameNum), a
		    inc	    a
		    ld	    h, a
		    ld	    (PlayerDirection), a	    ; Up
		    ld	    (DirectionMask), a		    ; Up pressed
		    ld	    (PlayerMovSpeed), hl
		    jr	    SetPlayerSpr_0

;----------------------------------------------------------------------------
;
; Check	if the player gets off the ladder
;
;----------------------------------------------------------------------------

ChkExitLadders:
		    ld	    a, (Room)
		    cp	    224				    ; First ladder room
		    ret	    nz				    ; Only in this room	the player can get off the ladder

		    ld	    a, (PlayerY)
		    cp	    99h				    ; Floor level (climbing)
		    ret	    nz				    ; Not in the start of the ladder

		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    1100b			    ; Left or right pressed?
		    ret	    z				    ; No, he is	not getting off	the ladder

		    and	    8				    ; Right pressed?
		    ld	    bc,	804h			    ; Right
		    jr	    nz,	ChkExitLadders2

		    ld	    bc,	403h			    ; Left

ChkExitLadders2:
		    ld	    a, c
		    ld	    (PlayerDirection), a	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    ld	    a, b
		    ld	    (DirectionMask), a		    ; Bitmask of the last pressed direction control

		    ld	    a, 9Eh
		    ld	    (PlayerY), a		    ; Floor level (walking)

		    ld	    a, CONTROL_LADDER_WALK
		    ld	    (PlayerControlMod),	a	    ; Walk in ladder room mode

		    ld	    hl,	200h
		    ld	    (PlayerMovSpeed), hl

		    xor	    a
		    ld	    (PlayerAnimation), a	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    ld	    (DirectionMaskOld),	a	    ; Bitmask of the previous pressed direction	control
		    ld	    (PlayerAnimWaitCnt), a
		    ld	    (PlayerFrameNum), a

SetPlayerSpr_0:
		    jp	    AnimatePlayer

;----------------------------------------------------------------------------
;
; Update player	position and check room	boundaries
;
;----------------------------------------------------------------------------

ChkExitRoom:
		    call    MovePlayerX			    ; Update player X

		    ld	    a, h			    ; Player X
		    cp	    12
		    ld	    c, 3			    ; Left
		    jp	    c, ExitRoom

		    inc	    c				    ; Right
		    cp	    244
		    jp	    nc,	ExitRoom

		    call    MovePlayerY

		    ld	    a, h
		    cp	    16				    ; Up
		    ld	    c, 1
		    jr	    c, ExitRoom

		    inc	    c				    ; Down
		    cp	    186
		    jr	    nc,	ExitRoom
		    ret

;----------------------------------------------------------------------------
;
; Update player's position and check elevator room X boundaries
;
;----------------------------------------------------------------------------

ChkLimitXElevator:
		    call    MovePlayerX
		    ld	    a, h			    ; Player X
		    cp	    104				    ; Left boundary
		    jr	    nc,	ChkLimitXElevator2

		    ld	    h, 104
		    ld	    (PlayerXdec), hl		    ; The player can't move further
		    ret


ChkLimitXElevator2:
		    ld	    a, h			    ; Player X
		    cp	    244				    ; Right boundary
		    ld	    c, DIR_RIGHT
		    jp	    nc,	ExitRoom		    ; Exit elevator room
		    ret

;----------------------------------------------------------------------------
;
; Update player's position and check escape ladders boundaries
; Triggers the ending scene after escaping
;
;----------------------------------------------------------------------------

ChkLadderLimits:
		    call    MovePlayerY

		    ld	    a, (Room)
		    cp	    226				    ; Last ladder room
		    jr	    nz,	ChkLadderDownlimit

		    ld	    c, a
		    ld	    a, h			    ; H=Player Y
		    cp	    10h				    ; Upper part of the	ladder
		    jr	    c, SetLeavedOuterH		    ; Has reached the end of the ladder. Trigger the ending

		    ld	    a, c			    ; Room number

ChkLadderDownlimit:
		    cp	    224				    ; First ladders room
		    jr	    nz,	ChkNextLadderRoom

		    ld	    a, h
		    cp	    99h				    ; Bottom limit
		    jr	    c, ChkNextLadderRoom

		    ld	    h, 99h
		    ld	    (PlayerYdec), hl
		    ret


ChkNextLadderRoom:
		    ld	    a, h
		    cp	    16				    ; Upper limit
		    ld	    c, DIR_UP			    ; Up
		    jr	    c, ExitRoom

		    inc	    c				    ; Down
		    cp	    186				    ; bottom limit
		    jr	    nc,	ExitRoom
		    ret

;----------------------------------------------------------------------------
;
; Moving to another room
;
; In:
;    C = Exit direction
;
;----------------------------------------------------------------------------

ExitRoom:
		    ld	    a, c
		    ld	    (NextRoomDirect), a		    ; 4=Right, 3=Left, 2=Down, 1=Up

		    ld	    a, GAME_MODE_NEXT_ROOM
		    ld	    (GameMode),	a		    ; Set change room mode
		    ret

;----------------------------------------------------------------------------
;
; Set "escaped from Outer Heaven" flag
; This flag triggers the ending
;
;----------------------------------------------------------------------------

SetLeavedOuterH:
		    ld	    a, 1
		    ld	    (LeavedOuterHeaven), a
		    ret

;----------------------------------------------------------------------------
;
; Update player	position X
; Add SpeedX to	X
;
; Out:
;    H = Player	X
;----------------------------------------------------------------------------

MovePlayerX:
		    ld	    de,	(PlayerSpeedX)

		    ld	    hl,	(PlayerXdec)
		    add	    hl,	de			    ; Add speed	to current position
		    ld	    (PlayerXdec), hl
		    ret

;----------------------------------------------------------------------------
;
; Update player	position Y
; Add SpeedY to	Y
;
; Out:
;    H = Player	Y
;----------------------------------------------------------------------------

MovePlayerY:
		    ld	    de,	(PlayerSpeedY)

		    ld	    hl,	(PlayerYdec)
		    add	    hl,	de			    ; Add speed	to current position
		    ld	    (PlayerYdec), hl
		    ret

;----------------------------------------------------------------------------
;
; Downgrade rank and reset rescued prisoners count
; Adjust the life and ammo to the new limits
;
;----------------------------------------------------------------------------

DowngradeRank:
		    ld	    a, (RescuedArray+0Dh)	    ; Jeniffer's brother rescued status

		    ld	    hl,	RescuedArray
		    ld	    de,	 RescuedArray+1
		    ld	    bc,	17			    ; There are	23 prisoners. The first	6 are not restored
		    ld	    (hl), b
		    ldir				    ; Reset last 17 prisoners rescued status

		    ld	    (RescuedArray+0Dh),	a	    ; Restore Jennifer's brother rescued status

		    xor	    a
		    ld	    (RescuedCnt), a		    ; Reset rescued prisoners

		    ld	    hl,	Class			    ; Logo end flag
		    ld	    a, (hl)
		    and	    a				    ; Rank/class = 0?
		    ret	    z				    ; Yes

		    dec	    (hl)			    ; Decrement	rank

		    ld	    a, 27h			    ; SFX decrement rank
		    call    SetSoundEntryChk

		    ld	    a, (Life)			    ; LogoCnt
		    push    af
		    call    UpdateLevels		    ; Update life max. value, and ammon/rations	limits.
		    pop	    af

		    ld	    c, a
		    ld	    a, (MaxLife)
		    cp	    c				    ; Current life greater than	new limit?
		    jr	    nc,	DowngradeRank2

		    ld	    a, (MaxLife)
		    ld	    c, a			    ; Set life at max. value

DowngradeRank2:
		    ld	    a, c
		    ld	    (Life), a			    ; Life

		    call    LimitAmmo			    ; Keeps the	amount of ammo and rations in the limits

		    jp	    DrawWeaponHUD

;----------------------------------------------------------------------------
;
; Increment rank each 5	rescued	prisoners
; Increment the	enegy bar size and fill	it
; Increment the	max. amount of rations and ammo
;
;----------------------------------------------------------------------------

IncRescued:
		    ld	    hl,	RescuedCnt		    ; Rescued prisoners	count (0-4)
		    inc	    (hl)
		    ld	    a, (hl)
		    cp	    5				    ; Has rescued 5 prisoners?
		    ret	    nz				    ; Not yet

		    ld	    (hl), 0			    ; Reset rescued counter

IncClassLv:
		    ld	    hl,	Class			    ; Logo end flag
		    ld	    a, (hl)
		    cp	    3				    ; Max. class
		    ret	    z				    ; Already in the maximum rank

		    inc	    (hl)			    ; Increment	class

		    ld	    a, 26h			    ; SFX rank up
		    call    SetSoundEntryChk

UpdateLevels:
		    push    hl
		    call    DrawClass			    ; Draw class text and stars
		    pop	    hl

		    ld	    c, (hl)			    ; Rank/class
		    dec	    c
		    ld	    a, 32			    ; Life level 2
		    jr	    z, UpdateLevels2

		    dec	    c
		    ld	    a, 40			    ; Life level 3
		    jr	    z, UpdateLevels2

		    dec	    c
		    ld	    a, 48			    ; Life level 4
		    jr	    z, UpdateLevels2

		    ld	    a, 24			    ; Life level 1

UpdateLevels2:
		    ld	    (MaxLife), a
		    ld	    (Life), a			    ; Set life to max value
		    call    DrawLife			    ; Draw life	text and bar
		    jp	    SetMaxAmmoVals		    ; Updates the limit	of items and ammo depending on the rank


;----------------------------------------------------------------------------
;
; Select player's sprite depending on the action and weapon
;
;----------------------------------------------------------------------------

AnimatePlayer:
		    ld	    a, (PlayerAnimation)	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    call    JumpIndex

		    dw SetSprWalk
		    dw SetSprPunch			    ; Punch
		    dw SetSprWater			    ; Water
		    dw SetSprParachute			    ; Parachute
		    dw SetSprDeepWater			    ; Deep water
		    dw SetSprLadder			    ; Ladder
		    dw SetSprDead			    ; Dead
		    dw SetSprBox			    ; Box



;----------------------------------------------------------------------------
;
; Player sprite: walk
;
;----------------------------------------------------------------------------

SetSprWalk:
		    ld	    a, (StopPlayerFlag)		    ; 1=The player is not moving
		    and	    a				    ; Is the player moving?
		    jr	    z, SetSprWalk2		    ; Yes

SetSprIdle:
		    xor	    a
		    ld	    (PlayerAnimWaitCnt), a
		    ld	    (PlayerFrameNum), a
		    jr	    SetSprWalk4


SetSprWalk2:
		    ld	    hl,	PlayerAnimWaitCnt
		    inc	    (hl)
		    ld	    a, (hl)
		    cp	    6				    ; The animation is updated each 6 iterations
		    jr	    nz,	SetSprWalk3

		    ld	    (hl), 0			    ; Reset animation wait counter
		    ld	    hl,	PlayerFrameNum
		    inc	    (hl)			    ; Increment	animation frame

SetSprWalk3:
		    ld	    hl,	PlayerFrameNum
		    ld	    a, (hl)
		    cp	    3				    ; Three frames animation
		    jr	    nz,	SetSprWalk4

		    ld	    (hl), 1

SetSprWalk4:
		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    dec	    a
		    ld	    c, a
		    add	    a, a
		    add	    a, c
		    ld	    c, a			    ; C= Direction x 3 frames

		    ld	    a, (SelectedWeapon)
		    and	    a				    ; Is Snake wearing a weapon?
		    jr	    z, SetSprWalk5		    ; No weapon

		    cp	    PLASTIC_BOMB
		    jr	    z, SetSprWalk5		    ; Walk animation is	normal when "wearing" plastic bombs

		    cp	    LAND_MINE			    ; Walk animation is	normal when "wearing" land mines
		    jr	    z, SetSprWalk5

		    ld	    a, 12			    ; Spr Snake	up with	weapon
		    add	    a, c
		    ld	    c, a

SetSprWalk5:
		    ld	    a, (PlayerFrameNum)
		    add	    a, c
		    jp	    SetPlayerSprId

;----------------------------------------------------------------------------
;
; Player sprite: punch
;
;----------------------------------------------------------------------------

SetSprPunch:
		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    dec	    a
		    add	    a, 24			    ; Spr Snake	punching up + dir
		    jp	    SetPlayerSprId

;----------------------------------------------------------------------------
;
; Player sprite: water
;
;----------------------------------------------------------------------------

SetSprWater:
		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    dec	    a
		    ld	    c, a

		    ld	    a, (SelectedWeapon)
		    and	    a				    ; Is wearing a weapon?
		    ld	    a, 28			    ; Spr Snake	water up
		    jr	    z, SetSprWater2

		    ld	    a, 32			    ; Spr Snake	water up with weapon

SetSprWater2:
		    add	    a, c
		    ld	    c, a

		    ld	    a, (TickCounter)
		    and	    8
		    ld	    a, 17			    ; 32 + 17 =	49 -> Spr Snake	water up with weapon (!?)
							    ; Points to	the same sprite	data. More animations originally?
		    jr	    nz,	SetSprWater3
		    xor	    a

SetSprWater3:
		    add	    a, c
		    jp	    SetPlayerSprId

;----------------------------------------------------------------------------
;
; Player sprite: parachute
;
;----------------------------------------------------------------------------

SetSprParachute:
		    ld	    a, 36			    ; Spr parachute
		    jp	    SetPlayerSprId

;----------------------------------------------------------------------------
;
; Player sprite: deep water
;
;----------------------------------------------------------------------------

SetSprDeepWater:
		    ld	    hl,	PlayerAnimWaitCnt
		    inc	    (hl)
		    ld	    a, (hl)
		    cp	    4
		    ret	    nz				    ; Do not update the	animation in this iteration

		    ld	    (hl), 0			    ; Reset animation wait counter

		    ld	    hl,	PlayerFrameNum
		    inc	    (hl)			    ; Next animation frame

		    ld	    a, (hl)
		    and	    1
		    ld	    c, 37			    ; Spr deep water shadow
		    add	    a, c
		    jp	    SetPlayerSprId

;----------------------------------------------------------------------------
;
; Player sprite: climbing
;
;----------------------------------------------------------------------------

SetSprLadder:
		    ld	    a, (StopPlayerFlag)		    ; 1=The player is not moving
		    and	    a
		    jr	    z, SetSprLadder2		    ; Is moving

		    xor	    a
		    ld	    (PlayerAnimWaitCnt), a
		    jr	    SetSprLadder3


SetSprLadder2:
		    ld	    hl,	PlayerAnimWaitCnt
		    inc	    (hl)
		    ld	    a, (hl)
		    cp	    6
		    ret	    nz				    ; Do not update the	animation in this iteration

		    ld	    (hl), 0			    ; Reset animation wait counter

		    ld	    hl,	PlayerFrameNum
		    inc	    (hl)			    ; Next animation frame

SetSprLadder3:
		    ld	    a, (PlayerFrameNum)
		    and	    1				    ; Two frames animation
		    ld	    c, 39			    ; Spr climb	animation frame	1
		    add	    a, c
		    jp	    SetPlayerSprId

;----------------------------------------------------------------------------
;
; Player sprite: dead animation
;
;----------------------------------------------------------------------------

SetSprDead:
		    ld	    a, (DeadTimer)
		    cp	    40h
		    ld	    c, 43			    ; Spr Snake	dead
		    jr	    c, SetSprDead2

		    ld	    c, 41			    ; Spr snake	dying (leaned)
		    cp	    70h
		    jr	    c, SetSprDead2

		    and	    0Ch
		    rra
		    ld	    c, a
		    rra
		    add	    a, c
		    ld	    c, a			    ; Spining

SetSprDead2:
		    ld	    a, c
		    jp	    SetPlayerSprId

;----------------------------------------------------------------------------
;
; Player sprite: box
;
;----------------------------------------------------------------------------

SetSprBox:
		    ld	    a, (StopPlayerFlag)		    ; 1=The player is not moving
		    and	    a
		    ld	    a, 42			    ; Spr cardboard box
		    jr	    nz,	SetPlayerSprId

		    ld	    a, (TickCounter)
		    and	    8
		    ld	    a, 42
		    jr	    z, SetPlayerSprId

		    ld	    a, 44			    ; Spr cardboard box	frame 2

SetPlayerSprId:
		    ld	    (SnakeSprId), a
		    ret


;----------------------------------------------------------------------------
;
; Set grenade target sprite
;
;----------------------------------------------------------------------------

SetGrenaTargetSpr:
		    ld	    a, (Room)
		    cp	    204				    ; Brick wall (parachute)
		    ret	    z				    ; Don't show the target sprite in this room (using the parachute)

		    ld	    a, (SelectedWeapon)
		    cp	    GRENADE_LAUNCHER
		    ret	    nz				    ; Grenade launcher not selected

		    ld	    a, (PlayerAnimation)	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    cp	    7				    ; Cardboard	box mode?
		    jr	    z, HideGrenadTargtSpr	    ; Hide grenade target sprite

		    ld	    a, (Room)
		    cp	    224				    ; Ladders or elevator rooms?
		    jr	    nc,	HideGrenadTargtSpr	    ; Hide grenade target sprite

; Set sprite color
		    ld	    b, 16			    ; Sprite NY
		    ld	    a, 0Eh			    ; White color
		    ld	    hl,	GrenadTargetCol

SetGrenaTargetSpr2:
		    ld	    (hl), a
		    inc	    hl
		    djnz    SetGrenaTargetSpr2

		    ld	    a, (PlayerY)
		    ld	    l, a
		    ld	    c, a

		    ld	    a, (PlayerX)
		    ld	    h, a
		    ld	    b, a

		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    dec	    a
		    ld	    de,	TargetXYOffsets
		    add	    a, a
		    call    ADD_DE_A

		    ld	    a, (de)
		    add	    a, l
		    ld	    l, a			    ; L	= Player Y + offset Y
		    inc	    de

		    ld	    a, (de)
		    add	    a, h
		    ld	    h, a			    ; H	= Player X + offset X
		    ld	    (GrenaTargetAtt), hl

		    ld	    a, 18h			    ; Sprite pattern
		    ld	    (GrenaTargetAtt+2),	a

		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    dec	    a
		    jr	    z, ChkGrenTargBoundsU

		    dec	    a
		    jr	    z, ChkGrenTargBoundsD

		    dec	    a
		    jr	    z, ChkGrenTargBoundsL

		    ld	    a, b			    ; Player X
		    cp	    0C0h
		    jr	    ChkGrenTargBoundsG		    ; Hide if X	greater


ChkGrenTargBoundsU:
		    ld	    a, c			    ; Player Y
		    cp	    38h
		    jr	    ChkGrenTargBounds


ChkGrenTargBoundsD:
		    ld	    a, c			    ; Player Y
		    cp	    80h

ChkGrenTargBoundsG:
		    jr	    nc,	HideGrenadTargtSpr	    ; Hide grenade target sprite
		    ret


ChkGrenTargBoundsL:
		    ld	    a, b			    ; Player X
		    cp	    50h

ChkGrenTargBounds:
		    ret	    nc

HideGrenadTargtSpr:
		    ld	    a, 225			    ; Hide grenade target sprite
		    ld	    (GrenaTargetAtt), a
		    ret

;----------------------------------------------------------------------------
;
; Grenade target sprite	offsets	per direction
;
;----------------------------------------------------------------------------
TargetXYOffsets:    dw 0F9ACh
		    dw 0F936h
		    dw 0B2F0h
		    dw 3CF0h







;----------------------------------------------------------------------------
;
;
; Game status logic
;
; This is the entry point of the main logic
;
;----------------------------------------------------------------------------

GameStatusLogic:
		    ld	    hl,	TickCounter
		    inc	    (hl)

		    ld	    bc,	(GameStatus)
		    ld	    a, c
		    cp	    3				    ; Has the game started?
		    jr	    nc,	GameStatusLogic2

		    ld	    hl,	ChkAnykeyStart
		    push    hl				    ; Add a function to	the logic pipeline to go to the	menu screen in case any	control	is pressed

GameStatusLogic2:
		    call    JumpIndex

		    dw GS_KonamiLogo			    ; 0	- Konami logo and menu
		    dw GS_WaitMenu			    ; 1	- Wait in menu screen
		    dw GS_DemoPlay			    ; 2	- Demo game: gameplay and tutorial (radio mode)
		    dw GS_PlayStart			    ; 3	- Play start effect
		    dw GS_StartGame			    ; 4	- Start	game
		    dw GS_Playing			    ; 5	- Gameplay
		    dw GS_GameOver			    ; 6	- Game over
		    dw GS_Pause				    ; 7	- Pause, load, save logic
		    dw GS_Ending			    ; 8	- Ending


;----------------------------------------------------------------------------
;
; Game status: Konami logo
;
;----------------------------------------------------------------------------

GS_KonamiLogo:
		    djnz    GS_LoadIntroGfx

		    call    ChkEnableMusicDemo		    ; Checks if	F5 is pressed to toggle	music in demo mode

		    call    SetBankInA0_9
		    call    DrawKonamiLogo		    ; Draw Konami logo logic
		    call    SetBanks1_2_3

		    ld	    a, (Class)			    ; Logo end flag
		    or	    a				    ; Has finished drawing the logo?
		    ret	    z				    ; Not yet

		    call    RegionLock			    ; In the Japanese version, here checks the region lock

		    xor	    a
		    jp	    NextSubstatusT


;----------------------------------------------------------------------------
;
; Wait in Konami logo and load intro graphics
;
;----------------------------------------------------------------------------

GS_LoadIntroGfx:
		    djnz    GS_IntroMenu

		    call    ChkEnableMusicDemo		    ; Checks if	F5 is pressed to toggle	music in demo mode

		    ld	    hl,	WaitCounter
		    dec	    (hl)
		    ret	    nz				    ; Wait a bit more

		    call    SetBankInA0_9
		    call    LoadIntroGfx		    ; Load Metal Gear logo graphics
		    call    SetBanks1_2_3

		    jr	    NextSubstatus


;----------------------------------------------------------------------------
;
; Draw Metal Gear logo intro
;
;----------------------------------------------------------------------------

GS_IntroMenu:
		    djnz    GS_InitKonamiLogo

		    call    ChkEnableMusicDemo		    ; Checks if	F5 is pressed to toggle	music in demo mode

		    call    SetBankInA0_9
		    call    MenuLogoLogic		    ; Metal Gear logo logic (scroll, sfx)
		    call    SetBanks1_2_3

		    ld	    a, (MenuStatus)
		    cp	    4				    ; Status to	draw the menu and play the sfx
		    ret	    nz				    ; Still moving the logo

		    xor	    a
		    jp	    NextGameStatus

;----------------------------------------------------------------------------
;
; Initialize Konami logo: erase	screen,	load and draw Konami logo
;
;----------------------------------------------------------------------------

GS_InitKonamiLogo:
		    call    ClearScreen

		    call    SetBankInA0_9
		    call    InitKonamiLogo		    ; Load and draw Konami logo
		    call    SetBanks1_2_3

		    jr	    NextSubstatus


;----------------------------------------------------------------------------
;
; Checks if F5 is pressed to toggle music in demo mode
;
;----------------------------------------------------------------------------

ChkEnableMusicDemo:
		    call    ReadFKeys

		    ld	    hl,	FKeysHoldMenu		    ; 0	0 RET F5 F4 F3 F2 F1
		    call    StoreControls

		    bit	    4, a			    ; F5 trigger?
		    ret	    z

		    ld	    a, (MusicInDemoMode)	    ; Flag to enable or	disable	music in demo mode
		    cpl
		    ld	    (MusicInDemoMode), a	    ; Flag to enable or	disable	music in demo mode
		    ret


;----------------------------------------------------------------------------
;
; Game status: menu wait
;
;----------------------------------------------------------------------------

GS_WaitMenu:
		    call    ChkEnableMusicDemo		    ; Checks if	F5 is pressed to toggle	music in demo mode

		    ld	    hl,	WaitCounter
		    dec	    (hl)			    ; Decrement	wait time
		    ret	    nz

		    jp	    NextStatusT


;----------------------------------------------------------------------------
;
; Game status: game demo mode (gameplay	and tutorial)
;
;----------------------------------------------------------------------------

GS_DemoPlay:
		    djnz    InitDemoMode

		    call    SetBankInA0_6

		    call    DemoControler		    ; Replay demo game controls
		    call    GameDemoLogic		    ; Run gameplay or tutorial logic

		    call    SetBanks1_2_3

		    ld	    a, (PlayingFlag)
		    or	    a
		    ret	    nz				    ; The demo/tutorial	has not	finished yet


ResetGameStat:
		    xor	    a				    ; Konami logo status

SetGameStatus:
		    ld	    (GameStatus), a

		    ld	    a, 20h
		    ld	    (WaitCounter), a
		    jr	    ResetSubstatus


;----------------------------------------------------------------------------
;
; Set up demo mode
;
;----------------------------------------------------------------------------

InitDemoMode:
		    call    ClearScreen			    ; Clear screen and sprites

		    call    SetBankInA0_6

		    call    SetupDemoPlay		    ; Setup demo controls and variables

		    call    SetBanks1_2_3

		    ld	    a, 20h

NextSubstatusT:
		    ld	    (WaitCounter), a

NextSubstatus:
		    ld	    hl,	GameSubstatus
		    inc	    (hl)
		    ret


;----------------------------------------------------------------------------
;
; Game status: PLAY START flashing effect
;
;----------------------------------------------------------------------------

GS_PlayStart:
		    djnz    GS_PlayStart2

		    ld	    hl,	WaitCounter
		    dec	    (hl)			    ; Has finished the flashing	effect?
		    jr	    z, NextSubstatus

		    bit	    2, (hl)			    ; Draw or erase?

		    ld	    hl,	txtPlayStart
		    call    z, PrintTextXY		    ; (!?) This	should be a JP.	After this call, "GAME OVER" text is erased

		    jp	    EraseTextXY


GS_PlayStart2:
		    djnz    GS_PlayStart3

		    call    ClearGameVars		    ; Clear game variables
		    jr	    NextStatusT			    ; Start game


GS_PlayStart3:
		    ld	    a, 50h			    ; "PLAY START" Flashing time
		    jr	    NextSubstatusT


;----------------------------------------------------------------------------
;
; Game status: start game
;
;----------------------------------------------------------------------------

GS_StartGame:
		    call    ClearScreen			    ; Clear screen and sprites
		    call    InitGame			    ; Initialize game: Reset doors' status, set start room, set Theme of Tara music, init. player variables...
		    ld	    hl,	PlayingFlag
		    ld	    (hl), 1

NextStatusT:
		    ld	    a, 20h

NextGameStatus:
		    ld	    (WaitCounter), a
		    ld	    hl,	GameStatus
		    inc	    (hl)

ResetSubstatus:
		    xor	    a
		    ld	    (GameSubstatus), a
		    ret



;----------------------------------------------------------------------------
;
; Game status: playing
;
;----------------------------------------------------------------------------

GS_Playing:
		    xor	    a
		    ld	    (RestoreSoundData),	a

		    call    GameLogic			    ; ;

		    ld	    a, (Pause_1_F5_2)
		    dec	    a				    ; F1 pressed?
		    jp	    z, SetPauseMode

		    ld	    a, (LeavedOuterHeaven)
		    and	    a				    ; Has Snake	escaped	from Outer Heaven?
		    ld	    a, 8			    ; Ending status
		    jp	    nz,	SetGameStatus

		    ld	    a, (PlayingFlag)
		    or	    a
		    ret	    nz

		    jr	    NextStatusT


;----------------------------------------------------------------------------
;
; Set pause mode
;
;----------------------------------------------------------------------------

SetPauseMode:
		    call    PrintPause

		    xor	    a
		    ld	    hl,	PasswordBuffer
		    ld	    de,	 PasswordBuffer+1
		    ld	    (hl), a
		    ld	    bc,	1Dh
		    ldir				    ; Clear password's buffer

		    inc	    a
		    ld	    (RestoreSoundData),	a

		    ld	    a, 4Dh
		    call    SetSoundEntryChk		    ; Pause SFX

		    ld	    a, 7
		    jp	    SetGameStatus

;----------------------------------------------------------------------------
;
; Print	"PAUSE"
;
;----------------------------------------------------------------------------

PrintPause:
		    ld	    hl,	6C58h
		    ld	    de,	0D898h
		    ld	    bc,	2808h

		    ld	    a, 4
		    push    hl
		    push    bc
		    call    VDP_Copy_Byte		    ; Save pause text background
		    pop	    bc
		    pop	    hl

		    xor	    a
		    ld	    d, a
		    call    FillRect			    ; Draw black rectangle

		    ld	    hl,	txtPause
		    jp	    PrintTextXY			    ; Print PAUSE



;----------------------------------------------------------------------------
;
; Game status: game over
;
;----------------------------------------------------------------------------

GS_GameOver:
		    djnz    PrintGameOver

		    ld	    a, (RestoreGameFlag)
		    and	    a
		    call    z, ChkContinueKey		    ; Check if F5 is pressed

		    ld	    a, (SoundWorkArea+2)
		    or	    a
		    ret	    nz				    ; Game over	music has not finished yet

ChkGoBackGame:
		    ld	    a, (RestoreGameFlag)
		    and	    a
		    ld	    a, 4
		    jp	    nz,	SetGameStatus

RebootGame:
		    ld	    hl,	ControlConfig		    ; Bit6: 1=Enable music/Player control
		    ld	    a, (hl)
		    and	    10111111b
		    ld	    (hl), a
		    jp	    ResetGameStat


ChkContinueKey:
		    call    UpdateControls

		    ld	    a, (FKeysHold)		    ; 0	0 RET F5 F4 F3 F2 F1
		    bit	    4, a			    ; F5?
		    ret	    z

		    ld	    hl,	txtContinue
		    call    EraseTextXY			    ; Erase CONTINUE F5

		    xor	    a
		    ld	    (SaveLoadMode), a		    ; 1=Load mode, 2=Save mode
		    inc	    a
		    ld	    (RestoreGameFlag), a
		    ret


;----------------------------------------------------------------------------
;
; Print	GAME OVER / CONTINUE F5
;
;----------------------------------------------------------------------------

PrintGameOver:
		    call    ClearScreen			    ; Erase screen

		    ld	    hl,	txtGameOver
		    call    PrintTextXY			    ; Print GAME OVER /	CONTINUE F5

		    xor	    a
		    ld	    (RestoreGameFlag), a

		    jp	    NextSubstatus


;----------------------------------------------------------------------------
;
; Game status: pause
;
;----------------------------------------------------------------------------

GS_Pause:
		    ld	    a, (SaveLoadMode)		    ; 1=Load mode, 2=Save mode
		    or	    a
		    jr	    z, PauseMode

		    call    SetBankInA0_6
		    call    ReadKeyboard
		    call    SetBanks1_2_3

		    call    SetBankInA0_F
		    call    LoadSaveLogic
		    call    SetBanks1_2_3

		    ld	    a, (RestoreSavedGame)	    ; ;Set after loading tape data
		    or	    a
		    ret	    z

		    xor	    a
		    ld	    (Pause_1_F5_2), a
		    ld	    (DoNotAddEnemies), a
		    ld	    (SaveLoadMode), a		    ; 1=Load mode, 2=Save mode
		    inc	    a
		    ld	    (RestoreSoundData),	a
		    ld	    (RestoreGameFlag), a
		    jp	    ChkGoBackGame


;----------------------------------------------------------------------------
;
; Pause	logic
; Read keyboard
;
;----------------------------------------------------------------------------

PauseMode:
		    call    UpdateControls

		    ld	    a, (FKeysTrigger)		    ; 0	0 RET F5 F4 F3 F2 F1
		    rra					    ; F1 pressed?
		    jr	    c, ExitPauseMode

		    push    af
		    call    SetBankInA0_6

		    call    ChkCharTyped		    ; Check text typed

		    call    SetBanks1_2_3
		    pop	    af

		    rra
		    rra
		    rra					    ; F4 pressed?
		    ld	    b, 1			    ; Load mode
		    jr	    c, SetLoadSaveMode

		    rra					    ; F5 pressed?
		    ret	    nc

		    inc	    b				    ; Save mode

SetLoadSaveMode:
		    ld	    a, b
		    ld	    (SaveLoadMode), a		    ; 1=Load mode, 2=Save mode

		    xor	    a
		    ld	    (SaveLoadStat), a
		    jp	    ClearSprAttr


;----------------------------------------------------------------------------
;
; Exit pause mode
; Check	passwords
;
;----------------------------------------------------------------------------

ExitPauseMode:
		    call    SetBankInA0_6
		    call    ChkPasswords		    ; Check if a valid password	was typed in pause mode
		    call    SetBanks1_2_3

		    xor	    a
		    ld	    (Pause_1_F5_2), a
		    inc	    a
		    ld	    (RestoreSoundData),	a

		    ld	    de,	6C58h
		    ld	    hl,	0D898h
		    ld	    bc,	2808h
		    ld	    a, 1
		    call    VDP_Copy_Byte		    ; Erase PAUSE text and restore background

		    ld	    a, 5
		    jp	    SetGameStatus



;----------------------------------------------------------------------------
;
; Ending logic
;
;----------------------------------------------------------------------------

GS_Ending:
		    djnz    GS_Ending2

		    call    SetBankInA0_F

		    call    SwapSprBuffer		    ; Swap sprites buffer
		    call    EndingLogic			    ; Ending logic
		    call    UpdateSpritesShuf		    ; Update and shuffle sprites

		    call    SetBanks1_2_3

		    ld	    hl,	EndingStatus
		    ld	    a, (hl)
		    sub	    0Eh
		    ret	    nz				    ; The ending has not ended yet

		    ld	    (hl), a
		    jp	    RebootGame


GS_Ending2:
		    call    SetBankInA0_F

		    call    EndingSetup			    ; Setup ending

		    call    SetBanks1_2_3
		    jp	    NextSubstatus


;----------------------------------------------------------------------------
;
; Checks if any	control	button is pressed
;
; This function	is used	to go to main menu from	game demo, or Konami logo
; If the game is already in the	menu, then the game starts
;
;----------------------------------------------------------------------------

ChkAnykeyStart:
		    call    ReadControls

		    ld	    hl,	ControlsHold_
		    call    StoreControls
		    or	    a
		    ret	    z				    ; Any key pressed

		    ld	    hl,	WaitCounter
		    ld	    (hl), 0

		    ld	    hl,	GameStatus
		    ld	    b, (hl)
		    djnz    GoToMenu			    ; Game status != 1 (menu)

		    and	    30h				    ; Fire 1 or	fire 2?
		    ret	    z				    ; No

		    ld	    a, 40h
		    ld	    (ControlConfig), a		    ; Bit6: 1=Enable music/Player control

		    ld	    (hl), 3			    ; Game status 3: START GAME
		    inc	    hl
		    ld	    (hl), b			    ; Substatus	= 0
		    ret

;----------------------------------------------------------------------------
;
; Show menu without logo scroll	effect
;
;----------------------------------------------------------------------------

GoToMenu:
		    ld	    (hl), 1			    ; Game status = menu

		    ld	    a, 28h
		    call    SetSoundEntry		    ; Stop SFXs

		    call    SetBankInA0_9
		    call    LoadIntroGfx		    ; Load menu	graphics

		    ld	    a, 4
		    ld	    (MenuStatus), a		    ; Status to	draw the menu and play SFX
		    call    MenuLogoLogic		    ; Draw the Metal Gear logo in a go

		    jp	    SetBanks1_2_3






;----------------------------------------------------------------------------
;
; Radio	mode logic
;
;----------------------------------------------------------------------------

RadioLogic:
		    ld	    a, (FKeysTrigger)		    ; 0	0 RET F5 F4 F3 F2 F1
		    and	    8				    ; F4 key pressed?
		    jp	    nz,	ExitRadio

		    ld	    a, (EquipRadioStatus)	    ; Equip and	radio status
		    call    JumpIndex

		    dw DrawRadio
		    dw RadioIdle
		    dw RadioSignalUp
		    dw SetupRadioReply
		    dw RadioSignalOFF

;----------------------------------------------------------------------------
;
; Draw radio screen
;
;----------------------------------------------------------------------------

DrawRadio:
		    call    DisableScreen		    ; Disable screen rendering
		    call    ClearSprAttr		    ; Remove sprites
		    call    ClearPage0			    ; Clear page 0
		    call    SetRadioPal			    ; Set radio	palette

		    ld	    a, 2
		    ld	    (RadioCallFlag), a		    ; Stop incoming call
		    dec	    a
		    ld	    (TilesetBank), a		    ; 0=First bank of 256 tiles, 1=Second bank

		    ld	    de,	3018h
		    ld	    hl,	RadioTilesMap
		    call    DrawTilesBlock		    ; Draw radio

		    ld	    de,	0C828h
		    ld	    hl,	SnakeTilesMap
		    call    DrawTilesBlock		    ; Draw Snake portrait

		    ld	    hl,	RadioCmd		    ; 1=Send
		    ld	    de,	RadioLedCnt
		    ld	    bc,	10h
		    ld	    (hl), 0
		    ldir				    ; Erase radio variables

		    call    PrintTransceiv		    ; Print TRANSCEIVER	title and RECV
		    call    DrawRadioFreq		    ; Draw selected radio frequency
		    call    RenderHUD			    ; Render HUD
		    call    NextRadioStat

		    ld	    a, (EndingStatus)
		    and	    a				    ; Ending mode?
		    ld	    a, 50h			    ; SFX: Radio noise
		    call    z, SetSoundEntryChk

		    jp	    EnableScreen		    ; Enable screen rendering


;----------------------------------------------------------------------------
;
; Radio	idle mode
;
; Check	if UP is pressed to select SEND	mode
; Check	if LEFT	or RIGHT are pressed to	change the frequency
; Check	if the selected	frequency triggers a reply
;----------------------------------------------------------------------------

RadioIdle:
		    ld	    a, (RadioCmd)		    ; 1=Send
		    and	    a
		    jr	    z, RadioIdle2

		    ld	    a, (EndingStatus)
		    and	    a				    ; Ending mode?
		    ld	    a, 50h			    ; SFX: Radio noise
		    call    z, SetSoundEntryChk

RadioIdle2:
		    ld	    de,	txtRecv
		    ld	    hl,	txtSend
		    call    ErasePrintTxt		    ; Erase SEND and print RECV

		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    1				    ; Up pressed?
		    jr	    nz,	SetRadioSend

		    ld	    (RadioCmd),	a		    ; 1=Send
		    call    ChgRadioFreq		    ; Check frequency change
		    jp	    ChkRadioReceiv		    ; Check if there is	someone	available in the selected frequency


SetRadioSend:
		    ld	    (RadioCmd),	a		    ; 1=Send
		    ld	    (ReplyRequested), a

		    ld	    de,	txtSend
		    ld	    hl,	txtRecv
		    call    ErasePrintTxt		    ; Erase RECV and print SEND

		    ld	    a, 5Ch			    ; Mute radio noise
		    call    SetSoundEntryChk

		    ld	    a, 0Ah			    ; This is Solid Snake... Your reply, please.
		    jp	    SetText


;----------------------------------------------------------------------------
;
; Draw leds turning on animation
;
;----------------------------------------------------------------------------

RadioSignalUp:
		    ld	    hl,	RadioLedDelay		    ; Delay before the first/next led turns on
		    dec	    (hl)
		    ret	    nz				    ; Wait

		    ld	    (hl), 2			    ; Delay value

		    ld	    hl,	RadioLedCnt
		    inc	    (hl)			    ; Increment	number of leds on

		    push    hl
		    call    DrawRadioLeds		    ; Draw radio leds
		    pop	    hl

		    ld	    a, (hl)
		    cp	    12				    ; Number of	radio leds/lights
		    ret	    nz				    ; Not all leds on

NextRadioStat:
		    ld	    hl,	EquipRadioStatus	    ; Equip and	radio status
		    inc	    (hl)
		    ret

;----------------------------------------------------------------------------
;
; Set radio reply text
;
;----------------------------------------------------------------------------

SetupRadioReply:
		    ld	    hl,	EquipRadioStatus	    ; Equip and	radio status
		    ld	    (hl), 4			    ; Radio signal off mode. The game will continue in this mode after showing the selected text

		    ld	    a, 5Ch
		    call    SetSoundEntryChk		    ; Silence

		    ld	    hl,	(ReplyRadioPerson)
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    ld	    a, (hl)			    ; Reply text
		    jp	    SetText			    ; Enable text box mode


;----------------------------------------------------------------------------
;
; Reset	radio status and turn leds off
;
;----------------------------------------------------------------------------

RadioSignalOFF:
		    xor	    a
		    ld	    (ReplyRequested), a
		    ld	    (RadioLedCnt), a
		    inc	    a
		    ld	    (AutoReplyDone), a		    ; Flag to indicate that autoreply has been done.

		    ld	    hl,	EquipRadioStatus	    ; Equip and	radio status
		    ld	    (hl), a			    ; Set radio	idle status

		    ld	    a, (EndingStatus)
		    and	    a
		    ld	    a, 50h			    ; SFX radio	noise
		    call    z, SetSoundEntryChk

		    jp	    DrawRadioLeds		    ; Turn leds	off

;----------------------------------------------------------------------------
;
; Print	RECV and erase SEND
; Sets the radio in receive mode
;
;----------------------------------------------------------------------------

PrintRecv:
		    ld	    de,	txtRecv
		    ld	    hl,	txtSend
		    jr	    ErasePrintTxt


;----------------------------------------------------------------------------
;
; Print	SEND and erase RECV
; Sets the radio in send mode
;
;----------------------------------------------------------------------------

PrintSend:
		    ld	    hl,	txtRecv
		    ld	    de,	txtSend
		    jr	    ErasePrintTxt


;----------------------------------------------------------------------------
;
; Erase	HL text	and print DE
;
;----------------------------------------------------------------------------

ErasePrintTxt:
		    push    de
		    call    EraseTextXY
		    pop	    hl
		    jp	    PrintTextXY



; (!?) Unused code

		    call    ErasePrintTxt



;----------------------------------------------------------------------------
;
; Change radio frequency by pressing left or right
;
;----------------------------------------------------------------------------

ChgRadioFreq:
		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    1100b			    ; Left or right pressed?
		    jr	    nz,	ChgRadioFreq2

		    ld	    a, (ControlsHold)		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    1100b			    ; Left or right hold?
		    ret	    z				    ; No

		    ld	    hl,	ControlHoldWait
		    dec	    (hl)			    ; Decrement	delay
		    ret	    nz				    ; Do not change the	frequency in this iteration

		    ld	    (hl), 2			    ; Set delay
		    jr	    ChgRadioFreq3


ChgRadioFreq2:
		    ld	    hl,	AutoReplyDone		    ; Flag to indicate that autoreply has been done.
		    ld	    (hl), 0			    ; Erase autoreply flag. If the right freq. is selected again an incoming call will be received
		    inc	    hl
		    ld	    (hl), 0
		    ld	    hl,	ControlHoldWait
		    ld	    (hl), 8

ChgRadioFreq3:
		    rra
		    rra
		    rra
		    jr	    c, DecrementFreq		    ; Left

		    ld	    hl,	RadioFreq
		    ld	    a, (hl)
		    cp	    99h				    ; Max. frequency
		    ret	    z

		    add	    a, 1
		    daa
		    ld	    (hl), a			    ; Increment	freq.
		    ret


DecrementFreq:
		    ld	    hl,	RadioFreq
		    ld	    a, (hl)
		    and	    a
		    ret	    z				    ; Frequency	= 0

		    sub	    1
		    daa
		    ld	    (hl), a			    ; Decrement	freq.
		    ret


;----------------------------------------------------------------------------
;
; Check	if there is someone available in the selected frequency
;
; If the frequency has "autoreply" feature, the character will contact as soon as the right freq. is selected
; otherwise Snake must request a reply before he gets it
;----------------------------------------------------------------------------

ChkRadioReceiv:
		    call    DrawRadioFreq

		    ld	    a, (NumRadioPersons)
		    and	    a
		    ret	    z				    ; There is anybody available in the	radio

		    ld	    b, a			    ; Number of	persons/frequencies available

		    ld	    a, (RadioFreq)
		    ld	    c, a			    ; C	= Selected frequency
		    ld	    hl,	RadioPersonsDat		    ; 0=Frequency, 1=dummy, 2=bit0:autoreply 1:autotune, 3=Text	id

ChkRadioReceiv2:
		    ld	    a, c
		    cp	    (hl)			    ; Same freq.?
		    jp	    z, ChkRadioReceiv4

ChkRadioReceiv3:
		    ld	    a, 20h
		    call    ADD_HL_A
		    djnz    ChkRadioReceiv2
		    ret


ChkRadioReceiv4:
		    inc	    hl
		    inc	    hl
		    ld	    a, (hl)
		    dec	    hl
		    dec	    hl
		    and	    1				    ; Wait call	or auto	reply? You get an incoming call	as soon	the right frequency is selected
		    jr	    z, RadioAutoReply		    ; Auto reply

		    ld	    a, (ReplyRequested)
		    and	    a				    ; Did Snake	send a reply request?
		    jr	    z, ChkRadioReceiv3		    ; No, ignore this frequency	and try	another	(if available)

		    jr	    RadioAutoReply2


;----------------------------------------------------------------------------
;
; Auto reply
;
;----------------------------------------------------------------------------

RadioAutoReply:
		    ld	    a, (AutoReplyDone)		    ; Flag to indicate that autoreply has been done.
		    and	    a
		    ret	    nz				    ; Ignores autoreply	feature	until the fequency changes

RadioAutoReply2:
		    push    hl
		    call    ChkRadioReply
		    pop	    hl
		    ret	    c				    ; No reply

		    ld	    (ReplyRadioPerson),	hl

		    ld	    hl,	EquipRadioStatus	    ; Equip and	radio status
		    ld	    (hl), 2			    ; Radio signal up status

		    ld	    a, 10h
		    ld	    (RadioLedDelay), a		    ; Delay before the first/next led turns on
		    ret


;----------------------------------------------------------------------------
;
; Check	radio reply
; Depending on the zone, the antenna is	requiered to comunicate	by radio
;
;----------------------------------------------------------------------------

ChkRadioReply:
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    ld	    c, (hl)			    ; Text ID

		    ld	    a, (MapZone)		    ; Values of	5 or more need the antenna
		    cp	    5
		    jr	    c, ChkReplyBigBoss		    ; Does not need the	antenna

		    ld	    a, (AntennaTaken)
		    and	    a
		    jr	    z, NoRadioReply		    ; Needs the	antenna

; Once the player reachs the basement of building 3 (room 111),	Big Boss will order the	player to power	off the	MSX every time he his contacted	by radio

ChkReplyBigBoss:
		    dec	    hl
		    dec	    hl
		    dec	    hl

		    ld	    a, (hl)			    ; Frequency
		    cp	    FREQ_BIGBOSS		    ; Big boss
		    jr	    z, ChkReplyBigBoss2

		    cp	    FREQ_BIGBOSS_BUILDING2	    ; Big boss building	2
		    jr	    nz,	ChkReplyBigBoss3

ChkReplyBigBoss2:
		    ld	    a, (SwitchOffMSXF)		    ; 1	= Big Boss will	order to switch	off your MSX
		    and	    a				    ; Is the flag enabled?
		    jr	    z, ChkReplyBigBoss3

		    inc	    hl
		    inc	    hl
		    inc	    hl
		    ld	    (hl), 136			    ; Text: Stop operation. Switch off your MSX
		    jr	    RadioReplyOk


;----------------------------------------------------------------------------
; Check	if Big Boss informs about transmissor/bug
;----------------------------------------------------------------------------

ChkReplyBigBoss3:
		    ld	    a, (hl)			    ; Frequency
		    cp	    FREQ_BIGBOSS
		    jr	    z, ChkReplyBigBoss4

		    cp	    FREQ_BIGBOSS_BUILDING2
		    jr	    nz,	ChkReplySchneider

ChkReplyBigBoss4:
		    ld	    a, (TransmiTaken)
		    and	    a				    ; Is the transmisor/bug in the equipment?
		    jr	    z, ChkReplySchneider

		    ld	    a, (MapZone)		    ; Values of	5 or more need the antenna
		    cp	    4
		    jp	    z, ChkReplySchneider

		    inc	    hl
		    inc	    hl
		    inc	    hl
		    ld	    (hl), 50			    ; TEXT: THIS IS BIG	BOSS...	CHECK YOUR EQUIPMENTS! CHECK IF	YOU HAVE BEEN BUGGED BY	THE ENEMY. ...OVER
		    jr	    RadioReplyOk


;----------------------------------------------------------------------------
; Check	Scheneider reply
;----------------------------------------------------------------------------

ChkReplySchneider:
		    ld	    a, (hl)
		    cp	    FREQ_SCHNEIDER		    ; Schneider
		    jr	    z, ChkReplySchneider2

		    cp	    FREQ_SCHNEIDER_BUILDING2	    ; Schneider	building 2
		    jr	    nz,	ChkReplyJeniffer

ChkReplySchneider2:
		    ld	    a, (SchneiderCaptured)
		    and	    a				    ; Is Schneider captured?
		    jr	    z, RadioReplyOk

		    jr	    NoRadioReply


;----------------------------------------------------------------------------
; Check	Jeniffer reply
;----------------------------------------------------------------------------

ChkReplyJeniffer:
		    ld	    a, (hl)
		    cp	    FREQ_JENIFFER		    ; Jeniffer
		    jr	    nz,	ChkReplyMadnar

		    ld	    a, (Class)			    ; Rank level
		    cp	    3
		    jr	    nz,	NoRadioReply		    ; Not enough rank

		    ld	    a, (JennifBrotherDead)
		    and	    a				    ; Jeniffer will not	answer anymore if her brother is dead
		    jr	    nz,	NoRadioReply

		    jr	    RadioReplyOk


;
; Probably this	check was made for Dr. Madnar
; Perhaps it was possible to contact him by radio before he was	moved
;

ChkReplyMadnar:
		    ld	    a, c			    ; Text ID
		    cp	    15				    ; LISTEN! SOLID SNAKE... I'LL NEVER DIE...* I'LL GET YOU. ONE DAY.* SEE YOU AGAIN...
		    jr	    nz,	RadioReplyOk		    ; (!?) Why is this text checked? It	is not a radio reply.

		    ld	    a, (MadnarMoved)
		    and	    a				    ; Was Madnar moved to building 2?
		    jr	    nz,	NoRadioReply

RadioReplyOk:
		    and	    a
		    ret


NoRadioReply:
		    scf
		    ret

;----------------------------------------------------------------------------
;
; Draw selected	frequency
;
;----------------------------------------------------------------------------

DrawRadioFreq:
		    ld	    c, 1
		    ld	    de,	9821h			    ; Frequency	XY
		    ld	    a, (RadioFreq)
		    rra
		    rra
		    rra
		    rra
		    call    PrintDigit

		    ld	    a, (RadioFreq)

;----------------------------------------------------------------------------
;
; Print	digital	digit (radio frequency,	destruction countdown)
;
; In:
;    A = Value (0-9)
;----------------------------------------------------------------------------

PrintDigit:
		    and	    0Fh				    ; Lower nibble (1 digit)
		    ld	    hl,	RedDigitTiles
		    call    ADD_HL_2A

		    ld	    a, (hl)
		    call    DrawChar

		    ld	    a, e
		    add	    a, 8
		    ld	    e, a			    ; Y	= Y + 8

		    inc	    hl
		    ld	    a, (hl)
		    call    DrawChar

		    ld	    a, e
		    sub	    8
		    ld	    e, a			    ; Y	= Y - 8

		    ld	    a, d
		    add	    a, 8
		    ld	    d, a			    ; X	= X + 8
		    ret


;----------------------------------------------------------------------------
;
; Tiles	used to	draw the digits
;
;----------------------------------------------------------------------------
RedDigitTiles:	    db 0A4h,0A5h
		    db 0A6h,0A7h
		    db 0A8h,0A9h
		    db 0AAh,0ABh
		    db 0ACh,0A7h
		    db 0ADh,0ABh
		    db 0ADh,0A5h
		    db 0AEh,0A7h
		    db 0AFh,0A5h
		    db 0AFh,0ABh

;----------------------------------------------------------------------------
;
; Text:	RECV
;
;----------------------------------------------------------------------------
txtRecv:	    dw 4038h
		    db	"RECV"
		    db 0FFh

;----------------------------------------------------------------------------
;
; Text:	SEND
;
;----------------------------------------------------------------------------
txtSend:	    dw 3838h
		    db	"SEND"
		    db 0FFh

;----------------------------------------------------------------------------
;
; Draw radio leds
;
; Steps:
;  - Draw led ON ON tiles
;  - Draw led ON OFF tile
;  - Draw led OFF OF tiles
;
;----------------------------------------------------------------------------

DrawRadioLeds:
		    ld	    de,	4020h
		    ld	    a, (RadioLedCnt)
		    srl	    a
		    and	    a
		    jr	    z, DrawRadioLeds2

		    ld	    b, a
		    ld	    hl,	1890h			    ; Leds ON ON tile coodinates
		    call    DrawRadioLeds4

DrawRadioLeds2:
		    ld	    a, (RadioLedCnt)
		    rra
		    jr	    nc,	DrawRadioLeds3

		    ld	    b, 1
		    ld	    hl,	1090h			    ; Leds ON OFF tile coodinates
		    call    DrawRadioLeds4

DrawRadioLeds3:
		    ld	    a, (RadioLedCnt)
		    cp	    11
		    ret	    nc

		    and	    1
		    ld	    c, a
		    ld	    a, (RadioLedCnt)
		    srl	    a
		    add	    a, c
		    ld	    c, a
		    ld	    a, 6
		    sub	    c
		    ld	    b, a
		    ld	    hl,	890h			    ; Leds OFF OFF tile	coodinates

DrawRadioLeds4:
		    push    bc
		    push    hl

		    push    hl
		    ld	    bc,	808h
		    ld	    a, 1
		    push    bc
		    call    VDP_Copy_Byte		    ; Draw upper leds row
		    pop	    bc
		    pop	    hl

		    ld	    a, e
		    add	    a, 8
		    ld	    e, a
		    ld	    a, 1
		    call    VDP_Copy_Byte		    ; Draw lower leds row
		    ld	    a, e
		    sub	    8
		    ld	    e, a
		    ld	    a, d
		    add	    a, 8
		    ld	    d, a

		    pop	    hl
		    pop	    bc
		    djnz    DrawRadioLeds4
		    ret


;----------------------------------------------------------------------------
;
; Exit radio mode
;
;----------------------------------------------------------------------------

ExitRadio:
		    ld	    a, 1
		    ld	    (RestoreSoundData),	a
		    call    SetSnakePal
		    jp	    RenderScreen		    ; Set game mode and	render screen

;----------------------------------------------------------------------------
;
; Weapon menu logic
;
;----------------------------------------------------------------------------

MenuWeapon:
		    ld	    a, (FKeysTrigger)		    ; 0	0 RET F5 F4 F3 F2 F1
		    and	    2				    ; F2 key pressed?
		    jp	    nz,	RenderScreen		    ; Yes, return to game

		    ld	    a, (EquipRadioStatus)	    ; Equip and	radio status
		    dec	    a				    ; Was the weapon menu rendered?
		    jp	    z, CtrlMenuWeapon		    ; Yes, run the menu	logic

		    call    DisableScreen		    ; Disable screen display
		    call    ClearSprAttr		    ; Remove sprites
		    call    ClearPage0			    ; Clear page 0
		    call    SetMenuWeaponPal		    ; Set weapons menu palette

		    ld	    hl,	EquipRadioStatus	    ; Equip and	radio status
		    inc	    (hl)

		    call    CompactWeapons		    ; Remove empty spaces
		    call    DrawWeaponMenu		    ; Draw weapons screen
		    call    GetWeaponCursor		    ; Get the index of the selected weapon
		    call    CalcCursorXYWeapon		    ; Calculate	the coordinates	of the cursor
		    call    DrawArrow			    ; Draw the cursor/arrow
		    call    RenderHUD			    ; Render HUD
		    jp	    EnableScreen		    ; Enable screen rendering


;----------------------------------------------------------------------------
;
; Weapons menu control logic
;
;----------------------------------------------------------------------------

CtrlMenuWeapon:
		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    0Fh				    ; Any direction pressed?
		    jr	    nz,	CtrlMenuWeapon2		    ; Yes

		    ld	    a, (ControlsHold)		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    0Fh				    ; Any direction hold?
		    ret	    z				    ; No

		    ld	    hl,	ControlHoldWait
		    dec	    (hl)			    ; Decrement	repeat delay
		    ret	    nz				    ; Wait before moving the cursor again

CtrlMenuWeapon2:
		    ld	    hl,	ControlHoldWait
		    ld	    (hl), 8			    ; Set repeat delay time

		    rra
		    jr	    c, CtrlMenuWeaponUp		    ; Up pressed

		    rra
		    jr	    c, CtrlMenuWeaponDown	    ; Down pressed

		    rra
		    jr	    c, CtrlMenuWeaponLeft	    ; Left pressed

; Right	pressed

		    ld	    a, (SelectIdx)
		    cp	    4
		    ret	    nc				    ; Not possible to move to the right	from that weapon

		    add	    a, 4
		    ld	    c, a
		    jr	    MenuWeaponMove


CtrlMenuWeaponUp:
		    ld	    a, (SelectIdx)
		    cp	    1
		    ret	    z				    ; Not possible to move up from top of left column

		    cp	    5
		    ret	    z				    ; Not possible to move up from top of right	column

		    dec	    a
		    ld	    c, a
		    jr	    MenuWeaponMove


CtrlMenuWeaponDown:
		    ld	    a, (SelectIdx)
		    cp	    4
		    ret	    z				    ; Not possible to move down	from bottom of left column

		    cp	    7
		    ret	    z				    ; Not possible to move down	from bottom of right column

		    inc	    a
		    ld	    c, a
		    jr	    MenuWeaponMove


CtrlMenuWeaponLeft:
		    ld	    a, (SelectIdx)
		    cp	    5
		    ret	    c				    ; Not possible to move left	from left column

		    sub	    4
		    ld	    c, a

MenuWeaponMove:
		    ld	    a, 20h
		    call    SetSoundEntryChk		    ; SFX cursor move

		    call    EraseArrow			    ; Erase cursor/arrow

		    ld	    a, c
		    ld	    (SelectIdx), a
		    call    CalcCursorXYWeapon
		    call    DrawArrow			    ; Draw cursor/arrow	in the new location

		    ld	    a, (EquipRemoved)		    ; The equipment and	weapons	have been removed by the enemy (captured)
		    and	    a				    ; Has Snake	his weapons?
		    jr	    z, SelectWeapon		    ; Yes, select the weapon

		    xor	    a

SelectWeapon_:
		    jr	    SelectWeapon2


;----------------------------------------------------------------------------
;
; Equip	the selected weapon and	update the HUD
;
;----------------------------------------------------------------------------

SelectWeapon:
		    ld	    a, (SelectIdx)
		    call    DEC_A_HL_4xA
		    ld	    de,	Weapons
		    add	    hl,	de
		    ld	    a, (hl)

SelectWeapon2:
		    ld	    (SelectedWeapon), a
		    ld	    (WeaponInUse), a
		    jp	    DrawWeaponHUD

;----------------------------------------------------------------------------
;
; Set game mode	and render screen
;
;----------------------------------------------------------------------------

RenderScreen:
		    xor	    a
		    ld	    (GameMode),	a		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late

		    call    DisableScreen		    ; Disable screen rendering
		    call    ClearSprAttr		    ; Hide sprites
		    call    LoadSprProjectile		    ; Load sprites used	by the selected	weapon

		    ld	    hl,	SprShootsAtt
		    ld	    b, 18h
		    ld	    a, 0E0h

RenderScreen2:
		    ld	    (hl), a
		    inc	    hl
		    djnz    RenderScreen2		    ; Hide shots

		    ld	    hl,	PlayerShotsList
		    ld	    de,	PlayerShot1Stat
		    ld	    bc,	17Fh
		    ld	    (hl), 0
		    ldir				    ; Remove shots actors

		    xor	    a
		    ld	    (LaserRoomCnt), a		    ; Laser position counter
		    call    RenderRoom			    ; Render the room
		    call    SetRoomPal			    ; Set the palette used in the room
		    call    SetSprPal			    ; Set the palette used by the sprites
		    call    DrawDoors			    ; Render the doors

		    ld	    a, (IntroSceneStatus)
		    cp	    0Ch
		    jr	    c, RenderScreen3

		    call    SetBankInA0_6
		    call    DrawRoomItems		    ; Draw the items in	the room
		    call    SetBanks1_2_3

		    call    SetBankInA0_F
		    call    DrawLaserBeams		    ; Draw laser beams,	if availables, when wearing goggles
		    call    SetBanks1_2_3

		    call    SetBankInA0_C
		    call    ChkDrawMetalGear		    ; Check draw Metal Gear
		    call    SetBanks1_2_3

RenderScreen3:
		    call    DrawMines			    ; Check draw mines
		    call    ChkDrawHindD		    ; Check draw Hind D
		    call    DrawOpenPitfalls		    ; Draw the pitfall that are	open
		    call    DrawCameras			    ; Draw the cameras as bitmap in alert mode
		    call    ChkDrawDestroyPS		    ; Erase the	power switch if	it is destroyed
		    call    RenderHUD			    ; Render HUD
		    jp	    EnableScreen		    ; Enable screen rendering


;----------------------------------------------------------------------------
;
; Get the index	of the selected	weapon
;
;----------------------------------------------------------------------------

GetWeaponCursor:
		    ld	    hl,	SelectedWeapon		    ; Pointer to selected weapon
		    ld	    b, 7			    ; Number of	weapons
		    ld	    de,	Weapons			    ; Pointer to weapons data in equipment

GetMenuCursor:
		    ld	    c, 1
		    ld	    a, (hl)
		    and	    a
		    ex	    de,	hl
		    ld	    de,	4
		    jr	    z, GetMenuCursor4

GetMenuCursor2:
		    cp	    (hl)			    ; Is the selected one?
		    jr	    z, SetSelectedIdx		    ; Yes

		    add	    hl,	de			    ; HL = Pointer to next entry
		    inc	    c				    ; Next index
		    djnz    GetMenuCursor2
		    ret


SetSelectedIdx:
		    ld	    a, c
		    ld	    (SelectIdx), a
		    ret


GetMenuCursor4:
		    ld	    a, (hl)
		    or	    a				    ; Empty entry?
		    jr	    z, SetSelectedIdx		    ; Yes

		    add	    hl,	de
		    inc	    c				    ; Next index
		    djnz    GetMenuCursor4		    ; Check next entry

		    ld	    c, 1
		    jr	    SetSelectedIdx


;----------------------------------------------------------------------------
;
; Erase	cursor/arrow
;
;----------------------------------------------------------------------------

EraseArrow:
		    ld	    a, 0
		    jr	    DrawArrow2


;----------------------------------------------------------------------------
;
; Draw cursor/arrow
;
;----------------------------------------------------------------------------

DrawArrow:
		    ld	    a, 3Ch			    ; Right arrow char

DrawArrow2:
		    ld	    de,	(MenuCursorXY)
		    jp	    DrawChar



;----------------------------------------------------------------------------
;
; Copy current palette in VRAM to RAM
;
;----------------------------------------------------------------------------

CopyPalToRAM:
		    ld	    de,	CurrentPal		    ; Color number, color data1, color data 2... #FF end
		    ld	    hl,	0F680h			    ; VRAM address where the palette is	stored
		    ld	    bc,	1000h

CopyPalToRAM2:
		    ld	    a, c
		    inc	    c
		    ld	    (de), a			    ; Color number

		    inc	    de
		    push    bc
		    ld	    bc,	2
		    call    VRAMtoRAM			    ; Copy color data (2 bytes)
		    inc	    hl
		    inc	    hl				    ; Pointer to next color data
		    pop	    bc
		    djnz    CopyPalToRAM2

		    ld	    a, 0FFh			    ; End palete data
		    ld	    (de), a
		    ret


;----------------------------------------------------------------------------
;
; Fade out
;
; Out:
;    Cy	= Fade completed
;
;----------------------------------------------------------------------------

FadeOutLogic:
		    call    FadeOutColors

		    ld	    hl,	CurrentPal		    ; Color number, color data1, color data 2... #FF end
		    call    SetPalette			    ; Set current palette

; Check	if all colors are black

		    ld	    hl,	 CurrentPal+1		    ; Color number, color data1, color data 2... #FF end
		    ld	    b, 16			    ; Number of	colors

		    xor	    a

FadeOutLogic2:
		    or	    (hl)
		    inc	    hl
		    or	    (hl)			    ; Mix RGB values
		    inc	    hl
		    inc	    hl
		    djnz    FadeOutLogic2

		    and	    a				    ; Are all colors black?
		    ret	    nz

		    scf
		    ret


;----------------------------------------------------------------------------
;
; Decrement RGB	values in current palette
;
;----------------------------------------------------------------------------

FadeOutColors:
		    ld	    a, (TickCounter)
		    and	    3
		    ret	    nz				    ; Skip this	iteration

		    ld	    hl,	 CurrentPal+1		    ; Color number, color data1, color data 2... #FF end
		    ld	    b, 10h

FadeOutColors2:
		    ld	    a, (hl)
		    and	    0F0h			    ; Red component
		    jr	    z, FadeOutColors3		    ; Is 0

		    ld	    a, (hl)
		    sub	    10h
		    ld	    (hl), a			    ; Decrement	R component

FadeOutColors3:
		    ld	    a, (hl)
		    and	    0Fh				    ; Blue component
		    jr	    z, FadeOutColors4		    ; Is 0

		    dec	    (hl)			    ; Decrement	blue

FadeOutColors4:
		    inc	    hl
		    ld	    a, (hl)
		    and	    0Fh				    ; Green component
		    ld	    (hl), a
		    jr	    z, FadeOutColors5		    ; Is 0

		    dec	    (hl)			    ; Decrement	green

FadeOutColors5:
		    inc	    hl
		    inc	    hl				    ; Pointer to next color data
		    djnz    FadeOutColors2
		    ret


;----------------------------------------------------------------------------
;
; Initialize game
;
; Reset	doors' status
; Add cigarretes to the	inventory and select them
; Set start room
; Set Big Boss radio frequency
; Set Theme of Tara music
; Init.	player variables
; Load game graphics
; Calculate the	maximum	amount of ammo and rations that	the player can carry
;----------------------------------------------------------------------------

InitGame:
		    call    EraseSprAttRAM		    ; Clear sprite attributes RAM buffer

		    xor	    a
		    ld	    (GameMode),	a		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late

		    ld	    a, (RestoreGameFlag)
		    and	    a				    ; Comes from continue or pause?
		    jp	    nz,	InitGame3		    ; Restore game status/check	point

		    call    SetDefaultDoorLock		    ; Set to default the open/closed status of the doors

		    xor	    a
		    ld	    (IdDoorEnter), a

		    ld	    a, SELECTED_CIGARETTES
		    ld	    (Equipment), a		    ; +0 Item ID, +1 tens/units, +2 hundreds, +3 unused
		    ld	    (SelectedItem), a
		    ld	    a, 1
		    ld	    (CigarsTaken), a
		    ld	    (CigarsUnits), a		    ; Add cigarretes to	inventory and select them

		    ld	    a, (ControlConfig)		    ; Bit6: 1=Enable music/Player control
		    bit	    6, a			    ; demo mode?
		    jr	    z, InitGame2		    ; Do not modify the	current	room number

		    ld	    a, 121			    ; First room
		    ld	    (Room), a
		    ld	    (PreviousRoom), a

InitGame2:
		    ld	    a, 0FFh
		    ld	    (CurrentTileSet), a		    ; Force to reload the tileset

		    ld	    a, FREQ_BIGBOSS		    ; Big boss freq.
		    ld	    (RadioFreq), a

		    ld	    a, 28h
		    ld	    (PrisonWall1Life), a	    ; Snake prison wall	energy
		    ld	    (PrisonWall2Life), a	    ; GreyFox prison wall energy

		    ld	    a, 2Ch			    ; Theme of Tara
		    ld	    (AreaMusic), a
		    ld	    a, 29h			    ; Intro Theme of Tara
		    call    SetSoundEntryChk

		    call    InitPlayerVars		    ; Initialize player	position, sprite, color, life, rank
		    call    LoadGameGfx			    ; Load common game graphics: boxes,	items, cameras,	snake portrait...
		    call    LoadGfxDoors		    ; Load doors graphics
		    call    SetMaxAmmoVals		    ; Set the limit of ammo and	rations	amount.
		    jr	    InitGame5

;----------------------------------------------------------------------------
;
; Restart game from checkpoint
;
;----------------------------------------------------------------------------

InitGame3:
		    call    SetBankInA0_6
		    call    RestoreGameStat		    ; Restore game checkpoint/status
		    call    SetBanks1_2_3
		    call    StopAlert			    ; Stop alert

InitGame4:
		    xor	    a
		    ld	    (AreaMusic), a
		    call    SetAreaMusic2		    ; Set area music

InitGame5:
		    call    SetRadioArea		    ; Set radio	coverage value depending on the	room
		    call    UpdateRadio			    ; Setup radio frequencies and characters available
		    call    AddDoorsData		    ; Get information about the	doors in the room
		    jr	    InitRoom2


;----------------------------------------------------------------------------
;
; Next room logic
;
;----------------------------------------------------------------------------

NextRoomLogic:
		    ld	    hl,	PasswordBuffer
		    ld	    de,	 PasswordBuffer+1
		    ld	    (hl), 0
		    ld	    bc,	1Dh
		    ldir				    ; Erase password buffer

		    call    SetNextRoom			    ; Set next room number
		    call    SetRadioArea		    ; Set radio	signal level/area
		    call    UpdateRadio			    ; Setup radio frequencies and characters available

		    ld	    a, (GameMode)		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late
		    cp	    GAME_MODE_DEAD		    ; is Snake dead?
		    jr	    z, InitRoom

		    ld	    a, (ControlConfig)		    ; Bit6: 1=Enable music/Player control
		    bit	    6, a
		    call    nz,	SetAreaMusic2		    ; Set area music

InitRoom:
		    call    AddDoorsData		    ; Get information about the	doors in the room
		    call    LocatePlayerEntry		    ; Locate the player	in the entry point of the room

InitRoom2:
		    call    SetBankInA0_6
		    call    ChkSaveGameStatus		    ; Checkpoints logic

		    call    SetBanks1_2_3
		    call    ChkIsolatedRoom		    ; Check if it is an	isolated room (can't use binoculars, shooting does not trigger the alarm)

		    call    SetBankInA0_9
		    call    ChkLorryMov			    ; Check if the player is in	a lorry	that is	moving to other	location
		    call    ChkMadnarMsx		    ; Trigger events: Big Boss "switch off your MSX" message and It's too late, Madnar has beed moved

		    call    SetBanks1_2_3

		    xor	    a
		    ld	    (byte_C150), a		    ; Unused?
		    ld	    (IdDoorEnter), a		    ; Reset door ID
		    ld	    (PowerSwitchOn), a		    ; Power switch status 1=On,	0=Off/destroyed
		    ld	    (SpawnedItems), a		    ; Reset spawned items
		    ld	    (LorryMovTextF), a		    ; Reset lorry moving text flag
		    ld	    (OpenBigBossDoor), a	    ; Flag to open door	from Metal Gear	to Big Boss room, and door to escape ladders.

		    ld	    hl,	PlayerShotsList
		    ld	    de,	PlayerShot1Stat
		    ld	    bc,	17Fh
		    ld	    (hl), a
		    ldir				    ; Clear player shots data

		    ld	    a, (Room)
		    cp	    240				    ; Elevator room?
		    jr	    nc,	InitRoom3		    ; Yes

		    ld	    hl,	SprShootsAtt
		    ld	    de,	 SprShootsAtt+1
		    ld	    bc,	17h
		    ld	    (hl), 0E0h
		    ldir				    ; Hide shoots sprites

InitRoom3:
		    call    DisableScreen		    ; Disable screen rendering
		    call    ClearSprAttr		    ; Clear sprite attributes in both VRAM buffers
		    call    LoadRoomTiles		    ; Load the tileset used in the room
		    call    LoadSprProjectile		    ; Load sprites used	by the selected	weapon
		    call    LoadRoomSpr			    ; Load sprites used	by the actors in the room
		    call    RenderRoom			    ; Render room
		    call    DrawDoors			    ; Draw doord
		    call    SetBankInA0_6
		    call    AddRoomItems		    ; Get information about the	items in the room
		    call    DrawRoomItems		    ; Draw items in the	room
		    call    SetBanks1_2_3
		    call    SetMenuWeaponPal		    ; Update the aplette used in the menus
		    call    SetRoomPal			    ; Update the palette used in the room
		    call    SetSprPal			    ; Update the palette used by the sprites
		    call    RenderHUD			    ; Render HUD

		    ld	    a, (SaveLoadMode)		    ; 1=Load mode, 2=Save mode
		    or	    a
		    jr	    nz,	InitRoom4

		    ld	    a, (DoNotAddEnemies)
		    or	    a
		    call    z, SetupEnemyRoom		    ; Add the enemies/actors in	current	room

InitRoom4:
		    call    SetBankInA0_F
		    call    DrawLaserBeams		    ; Draw laser beams,	if availables, when wearing goggles
		    call    SetBanks1_2_3

		    ld	    a, (SaveLoadMode)		    ; 1=Load mode, 2=Save mode
		    or	    a
		    jr	    z, InitRoom5

		    call    SetBankInA0_C
		    call    ChkDrawMetalGear		    ; Check draw Metal Gear
		    call    SetBanks1_2_3

		    call    ChkDrawHindD		    ; Check draw Hind D
		    call    DrawOpenPitfalls		    ; Check draw open pitfalls
		    call    DrawCameras			    ; Check draw cameras as bitmap
		    call    DrawMines			    ; Check draw mines
		    call    ErasePowerSw		    ; Check erase power	switch

InitRoom5:
		    call    EnableScreen		    ; Enable screen rendering

		    ld	    a, (ControlConfig)		    ; Bit6: 1=Enable music/Player control
		    bit	    6, a			    ; Demo mode?
		    jr	    nz,	InitRoom6		    ; No

		    ld	    a, 6
		    ld	    (BankInA0Fixed), a

InitRoom6:
		    ld	    a, (Room)
		    cp	    0F0h			    ; Elevator rooms?
		    jr	    c, InitRoom7		    ; No

		    call    SetHUDSprMask		    ; Put 16 sprites in	the HUD	to avoid the elevator overlap it
		    call    SetBankInA0_9

		    call    SetElevatorSpr		    ; Update elevator sprites
		    jp	    SetBanks1_2_3


InitRoom7:
		    ld	    a, (SaveLoadMode)		    ; 1=Load mode, 2=Save mode
		    or	    a				    ; Returning	from LOAD/SAVE?
		    jp	    z, SetBanks1_2_3

		    call    UpdateSnakeSpr		    ; Update Snake sprite
		    call    UpdateEnemySprStr		    ; Update sprites in	actors structures
		    call    UpdateEnemySprRAM		    ; Update sprites used by the actors/enemies
		    call    PrintPause			    ; Print pause text

		    call    SetBankInA0_F

		    call    UpdateSpritesShuf		    ; Update and shuffle sprites
		    call    SwapSprBuffer		    ; Swap sprites buffer
		    call    UpdateSpritesShuf		    ; Update and shuffle sprites. Force	a full sprite prefresh

		    xor	    a
		    ld	    (SaveLoadMode), a		    ; 1=Load mode, 2=Save mode
		    ld	    (DoNotAddEnemies), a
		    jp	    SetBanks1_2_3



;---------------------------------------------------------------------------
;
; Patch	to update the sprites after destroying Metal Gear
;
;---------------------------------------------------------------------------

TextBoxPatch:
		    ld	    a, (MetalGear_KO)		    ; Metal Gear destroyed. Self destruction activated
		    dec	    a
		    jr	    z, GameLogic4

		    dec	    a
		    jr	    z, GameLogic4

		    jr	    GameModeLogic



;---------------------------------------------------------------------------
;
; Game logic
;
;---------------------------------------------------------------------------

GameLogic:
		    ld	    a, (GameMode)		    ; ;
		    and	    a				    ; Normal mode? (Controlling	Snake)
		    jr	    z, GameLogic3

		    cp	    GAME_MODE_TEXT_BOX		    ; Text window
		    jr	    z, TextBoxPatch

		    cp	    GAME_MODE_LORRY		    ; Lorry
		    jr	    c, GameLogic5

GameLogic3:
		    ld	    a, (IntroSceneStatus)
		    cp	    5
		    jr	    c, GameLogic4

		    cp	    8
		    jr	    c, GameLogic5		    ; Intro Scene 5-7: radio

GameLogic4:
		    call    SetBankInA0_F
		    call    SwapSprBuffer		    ; Swap sprite double buffer
		    call    SetBanks1_2_3

GameLogic5:
		    ld	    a, (GameMode)		    ; ;
		    cp	    GAME_MODE_BINOCULARS	    ; Binocular	mode
		    jr	    z, SkipPlayerSpr

		    call    DrawLife			    ; Draw life	bar and	text

		    call    DrawClass			    ; Draw class stars and text

		    ld	    a, (GameMode)		    ; ;
		    cp	    GAME_MODE_WEAPONS		    ; Weapons menu?
		    jr	    z, LoadSnakeSprs		    ; Skip drawing/erasing CALL	sign or	countdown timer

		    cp	    GAME_MODE_EQUIPMENT		    ; Equipment	menu?
		    jr	    z, LoadSnakeSprs		    ; Skip drawing/erasing CALL	sign or	countdown timer

		    call    DrawCallTimer		    ; Draw/erase CALL sign, or destruction countdown

LoadSnakeSprs:
		    call    SetSnakeSprPatt		    ; Load Snake sprite	patterns depending on current animation	frame
		    call    SetSnakeSprAtt		    ; Update Solid Snake sprite	attributes depending on	current	animation frame
		    call    SetSnakeSprCol		    ; Update player's sprites colors depending on current animation frame
		    call    SetGrenaTargetSpr		    ; Update grenade target sprite
		    call    SetPlayerShotSpr		    ; Update player's shots sprites

SkipPlayerSpr:
		    ld	    a, (Room)
		    cp	    0F0h
		    jr	    nc,	GameModeLogic		    ; No enemies in elevators

		    call    UpdateEnemySprStr		    ; Update the sprites used by the enemies' structures
		    call    UpdateEnemySprRAM		    ; Update sprite attributes (RAM buffer) used by the	enemies

GameModeLogic:
		    call    UpdateControls
		    ld	    a, (GameMode)		    ; Current game mode
		    call    JumpIndex

		    dw Playing
		    dw NextRoomLogic
		    dw MenuWeapon
		    dw MenuEquip
		    dw RadioLogic
		    dw LorryLogic
		    dw ElevatorRoom
		    dw OpenDoorLogic
		    dw BinocularMode
		    dw DeadLogic
		    dw MessageLogic
		    dw CaptureLogic_
		    dw EventMadnarMoved


;---------------------------------------------------------------------------
; Playing
;
; Check	F1-F5 keys
; Check	alarm end
; Check	destruction timer
; Player control logic
; Check	weapon shot
; Player shots logic
; Enemies logic
; CommonLogic: ChkPlayerShots, ChkTouchEnemies,	ChkOnBridge, ChkElectricFloor, ChkGasRooms, ChkDoors, ChkPickItems
; Check	poisoned
;---------------------------------------------------------------------------

Playing:
		    ld	    a, (PlayerControlMod)	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
		    cp	    8				    ; Intro scene mode?
		    jr	    z, PlayModeLogic		    ; Do not check F1-F5 in intro scene


; It is	not possible to	pause the game,	use the	radio or select	an item/weapon in the ladders rooms or while falling in	parachute

		    ld	    a, (Room)
		    cp	    224				    ; Exit ladders
		    jr	    nc,	PlayModeLogic		    ; Can't pause or use inventory

		    cp	    204				    ; Wall bricks parachute
		    jr	    z, PlayModeLogic		    ; Can't pause or use inventory

		    ld	    a, (FKeysTrigger)		    ; 0	0 RET F5 F4 F3 F2 F1
		    rra					    ; F1
		    jr	    nc,	ChkFuncKeys

		    ld	    a, 1
		    ld	    (Pause_1_F5_2), a		    ; Pause flag
		    ret


ChkFuncKeys:
		    rra					    ; F2
		    ld	    c, 2
		    jp	    c, SwitchGameMode

		    inc	    c
		    rra					    ; F3
		    jp	    c, SwitchGameMode

		    inc	    c
		    rra					    ; F4
		    jp	    c, SwitchGameMode

		    rra					    ; F5
		    jr	    nc,	PlayModeLogic

		    ld	    a, 2
		    ld	    (Pause_1_F5_2), a		    ; (!?) Is it used anywere?
		    ret


PlayModeLogic:
		    call    ChkAlarmEnd			    ; Check if the alert mode ends

		    ld	    hl,	DamageDelayTimer
		    ld	    a, (hl)
		    and	    a
		    jr	    z, PlayModeLogic2

		    dec	    (hl)			    ; Decrement	damage delay timer

PlayModeLogic2:
		    call    ChkIncomingCall		    ; Incoming call life cicle
		    call    DecNukeTimer		    ; Self destruction logic

		    ld	    a, (GameMode)		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late
		    cp	    GAME_MODE_DEAD		    ; Dead?
		    jp	    z, RefreshSprites		    ; Update the sprites (copy attributes and colors from RAM to VRAM)

; The player can't move while Metal Gear is exploding

		    ld	    a, (EnemyList)		    ; Get the fist enemy ID in the list
		    ld	    c, a
		    and	    7Fh
		    cp	    ID_METAL_GEAR
		    jr	    nz,	PlayModeLogic3		    ; Metal Gear is not	in the room

		    ld	    a, (EnemyList+0Dh)		    ; Metal Gear life
		    and	    a
		    jr	    z, PlayModeLogic4		    ; All bombs	were set correctly

		    bit	    7, c
		    jr	    nz,	PlayModeLogic4		    ; Metal Gear is exploding

PlayModeLogic3:
		    call    PlayerControlLogic		    ; Control the player depending on the action (normal, punching, climbing...)

PlayModeLogic4:
		    call    ChkWeaponShot		    ; Check if the player uses a weapon
		    call    PlayerShotsLogic		    ; Logic of shots from the player
		    call    EnemiesLogic		    ; Logic of enemies
		    call    CommonLogic			    ; ChkPlayerShots, ChkTouchEnemies, ChkOnBridge, ChkElectricFloor, ChkGasRooms, ChkDoors, ChkPickItems

		    ld	    a, (SelectedItem)
		    cp	    SELECTED_BOX		    ; Cardboard	box
		    call    z, SetGrenaTargetSpr	    ; Hide grenade target sprite when using the	cardboard box

		    ld	    a, (TickCounter)
		    and	    3Fh
		    jp	    nz,	RefreshSprites		    ; Skip continuously	checking if the	player is poisoned

		    ld	    a, (Poisoned)
		    and	    a				    ; Is poisoned?
		    jr	    z, RefreshSprites		    ; Update the sprites (copy attributes and colors from RAM to VRAM)

		    ld	    b, 1
		    call    DecrementLife_4		    ; Decrement	life

		    jr	    RefreshSprites		    ; Update the sprites (copy attributes and colors from RAM to VRAM)

;---------------------------------------------------------------------------
;
; Lorry	logic
;
;---------------------------------------------------------------------------

LorryLogic:
		    call    SetBankInA0_9
		    call    LorryMoving			    ; Moving lorry logic
		    call    SetBanks1_2_3
		    jr	    RefreshSprites		    ; Update the sprites (copy attributes and colors from RAM to VRAM)

;---------------------------------------------------------------------------
;
; Elevator room	logic
;
;---------------------------------------------------------------------------

ElevatorRoom:
		    call    DecNukeTimer		    ; (!?) Once	the self destruction system is activated is not	possible to go back and	enter an elevator

		    call    SetBankInA0_9
		    call    ElevatorRoomLogic
		    call    SetBanks1_2_3

		    call    SetSnakeSprPatt		    ; Update player sprites patterns
		    call    SetSnakeSprAtt		    ; Update player sprites attributes
		    call    SetSnakeSprCol		    ; Update player sprites colors
		    jr	    RefreshSprites		    ; Update the sprites (copy attributes and colors from RAM to VRAM)

;---------------------------------------------------------------------------
;
; Open door animation, draw broken wall
;
;---------------------------------------------------------------------------

OpenDoorLogic:
		    call    EraseDoorLogic
		    jr	    RefreshSprites		    ; Update the sprites (copy attributes and colors from RAM to VRAM)

;---------------------------------------------------------------------------
;
; Binoculars mode
;
;---------------------------------------------------------------------------

BinocularMode:
		    ld	    a, (BinoculStatus)
		    dec	    a
		    jr	    nz,	BinocularMode2		    ; Watching an adjacent room. It is not possible to exit binoculars mode

		    ld	    a, (FKeysTrigger)		    ; 0	0 RET F5 F4 F3 F2 F1
		    and	    4				    ; F3 key?
		    ld	    c, GAME_MODE_EQUIPMENT
		    jp	    nz,	ExitBinocularMode

BinocularMode2:
		    call    BinocularLogic
		    jr	    SetBinoTargetSpr_

;---------------------------------------------------------------------------
;
; Dead
;
;---------------------------------------------------------------------------

DeadLogic:
		    ld	    hl,	DeadTimer
		    dec	    (hl)
		    jr	    z, DeadLogicEnd

		    call    PlayerControlLogic		    ; Run control logic	-> run animation logic

		    jr	    RefreshSprites2


DeadLogicEnd:
		    xor	    a
		    ld	    (PlayingFlag), a		    ; Exit "playing" mode
		    ret

;---------------------------------------------------------------------------
;
; Game Mode: Show a text message
;
;---------------------------------------------------------------------------

MessageLogic:
		    ld	    a, (TextId)
		    cp	    150				    ; EMERGENCY!! EMERGENCY!! THE SELF-DESTRUCTION SWITCH OF OUTER HEAVEN HAS BEEN ACTIVATED.*
		    jp	    nz,	TextBoxLogic

; Update both sprites buffers to clear the sprites before showing the self destruction message

		    ld	    a, (MetalGear_KO)		    ; Metal Gear destroyed. Self destruction activated
		    cp	    3
		    jp	    z, TextBoxLogic

		    inc	    a
		    ld	    (MetalGear_KO), a		    ; Metal Gear destroyed. Self destruction activated
		    jr	    RefreshSprites		    ; Update the sprites (copy attributes and colors from RAM to VRAM)

;---------------------------------------------------------------------------
;
; Capture scene
;
;---------------------------------------------------------------------------

CaptureLogic_:
		    call    CaptureSceneLogic		    ; Capture scene logic. Part	of the logic is	done in	the "alert guard" logic
		    call    EnemiesLogic		    ; Alert guards do part of the logic	of the scene
		    jr	    RefreshSprites2

;---------------------------------------------------------------------------
;
; P. Madnar has	been moved to another cell
; "It is too late" message
;
;---------------------------------------------------------------------------

EventMadnarMoved:
		    call    SetBankInA0_9
		    call    chkMadnarLate		    ; Show "IT'S TOO LATE"
		    call    SetBanks1_2_3
		    jr	    RefreshSprites		    ; Update the sprites (copy attributes and colors from RAM to VRAM)



;---------------------------------------------------------------------------
;
; Update the sprites in	VRAM
; Depending on the room, the sprites are shuffled to avoid the 8th sprite limit
;
;---------------------------------------------------------------------------

RefreshSprites:
		    ld	    a, (Room)			    ; Update the sprites (copy attributes and colors from RAM to VRAM)
		    cp	    45				    ; Bridge
		    jr	    z, RefreshSprites2

		    cp	    46				    ; Moving bridge
		    jr	    z, RefreshSprites2

		    cp	    0F0h			    ; Elevators
		    jr	    c, UpdateSprites_

		    call    RefreshSprites2

RefreshSprites2:
		    call    SetBankInA0_F
		    call    UpdateSprites		    ; Copy colors and attributes from RAM to VRAM
		    jr	    SetBanks1_2_3_g


;----------------------------------------------------------------------------
;
; Set binoculars target	sprites
; Switch memory	banks to call the routine
;
;----------------------------------------------------------------------------

SetBinoTargetSpr_:
		    call    SetBankInA0_F
		    call    SetBinoTargetSpr
		    jr	    SetBanks1_2_3_g




;----------------------------------------------------------------------------
;
; Update sprites (shuffle mode)
; Switch memory	banks to call the routine
;
;----------------------------------------------------------------------------

UpdateSprites_:
		    call    SetBankInA0_F
		    call    UpdateSpritesShuf		    ; Shuffle the sprites to avoid the 8th limit

SetBanks1_2_3_g:
		    jp	    SetBanks1_2_3



;----------------------------------------------------------------------------
;
; Exit binoculars mode
; In:
;    C = Game mode (!?)	it is always 3 (equipment)
;----------------------------------------------------------------------------

ExitBinocularMode:
		    push    bc
		    ld	    hl,	EnemyListCopy		    ; Used when	entering binoculars mode
		    ld	    de,	EnemyList		    ; Array of enemies in the room
		    ld	    bc,	800h
		    ldir				    ; Restore the enemies in the room

		    ld	    a, (PowerSwitchOnCopy)
		    ld	    (PowerSwitchOn), a		    ; Restore power switch status

		    ld	    hl,	(RadioCallFlagCopy)
		    ld	    (RadioCallFlag), hl		    ; Restore incoming call status

		    ld	    a, (AlertModeCopy2)
		    ld	    (AlertModeCopy), a		    ; Restore alert mode

		    ld	    hl,	 SprAttRAM+0Eh
		    ld	    de,	 SprAttRAM+0Fh
		    ld	    bc,	57h
		    ld	    (hl), 0E0h
		    ldir				    ; Hide target sprites (attributes in RAM)

		    pop	    bc				    ; C	= Game mode to restore (always 3 = equipment menu)

SwitchGameMode:
		    ld	    a, (Room)
		    cp	    0F0h			    ; Elevators
		    ret	    nc

		    ld	    a, c
		    ld	    (GameMode),	a		    ; Set the new game mode (equipment)
		    cp	    GAME_MODE_RADIO		    ; (!?) It is not possible to exit from binoculars mode to radio mode
		    jr	    nz,	SwitchGameMode2

		    ld	    a, 1
		    ld	    (RestoreSoundData),	a
		    ld	    a, 59h
		    call    SetSoundEntryChk		    ; Mute sound

SwitchGameMode2:
		    xor	    a
		    ld	    (EquipRadioStatus),	a	    ; Equip and	radio status
		    ret

;---------------------------------------------------------------------------
;
; Binoculars logic
;
; Check	controls to "move" to an adjacent room
; Draw the room
; Wait and "move" to the opposite direction to return to the player's room
;
;---------------------------------------------------------------------------

BinocularLogic:
		    ld	    a, (BinoculStatus)
		    ld	    b, a
		    djnz    BinocularUp

; Check	controls
		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    0Fh				    ; Up, down,	left, right
		    ret	    z				    ; No direction pressed

		    rra					    ; Up?
		    ld	    c, 2
		    jr	    c, MoveBinoculars

		    inc	    c
		    rra					    ; Down?
		    jr	    c, MoveBinoculars

		    inc	    c
		    rra					    ; Left?
		    jr	    c, MoveBinoculars

		    inc	    c				    ; Right

MoveBinoculars:
		    ld	    a, 80h
		    ld	    (TimerBinocular), a		    ; Set the time that	an adjacent room is shown
		    ld	    a, c
		    dec	    a
		    jr	    MoveBinoculars2


BinocularUp:
		    djnz    BinocularDown
		    ld	    a, 2			    ; Down
		    jr	    BinocularShowRoom


BinocularDown:
		    djnz    BinocularLeft
		    ld	    a, 1			    ; Up
		    jr	    BinocularShowRoom


BinocularLeft:
		    djnz    BinocularRight
		    ld	    a, 4			    ; Right
		    jr	    BinocularShowRoom


BinocularRight:
		    djnz    DrawBinocRoom
		    ld	    a, 3			    ; Left

BinocularShowRoom:
		    ld	    hl,	TimerBinocular
		    dec	    (hl)
		    ret	    nz				    ; Continue showing the room

		    ld	    c, 1			    ; Return player's room

MoveBinoculars2:
		    ld	    (NextRoomDirect), a		    ; Set which	direction the binoculars are looking at

		    push    bc
		    call    GetNextRoomNum
		    pop	    bc
		    inc	    a
		    ret	    z				    ; FF = Room	no available

		    dec	    a
		    ld	    (Room), a			    ; Room number to show

		    ld	    a, c
		    ld	    (BinocularDir), a

		    xor	    a
		    ld	    (BinoculStatus), a		    ; Status to	draw the examined room
		    ret


;----------------------------------------------------------------------------
;
; Draw the room	being examined with the	binoculars
;
;----------------------------------------------------------------------------

DrawBinocRoom:
		    call    DisableScreen		    ; Disable screen rendering
		    call    ClearPage0			    ; Clear VRAM page 0
		    call    ClearSprAttr		    ; Clear sprite's attributes in VRAM (both buffers)
		    call    LoadRoomTiles		    ; Load the tileset used in the room
		    call    LoadRoomSpr			    ; Load the sprites used in the room
		    call    SetBankInA0_6
		    call    AddRoomItems		    ; Add the items in the room
		    call    SetBanks1_2_3
		    call    SetRoomPal			    ; Set the palette used by the tileset of room
		    call    SetSprPal			    ; Set the sprite's palette used in the room
		    call    AddDoorsData		    ; Add the rooms structures of the room
		    call    RenderRoom			    ; Render the room
		    call    DrawDoors			    ; Render the doors

		    ld	    hl,	EnemyList		    ; Array of enemies in the room
		    ld	    de,	 EnemyList+1		    ; Array of enemies in the room
		    ld	    (hl), 0
		    ld	    bc,	7FFh
		    ldir				    ; Erase enemies structures/actors data

		    ld	    hl,	EnemySprAttRAM
		    ld	    de,	 EnemySprAttRAM+1
		    ld	    (hl), 0E0h
		    ld	    bc,	57h
		    ldir				    ; Erase enemies sprites attributes

		    call    SetupEnemyRoom		    ; Add the enemies structures/actors	in the room

		    ld	    a, (BinocularDir)
		    dec	    a				    ; Is the player's room?
		    jr	    nz,	DrawBinocRoom2

		    ld	    hl,	EnemySprAttRAM
		    ld	    de,	 EnemySprAttRAM+1
		    ld	    (hl), 0E0h
		    ld	    bc,	57h
		    ldir				    ; Remove sprites from player's room

DrawBinocRoom2:
		    ld	    hl,	txtTelescope
		    call    PrintTextXY			    ; Print TELESCOPE MODE

		    ld	    a, (BinocularDir)
		    ld	    (BinoculStatus), a		    ; Status to	return to player's room after examining the room
		    dec	    a
		    ld	    hl,	ArrowsChars
		    call    ADD_HL_A
		    ld	    a, (hl)			    ; Get tile number of the direction arrow

		    ld	    de,	0C0C4h			    ; XY
		    ld	    c, 0FFh			    ; Print flag
		    call    DrawChar			    ; Draw the direction arrow

		    jp	    EnableScreen		    ; Enable screen rendering to show the result

ArrowsChars:	    db 0
		    db 9Ah				    ; Arrow up
		    db 9Bh				    ; Arrow down
		    db 99h				    ; Arrow left
		    db 3Ch				    ; Arrow right

;---------------------------------------------------------------------------
;
; Logic	of all active enemies
; If the enemy is stunned, it just bounce a bit
;
;---------------------------------------------------------------------------

EnemiesLogic:
		    call    ChkEraseAlertSign		    ; Logic to erase the alert sign
		    call    ChkRespawnEnemy		    ; Logic to respawn enemies in alert	mode

		    ld	    ix,	EnemyList		    ; Array of enemies in the room
		    ld	    b, 16			    ; Max. number of enemies

EnemiesLogicLoop:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    and	    a				    ; Empty actor?
		    jr	    z, EnemiesLogicNext		    ; Yes, check next enemy

		    push    bc

		    ld	    a, (ix+ACTOR.StunnedCnt)
		    and	    a				    ; Is the enemy stunned?
		    jr	    z, EnemiesLogic3

		    dec	    (ix+ACTOR.StunnedCnt)	    ; Decrement	stunned	timer
		    call    StunnedBounce		    ; Stunned bounce logic
		    jr	    EnemiesLogic4		    ; Next enemy


EnemiesLogic3:
		    call    RunEnemyLogic		    ; Enemy logic
		    call    MoveActor			    ; Update actor position depending on his speed
		    call    ChkActorExitRoom		    ; Dimiss enemies that exit the room

EnemiesLogic4:
		    pop	    bc

EnemiesLogicNext:
		    ld	    de,	80h			    ; Enemy structure size
		    add	    ix,	de			    ; IX = Pointer to next enemy
		    djnz    EnemiesLogicLoop

EnemyLogicEnd:
		    ret

;---------------------------------------------------------------------------
;
; Run enemy logic depending on his ID
;
;---------------------------------------------------------------------------

RunEnemyLogic:
		    inc	    (ix+ACTOR.ANIM_CNT)		    ; Increment	animation counter

		    ld	    a, (ix+ACTOR.LIFE)		    ; 0=Kill the actor
		    or	    a				    ; Does it have life	points?
		    jp	    z, KillActor		    ; No, kill it

		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    bit	    7, a			    ; Destroy the actor?
		    jp	    nz,	KillActor3		    ; Yes

		    dec	    a				    ; Adjust IDs to start at 0

		    bit	    6, (ix+ACTOR.TOUCH_INFO)	    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
		    jp	    nz,	ChkKillPunching		    ; The actor	is being punched

		    call    JumpIndex

		    dw BridgeLogic
		    dw EnemyLogicEnd			    ; ID_BRIDGE
		    dw ChkSayHelpMe
		    dw GuardLogic
		    dw GuardLogic
		    dw CameraLogic
		    dw EnemyLogicEnd
		    dw GasLogic				    ; 8
		    dw TankLogic
		    dw GuardAlertLogic
		    dw GuardAlertLogic
		    dw ThankShellLogic
		    dw ShooterLogic
		    dw GuardElevator
		    dw RollingBarrelLogic
		    dw PitfallLogic			    ; #10
		    dw EnemyLogicEnd			    ; Metal Gear
		    dw BulldozerLogic
		    dw GuardLorryLogic
		    dw JetpacTakeoff
		    dw JetpackSwitchLogic
		    dw JetpackLogic
		    dw DummyLogic2			    ; Tank shell
		    dw GuardSwitchLogic			    ; #18
		    dw DogLogic
		    dw ArnoldLogic
		    dw DogBasementLogic
		    dw LorryShooterLogic
		    dw SpawnDogLogic
		    dw GuardLogic
		    dw ScorpionLogic
		    dw BigBossLogic			    ; #20
		    dw ShotGunnerLogic
		    dw MachGunKidLogic
		    dw DrawMovingLasers
		    dw FireTrooperLoogic
		    dw FlamesLogic
		    dw HindDLogic
		    dw SpawnTankShell
		    dw SpawnGuardElev			    ; #28
		    dw CowardDuckLogic
		    dw EnemyLogicEnd
		    dw ShotGunnerShot
		    dw PowerSwitchLogic
		    dw CaptureGuardsLogic
		    dw DesertSecurityLogic
		    dw BulletLogic
		    dw SentinelLogic			    ; #30
		    dw PrisonerLogic
		    dw PrisonerLogic
		    dw PrisonerLogic
		    dw PrisonerLogic
		    dw LaserCameraLogic
		    dw LaserShotLogic
		    dw FakeMadnadLogic
		    dw EnemyLogicEnd			    ; #38
		    dw GuardSilencerLogic
		    dw DummyLogic2			    ; This bullet does not check collisions
		    dw BulletLogic
		    dw MGunKidShotLogic
		    dw DummyLogic2
		    dw TankShotLogic
		    dw BoomerangLogic
		    dw SnoringSymbolLogic
		    dw BigExplosionLogic



;---------------------------------------------------------------------------
;
; Erase	the alert sign if needed
;
;---------------------------------------------------------------------------

ChkEraseAlertSign:
		    ld	    hl,	AlertIconTimer
		    ld	    a, (hl)
		    or	    a
		    ret	    z				    ; Alert sign not visible

		    dec	    (hl)			    ; Decrement	timer
		    ret	    nz

		    ld	    a, (Room)
		    ld	    b, a
		    ld	    a, (RoomAlertTrigged)	    ; This is the room where the alert was triggered
		    cp	    b
		    ret	    nz				    ; The alert	was triggered in a different room. No need to erase the	sign

		    ld	    hl,	AlertSignNotOnScreen	    ; 1	= No need to erase the alert sign. The alert was triggered by a	camera
		    ld	    a, (hl)
		    ld	    (hl), 0
		    or	    a
		    ret	    nz				    ; There is no alert	sign on	screen,	so no need to erase it

		    ld	    hl,	XY_AlertIcon
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)			    ; DE = DX, DY
		    ld	    hl,	6080h			    ; SX,SY
		    ld	    bc,	1010h			    ; 16x16
		    ld	    a, 1			    ; From page	1 to 0
		    jp	    VDP_Copy_Byte		    ; Restore alert sign background

;---------------------------------------------------------------------------
;
; Stunned bounce logic
; When you punch a guard, it makes a little bounce
;
;---------------------------------------------------------------------------

StunnedBounce:
		    ld	    a, (ix+ACTOR.StunnedCnt)	    ; Stunned counter
		    cp	    3Fh
		    ld	    c, -4			    ; Y	offset
		    jr	    z, StunnedBounce2

		    cp	    3Dh
		    jr	    z, StunnedBounce2

		    cp	    3Bh
		    ld	    c, 4			    ; Y	offset
		    jr	    z, StunnedBounce2

		    cp	    39h
		    ret	    nz

StunnedBounce2:
		    ld	    a, (ix+ACTOR.Y)
		    add	    a, c
		    ld	    (ix+ACTOR.Y), a		    ; Modify actor Y
		    ret

;---------------------------------------------------------------------------
;
; After	three punches the guard	dies
; Some of them drop an item
;
;---------------------------------------------------------------------------

ChkKillPunching:
		    inc	    (ix+ACTOR.PunchesCnt)	    ; Increment	number of punches

		    ld	    a, (ix+ACTOR.PunchesCnt)
		    cp	    3
		    jr	    z, ChkDropItem		    ; After 3 punches, check if	the enemy drops	an item

		    ld	    (ix+ACTOR.StunnedCnt), 40h	    ; Stunned time
		    ret

;---------------------------------------------------------------------------
;
; Cheks	if the enemy drops a ration or ammo crate
; (!?) This routine is weird. Only the first enemy type	checked	can drop an item
;
;---------------------------------------------------------------------------

ChkDropItem:
		    ld	    a, (ix+ACTOR.ID)		    ; Enemy type
		    cp	    ID_GUARD_SLOW		    ; (!?) Only	this ID	drops an item
		    jr	    nz,	ChkDropItem3		    ; The NZ filters all other enemy types

		    cp	    ID_GUARD_MEDIUM
		    jr	    z, ChkDropItem2

		    cp	    ID_GUARD_ELEVATOR
		    jr	    z, ChkDropItem2

		    cp	    ID_GUARD_FAST
		    jr	    z, ChkDropItem2

; (Probably some missing code here)

ChkDropItem2:
		    ld	    a, (ix+ACTOR.Y)
		    sub	    4
		    ld	    e, a
		    ld	    a, (ix+ACTOR.X)
		    sub	    8
		    ld	    d, a			    ; DE = Item	XY

		    ld	    a, r			    ; Random number
		    rra
		    rra
		    and	    3				    ; 0-3
		    cp	    2				    ; Value threshold
		    ld	    c, a			    ; Item ID (0 = Ratio, 1 = Ammo crate)
		    call    c, SpawnItem_

ChkDropItem3:
		    jp	    KillActor

;---------------------------------------------------------------------------
;
; Update the actor position adding its current speed values
;
; In:
;    IX	= Pointer to actor
;---------------------------------------------------------------------------

MoveActor:
		    bit	    7, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    ret	    nz				    ; Is dying

		    ld	    a, (ix+ACTOR.Moving)	    ; 0=Does not move
		    and	    a
		    ret	    z				    ; Can't move

		    ld	    b, 2			    ; 2	iterations: Y and X
		    push    ix				    ; Save pointer to actor

MoveActor2:
		    ld	    e, (ix+ACTOR.speedYdec)
		    ld	    d, (ix+ACTOR.SpeedY)	    ; DE = Speed X or Y
		    ld	    l, (ix+ACTOR.Ydec)
		    ld	    h, (ix+ACTOR.Y)		    ; HL = X or	Y
		    add	    hl,	de
		    ld	    (ix+ACTOR.Ydec), l
		    ld	    (ix+ACTOR.Y), h		    ; Update X or Y

		    inc	    ix
		    inc	    ix				    ; Offset to	X related variables
		    djnz    MoveActor2

		    pop	    ix				    ; Restore pointer to actor
		    ret

;---------------------------------------------------------------------------
;
; Check	room boundaries
; If an	actor exits the	room, it is dismissed
;
;---------------------------------------------------------------------------

ChkActorExitRoom:
		    ld	    a, (ix+ACTOR.Y)
		    cp	    193				    ; Top and bottom
		    jr	    nc,	DismissActor0

		    ld	    a, (ix+ACTOR.X)
		    cp	    255				    ; Right
		    jr	    nc,	DismissActor0

		    cp	    7				    ; Left
		    ret	    nc

DismissActor0:
		    ld	    a, (ix+ACTOR.ID)		    ; Actor ID
		    and	    7Fh				    ; Discard bit 7 (dying/exploding flag)
		    cp	    ID_FLAME
		    jp	    z, FlameOutScreen

DismissActor:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    cp	    ID_BIG_BOSS	| 080h		    ; (#A0) Big	boss ID	+ bit 7	on (exploding)
		    jr	    nz,	DismissActor3

		    ld	    a, 1
		    ld	    (OpenBigBossDoor), a	    ; Flag to open door	from Metal Gear	to Big Boss room, and door to escape ladders.

		    ld	    hl,	BigBossStat		    ; 0=Dead, 1=Confession dialog
		    set	    0, (hl)			    ; Big Boss is dead
		    jp	    RemoveActorMusic

;---------------------------------------------------------------------------
;
; Check	if both	Arnolds	are destroyed
; Drop card 7
;---------------------------------------------------------------------------

DismissActor3:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    cp	    ID_ARNOLD |	080h		    ; Arnold ID	+ bit 7	on
		    jr	    nz,	DismissActor4

		    ld	    hl,	ArnoldsCnt
		    dec	    (hl)			    ; Decrement	number of Arnolds
		    jr	    nz,	DismissActor4		    ; One Arnold left

		    ld	    c, SPAWN_CARD7
		    ld	    de,	3030h			    ; XY
		    jr	    RemoveActorDrop		    ; Drop card	7

;---------------------------------------------------------------------------
;
; Coward Duck drops card 8
;
;---------------------------------------------------------------------------

DismissActor4:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    cp	    ID_COWARD_DUCK | 080h	    ; Coward Duck ID + bit 7 on	(exploding)
		    jr	    nz,	DismissActor5

		    ld	    c, SPAWN_CARD8
		    ld	    de,	3870h			    ; XY
		    jr	    RemoveActorDrop		    ; Drop card	8


;---------------------------------------------------------------------------
;
; Check	Fire Trooper
;
;---------------------------------------------------------------------------

DismissActor5:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    cp	    ID_FIRE_TROOPER | 080h	    ; #24 = Fire Trooper
		    jr	    nz,	DismissActor6

		    ld	    a, 1
		    ld	    (FireTrooper_KO), a		    ; Fire Tropped dead	flag
		    jr	    RemoveActorMusic


;---------------------------------------------------------------------------
;
; Check	Shot Gunner
;
;---------------------------------------------------------------------------

DismissActor6:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    cp	    ID_SHOT_GUNNER | 080h	    ; #21 = Shot gunner
		    jr	    nz,	DismissActor7

		    ld	    hl,	ShotGunnerStat		    ; Bit1=Shot	Gunner speech, 0=Dead
		    set	    0, (hl)
		    jr	    RemoveActorMusic


;---------------------------------------------------------------------------
;
; Check	Machine	Gun Kid
;
;---------------------------------------------------------------------------

DismissActor7:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    cp	    ID_MACH_GUN_KID | 080h	    ; Machine Gun Kid
		    jr	    nz,	DismissActor8

		    ld	    hl,	MachGunStatus		    ; Bit0 = Dead, 1 = Speech done
		    set	    0, (hl)
		    jr	    RemoveActorMusic


;---------------------------------------------------------------------------
;
; Drop the supressor after defeating the four guards
;
;---------------------------------------------------------------------------

DismissActor8:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    cp	    ID_GUARD_SILENCER |	080h	    ; Guards that drop the supressor
		    jr	    nz,	DismissActor9

		    ld	    hl,	GuardSilencerCnt	    ; Four soldiers (supressor room)
		    dec	    (hl)
		    jr	    nz,	DismissActor9

		    ld	    c, SPAWN_SUPRESSOR
		    ld	    de,	6224h			    ; XY
		    jr	    RemoveActorDrop		    ; Drop supressor


DismissActor9:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    res	    7, a			    ; Ignore bit 7
		    cp	    ID_BULLDOZER
		    call    z, SetBulldozerKO		    ; Set Bulldozer KO flag and	restore	area music

		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    and	    7Fh
		    cp	    ID_POWER_SWITCH
		    jr	    nz,	RemoveActor_

		    ld	    (ix+ACTOR.ID),	a		    ; Remove bit7 (dying)
		    ret


;----------------------------------------------------------------------------
;
; Spawn	an item
; Restore area music
; Remove the actor (free actor structure and the sprites used)
;
; In:
;   IX = Pointer to actor
;    C = Item to spawn
;   DE = Item XY
;----------------------------------------------------------------------------

RemoveActorDrop:
		    call    SpawnItem_

RemoveActorMusic:
		    call    SetAreaMusic		    ; Restore area music

; Free actor structure and the sprites used by the actor


RemoveActor_:
		    xor	    a
		    ld	    (ix+ACTOR.ID),	a		    ; Free actor structure
		    ld	    (ix+ACTOR.COLLISION_CFG), a	    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed

		    push    ix
		    pop	    hl				    ; HL = Pointer to actor

		    set	    5, l
		    ld	    c, (hl)			    ; Number of	sprites	used by	the actor
		    ld	    a, c
		    and	    a
		    ret	    z				    ; None

		    inc	    l
		    ex	    de,	hl

RemoveActor2_:
		    ld	    hl,	EnemySprAttRAM
		    ld	    a, (de)			    ; Spr. layer
		    add	    a, a
		    add	    a, a			    ; 4	bytes per sprite attributes
		    add	    a, l
		    ld	    l, a
		    ld	    (hl), 0E0h			    ; Y	in sprites attributes RAM buffer

		    inc	    e
		    ld	    a, 0E0h
		    ld	    (de), a			    ; Y	in actor structure

		    ld	    a, e
		    add	    a, 4
		    ld	    e, a			    ; DE = pointer to next sprite in the actor structure
		    dec	    c				    ; Decrement	remaining number of sprites
		    jr	    nz,	RemoveActor2_

		    ret

;---------------------------------------------------------------------------
;
; Spawn	item
;
; C = Item ID
;     0	- Ration
;     1	- Ammo crate
;     2	- Card 7
;     3	- Card 8
;     4	- Supressor
; DE = XY
;
;---------------------------------------------------------------------------

SpawnItem_:
		    ld	    a, c
		    push    ix
		    call    SetBankInA0_6
		    call    SpawnItem
		    call    SetBanks1_2_3
		    pop	    ix
		    ret


;---------------------------------------------------------------------------
;
; Restore the background of a mine
;
;---------------------------------------------------------------------------

RestoreBackMine:
		    ld	    h, (ix+ACTOR.X)
		    ld	    l, (ix+ACTOR.Y)		    ; Mine XY
		    call    GetMineBackXY		    ; Get mine background coordinates and offset X in VRAM buffer

		    ex	    de,	hl
		    ld	    h, a			    ; SX
		    ld	    l, 0A0h			    ; SY
		    ld	    bc,	1010h			    ; 16x16
		    ld	    a, 40h			    ; From page	1 to 0
		    jp	    VDP_Copy_Dot


;----------------------------------------------------------------------------
;
; Update the sprites used by the enemies in their structures
;
;----------------------------------------------------------------------------

UpdateEnemySprStr:
		    ld	    ix,	EnemyList		    ; Array of enemies in the room
		    ld	    b, 16			    ; Maximum number of	enemies	on a room

UpdateEnemySpr2:
		    push    bc

		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    and	    a				    ; Active actor?
		    call    nz,	UpdateActorSprDat

		    ld	    de,	80h			    ; Actor structure size
		    add	    ix,	de			    ; IX = Pointer to next actor

		    pop	    bc
		    djnz    UpdateEnemySpr2
		    ret

;---------------------------------------------------------------------------
;
; Kill actor
;
; Decrement respawn count if it	is a guard
; Actor	dead logic
;
;---------------------------------------------------------------------------

KillActor:
		    ld	    a, (ix+ACTOR.ID)		    ; Actor ID
		    ld	    d, a			    ; Save ID

		    cp	    ID_GUARD_ALERT
		    jr	    z, DecRespawnGuards

		    cp	    ID_GUARD_REDALERT
		    jr	    z, DecRespawnGuards

		    cp	    ID_SHOOTER
		    jr	    z, DecRespawnGuards

		    sub	    ID_JETPACK_TAKEOFF
		    jr	    z, DecRespawnGuards

		    dec	    a				    ; JETPACK_SWITCH
		    jr	    z, DecRespawnGuards

		    dec	    a				    ; JETPACK
		    jr	    nz,	KillActor2

DecRespawnGuards:
		    ld	    hl,	NumRespawnGuards
		    dec	    (hl)
		    bit	    7, (hl)			    ; Counter overflow?	-1
		    jr	    z, KillActor2

		    ld	    (hl), 0			    ; Reset counter

KillActor2:
		    ld	    a, d			    ; Actor ID
		    cp	    ID_LAND_MINE		    ; Is it a mine?
		    call    z, RestoreBackMine		    ; Restore the backgorund

		    cp	    ID_SLEEPING_SIGN
		    jr	    z, KillActor3

		    xor	    a
		    set	    7, (ix+ACTOR.ID)		    ; Mark this	actor as killed

		    ld	    (ix+ACTOR.COLLISION_CFG), a	    ; Do not check collisions with the player or shots
		    ld	    (ix+ACTOR.ANIM_CNT), a	    ; Reset animation counter
		    inc	    a
		    ld	    (ix+ACTOR.LIFE), a		    ; Disable "KillActor" flag

		    ld	    a, 16h
		    call    SetSoundEntry		    ; Sfx: enemy dead

KillActor3:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    and	    7Fh				    ; Remove "killed flag bit"
		    dec	    a
		    ld	    hl,	IdsKillLogic
		    call    GetNibbleHL_A2		    ; Get the type of dead logic of this enemy
		    call    JumpIndex			    ; Run dead logic

		    dw DismissActor0
		    dw KillEnemy
		    dw KillPrisoner2			    ; Elen, Grey Fox, Madnar
		    dw KillPrisoner			    ; Prisoner1, prisoner6 (not	used?)
		    dw KillJetpack			    ; Jetpack guards
		    dw ExplosionAnim			    ; Camera, land mine, laser camera
		    dw BossDefeatedLogic		    ; Metal Gear, Tank,	Hind D,	Bulldozer
		    dw EraseBitmapActor			    ; Power switch

;----------------------------------------------------------------------------
;
; There	are 7 different	kill logics for	the actors
; Array	with the types of each actor encoded in	nibbles
;
;----------------------------------------------------------------------------
IdsKillLogic:	    db	  0,   1, 15h, 50h, 61h, 10h, 11h,   0,	66h, 14h, 44h,	 1, 11h, 11h,	1, 11h
		    db	11h,   1,   6,	 0, 10h,   7,	0,   1,	32h, 22h, 50h, 13h, 10h,   0,	0,   0
		    db	  0



;----------------------------------------------------------------------------
;
; Kill prisoner	logic
;
;----------------------------------------------------------------------------

KillPrisoner:
		    ld	    a, (Room)
		    cp	    193				    ; Coward Duck and Jennifer's brother room
		    jr	    nz,	KillPrisoner2

		    ld	    a, (ix+ACTOR.IDX_SAME_ID)
		    cp	    3				    ; Is Jenniffer's brother?
		    jr	    nz,	KillPrisoner2

		    ld	    a, 1
		    ld	    (JennifBrotherDead), a	    ; Mark Jeniffer's brother as dead
		    ld	    (RescuedArray+0Dh),	a	    ; Also as "rescued"

KillPrisoner2:
		    ld	    a, (ix+ACTOR.ANIM_CNT)
		    and	    a				    ; (!?) all prisoners have their counter reset to 0
		    push    ix
		    call    z, DowngradeRank		    ; Downgrade	rank and reset rescued prisoners counter
		    pop	    ix

KillEnemy:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    and	    7Fh
		    sub	    ID_BIG_BOSS
		    jr	    nz,	JpDismissActor

		    ld	    (DoorOpenArray+6Ah), a	    ; Open ladders' door

JpDismissActor:
		    jp	    DismissActor

;----------------------------------------------------------------------------
;
; Jetpack guard	explosion
;
;----------------------------------------------------------------------------

KillJetpack:
		    ld	    hl,	ExplosionSprColx1

		    ld	    a, (ix+ACTOR.ANIM_CNT)
		    cp	    5
		    ld	    c, 7Ah			    ; Explosion	sprite id
		    jr	    c, KillJetpack2

		    cp	    0Ah
		    inc	    c				    ; Frame 2
		    jr	    c, KillJetpack2

		    cp	    10h
		    jp	    z, DismissActor		    ; Remove actor/explosion

		    inc	    c				    ; Frame 4

KillJetpack2:
		    ld	    b, 6			    ; Number of	sprites	to update
		    jr	    ExplosionAnim3


;----------------------------------------------------------------------------
;
; Explosion animation
;
;----------------------------------------------------------------------------

ExplosionAnim:
		    ld	    hl,	ExplosionSprColx3
		    ld	    a, (ix+ACTOR.ANIM_CNT)
		    cp	    5
		    ld	    c, 6Ah			    ; Small explosion sprite ID
		    jr	    c, ExplosionAnim2

		    cp	    0Ah
		    inc	    c
		    jr	    c, ExplosionAnim2

		    cp	    10h
		    jp	    z, DismissActor
		    inc	    c

ExplosionAnim2:
		    ld	    b, 2

ExplosionAnim3:
		    ld	    (ix+ACTOR.SpriteId), c
		    push    ix
		    pop	    de
		    ld	    a, 25h			    ; Spr1 color
		    call    ADD_DE_A
		    jr	    SetExplSprColors


;----------------------------------------------------------------------------
;
; Big sized bosses: Metal Gear,	Tank, Hind D, Bulldozer
; 3 explosions
;
;----------------------------------------------------------------------------

BossDefeatedLogic:
		    ld	    l, (ix+ACTOR.BASE_SPR_ID)
		    ld	    h, (ix+ACTOR.KO_POINTER_H)
		    ld	    a, (hl)			    ; Pointer to defeated flag
		    and	    a
		    jr	    nz,	BossDefeatedLogic2

		    ld	    (hl), 1			    ; Mark as destroyed

		    call    SetAreaMusic		    ; Restore area music

		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    and	    7Fh
		    sub	    ID_METAL_GEAR		    ; Is Metal Gear destroyed?
		    jr	    nz,	BossDefeatedLogic2

		    inc	    a
		    ld	    (DestructionTimerOn), a	    ; Enable destruction countdown

		    ld	    hl,	3000h
		    ld	    (DestructTimer), hl		    ; Countdown	time

		    ld	    a, l
		    ld	    (DoorOpenArray+62h), a	    ; Open door	to Big Boss room

		    ld	    a, 53h			    ; SFX Metal	Gear destroyed
		    call    SetSoundEntry

BossDefeatedLogic2:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    and	    7Fh
		    cp	    ID_METAL_GEAR
		    jr	    z, DestroyMetalG

		    ld	    a, (ix+ACTOR.ANIM_CNT)
		    cp	    5
		    ld	    hl,	ExplosionSprColx3
		    ld	    c, 7Fh
		    jr	    c, BossDefeatedLogic3

		    cp	    10h
		    jp	    z, EraseBitmapActor

		    inc	    c
		    cp	    0Ah
		    ld	    hl,	ExplosionSprColx3
		    jr	    c, BossDefeatedLogic3

		    ld	    c, 81h
		    ld	    hl,	ExpSprColWhtRed
		    jr	    nz,	BossDefeatedLogic3

		    ld	    a, 1
		    ld	    (OpenBigBossDoor), a	    ; Flag to open door	from Metal Gear	to Big Boss room, and door to escape ladders.

BossDefeatedLogic3:
		    ld	    (ix+ACTOR.SpriteId), c
		    push    ix
		    pop	    de
		    ld	    a, 25h			    ; +25 = Spr1Color
		    call    ADD_DE_A

		    ld	    b, 18			    ; The tank and the bulldozer use 18	sprites	explosion
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    and	    7Fh
		    cp	    ID_TANK
		    jr	    z, SetExplSprColors

		    cp	    ID_BULLDOZER
		    jr	    z, SetExplSprColors

		    ld	    b, 8			    ; 8	sprites	explosion

SetExplSprColors:
		    ld	    a, (hl)
		    ld	    (de), a
		    inc	    hl
		    ld	    a, 5
		    call    ADD_DE_A
		    djnz    SetExplSprColors
		    ret


;----------------------------------------------------------------------------
;
; Metal	Gear destruction logic
; Explosions (flashing colors),	open door to Big Boss room and show self-destruction text
;
;----------------------------------------------------------------------------

DestroyMetalG:
		    ld	    a, (ix+ACTOR.ANIM_CNT)
		    and	    2				    ; Time mask
		    ld	    de,	0			    ; Black
		    jr	    nz,	DestroyMetalG2

		    ld	    de,	7707h			    ; White

DestroyMetalG2:
		    ld	    a, 0Fh			    ; Color 15
		    call    SetPaletteColor		    ; Set black	or white color

		    ld	    a, (ix+ACTOR.ANIM_CNT)
		    cp	    5
		    ld	    hl,	ExplosionSprColx2
		    ld	    c, 89h
		    jr	    c, BossDefeatedLogic3

		    inc	    c
		    cp	    0Ah
		    ld	    hl,	ExplosionSprColx3
		    jr	    c, BossDefeatedLogic3

		    inc	    c
		    cp	    0Fh
		    ld	    hl,	ExplosionSprColx4
		    jr	    c, BossDefeatedLogic3

		    inc	    c
		    cp	    14h
		    ld	    hl,	ExplosionSprColx3
		    jr	    c, BossDefeatedLogic3

		    inc	    c
		    cp	    19h
		    ld	    hl,	ExplosSprColWht
		    jr	    c, BossDefeatedLogic3

		    inc	    c
		    cp	    21h
		    ld	    hl,	ExplosSprColWht2
		    jr	    c, BossDefeatedLogic3
		    jr	    z, ClearMetalGear

		    cp	    22h
		    jr	    nz,	ShowEmergencyText

		    ld	    a, 1
		    ld	    (OpenBigBossDoor), a	    ; Flag to open door	from Metal Gear	to Big Boss room, and door to escape ladders.
		    ret


ShowEmergencyText:
		    call    DismissActor
		    ld	    a, 150			    ; TEXT: EMERGENCY!!*EMERGENCY!!*THE	SELF-DESTRUCTION SWITCH	OF* OUTER HEAVEN HAS BEEN ACTIVATED.*ESCAPE QUICKLY!!
		    jp	    SetTextUnskippable


;----------------------------------------------------------------------------
;
; Erase	Metal Gear tiles
;
;----------------------------------------------------------------------------

ClearMetalGear:
		    call    EraseBitmapActor		    ; Erase Metal Gear tiles
		    ld	    hl,	EmptySprColx6
		    jp	    BossDefeatedLogic3		    ; Remove explosion sprites

ExplosionSprColx4:  dw 4806h
ExplosionSprColx3:  dw 4806h
ExplosionSprColx2:  dw 4806h
ExplosionSprColx1:  dw 4806h
EmptySprColx6:	    dw 0
		    dw 0
		    dw 0
		    dw 0
		    dw 0
		    dw 0

; Big white explosion and 2 small (fire)
ExpSprColWhtRed:    dw 0E0Eh
		    dw 0E0Eh
		    dw 4806h
		    dw 4806h
		    dw 0
		    dw 0
		    dw 0
		    dw 0
		    dw 0
ExplosSprColWht:    dw 0E0Eh
		    dw 0E0Eh
		    dw 4806h
		    dw 0
ExplosSprColWht2:   dw 0E0Eh
		    dw 0E0Eh
		    dw 0
		    dw 0




;----------------------------------------------------------------------------
;
; Remove Metal Gear entry call
;
;----------------------------------------------------------------------------

RemoveMetalGear_:
		    call    SetBankInA0_C
		    call    RemoveMetalGear
		    jp	    SetBanks1_2_3



;----------------------------------------------------------------------------
;
; Remove actor and restore his background (Hind	D, Metal Gear and Power	Switch)
;
;----------------------------------------------------------------------------

EraseBitmapActor:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    and	    7Fh
		    cp	    ID_TANK
		    jp	    z, DismissActor		    ; The tank is made of sprites

		    cp	    ID_BULLDOZER
		    jp	    z, DismissActor		    ; The Bulldozer is made of sprites

		    cp	    ID_HIND_D
		    jp	    z, RemoveHindD		    ; Erase Hind D and restore background

		    cp	    ID_METAL_GEAR
		    jr	    z, RemoveMetalGear_		    ; Erase Metal Gear and restore background

		    cp	    ID_POWER_SWITCH
		    ret	    nz

		    xor	    a
		    ld	    (PowerSwitchOn), a		    ; Mark the power switch as destroyed
		    ld	    (ix+ACTOR.ID),	a		    ; Disable actor/free structure

		    ld	    hl,	PowerSwitchY
		    ld	    a, (ix+ACTOR.Y)
		    sub	    8
		    ld	    (hl), a
		    inc	    hl
		    ld	    a, (ix+ACTOR.X)
		    sub	    4
		    ld	    (hl), a			    ; Stores coordinates of power switch image location

		    call    SetRoomPal			    ; Reset the	floor color
		    call    DismissActor		    ; Disable the actor	(again)	and free his sprites

ErasePowerSw:
		    ld	    hl,	PowerSwitchY
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)
		    ld	    a, e
		    or	    d
		    ret	    z				    ; Invalid coordinates. Powers Switch unavailable

		    ld	    a, (Room)
		    cp	    40				    ; Roof electrified floor
		    ld	    hl,	PowSwOffGfxX
		    jr	    z, ErasePowerSw2

		    dec	    hl
		    dec	    hl				    ; Pointer to alternative X coordinates of the destroyed power switch tiles

ErasePowerSw2:
		    ld	    (ix+ACTOR.COLLISION_CFG), 0	    ; Disable collision	with missiles
		    jr	    DrawDestroyPowSw		    ; Render destroyed power switch


;----------------------------------------------------------------------------
;
; Erase	the power switch if it is destroyed
;
;----------------------------------------------------------------------------

ChkDrawDestroyPS:
		    ld	    hl,	PowerSwitchY
		    ld	    a, (hl)
		    or	    a
		    ret	    z				    ; Power switch not available

		    ld	    a, (PowerSwitchOn)		    ; Power switch status 1=On,	0=Off/destroyed
		    or	    a
		    ret	    nz				    ; Power switch not destroyed

		    jr	    ErasePowerSw

;----------------------------------------------------------------------------
;
; Draws	destroyed power	switch
;
; In:
;   HL = Pointer to X coordinates of destroyed tiles
;   DE = DX,DY
;----------------------------------------------------------------------------

DrawDestroyPowSw:
		    ld	    a, (hl)			    ; Upper tile X coordinate
		    inc	    hl

		    push    hl
		    push    de

		    ld	    bc,	808h			    ; 8x8 tile
		    push    bc

		    ld	    h, a			    ; X	tile
		    ld	    l, 10h			    ; HL = SX, SY
		    ld	    a, 1			    ; From page	1 to 0
		    call    VDP_Copy_Byte		    ; Render upper tile

		    pop	    bc
		    pop	    de

		    ld	    a, e
		    add	    a, 8
		    ld	    e, a			    ; DY = DY +	8

		    pop	    hl

		    ld	    h, (hl)			    ; Lower tile X coordinate
		    ld	    l, 10h			    ; SY
		    ld	    a, 1			    ; From page	1 to 0
		    jp	    VDP_Copy_Byte		    ; Render bottom tile


;----------------------------------------------------------------------------
; X coordinates	of destroyed power switch tiles
; Y is always #10
;----------------------------------------------------------------------------
		    dw 3830h
PowSwOffGfxX:	    dw 7050h



;----------------------------------------------------------------------------
;
; Restore laser	beans background
;
;----------------------------------------------------------------------------

RestLaserBack_:
		    call    SetBankInA0_F
		    call    RestLasersBack
		    jp	    SetBanks1_2_3




	include	"logic/doors.asm"

	include	"logic/inithardware.asm"

	include	"logic/controls.asm"

	include	"logic/setalert.asm"

	include	"logic/capturescene.asm"

	include	"logic/menuequipment.asm"

	include	"logic/checkweaponalert.asm"
		    
	include	"logic/weaponuse.asm"		    
		    
	include	"logic/textboxappear.asm"

	include	"logic/collisions.asm"

	include	"logic/helperdirections.asm"

	include	"logic/weapon/handgun.asm"

	include	"logic/weapon/smg.asm"

	include	"logic/weapon/grenade.asm"

	include	"logic/weapon/rocket.asm"

	include	"logic/weapon/plasticbomb.asm"

	include	"logic/weapon/mine.asm"

	include	"logic/weapon/missile.asm"



	include "logic/common.asm"

	include	"logic/items.asm"

	include	"logic/hud.asm"

	include	"logic/maxammo.asm"

	include	"logic/incomingcall.asm"

	include	"logic/destructiontimer.asm"

	include	"logic/shrinkitems.asm"

	include	"data/hudstartendtexts.asm"

	include	"logic/nextroom.asm"

	include	"logic/hudspritemask.asm"

	include	"logic/actors.asm"

		    ; Fill empty space
		    ds      (#C000-$),#ff
		    ASSERT  $=#C000