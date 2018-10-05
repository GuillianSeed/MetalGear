;----------------------------------------------------------------------------
;
; There	are 3 guards in	room 1
; Depending on from where the player enters the	room, one of those guards is removed
;
; In:
;    D = Direction
;----------------------------------------------------------------------------

HideGuardRoom1:
		    ld	    a, d
		    ld	    c, 0B0h			    ; Guard start Y coordinate
		    cp	    1				    ; Entering from south
		    jr	    z, HideGuardRoom1_2

		    ld	    c, 18h			    ; Guard start Y coordinate

HideGuardRoom1_2:
		    ld	    a, (ix+ACTOR.Y)
		    cp	    c
		    ret	    nz

HideGuardSpr:
		    ld	    (ix+ACTOR.REMOVE_GUARD), 1	    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
		    ld	    (ix+ACTOR.COLLISION_CFG), 0	    ; Disable collsiong	with the player	and his	shots
		    ld	    (ix+ACTOR.NumSprites), 0	    ; (!?)
		    jp	    HideSprColor		    ; (!?) Setting 0 sprites this call does nothing


;----------------------------------------------------------------------------
; Remove guard from room 13
;----------------------------------------------------------------------------

HideGuardRoom13:
		    ld	    a, e
		    cp	    137				    ; Previous room: Sub Machine Gun item
		    ld	    a, (ix+ACTOR.X)
		    ld	    c, 88h			    ; Guard X
		    ret	    nz

		    jr	    HideGuardChkCoord


;----------------------------------------------------------------------------
; Remove guard from room 15
;----------------------------------------------------------------------------

HideGuardRoom15:
		    ld	    a, d
		    ld	    c, 10h			    ; Remove guard with	this X
		    cp	    4				    ; Entering from left
		    ld	    a, (ix+ACTOR.X)
		    ret	    nz

		    jr	    HideGuardChkCoord


;----------------------------------------------------------------------------
; Remove guard from room 17
;----------------------------------------------------------------------------

HideGuardRoom17:
		    ld	    a, d
		    ld	    c, 30h
		    cp	    1				    ; Entering from south?
		    ld	    a, (ix+ACTOR.Y)
		    jr	    nz,	HideGuardChkCoord

		    jr	    HideGuardChkCoordN


;----------------------------------------------------------------------------
; Remove guard from room 18
;----------------------------------------------------------------------------

HideGuardRoom18:
		    ld	    a, d
		    ld	    c, 13h
		    cp	    1
		    ld	    a, (ix+ACTOR.Y)
		    jr	    nz,	HideGuardChkCoord

; Hides	the guard with different coordinate

HideGuardChkCoordN:
		    cp	    c
		    ret	    z

		    jr	    HideGuardSpr

; Hides	the guard with the same	coordinate

HideGuardChkCoord:
		    cp	    c
		    ret	    nz

		    jr	    HideGuardSpr


;----------------------------------------------------------------------------
; Remove guard from room 19
;----------------------------------------------------------------------------

HideGuardRoom19:
		    ld	    a, 141			    ; From room	141: rolling cilinders in Building 1 Floor 2
		    ld	    c, 78h
		    cp	    e
		    ld	    a, (ix+ACTOR.Y)
		    jr	    z, HideGuardChkCoord

		    dec	    d
		    ret	    nz				    ; Not entering from	south
							    ; (!?) If it does not enter	from north (141) or south... there are no more paths

		    ld	    c, 0A8h
		    jr	    HideGuardChkCoord


;----------------------------------------------------------------------------
; Remove guard from room 22
;----------------------------------------------------------------------------

HideGuardRoom22:
		    ld	    a, e
		    ld	    c, 20h			    ; Machine Gun Kid room
		    cp	    20
		    ld	    a, (ix+ACTOR.X)
		    jr	    z, HideGuardChkCoord

		    ld	    c, 0F0h
		    jr	    HideGuardChkCoord


;----------------------------------------------------------------------------
; Remove guard from room 35
;----------------------------------------------------------------------------

HideGuardRoom35:
		    ld	    a, 156			    ; Room: box	item
		    cp	    e
		    ld	    a, (ix+ACTOR.Y)
		    ld	    c, 28h
		    jr	    z, HideGuardChkCoord

		    ld	    a, 21h
		    cp	    e
		    ld	    c, 18h
		    ld	    a, (ix+ACTOR.X)
		    ret	    nz

		    jr	    HideGuardChkCoord


;---------------------------------------------------------------------------
;
; Hide one of  the guards in room 39 depending on the player entering the room
; from the elevator or not
;
;---------------------------------------------------------------------------

HideGuardRoom39:
		    ld	    a, (PreviousRoom)
		    cp	    242				    ; Elevator roof building 2
		    ld	    a, (ix+ACTOR.Y)		    ; Enemy Y

		    ld	    c, 72			    ; North guard Y
		    jr	    z, HideGuardChkCoord

		    ld	    c, 176			    ; South guard Y
		    jr	    HideGuardChkCoord

