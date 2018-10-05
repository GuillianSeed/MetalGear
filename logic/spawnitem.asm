;---------------------------------------------------------------------------
;
; Spawn	item
;
; A = Item ID
;     0	- Ration
;     1	- Ammo crate
;     2	- Card 7
;     3	- Card 8
;     4	- Supressor
; DE = XY
;
;---------------------------------------------------------------------------

SpawnItem:
		    ld	    hl,	ListDropItems
		    call    ADD_HL_A_

		    ld	    a, (hl)			    ; Get the item ID to spawn

		    ld	    hl,	SpawnItemData		    ; Item ID, Y, X  (#FF = End	list)
		    ld	    (hl), a			    ; Item
		    inc	    hl
		    ld	    (hl), e			    ; Y
		    inc	    hl
		    ld	    (hl), d			    ; X
		    inc	    hl
		    ld	    (hl), 0FFh

		    ld	    c, 1
		    cp	    RATION
		    jr	    z, SpawnItem2

		    cp	    AMMO_CRATE
		    jr	    z, SpawnItem2
		    dec	    c

SpawnItem2:
		    ld	    a, (SpawnedItems)
		    and	    a
		    ret	    nz				    ; There is a previously spawned item

		    inc	    a
		    ld	    (SpawnedItems), a

		    ld	    hl,	ItemsInTheRoom		    ; ID, size,	Y, X
		    ld	    a, (hl)
		    and	    a
		    ret	    nz				    ; There is another item in the room

		    push    bc
		    ld	    de,	SpawnItemData		    ; Item ID, Y, X  (#FF = End	list)
		    call    AddRoomItems2
		    ld	    bc,	0Ch
		    and	    a
		    sbc	    hl,	bc			    ; HL points	to "amount of the items"
		    pop	    bc

		    ld	    (hl), c			    ; Amount of	the item
		    ld	    ix,	ItemsInTheRoom		    ; ID, size,	Y, X
		    ld	    bc,	100h
		    call    DrawRoomItems2		    ; Draw the spawned item

		    ld	    a, 25h
		    jp	    SetSoundEntry__		    ; Spawn SFX


;----------------------------------------------------------------------------
; Items	that can be droped by enemies
;----------------------------------------------------------------------------
ListDropItems:	    db RATION
		    db AMMO_CRATE
		    db CARD7
		    db CARD8
		    db SUPRESSOR
