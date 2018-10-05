
;----------------------------------------------------------------------------
;
; Equipment menu logic
;
;----------------------------------------------------------------------------

MenuEquip:
		    ld	    a, (FKeysTrigger)		    ; 0	0 RET F5 F4 F3 F2 F1
		    and	    4				    ; F3 key pressed?
		    jp	    nz,	ExitEquipMenu		    ; Yes, exit	equipment menu and check if binoculars are selected

		    ld	    a, (EquipRadioStatus)	    ; Equip and	radio status
		    dec	    a				    ; Is the menu already drawn?
		    jp	    z, MenuEquipLogic		    ; Yes, run the control logic

; Draw the equipment screen

		    call    DisableScreen		    ; Disable screen rendering
		    call    ClearSprAttr		    ; Hide sprites
		    call    ClearPage0			    ; Erase screen
		    call    SetMenuWeaponPal		    ; Set the palette used in the equipment menu

		    ld	    hl,	EquipRadioStatus	    ; Equip and	radio status
		    inc	    (hl)			    ; Next status

		    call    CompactEquipment		    ; Compact items in the menu

		    call    DrawEquipMenu		    ; Draw items in the	menu

		    ld	    hl,	SelectedItem
		    ld	    b, 25
		    ld	    de,	Equipment		    ; +0 Item ID, +1 tens/units, +2 hundreds, +3 unused
		    call    GetMenuCursor		    ; Get the index of the selected item

		    call    CalcCursorXYEquip		    ; Get arrow	XY
		    call    DrawArrow			    ; Draw the arrow in	the selected item

		    call    RenderHUD			    ; Render the HUD (life, class, selected item...)
		    jp	    EnableScreen		    ; Enable screen rendering


;----------------------------------------------------------------------------
;
; Equipment menu logic
; Check	controls to move the cursor/arrow
; Check	if an item is selected or used
;
;----------------------------------------------------------------------------

MenuEquipLogic:
		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    bit	    4, a			    ; Fire key pressed?
		    jp	    nz,	ChkUseItem

		    and	    0Fh				    ; Any direction triggered?
		    jr	    nz,	MenuEquipLogic2

		    ld	    a, (ControlsHold)		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    0Fh
		    ret	    z				    ; No direction is pressed

		    ld	    hl,	ControlHoldWait
		    dec	    (hl)
		    ret	    nz				    ; Delay for	repeating the direction

MenuEquipLogic2:
		    ld	    hl,	ControlHoldWait
		    ld	    (hl), 8			    ; Set direction repeat delay

		    rra					    ; Up pressed?
		    jr	    c, MenuEquipUp

		    rra					    ; Down pressed?
		    jr	    c, MenuEquipDown

		    rra					    ; Left pressed?
		    jr	    c, MenuEquipLeft

; Must be right	pressed

		    ld	    a, (SelectIdx)
		    cp	    17				    ; Item (2,7)
		    ret	    nc				    ; It is not	possible to move to 3rd	column

		    add	    a, 9			    ; Move to 3rd items	column
		    ld	    c, a
		    jr	    MenuEquipMove


;----------------------------------------------------------------------------
;
; Move the cursor up (if it is possible)
;
;----------------------------------------------------------------------------

MenuEquipUp:
		    ld	    a, (SelectIdx)
		    cp	    1
		    ret	    z				    ; First item. It is	not possible to	move up

		    cp	    10
		    ret	    z				    ; First item of 2nd	column.	Not possible to	move up

		    cp	    19
		    ret	    z				    ; First item of 3rd	column.	Not possible to	move up

		    dec	    a				    ; Move up
		    ld	    c, a
		    jr	    MenuEquipMove


;----------------------------------------------------------------------------
;
; Move the cursor down (if it is possible)
;
;----------------------------------------------------------------------------

MenuEquipDown:
		    ld	    a, (SelectIdx)
		    cp	    9
		    ret	    z				    ; Last item	of first column.

		    cp	    18
		    ret	    z				    ; Last item	of second column.

		    cp	    25
		    ret	    z				    ; Last item	of third column.

		    inc	    a				    ; Move down
		    ld	    c, a
		    jr	    MenuEquipMove


;----------------------------------------------------------------------------
;
; Move the cursor left (if it is possible)
;
;----------------------------------------------------------------------------

MenuEquipLeft:
		    ld	    a, (SelectIdx)
		    cp	    10
		    ret	    c				    ; First column, no possible	to move	left

		    sub	    9				    ; Move left
		    ld	    c, a


;----------------------------------------------------------------------------
;
; Move the cursor
; Play SFX
; Erase	the cursor in the old location
; Draw the cursor in the new location
; If Snake has his equipment, select the item
;
;----------------------------------------------------------------------------

MenuEquipMove:
		    ld	    a, 20h
		    call    SetSoundEntryChk		    ; SFX: move	arrow

		    call    EraseArrow			    ; Erase previous position

		    ld	    a, c
		    ld	    (SelectIdx), a		    ; Set new selected index

		    call    CalcCursorXYEquip
		    call    DrawArrow			    ; Draw the arrow in	the new	location

		    ld	    a, (EquipRemoved)		    ; The equipment and	weapons	have been removed by the enemy (captured)
		    and	    a
		    jr	    z, SetSelectedItem		    ; Snake has	his equipment

		    xor	    a				    ; Any item selected
		    jr	    SetSelectedItem2


;----------------------------------------------------------------------------
;
; Select the choosen item
;
;----------------------------------------------------------------------------

SetSelectedItem:
		    ld	    a, (SelectIdx)
		    call    DEC_A_HL_4xA		    ; Each item	takes 4	bytes
		    ld	    de,	Equipment		    ; +0 Item ID, +1 tens/units, +2 hundreds, +3 unused
		    add	    hl,	de
		    ld	    a, (hl)			    ; Get selected item	ID

SetSelectedItem2:
		    ld	    (SelectedItem), a
		    jp	    DrawItemHUD


;----------------------------------------------------------------------------
;
; Check	if an item is used
; Rations fill the energy bar (can not be used in deep water)
; Drop the trasmitter
; Antidote removes the poison
; Cigarettes add 2000 units to the destruction timer
;
;----------------------------------------------------------------------------

ChkUseItem:
		    ld	    a, (SelectedItem)
		    and	    a
		    ret	    z				    ; No item selected

		    call    GetItemInvAdd		    ; Get a pointer to the selected item

		    ld	    a, (PlayerAnimation)	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    cp	    4				    ; In deep water?
		    jr	    z, ChkDropTransmitter	    ; Can't use rations in deep water

		    ld	    a, (hl)
		    cp	    SELECTED_RATION		    ; Ration
		    jr	    nz,	ChkDropTransmitter

		    ld	    c, 2			    ; Type of use: Item	consumed in the	equipment screen
		    inc	    hl
		    call    DecItemUnits		    ; Decrement	item number and	update the amount in the equipment screen

		    ld	    a, (MaxLife)
		    ld	    (Life), a			    ; Fill the energy

		    call    DrawLife			    ; Draw life	bar
		    jr	    UseItemSfx			    ; Play sfx


;----------------------------------------------------------------------------
; Check	if the transmitter/bug is dropped
;----------------------------------------------------------------------------

ChkDropTransmitter:
		    cp	    SELECTED_TRANSMITTER	    ; Transmiter
		    jr	    nz,	ChkUseAntidote

		    ld	    c, 2
		    inc	    hl
		    call    DecItemUnits		    ; Remove item

		    xor	    a
		    ld	    (TransmiTaken), a		    ; Erase transmitter	flag
		    jr	    UseItemSfx


;----------------------------------------------------------------------------
; Check	if the antidote	is used
;----------------------------------------------------------------------------

ChkUseAntidote:
		    cp	    SELECTED_ANTIDOTE		    ; Antidote
		    jr	    nz,	ChkUseCigarettes

		    xor	    a
		    ld	    (Poisoned),	a		    ; Remove poisoned status
		    jr	    UseItemSfx


;----------------------------------------------------------------------------
; Cigarettes can only be used in the final countdown to	add 2000 extra units to	the counter
;----------------------------------------------------------------------------

ChkUseCigarettes:
		    cp	    SELECTED_CIGARETTES		    ; Cigarettes
		    ret	    nz

		    ld	    a, (DestructionTimerOn)
		    and	    a
		    ret	    z				    ; The destruction timer is not active

		    ld	    c, 2
		    inc	    hl
		    call    DecItemUnits		    ; Remove cigarets from inventory

		    ld	    hl,	DestructTimerH
		    ld	    a, 20h
		    add	    a, (hl)
		    daa
		    ld	    (hl), a			    ; Add 2000 units to	destruction timer

		    call    DrawCallTimer		    ; Update timer display

UseItemSfx:
		    ld	    a, 21h			    ; SFX item used
		    jp	    SetSoundEntryChk


;----------------------------------------------------------------------------
;
; Checks if binoculars are selected and	if it is possible to use them
;
;----------------------------------------------------------------------------

ExitEquipMenu:
		    ld	    a, (IsolatedRoom)		    ; Can't use binoculars. Shooting does not trigger the alarm
		    and	    a
		    jp	    nz,	RenderScreen		    ; Isolated room. Binoculars	can't be used here

		    ld	    a, (SelectedItem)
		    cp	    SELECTED_BINOCULARS		    ; Binoculars
		    jp	    nz,	RenderScreen

		    ld	    a, GAME_MODE_BINOCULARS
		    ld	    (GameMode),	a		    ; Set binoculars mode

		    xor	    a
		    ld	    (BinoculStatus), a
		    inc	    a
		    ld	    (BinocularDir), a		    ; Reset binoculars mode status

		    call    DisableScreen		    ; Disable screen rendering

		    ld	    hl,	EnemyList		    ; Pointer to an array of enemies
		    ld	    de,	EnemyListCopy		    ; Pointer to an array of enemies copy
		    ld	    bc,	800h
		    ldir				    ; Backup enemies

		    ld	    a, (PowerSwitchOn)		    ; Power switch status 1=On,	0=Off/destroyed
		    ld	    (PowerSwitchOnCopy), a	    ; Save power switch	status

		    ld	    hl,	(RadioCallFlag)		    ; 1=Start incoming call, 2=Stop incoming call
		    ld	    (RadioCallFlagCopy), hl	    ; Save radio call flag and timer

		    ld	    a, (AlertModeCopy)
		    ld	    (AlertModeCopy2), a		    ; Save alert mode status

		    ld	    hl,	 SprAttRAM+0Eh
		    ld	    de,	 SprAttRAM+0Fh
		    ld	    bc,	57h
		    ld	    (hl), 0E0h
		    ldir				    ; Hide sprites

		    ld	    hl,	BinocularSprAtt
		    ld	    de,	SprShootsAtt
		    ld	    bc,	18h
		    ldir				    ; Set the binoculars target	sprites	attributes

		    ld	    hl,	BinocularSprCol
		    ld	    de,	 BinocularSprCol+1
		    ld	    bc,	3Fh
		    ld	    (hl), 0Eh			    ; White
		    ldir				    ; Set the sprites colors

		    jp	    LoadSprTarget		    ; Set sprites patterns


;----------------------------------------------------------------------------
; Binoculars target sprites attributes
;----------------------------------------------------------------------------
BinocularSprAtt:    db	50h, 70h, 10h,	 0
		    db	50h, 80h, 14h,	 0
		    db	60h, 70h, 18h,	 0
		    db	60h, 80h, 1Ch,	 0
		    db 0E0h,   0,   0,	 0
		    db 0E0h,   0,   0,	 0
