;----------------------------------------------------------------------------
;
; Enable alert
; The number of	respawned soldiers depends on the level	of  the	highest	card obtained
; Play alert music (if Snake is	not dying). Cameras trigger Red	Alert music
;
; In:
;    A = Respawn timer (0 = No respawn)
;----------------------------------------------------------------------------

SetAlertModeRespawn:
		    ld	    (AlertRespawnTimer), a

SetAlertMode:
		    ld	    a, 1
		    ld	    (AlertMode), a
		    ld	    (AlertModeCopy), a

		    ld	    a, (Room)
		    ld	    (RoomAlert), a		    ; Room where the alert was triggered
		    cp	    216				    ; 4th Lorry	in the desert/entrance to building 3
		    ld	    a, 0			    ; Do not respawn in	this lorry
		    jr	    z, SetAlertMode4

		    ld	    hl,	Card8Taken
		    ld	    b, 8			    ; 8	cards

SetAlertMode2:
		    bit	    0, (hl)			    ; Card picked?
		    jr	    nz,	SetAlertMode3
		    dec	    hl
		    djnz    SetAlertMode2

SetAlertMode3:
		    ld	    a, b
		    add	    a, 3			    ; Minimum respawned	guards

SetAlertMode4:
		    ld	    (NumRespawnGuards),	a

		    ld	    a, (DestructionTimerOn)
		    or	    a
		    ret	    nz				    ; Do not play alert	music when the destruction timer is running
							    ; (!?) Is not possible to trigger the alert	after destroying Metal Gear

		    ld	    a, (SoundWorkArea+2)
		    cp	    44h				    ; Game over	music playing? (Music: Just another dead soldier)
		    ret	    z				    ; No dot play alert	music

; Cameras trigger Red Alert music

		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    cp	    ID_CAMERA
		    jr	    z, SetAlertMode5		    ; Set Red Alert music

		    cp	    ID_LASER
		    jr	    z, SetAlertMode5		    ; Set Red Alert music

		    ld	    c, 32h			    ; MUSIC: Alert
		    jr	    SetAlertMode6


SetAlertMode5:
		    ld	    c, 2Fh			    ; MUSIC: Red alert

SetAlertMode6:
		    ld	    a, (ControlConfig)		    ; Bit6: 1=Enable music/Player control
		    bit	    6, a			    ; Demo mode?
		    jr	    nz,	SetAlertMode7		    ; No

		    ld	    a, (MusicInDemoMode)	    ; Flag to enable or	disable	music in demo mode
		    and	    a				    ; Is the music enabled in demo mode?
		    ret	    nz				    ; Music disabled

SetAlertMode7:
		    ld	    a, c
		    ld	    (AreaMusic), a
		    jp	    SetSoundEntry		    ; Play alert music

