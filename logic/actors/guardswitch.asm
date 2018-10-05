;----------------------------------------------------------------------------
;
; Init guard: switch
;
;----------------------------------------------------------------------------

InitGuardSwitch:
		    ld	    a, (PreviousRoom)
		    cp	    139				    ; Room goggles
		    jp	    z, DismissActor0		    ; Remove guard when	the player comes from the goggles room

		    inc	    (ix+ACTOR.Moving)		    ; Enable movement

		    ld	    (ix+ACTOR.Direction), DIR_RIGHT ; 1=Up, 2=Down, 3=Left, 4=Right

		    call    AnimateGuard		    ; Update guard walk	animation
		    call    ResetActorSpeed
		    jp	    SetWalkSpeed

;----------------------------------------------------------------------------
;
; The guard patrols left and right
; Stops	at some	points and looks north
; If he	sees the player, or the	box moving, triggers the alarm and runs	to the switch to power the electrified floor
; Then waits near the switch and shots as soon he sees the player
;
;----------------------------------------------------------------------------

GuardSwitchLogic:
		    ld	    a, (ix+ACTOR.Status)
		    call    JumpIndex

		    dw GuardSwPatrol
		    dw GuardSwLookNorth
		    dw GuardSwGoToSw
		    dw GuardSwWait
		    dw GuardSwRight
		    dw GuardSwShot
		    dw GuardSwWaitSwitch


GuardSwPatrol:
		    ld	    a, (AlertMode)
		    or	    a				    ; Alert on?
		    jp	    nz,	SetStatGoToSwitch	    ; Change to	"Go to the switch" status

		    call    AnimateGuard

		    call    GuardSwChkSeeY

		    ld	    a, (ix+ACTOR.X)
		    ld	    b, DIR_RIGHT
		    cp	    50h				    ; Left limit
		    jr	    z, GuardSwTurn		    ; Start moving to the right

		    cp	    98h
		    jr	    z, GuardSwPatrol2

		    cp	    0D0h
		    ret	    nz

GuardSwPatrol2:
		    ld	    (ix+ACTOR.Status), 1	    ; Look north status
		    ld	    (ix+ACTOR.Moving), 0	    ; Stop moving
		    ld	    (ix+ACTOR.Wait), 1Eh	    ; Wait time
		    ld	    (ix+ACTOR.SpriteId), 8	    ; Guard up sprite ID
		    ret

;----------------------------------------------------------------------------
;
; The guard changes the	direction
;
;----------------------------------------------------------------------------

GuardSwTurn:
		    ld	    (ix+ACTOR.Direction), b	    ; Set new direction
		    call    AnimateGuard		    ; Update walk animation
		    jp	    SetWalkSpeed

;----------------------------------------------------------------------------
;
; The guard looks north	for a while and	continue walking
; If he	reaches	the right limit, turns back to the left
;
;----------------------------------------------------------------------------

GuardSwLookNorth:
		    ld	    a, (AlertMode)
		    or	    a				    ; Alert mode?
		    jp	    nz,	SetStatGoToSwitch

		    dec	    (ix+ACTOR.Wait)
		    jr	    nz,	GuardSwChkPlayer

		    ld	    (ix+ACTOR.Status), 0	    ; Continue walking
		    ld	    (ix+ACTOR.Moving), 1	    ; 0=Does not move

		    ld	    a, (ix+ACTOR.X)
		    cp	    0D0h			    ; Right path limit?
		    jr	    z, GuardSwTurnLeft

		    jp	    AnimateGuard		    ; Update walk animation

;----------------------------------------------------------------------------
;
; The guard turns left
;
;----------------------------------------------------------------------------

GuardSwTurnLeft:
		    ld	    b, DIR_LEFT
		    jr	    GuardSwTurn


GuardSwChkPlayer:
		    ld	    a, (ix+ACTOR.X)
		    cp	    0D0h
		    jr	    nz,	GuardSwChkSee

		    ld	    a, (PlayerX)
		    cp	    0C0h
		    jr	    nc,	GuardSwChkBox		    ; The player and guard are in the right part of the	screen
							    ; The guard	can see	the player unless he is	in the cardboard box

		    jr	    GuardSwChkSeeY


GuardSwChkSee:
		    ld	    a, (PlayerX)

		    sub	    (ix+ACTOR.X)
		    add	    a, 8
		    cp	    11h
		    jr	    c, GuardSwChkBox

GuardSwChkSeeY:
		    ld	    a, (PlayerY)
		    rla
		    ret	    nc				    ; The player is not	inline with the	guard

GuardSwChkBox:
		    ld	    a, (PlayerAnimation)	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    cp	    7				    ; Is the player using the cardboard	box?
		    jr	    nz,	GuardSwAlarm		    ; No, the guard will trigger the alarm

		    ld	    hl,	PlayerSpeedY
		    ld	    a, (hl)
		    inc	    hl
		    or	    (hl)			    ; Is the player moving?
		    jr	    nz,	GuardSwAlarm		    ; Yes, the guard will trigger the alarm

		    ld	    hl,	PlayerSpeedX
		    ld	    a, (hl)
		    or	    (hl)			    ; (!?)
		    inc	    hl
		    or	    (hl)			    ; Is the player moving?
		    or	    a				    ; (!?)
		    ret	    z				    ; No

GuardSwAlarm:
		    xor	    a
		    call    SetAlertModeRespawn

		    ld	    h, 0			    ; Normal alert icon	X
		    call    DrawAlertSign

		    ld	    (ix+ACTOR.Status), 6	    ; Status to	wait a bit before going	to the power switch
		    ld	    (ix+ACTOR.Moving), 0	    ; Stop moving
		    ld	    (ix+ACTOR.Wait), 0Fh
		    call    GetDirToPlayer

		    jp	    GuardLookDirection2		    ; Update sprite to look at the player


;----------------------------------------------------------------------------
;
; Move towards the switch and enable electrified floor
;
;----------------------------------------------------------------------------

GuardSwGoToSw:
		    call    AnimateGuard		    ; Update walk animation

		    ld	    a, (ix+ACTOR.X)
		    cp	    25h
		    ret	    nc				    ; Has not reached the switch yet

		    inc	    (ix+ACTOR.Status)		    ; Wait status
		    ld	    (ix+ACTOR.Moving), 0	    ; Do not move
		    ld	    (ix+ACTOR.Wait), 0Ah
		    ld	    (ix+ACTOR.SpriteId), 8	    ; Guard up sprite ID

		    ld	    a, 15h			    ; SFX click
		    call    SetSoundEntryChk

		    ld	    c, ID_POWER_SWITCH
		    ld	    de,	2470h
		    jp	    AddEnemy			    ; Add power	switch / Enable	electrified floor


;----------------------------------------------------------------------------
;
; Waits	in front of the	switch and face	right
;
;----------------------------------------------------------------------------

GuardSwWait:
		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Wait

		    inc	    (ix+ACTOR.Status)
		    ld	    (ix+ACTOR.Moving), 1	    ; Enable movement
		    ld	    (ix+ACTOR.Wait), 10h
		    ld	    (ix+ACTOR.Direction), DIR_RIGHT ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    AnimateGuard2
		    jp	    SetWalkSpeed


;----------------------------------------------------------------------------
;
; Moves	a bit to the right to walk away	from the power switch
;
;----------------------------------------------------------------------------

GuardSwRight:
		    call    AnimateGuard		    ; Update wlak animation
		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Continue walking

		    inc	    (ix+ACTOR.Status)		    ; Next status: shot	to the player
		    ld	    (ix+ACTOR.Moving), 0	    ; Stop moving
		    ld	    (ix+ACTOR.SpriteId), 0Bh	    ; Guard right sprite ID
		    ld	    (ix+ACTOR.Wait), 1
		    ret


;----------------------------------------------------------------------------
;
; The guard shots if the player	is in front of him
;
;----------------------------------------------------------------------------


GuardSwShot:
		    ld	    a, (PlayerY)
		    rla
		    ret	    nc				    ; The player is in the upper part of the room

		    call    GetDirToPlayer
		    add	    a, 7			    ; 8	= Guard	up sprite ID (Dir. up =	1)
		    ld	    (ix+ACTOR.SpriteId), a	    ; Look at the player
		    dec	    (ix+ACTOR.Wait)		    ; decrement	shot delay
		    ret	    nz

		    ld	    (ix+ACTOR.Wait), 10h	    ; Shot delay (cadence)
		    ld	    c, ID_BULLET
		    jp	    AddEnemyShot2		    ; Shoot to the player


;----------------------------------------------------------------------------
;
; Wait a bit before moving to the switch
;
;----------------------------------------------------------------------------

GuardSwWaitSwitch:
		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Wait

SetStatGoToSwitch:
		    ld	    (ix+ACTOR.Status), 2	    ; Status to	go to the switch
		    ld	    (ix+ACTOR.Moving), 1	    ; Enable movement
		    ld	    (ix+ACTOR.SpeedX), -3	    ; Speed to the left
		    ld	    a, DIR_LEFT
		    ld	    (ix+ACTOR.Direction), a	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    jp	    AnimateGuard2		    ; Update walk animation
