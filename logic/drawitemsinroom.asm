;---------------------------------------------------------------------------
;
; Draw items in	the room
;
;---------------------------------------------------------------------------

DrawRoomItems:
		    ld	    ix,	ItemsInTheRoom		    ; ID, size,	Y, X
		    ld	    bc,	300h

DrawRoomItems2:
		    push    bc
		    ld	    a, (ix+ITEM.ID)
		    and	    a				    ; Empty item structure?
		    jr	    z, DrawRoomItems6

		    cp	    9				    ; Is it a weapon or	equipment?
		    ld	    hl,	WeaponGfxXY
		    jr	    c, DrawRoomItems3

		    sub	    8
		    ld	    hl,	ItemGfxXY

DrawRoomItems3:
		    dec	    a
		    add	    a, a
		    call    ADD_HL_A_
		    ld	    a, (hl)
		    and	    1				    ; Width 16 or 32 pixels?
		    ld	    (ix+ITEM.status), a		    ; bit0=size	32x16/16x16

		    push    hl
		    ld	    a, c			    ; Item count
		    and	    a
		    ld	    de,	0A0B0h			    ; Backup VRAM address coordinates
		    jr	    z, DrawRoomItems4

		    dec	    a
		    ld	    e, 0C0h
		    jr	    z, DrawRoomItems4

		    ld	    e, 0D0h

DrawRoomItems4:
		    bit	    0, (ix+ITEM.status)		    ; bit0=size	32x16/16x16
		    ld	    bc,	2010h
		    jr	    z, DrawRoomItems5
		    ld	    b, c

DrawRoomItems5:
		    ld	    l, (ix+ITEM.Y)		    ; SY
		    ld	    h, (ix+ITEM.X)		    ; SX
		    ld	    a, 18h
		    push    bc
		    call    VDP_Copy_Dot_		    ; Save item	background
		    pop	    bc
		    pop	    hl

		    ld	    a, (hl)
		    and	    0FEh
		    inc	    hl
		    ld	    l, (hl)
		    ld	    h, a
		    ld	    e, (ix+ITEM.Y)
		    ld	    d, (ix+ITEM.X)
		    ld	    a, 48h
		    call    VDP_Copy_Dot_		    ; Draw item	on screen

DrawRoomItems6:
		    pop	    bc
		    ld	    de,	10h
		    add	    ix,	de
		    inc	    c
		    djnz    DrawRoomItems2
		    ret