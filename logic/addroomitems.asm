;---------------------------------------------------------------------------
;
; Add room items
; Get information about	the items in the current room
;
;---------------------------------------------------------------------------

AddRoomItems:
		    ld	    hl,	ItemsInTheRoom		    ; ID, size,	Y, X
		    ld	    de,	 ItemsInTheRoom+1	    ; ID, size,	Y, X
		    ld	    bc,	2Fh
		    ld	    (hl), b
		    ldir

		    ld	    a, (Room)
		    cp	    218				    ; From this	room on, there are no items
		    ret	    nc

		    cp	    122				    ; Isolated rooms-lorries
		    ret	    c				    ; There are	no items in "open" rooms

		    sub	    122

		    ld	    de,	idxRoomItemsIdx
		    call    ADD_DE_A__

		    ld	    a, (de)
		    and	    a
		    ret	    z				    ; No items in the room

		    dec	    a
		    ld	    de,	idxRoomItems
		    call    GetPointerDE2A_

		    ld	    hl,	ItemsInTheRoom		    ; ID, size,	Y, X

AddRoomItems2:
		    ld	    a, (de)
		    inc	    a
		    ret	    z				    ; FF = End

		    dec	    a
		    ld	    b, a
		    cp	    ROCKET_LAUNCHER
		    jr	    nz,	AddRoomItems3

		    ld	    a, (JeniRocketF)
		    and	    a
		    ret	    z				    ; Don't put the rocket launcher before speaking to Schneider

AddRoomItems3:
		    ld	    a, b
		    cp	    9
		    ld	    bc,	WeaponsTaken
		    jr	    c, AddRoomItems4

		    sub	    8
		    ld	    bc,	ItemsTaken

AddRoomItems4:
		    dec	    a
		    add	    a, c
		    ld	    c, a
		    jr	    nc,	AddRoomItems5
		    inc	    b

AddRoomItems5:
		    ld	    a, (bc)
		    and	    a				    ; Was the item/weapon taken	before?
		    jr	    z, AddItemToRoom

		    inc	    de
		    inc	    de
		    inc	    de
		    jr	    AddRoomItems2


AddItemToRoom:
		    ld	    a, (de)
		    ld	    (hl), a			    ; Item ID

		    inc	    de
		    inc	    hl
		    inc	    hl
		    ld	    a, (de)
		    ld	    (hl), a			    ; Item Y

		    inc	    de
		    inc	    hl
		    ld	    a, (de)
		    ld	    (hl), a			    ; Item X

		    inc	    hl
		    inc	    de
		    ld	    (hl), 0

		    ld	    a, 0Ch
		    call    ADD_HL_A_
		    jr	    AddRoomItems2
