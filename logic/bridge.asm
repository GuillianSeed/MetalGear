
;----------------------------------------------------------------------------
;
; Bridge logic
;
; The map is filled with tiles 1, except the fixed parts of the	bridge
; If the player	is not on a moving bridge part and is on tiles 1, falls
; The landing room depends on the room he falls	from
;
; In:
;   DE = Player	XY
;
;----------------------------------------------------------------------------

ChkOnBridge:
		    ld	    a, (Room)
		    cp	    45				    ; Room moving bridge 1
		    jr	    z, ChkOnBridge2

		    cp	    46				    ; Room moving bridge 2
		    ret	    nz				    ; There is no bridge in this room

ChkOnBridge2:
		    ld	    a, (isOnBridge)
		    and	    a
		    ret	    nz				    ; The player is not	on a moving bridge actor

		    call    GetTilePlayer
		    dec	    h
		    ret	    nz				    ; The player is on the fixed bridge	part (beggining	and end	of the bridge)

		    dec	    l
		    ret	    nz				    ; On the fixed part

		    ld	    a, (Room)
		    cp	    45
		    ld	    a, 5Bh			    ; Door ID in wall of bricks	room
		    ld	    c, 1			    ; Jump room	ID 1
		    jr	    z, ChkOnBridge3

		    ld	    a, 81h			    ; Door ID in wall of bricks	room
		    inc	    c				    ; Jump room	ID 2

ChkOnBridge3:
		    ld	    (IdDoorEnter), a		    ; ID of the	"door" use to locate the player in the next room
		    ld	    a, c
		    ld	    (JumpRoomId), a		    ; 1	= From room 45,	2 = From room 46, others = 117

		    xor	    a
		    ld	    (OpenDoorStatus), a

		    inc	    a
		    ld	    (GameMode),	a		    ; Next room	status
		    ret