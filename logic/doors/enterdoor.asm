;----------------------------------------------------------------------------
;
; Check	if the player opens or enters a	door
;
;----------------------------------------------------------------------------

ChkDoors:
		    ld	    hl,	DoorsList		    ; Pointer to array of doors	structures
		    ld	    c, 0			    ; Door door	index

		    ld	    a, (DoorsInRoom)		    ; Number of	doors in the room
		    and	    a
		    ret	    z				    ; There are	no doors

		    ld	    b, a			    ; Number of	doors in the room

ChkDoors1:
		    push    bc
		    push    hl

		    ld	    a, (hl)			    ; +0 Door ID
		    ld	    (TempData),	a

		    inc	    hl				    ; +1

		    ld	    a, (hl)			    ; Open / closed status
		    inc	    hl				    ; +2
		    and	    a				    ; Closed?
		    jr	    z, ChkEnterDoor		    ; The door is open

; The last door	before Metal Gear is locked after self destruction is activated

		    ld	    a, (MetalGear_KO)		    ; Metal Gear destroyed. Self destruction activated
		    and	    a
		    jr	    z, ChkDoors2

		    ld	    a, (TempData)		    ; Door ID
		    cp	    62h				    ; Door card	1 before Metal Gear. Snake can't go back
		    jr	    z, ChkNextDoor

ChkDoors2:
		    call    ChkOpenDoor
		    jr	    nc,	ChkNextDoor

		    pop	    hl
		    pop	    bc

		    ld	    a, c
		    ld	    (idxDoorOpen), a

		    ld	    a, GAME_MODE_OPEN_DOOR
		    ld	    (GameMode),	a		    ; Select open door mode

		    xor	    a
		    ld	    (OpenDoorStatus), a
		    jp	    UpdateSnakeSpr

;----------------------------------------------------------------------------
;
; The door is open. Check if the player	enters it
;
;----------------------------------------------------------------------------

ChkEnterDoor:
		    ld	    a, (TempData)		    ; Door ID
		    cp	    40h				    ; Hidden door at room 6 (?!) Connected to room 204
		    jr	    z, ChkNextDoor

		    cp	    6Ch				    ; Hidden door at room 5 (?!) Connected to room 204
		    jr	    z, ChkNextDoor

		    ld	    a, (hl)			    ; Door open	logic ID
		    and	    1Fh
		    cp	    0Fh				    ; Door IDs:	#C (rooms 64 and 164), #67 (room 164 and 165) Entrance to prison, Grey Fox cell, Snake cell
		    jr	    z, ChkEnterDoor2

		    cp	    10h				    ; Door IDs:	#68(108), #6A! (166,167),#73! (115,200)	#8C-#90(58,63, 60, xx, 100)
		    jr	    nz,	ChkEnterDoor3

ChkEnterDoor2:
		    ld	    a, (hl)			    ; Type of logic that opens the door
		    and	    20h				    ; Broken wall inside a room	(does not connect to other room)
		    jr	    z, ChkNextDoor		    ; No need to "teleport" the player

ChkEnterDoor3:
		    ld	    de,	9
		    add	    hl,	de			    ; HL = Pointer to door enter offset	Y
		    call    ChkTouchDoor2		    ; Check if the player enter	in the door
		    jr	    nc,	ChkNextDoor		    ; No

		    pop	    hl
		    pop	    bc

		    ld	    de,	DoorsList		    ; Array of doors in	the room
		    ld	    a, c
		    call    HL_4xA
		    add	    hl,	hl
		    add	    hl,	hl			    ; x16
		    add	    hl,	de			    ; HL = Pointer to door data
		    ld	    a, (hl)			    ; ID
		    ld	    (IdDoorEnter), a		    ; Save the door ID to know in which	door of	the new	room the player	will be	placed

		    xor	    a
		    ld	    (OpenDoorStatus), a		    ; Init. door status

		    inc	    a
		    ld	    (GameMode),	a		    ; Next room	mode
		    ret


ChkNextDoor:
		    pop	    hl
		    pop	    bc

		    ld	    de,	10h			    ; Door structure size
		    add	    hl,	de			    ; Pointer to next door data

		    inc	    c				    ; Next door	index

		    djnz    ChkDoors1

		    xor	    a
		    ld	    (IdDoorEnter), a
		    ret