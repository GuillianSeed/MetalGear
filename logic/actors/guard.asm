;----------------------------------------------------------------------------
;
; Change guard's sprite to match his direction
;
;----------------------------------------------------------------------------

ChangeGuardSprDir:
		    ld	    a, (ix+ACTOR.Direction)	    ; Guard direction
		    rlca				    ; x2
		    add	    a, 0			    ; (!?) Probably they used a	constant. 0 = Guard up sprite ID
		    ld	    b, a			    ; B	= Guard	walk frame 1 sprite ID

		    ld	    a, (ix+ACTOR.SpriteId)
		    and	    1				    ; Keep animation frame 1 or	2
		    or	    b				    ; Add sprite ID of current direction
		    ld	    (ix+ACTOR.SpriteId), a
		    ret

;----------------------------------------------------------------------------
;
; Guard	logic
;
; Moves	following a predefined path
; Randomly waits at some points, turns +/- 90 degrees, waits and continues moving
; If the guard is sleepy, he falls asleep sometimes
;
;----------------------------------------------------------------------------

GuardLogic:
		    ld	    a, (ix+ACTOR.REMOVE_GUARD)	    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
		    or	    a
		    jp	    nz,	DismissActor0		    ; Remove actor

		    ld	    a, (ix+ACTOR.GuardStatus)
		    sub	    3				    ; Is he sleeping?
		    call    nz,	ChkActSeePlayer		    ; No, check	if he sees the player

		    ld	    a, (AlertMode)
		    or	    a				    ; Alert on?
		    jp	    nz,	TransformAlertGuard	    ; Transform	the guard in alert guard

		    ld	    a, (ix+ACTOR.GuardStatus)
		    call    JumpIndex

		    dw GuardPatrolLogic
		    dw GuardPatrolTurn
		    dw GuardPatrolWait
		    dw GuardSleeping
		    dw GuardWakeUp


;----------------------------------------------------------------------------
;
; Guard	patrol logic. Moves from point to point	of the predefined path
;
;----------------------------------------------------------------------------

GuardPatrolLogic:
		    call    GuardPatrolLogic2
		    jr	    ChangeGuardSprDir


GuardPatrolLogic2:
		    call    ChkSleepyGuard		    ; Check if the guard fall asleep

		    ld	    bc,	700h
		    call    Anim2FramesActor		    ; Animate the guard	each 8 iterations

;----------------------------------------------------------------------------
;
; Check	if the actor has reached his destination point
;
;----------------------------------------------------------------------------

ChkReachPoint:
		    ld	    d, (ix+ACTOR.X)
		    ld	    e, (ix+ACTOR.Y)		    ; DE = Guard XY

		    ld	    h, (ix+ACTOR.DestinationX)
		    ld	    l, (ix+ACTOR.DestinationY)	    ; HL = Destination XY

		    ld	    a, (ix+ACTOR.Direction)	    ; (!?) 0=Up, 1=Down, 2=Left, 3=Right
		    dec	    a
		    jr	    z, ChkPathDown

		    dec	    a
		    jr	    z, ChkPathLeft

		    dec	    a
		    jr	    z, ChkPathRight

		    ld	    a, l
		    sub	    e

ChkPathGreater:
		    ret	    c
		    jr	    UpdateActorPath_

;----------------------------------------------------------------------------
; Check	if the guard reachs the	destination point when moving down
;----------------------------------------------------------------------------

ChkPathDown:
		    ld	    a, l
		    sub	    e

ChkPathSmaller:
		    ret	    nc

UpdateActorPath_:
		    jp	    UpdateActorPath		    ; Set next path point and continue walking or stop and wait	(set status 1)

;----------------------------------------------------------------------------
; Check	if the guard reachs the	destination point when moving left
;----------------------------------------------------------------------------

ChkPathLeft:
		    ld	    a, h
		    sub	    d
		    jr	    ChkPathGreater

;----------------------------------------------------------------------------
; Check	if the guard reachs the	destination point when moving right
;----------------------------------------------------------------------------

ChkPathRight:
		    ld	    a, h
		    sub	    d
		    jr	    ChkPathSmaller

;----------------------------------------------------------------------------
;
; Wait and then	turns +/- 90 degrees
;
;----------------------------------------------------------------------------

GuardPatrolTurn:
		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Wait and keep looking in the same	direction

		    ld	    a, (ix+ACTOR.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    (ix+ACTOR.PreviousDirection), a

		    xor	    2				    ; Turns 90 degrees
		    ld	    b, a

		    ld	    a, r
		    rra
		    rra
		    and	    1
		    or	    b				    ; Turns or not 180 degrees
		    ld	    (ix+ACTOR.Direction), a	    ; New direction

		    add	    a, 8			    ; Guard idle up sprite ID
		    ld	    (ix+ACTOR.SpriteId), a	    ; Set guard	sprite standing	in the new direction
		    ld	    (ix+ACTOR.Wait), 10h

NextGuardStatus:
		    inc	    (ix+ACTOR.GuardStatus)	    ; Next status
		    ret


;----------------------------------------------------------------------------
;
; Wait and look
; Restore the original direction and continue following	the path
;
;----------------------------------------------------------------------------

GuardPatrolWait:
		    dec	    (ix+ACTOR.Wait)
		    ret	    nz

		    inc	    (ix+ACTOR.Moving)		    ; 0=Does not move
		    ld	    a, (ix+ACTOR.PreviousDirection)
		    ld	    (ix+ACTOR.Direction), a	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    (ix+ACTOR.GuardStatus), 0
		    ret


;----------------------------------------------------------------------------
;
; Check	if the guard falls asleep
;
;----------------------------------------------------------------------------

ChkSleepyGuard:
		    ld	    a, (SleepyGuardFlag)
		    or	    a
		    ret	    z				    ; The guard	is not sleepy

		    dec	    (ix+ACTOR.AwakeTime)
		    ret	    nz				    ; He is still awake

		    pop	    hl				    ; Return address
		    pop	    hl				    ; Return address 2

		    ld	    (ix+ACTOR.Moving), 0	    ; Disable movement

		    ld	    a, (ix+ACTOR.GuardStatus)
		    ld	    (ix+ACTOR.GuardStatusOld), a    ; Save his current status

		    ld	    (ix+ACTOR.GuardStatus), 3	    ; Sleeping status
		    ld	    (ix+ACTOR.SpriteId), 2	    ; Guard down sprite	ID
		    ld	    (ix+ACTOR.SleepingTime), 0	    ; Sleeping time (256)

		    ld	    a, 33			    ; TEXT: I'm sleepy
		    call    SetTextUnskippable

		    ld	    d, (ix+ACTOR.X)
		    ld	    a, (ix+ACTOR.Y)
		    sub	    23h
		    ld	    e, a			    ; DE = Sleeping sign XY
		    ld	    c, 40h			    ; Sleeping sign (Zzz)
		    jp	    AddEnemy			    ; Add sleeping sign	actor


;----------------------------------------------------------------------------
;
; Guard	sleeping logic
; Checks if the	player wakes him up
; Dismiss the sleeping sing actor by reseting his life value
;
;----------------------------------------------------------------------------

GuardSleeping:
		    call    ListenShotsChkTouch		    ; Check if the player wakes	up the guard by	touching him or	making noise using a weapon
		    jp	    c, GuardSetAlarm		    ; Yes, trigger the alarm

		    dec	    (ix+ACTOR.SleepingTime)	    ; Decrement	sleeping time
		    ret	    nz				    ; Continue sleeping

		    ld	    (ix+ACTOR.AwakeTime), 0C0h	    ; Set awake	time

		    push    ix
		    pop	    hl

		    ld	    de,	8Dh			    ; Offset to	next actor (Sleeping sign) life	property
		    add	    hl,	de
		    ld	    (hl), 0			    ; Reset life value to discard the actor and	hide its sprites
		    jr	    NextGuardStatus		    ; Wake up status


;----------------------------------------------------------------------------
;
; Guard	wake up	logic
; Enable movement and restore his previous status
; The guard says "Overslept"
;
;----------------------------------------------------------------------------

GuardWakeUp:
		    inc	    (ix+ACTOR.Moving)		    ; Enable movement

		    ld	    a, (ix+ACTOR.GuardStatusOld)
		    ld	    (ix+ACTOR.GuardStatus), a	    ; Restore previous status

		    ld	    a, 34			    ; TEXT: Overslept
		    jp	    SetTextUnskippable


