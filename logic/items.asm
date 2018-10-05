;----------------------------------------------------------------------------
;
; Check	if the player picks up an item
;
;----------------------------------------------------------------------------

ChkTakeItems:
		    ld	    hl,	ItemsInTheRoom		    ; ID, size,	Y, X

		    ld	    a, (PlayerY)
		    ld	    e, a
		    ld	    a, (PlayerX)
		    ld	    d, a			    ; DE = XY player

		    ld	    bc,	300h			    ; B	= Max. 3 items,	C = item index = 0

ChkTakeItems2:
		    push    hl
		    push    de
		    push    bc

		    ld	    a, (hl)
		    and	    a				    ; Empty structure?
		    call    nz,	ChkTakeItem		    ; Check if the player takes	the item

		    ld	    a, (GameMode)		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late
		    cp	    GAME_MODE_TEXT_BOX		    ; Showing a	text
		    jr	    nz,	ChkTakeItems3

		    pop	    bc
		    ld	    b, 1			    ; An item description is being shown. Do not check more items
		    jr	    ChkTakeItems4


ChkTakeItems3:
		    pop	    bc

ChkTakeItems4:
		    pop	    de
		    pop	    hl

		    ld	    a, 10h			    ; Item structure size
		    call    ADD_HL_A			    ; Pointer to next item structure

		    inc	    c				    ; Next item	index
		    djnz    ChkTakeItems2
		    ret



;----------------------------------------------------------------------------
;
; Check	if the player picks up an item
;
; In:
;   HL = Pointer to item
;
;----------------------------------------------------------------------------

ChkTakeItem:
		    push    hl
		    pop	    ix				    ; IX = Pointer to item structure

		    ld	    a, c
		    ld	    (TempData),	a		    ; Item index

		    inc	    hl
		    bit	    0, (hl)			    ; Size

		    ld	    bc,	1014h			    ; B	= Item NX/2, C = Detection radius X
		    jr	    z, ChkTakeItem2

		    ld	    bc,	80Ch			    ; B	= Item NX/2, C = Detection radius X

ChkTakeItem2:
		    inc	    hl
		    ld	    a, (hl)			    ; Item Y
		    add	    a, 16			    ; Radius Y
		    sub	    e				    ; Player Y
		    jr	    nc,	ChkTakeItem3

		    neg					    ; Adjust negative value to positive

ChkTakeItem3:
		    cp	    16				    ; Radius Y
		    ret	    nc				    ; Not in the same Y	range

		    inc	    hl
		    ld	    a, (hl)			    ; Item X
		    add	    a, b			    ; B	= Item NX/2 -> A = Centre X
		    sub	    d				    ; Player X
		    jr	    nc,	ChkTakeItem4

		    neg					    ; Adjust negative value to positive

ChkTakeItem4:
		    cp	    c				    ; Radius X
		    ret	    nc				    ; Not in the same X	range

		    inc	    hl
		    ld	    a, (hl)
		    ld	    (TempData2), a		    ; Enemy XY,	MetaTileSetAddr

		    dec	    hl
		    dec	    hl
		    dec	    hl
		    dec	    hl
		    ld	    a, (hl)			    ; Item ID

		    ld	    (TempData+1), a
		    cp	    AMMO_CRATE
		    jp	    z, PickAmmoCrate		    ; Increment	the ammo of the	weapons	in the inventory

		    cp	    SUPRESSOR			    ; Last weapon ID
		    jr	    c, PickUpWeapon		    ; It is a weapon.
		    jr	    z, PickSupressor		    ; Supressor	obtained

		    call    SetItemAsTaken

		    ld	    a, (TempData+1)		    ; Item ID
		    sub	    SUPRESSOR			    ; Last weapon ID
		    cp	    1Ah				    ; Trash bag	with items and weapons
		    jp	    z, RecoverEquipment		    ; Recover items and	weapons. Add transmitter to inventory

		    call    GetItemInvAdd		    ; Is the item in the inventory?
		    jr	    c, AddItemInventory		    ; No, add it

		    call    AddItemAmount		    ; Increment	the amount of the item
		    jp	    EraseTakenItem



;----------------------------------------------------------------------------
;
; Add an item to inventory
;
;----------------------------------------------------------------------------

AddItemInventory:
		    ld	    a, (TempData+1)		    ; Item ID
		    sub	    SUPRESSOR			    ; Remove weapons IDs. Adjust first item ID to 0

		    ld	    hl,	Equipment		    ; Pointer to equipment items array
		    ld	    b, 25			    ; Number of	available slots
		    ld	    c, a

AddItemInventory2:
		    ld	    a, (hl)
		    and	    a				    ; Empty entry?
		    jr	    z, AddItemInventory3

		    ld	    a, 4			    ; Item structure size
		    call    ADD_HL_A			    ; Pointer to next slot

		    djnz    AddItemInventory2		    ; Check next inventory slot
		    ret


AddItemInventory3:
		    ld	    (hl), c			    ; Set item ID

		    ld	    a, c
		    cp	    SELECTED_ANTENNA		    ; Antenna?
		    jr	    nz,	AddItemInventory4

		    ld	    a, 10h
		    ld	    (IncomingCallTimer), a

		    xor	    a
		    ld	    (RadioCallFlag), a		    ; Force pending incoming calls

AddItemInventory4:
		    call    AddItemAmount		    ; Increment	item units
		    jp	    EraseTakenItem



;----------------------------------------------------------------------------
;
; Add supressor	to equipment
;
;----------------------------------------------------------------------------

PickSupressor:
		    call    SetItemAsTaken

		    ld	    a, SUPRESSOR
		    ld	    (InvSupressor), a		    ; set the supressor	in the last slot
		    jp	    EraseTakenItem


;----------------------------------------------------------------------------
;
; Mark weapon as obtained
; Add weapon to	equipment or increment ammo amount
;
;----------------------------------------------------------------------------

PickUpWeapon:
		    call    SetItemAsTaken

		    ld	    a, (TempData+1)		    ; Weapon ID
		    call    GetWeaponInvAdd
		    jr	    c, GetWeapon		    ; Weapon not in inventory

		    push    hl
		    call    AddItemAmount		    ; Increment	amount
		    pop	    hl

		    ld	    a, (SelectedWeapon)
		    ld	    c, a
		    ld	    a, (TempData+1)
		    cp	    c				    ; Is this weapon selected?
		    jp	    nz,	EraseTakenItem

		    inc	    hl
		    inc	    hl
		    call    RenderAmmoHUD		    ; Update ammo counter
		    jp	    EraseTakenItem


;----------------------------------------------------------------------------
;
; Add the weapon to the	equipment
;
; If it	is the first weapon obtained, it is automatically selected (unless it is the grenade launcher)
;
;----------------------------------------------------------------------------

GetWeapon:
		    ld	    a, (TempData+1)
		    ld	    hl,	Weapons
		    ld	    b, 7			    ; Max. number of weapons
		    ld	    c, a			    ; Weapon ID

GetWeapon2:
		    ld	    a, (hl)
		    and	    a				    ; Empty slot?
		    jr	    z, GetWeapon3

		    ld	    a, 4
		    call    ADD_HL_A			    ; Pointer to next weapon structure

		    djnz    GetWeapon2			    ; Check next equipment slot
		    ret


GetWeapon3:
		    ld	    (hl), c			    ; Weapon ID

		    push    hl
		    ld	    a, b
		    cp	    7				    ; First picked weapon?
		    jr	    nz,	GetWeapon5		    ; No

		    ld	    a, c			    ; Weapon ID
		    cp	    GRENADE_LAUNCHER
		    jr	    z, GetWeapon5		    ; Is the grenade launcher the first	weapon obtained?

		    ld	    (WeaponInUse), a
		    ld	    (SelectedWeapon), a		    ; Select this weapon

		    call    LoadSprProjectile		    ; Load this	weapon proyectiles

		    ld	    hl,	SprShootsAtt
		    ld	    b, 18h
		    ld	    a, 0E0h			    ; Hidden sprite Y

GetWeapon4:
		    ld	    (hl), a
		    inc	    hl
		    djnz    GetWeapon4			    ; Remove all bullets sprites in the	room

		    ld	    hl,	PlayerShotsList
		    ld	    de,	PlayerShot1Stat
		    ld	    bc,	17Fh
		    ld	    (hl), 0
		    ldir				    ; Remove all bullets data

GetWeapon5:
		    pop	    hl

		    call    AddItemAmount		    ; Increment	units/ammo amount
		    call    DrawWeaponHUD		    ; Draw selected weapon in the HUD
		    jr	    EraseTakenItem

;----------------------------------------------------------------------------
;
; Pick bag with	equipment
; Recover the items and	weapons
; Adds the transmitter/bug to the inventory
;
;----------------------------------------------------------------------------

RecoverEquipment:
		    xor	    a
		    ld	    (EquipRemoved), a		    ; Erase the	equipment removed flag
		    inc	    a
		    ld	    (EquipBagTaken), a		    ; Equipment	recovered

		    ld	    hl,	Equipment		    ; +0 Item ID, +1 tens/units, +2 hundreds, +3 unused
		    ld	    b, 19h

RecoverEquipment2:
		    ld	    a, (hl)
		    and	    a				    ; Empty entry?
		    jr	    z, AddTransmitter		    ; Add the transmitter/bug to the inventory

		    ld	    a, 4
		    call    ADD_HL_A			    ; Pointer to next item slot
		    jr	    RecoverEquipment2


AddTransmitter:
		    ld	    (hl), SELECTED_TRANSMITTER
		    inc	    hl
		    ld	    a, 1			    ; Units
		    ld	    (hl), a
		    ld	    (TransmiTaken), a		    ; Transmitter taken	flag

		    call    DrawWeaponHUD
		    call    DrawItemHUD
		    jr	    EraseTakenItem


;----------------------------------------------------------------------------
;
; Add ammo to weapons in inventory
; Refresh ammo amount of selected weapon
;
;----------------------------------------------------------------------------

PickAmmoCrate:
		    ld	    a, HAND_GUN
		    call    GetWeaponInvAdd
		    inc	    hl
		    ld	    a, 20h			    ; Number of	bullets
		    call    nc,	AddAmmo

		    ld	    a, SUB_MACHINE_GUN
		    call    GetWeaponInvAdd
		    inc	    hl
		    ld	    a, 20h			    ; Number of	bullets
		    call    nc,	AddAmmo

		    ld	    a, GRENADE_LAUNCHER
		    call    GetWeaponInvAdd
		    inc	    hl
		    ld	    a, 6			    ; Number of	grenades
		    call    nc,	AddAmmo

		    ld	    a, ROCKET_LAUNCHER
		    call    GetWeaponInvAdd
		    inc	    hl
		    ld	    a, 2			    ; Number of	missiles
		    call    nc,	AddAmmo

		    ld	    a, (SelectedWeapon)
		    and	    a
		    jr	    z, EraseTakenItem		    ; No weapon	selected. No need to update the	HUD

		    call    GetWeaponInvAdd
		    inc	    hl
		    inc	    hl
		    call    RenderAmmoHUD		    ; Update units/ammoun amount in HUD

EraseTakenItem:
		    ld	    a, (TempData)		    ; Item index
		    and	    a
		    ld	    hl,	0A0B0h			    ; Item 1 background	buffer coordinates
		    jr	    z, ErasePickedItem2

		    dec	    a
		    ld	    l, 0C0h			    ; Item 2 background	buffer X coordinate
		    jr	    z, ErasePickedItem2

		    ld	    l, 0D0h			    ; Item 3 background	buffer X coordinate

ErasePickedItem2:
		    bit	    0, (ix+ITEM.status)		    ; bit0=size	32x16/16x16

		    ld	    bc,	2010h			    ; 32x16
		    jr	    z, ErasePickedItem3

		    ld	    b, 10h			    ; 16x16

ErasePickedItem3:
		    ld	    e, (ix+ITEM.Y)
		    ld	    d, (ix+ITEM.X)
		    ld	    a, 48h
		    call    VDP_Copy_Dot		    ; Restore item background

		    ld	    c, (ix+ITEM.ID)
		    ld	    (ix+ITEM.ID), 0		    ; Release the item structure

		    ld	    a, 24h			    ; SFX pick up item
		    call    SetSoundEntry

		    ld	    a, (TempData2)		    ; Enemy XY,	MetaTileSetAddr
		    and	    a
		    ret	    nz				    ; Last item	in the room?

		    ld	    a, c			    ; Item ID
		    ld	    hl,	ItemTakeText
		    call    GET_HL_A_DEC		    ; Get text ID of the description of	this item
		    and	    a
		    ret	    z				    ; No description available for this	item

	IF	(!JAPANESE)
		    cp	    62				    ; TEXT: I took back	the weapon and equipment
		    ret	    nz				    ; (!?) The other item descriptions are ignored in the English version.
							    ; In the Japanese version this check is not	done
	ENDIF
		    jp	    SetText



;----------------------------------------------------------------------------
;
; Increment the	amount/units of	the picked item
; Keep the amount in the limits
;
;----------------------------------------------------------------------------

AddItemAmount:
		    inc	    hl
		    ld	    a, (TempData+1)		    ; Item ID
		    dec	    a
		    call    GetItemAmount		    ; Amount

AddAmmo:
		    add	    a, (hl)
		    daa
		    ld	    (hl), a			    ; Increment	units and tens
		    jr	    nc,	LimitAmmo		    ; Keeps the	amount of ammo and rations in the limits

		    inc	    hl
		    inc	    (hl)			    ; Increment	hundreds

LimitAmmo:
		    ld	    a, HAND_GUN			    ; Keeps the	amount of ammo and rations in the limits
		    call    GetWeaponInvAdd
		    ld	    bc,	(MaxAmmoGun)
		    call    nc,	ChkMaxAmount

		    ld	    a, SUB_MACHINE_GUN
		    call    GetWeaponInvAdd
		    ld	    bc,	(MaxAmmoSMG)
		    call    nc,	ChkMaxAmount

		    ld	    a, GRENADE_LAUNCHER
		    call    GetWeaponInvAdd
		    ld	    bc,	(MaxAmmoGrenade)
		    call    nc,	ChkMaxAmount

		    ld	    a, ROCKET_LAUNCHER
		    call    GetWeaponInvAdd
		    ld	    bc,	(MaxAmmonRocket)
		    call    nc,	ChkMaxAmount

		    ld	    a, PLASTIC_BOMB
		    call    GetWeaponInvAdd
		    ld	    bc,	(MaxAmmoBomb)
		    call    nc,	ChkMaxAmount

		    ld	    a, LAND_MINE
		    call    GetWeaponInvAdd
		    ld	    bc,	(MaxAmmoMine)
		    call    nc,	ChkMaxAmount

		    ld	    a, MISSILE
		    call    GetWeaponInvAdd
		    ld	    bc,	(MaxAmmoMissile)
		    call    nc,	ChkMaxAmount

		    ld	    a, SELECTED_RATION		    ; Ratios
		    call    GetItemInvAdd
		    ld	    bc,	(MaxRations)
		    call    nc,	ChkMaxAmount
		    ret



;----------------------------------------------------------------------------
;
; Set the item/weapon as taken
;
;----------------------------------------------------------------------------

SetItemAsTaken:
		    ld	    c, a
		    cp	    PLASTIC_BOMB
		    jr	    c, SetItemAsTaken2		    ; Hand gun,	SMG, Grenade, Rocket

		    cp	    SUPRESSOR
		    ret	    c				    ; Plastic bomb, land mine, missile (consumables)

		    cp	    RATION
		    ret	    z

		    cp	    AMMO_CRATE
		    ret	    z

SetItemAsTaken2:
		    cp	    ARMOR
		    ld	    hl,	WeaponsTaken		    ; Array of picked weapons
		    jr	    c, SetItemAsTaken3

		    sub	    8
		    ld	    hl,	ItemsTaken		    ; Array of picket items

SetItemAsTaken3:
		    dec	    a
		    call    ADD_HL_A
		    ld	    (hl), 1			    ; Set as picked
		    ret


;----------------------------------------------------------------------------
;
; Clear	game variables
;
;----------------------------------------------------------------------------

ClearGameVars:
		    xor	    a
		    ld	    hl,	GameVars
		    ld	    bc,	2B6Fh
		    ld	    d, h
		    ld	    e, l
		    inc	    e
		    ld	    (hl), a			    ; 0
		    ldir

		    ld	    (Pause_1_F5_2), a
		    ret
