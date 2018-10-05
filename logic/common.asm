
;----------------------------------------------------------------------------
;
; Common game logic
;
;----------------------------------------------------------------------------

CommonLogic:
		    ld	    a, (GameMode)		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late
		    cp	    GAME_MODE_DEAD		    ; Is the player dead?
		    ret	    z				    ; Don't check these things

		    call    ChkPlayerShots		    ; Check if an enemy	is hit by a player's shot (also Metal Gear bombs order)
		    call    ChkTouchEnemies		    ; Check if the player is in	contact	with another actor/enemy
		    call    ChkOnBridge			    ; Check if the player is on	a bridge or falls from it
		    call    ChkElectricFloor		    ; Check if the player is on	an electrified floor
		    call    ChkGasRooms			    ; Check if the player is in	a gas room

		    ld	    a, (GameMode)		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late
		    cp	    GAME_MODE_DEAD		    ; Is the player dead?
		    ret	    z				    ; Yes

		    call    ChkDoors			    ; Check if the player opens	or enters a door
		    call    ChkTakeItems		    ; Check if the player takes	an item

; Check	captured by enemy
		    ld	    a, (EquipBagTaken)
		    and	    a
		    ret	    nz				    ; Snake recovered his equipment. Capture scene already shown

		    ld	    a, (Room)
		    cp	    8
		    ret	    nz				    ; Snake is not in the room of the capture scene

		    ld	    a, (PlayerX)
		    cp	    0D0h
		    ret	    nc				    ; Snake is not in the right	X range

		    cp	    0C0h
		    ret	    c				    ; Snake is not in the right	X range

		    ld	    a, GAME_MODE_CAPTURED
		    ld	    (GameMode),	a		    ; Enable capture scene mode

		    xor	    a
		    ld	    (CaptureStatus), a		    ; Reset the	capture	scene status
		    ret




	include	"touchenemy.asm"

	include	"punchenemy.asm"

	include	"laserbeams.asm"

;----------------------------------------------------------------------------
;
; The player is	on a bridge
;
;----------------------------------------------------------------------------

SetOnBridge:
		    ld	    a, 1
		    ld	    (isOnBridge), a		    ; The player is on a bridge

		    set	    7, (ix+ACTOR.TOUCH_INFO)	    ; This actor/bridge	is touching the	player

		    ret



	include "pitfall.asm"

	include	"damagelaser.asm"

	include	"bridge.asm"

	include	"damageelectric.asm"

	include	"damagegas.asm"

	include	"damagetoenemy.asm"