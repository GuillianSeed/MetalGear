
;----------------------------------------------------------------------------
;
; Check	if the player is on an electrified floor
;
;----------------------------------------------------------------------------

ChkElectricFloor:
		    ld	    a, (Room)
		    cp	    16				    ; Electrified floor	soldier
		    ld	    bc,	6061h			    ; Electrified floor	tiles
		    jr	    z, ChkElectricFloor2

		    cp	    37				    ; Electrified floor	switch
		    jr	    z, ChkElectricFloor2

		    cp	    110				    ; Electrified floor	switch and doors
		    jr	    z, ChkElectricFloor2

		    cp	    40				    ; Electrified floor	roof
		    ld	    bc,	4546h			    ; Electrified floor	tiles
		    jr	    z, ChkElectricFloor2

		    cp	    116				    ; Electrified floor	basement Metal Gear
		    ld	    bc,	4041h			    ; Electrified floor	tiles
		    ret	    nz				    ; Not a room with electrified floor

ChkElectricFloor2:
		    ld	    a, (PowerSwitchOn)		    ; Power switch status 1=On,	0=Off/destroyed
		    and	    a				    ; Is the power switch on?
		    ret	    z				    ; No, it is	off or destroyed

		    push    bc
		    call    GetTilePlayer		    ; Get the tiles where the player is
		    pop	    bc

		    ld	    a, h			    ; Right tile
		    cp	    b				    ; Is it an electrified floor tile?
		    jr	    z, ChkElectricFloor3	    ; Yes

		    cp	    c				    ; Is it an electrified floor tile?
		    jr	    z, ChkElectricFloor3	    ; Yes

		    ld	    a, l			    ; Left tile
		    cp	    b				    ; Is it an electrified floor tile?
		    jr	    z, ChkElectricFloor3	    ; Yes

		    cp	    c				    ; Is it an electrified floor tile?
		    ret	    nz				    ; No

ChkElectricFloor3:
		    ld	    a, (DamageDelayTimer)
		    and	    a				    ; Was the player electrified recently?
		    ret	    nz				    ; Yes, wait	a bit to avoid continuous damage

		    ld	    a, 18h			    ; SFX electric damage
		    call    SetSoundEntry

		    ld	    a, 8			    ; Damage delay
		    ld	    (DamageDelayTimer),	a

		    jr	    DecrementLife_2		    ; Decrement	two points of life

