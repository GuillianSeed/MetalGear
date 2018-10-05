;----------------------------------------------------------------------------
;
; Init elevator	guard
; Two types:
; - In from of the elevator. Removed if	the player comes from the elevator
; - Relieve. Entering from the right
;
;----------------------------------------------------------------------------

InitGuardElevat:
		    ld	    a, (ix+ELEVATOR_GUARD.X)
		    cp	    0F2h			    ; Is the guard coming from the right side?
		    jr	    z, InitGuardRelieve

; The guard is in front	of the elevator

		    ld	    a, (PreviousRoom)
		    cp	    0F0h			    ; Elevator
		    jp	    z, DismissActor0		    ; The guards are removed if	the player comes from the elevator

		    ld	    (ix+ELEVATOR_GUARD.Wait), 0
		    ld	    (ix+ELEVATOR_GUARD.Status),	1   ; Idle status. Wait	for relieve
		    ld	    (ix+ELEVATOR_GUARD.Moving),	0   ; Do not move

		    ld	    a, (ix+ELEVATOR_GUARD.X)
		    ld	    (ix+ELEVATOR_GUARD.DestinationX), a	; Destination and current positions are	the same
		    ld	    (ix+ELEVATOR_GUARD.LookDirTimer), 1Eh

		    ld	    a, DIR_DOWN			    ; Down
		    ld	    (ix+ELEVATOR_GUARD.Direction), a ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    (ix+ELEVATOR_GUARD.SpriteId), 9 ; Guard down sprite	ID
		    ret

;----------------------------------------------------------------------------
;
; Relieve guard. Enters	the room from the right
;
;----------------------------------------------------------------------------

InitGuardRelieve:
		    ld	    (ix+ELEVATOR_GUARD.Status),	0   ; Walk to the elevator status
		    ld	    (ix+ELEVATOR_GUARD.Moving),	1   ; Enable movement

		    ld	    a, DIR_LEFT
		    ld	    (ix+ELEVATOR_GUARD.Direction), a ; Walks to	the left

		    call    AnimateGuard2		    ; Update the sprite
		    call    ResetActorSpeed
		    call    SetWalkSpeed		    ; Set walk speed

		    ld	    a, (ix+ELEVATOR_GUARD.DestinationX)	; Destination X
		    cp	    90h				    ; Destination of second relieve guard?
		    ret	    z

		    ld	    (ix+ELEVATOR_GUARD.Wait), 40h   ; Time to spawn the	second guard
		    ld	    (ix+ELEVATOR_GUARD.DestinationX), 50h ; Destination	of the first guard
		    ret




;----------------------------------------------------------------------------
;
; Elevator guard logic
;
;----------------------------------------------------------------------------

GuardElevator:
		    ld	    a, (ix+ELEVATOR_GUARD.Status)
		    cp	    3				    ; Alert status?
		    jr	    nc,	GuardElevator2		    ; Do not transform in alert	guard if the alert is triggered

		    ld	    a, (AlertMode)
		    or	    a				    ; In alert mode?
		    jp	    nz,	TransformAlertGuard	    ; Transform	the guard in alert guard

		    ld	    a, (ix+ELEVATOR_GUARD.Status)

GuardElevator2:
		    call    JumpIndex

		    dw GuardElevatorWalk
		    dw GuardElevIdle
		    dw GuardElevLeave
		    dw GuardElevAlert
		    dw GuardElevFlees

;----------------------------------------------------------------------------
;
; Walks	towards	the elevator
; The first guard spawn	a second one following him
;
;----------------------------------------------------------------------------

GuardElevatorWalk:
		    ld	    a, (PlayerY)
		    cp	    3Dh				    ; Can the guard see	the player?
		    jr	    c, GuardElevSetAlert	    ; Trigger the alert

		    call    AnimateGuard

		    ld	    a, (ix+ELEVATOR_GUARD.X)
		    cp	    (ix+ELEVATOR_GUARD.DestinationX) ; Has reached his destination?
		    jr	    z, GuardReachElevator

		    ld	    a, (ix+ELEVATOR_GUARD.DestinationX)
		    cp	    90h				    ; Is the second guard?
		    ret	    z				    ; Yes

		    dec	    (ix+ELEVATOR_GUARD.Wait)
		    ret	    nz				    ; Don not spawn the	second guard yet

		    ld	    c, ID_GUARD_ELEVATOR
		    ld	    de,	0F230h			    ; XY
		    call    AddEnemy			    ; Spawn the	second guard

		    ld	    bc,	ELEVATOR_GUARD.DestinationX
		    add	    hl,	bc
		    ld	    (hl), 90h			    ; Destination X of the second guard
		    ret


;----------------------------------------------------------------------------
;
; Stop,	look down and set idle mode
;
;----------------------------------------------------------------------------

GuardReachElevator:
		    ld	    (ix+ELEVATOR_GUARD.Wait), 0
		    ld	    (ix+ELEVATOR_GUARD.Status),	1   ; Idle status
		    ld	    (ix+ELEVATOR_GUARD.Moving),	0   ; Disable movement
		    ld	    (ix+ELEVATOR_GUARD.LookDirTimer), 1Eh

		    ld	    a, DIR_DOWN
		    ld	    (ix+ELEVATOR_GUARD.Direction), a ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    (ix+ELEVATOR_GUARD.SpriteId), 9 ; Guard down sprite	ID
		    ret


;----------------------------------------------------------------------------
;
; Look around and wait for relieve time
;
;----------------------------------------------------------------------------

GuardElevIdle:
		    ld	    a, (PlayerY)
		    cp	    3Dh				    ; Can the guard see	the player?
		    jr	    c, GuardElevSetAlert	    ; Trigger the alert

		    dec	    (ix+ELEVATOR_GUARD.Wait)	    ; Decrement	relieve	time
		    jp	    nz,	GuardRandomDir		    ; Look left, right or down

		    ld	    (ix+ELEVATOR_GUARD.Status),	2   ; Leaving status
		    ld	    (ix+ELEVATOR_GUARD.Moving),	1   ; Enable movement

		    ld	    a, 4			    ; Right
		    ld	    (ix+ELEVATOR_GUARD.Direction), a ; 1=Up, 2=Down, 3=Left, 4=Right

		    call    AnimateGuard2
		    call    SetWalkSpeed

		    ld	    a, (ix+ELEVATOR_GUARD.DestinationX)
		    cp	    50h				    ; Is the first/left	guard?
		    ld	    a, 1			    ; TEXT: Relieve
		    jp	    z, SetTextUnskippable
		    ret


;----------------------------------------------------------------------------
;
; The guard look at the	player
;
;
;----------------------------------------------------------------------------

GuardElevSetAlert:
		    push    ix

		    ld	    a, (PlayerX)
		    cp	    (ix+ELEVATOR_GUARD.X)
		    ld	    a, 0Ah			    ; Guard left sprite	ID
		    jr	    c, GuardElevSetAlert2

		    inc	    a				    ; Guard right sprite ID

GuardElevSetAlert2:
		    ld	    (ix+ELEVATOR_GUARD.Status),	3   ; Alert status
		    ld	    (ix+ELEVATOR_GUARD.Moving),	0   ; Do not move
		    ld	    (ix+ELEVATOR_GUARD.SpriteId), a ; Look at the player
		    ld	    (ix+ELEVATOR_GUARD.AlertDelay), 0Fh

		    ld	    bc,	80h
		    add	    ix,	bc			    ; Pointer to the second guard
		    ld	    (ix+ELEVATOR_GUARD.Status),	3   ; Alert status
		    ld	    (ix+ELEVATOR_GUARD.Moving),	0   ; Do not move
		    ld	    (ix+ELEVATOR_GUARD.SpriteId), a ; Look at the player
		    ld	    (ix+ELEVATOR_GUARD.AlertDelay), 0Fh

		    ld	    a, (AlertMode)
		    or	    a
		    ret	    nz				    ; Already in alert mode

		    ld	    a, 3Ch			    ; Respawn time
		    call    SetAlertModeRespawn		    ; Trigger the alert

		    pop	    ix				    ; Pointer to guard 1

		    ld	    h, 10h			    ; SX of double exclamation alert icon

DrawAlertSign:
		    ld	    l, 80h			    ; SY of alert icon

		    ld	    a, (ix+ACTOR.Y)
		    sub	    18h
		    and	    0F8h
		    ld	    e, a			    ; DY alert icon

		    ld	    a, (ix+ACTOR.X)
		    add	    a, 8
		    and	    0F8h
		    ld	    d, a			    ; DX alert icon

		    push    hl

		    ld	    hl,	XY_AlertIcon
		    ld	    (hl), e
		    inc	    hl
		    ld	    (hl), d			    ; Save alert icon XY

		    ex	    de,	hl
		    call    SaveAlertIconBacknd		    ; Save alert icon background

		    pop	    hl

		    call    Draw16x16			    ; Draw alert icon

		    pop	    hl				    ; (!?) Remove the return address! The game will jump to #F02 in the	BIOS when running the logic of an elevator guard!
							    ; (Works fine with Power Switch guard)

		    jp	    SetAlertRoom


;-----------------------------------------------------------------------------
;
; Saves	the background of the alert icon
;
; In:
;   HL = SX, SY
;-----------------------------------------------------------------------------

SaveAlertIconBacknd:
		    push    hl
		    ld	    de,	6080h			    ; VRAM coordinates to store	the background
		    ld	    bc,	1010h			    ; NX, NY (16x16)
		    ld	    a, 4			    ; From page	0 to 1
		    call    VDP_Copy_Byte
		    pop	    de
		    ret


;-------------------------------------------------------------------------------
;
; Copy a 16x16 graphic from page 1 to 0
;
; H = SX
; L = SY
; D = DX
; E = DY
;
;-------------------------------------------------------------------------------

Draw16x16:
		    ld	    bc,	1010h			    ; (16x16)
		    ld	    a, 48h			    ; From page	1 to 0
		    jp	    VDP_Copy_Dot

;----------------------------------------------------------------------------
;
; Randomly look	in different directions
;
;----------------------------------------------------------------------------

GuardRandomDir:
		    dec	    (ix+ELEVATOR_GUARD.LookDirTimer)
		    ret	    nz				    ; Keep looking in the same direction

		    ld	    a, r
		    and	    0Fh
		    add	    a, 20h
		    ld	    (ix+ELEVATOR_GUARD.LookDirTimer), a	; Looking time

		    ld	    a, r
		    xor	    (ix+ACTOR.ANIM_CNT)
		    and	    1
		    ld	    b, a

		    ld	    a, (ix+ELEVATOR_GUARD.Direction) ; 1=Up, 2=Down, 3=Left, 4=Right
		    and	    1
		    add	    a, b
		    add	    a, (ix+ELEVATOR_GUARD.Direction) ; 1=Up, 2=Down, 3=Left, 4=Right
		    and	    3
		    or	    a
		    ret	    z				    ; Do not look up

		    inc	    a
		    ld	    (ix+ELEVATOR_GUARD.Direction), a ; 1=Up, 2=Down, 3=Left, 4=Right
		    jp	    GuardLookDirection2


;----------------------------------------------------------------------------
;
; Check	if the guard can see the player
;
;----------------------------------------------------------------------------

GuardElevLeave:
		    call    AnimateGuard

		    ld	    a, (PlayerY)
		    cp	    3Dh
		    ret	    nc				    ; The player is not	in the same corridor

		    ld	    a, (PlayerX)
		    add	    a, 10h
		    cp	    (ix+ELEVATOR_GUARD.X)
		    jp	    nc,	GuardElevSetAlert	    ; The guard	can see	the player

		    ret


;----------------------------------------------------------------------------
;
; The first guard is transformed in "alert guard".
; The second guard leaves the room walking to the right
;
;----------------------------------------------------------------------------

GuardElevAlert:
		    dec	    (ix+ELEVATOR_GUARD.AlertDelay)
		    ret	    nz				    ; Waits while alert	sign is	visible

		    ld	    ix,	EnemyListEntry1
		    call    TransformAlertGuard		    ; Transform	the first guard	in alert guard

		    ld	    ix,	EnemyListEntry2
		    ld	    (ix+ELEVATOR_GUARD.Status),	4   ; Flee status
		    ld	    (ix+ELEVATOR_GUARD.Moving),	1   ; Enable movement

		    ld	    a, DIR_RIGHT
		    ld	    (ix+ELEVATOR_GUARD.Direction), a ; The second guard	leaves the room
		    ld	    (ix+ELEVATOR_GUARD.SpeedX),	a   ; Speed 4

; The second guard walks to the	right

GuardElevFlees:
		    jp	    AnimateGuard


