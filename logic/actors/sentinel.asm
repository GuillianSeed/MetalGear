;---------------------------------------------------------------------------
;
; Init sentinel
;
;---------------------------------------------------------------------------

InitSentinel:
		    ld	    a, (Room)
		    ld	    c, a

		    ld	    b, 1			    ; Sleepy guard
		    cp	    140				    ; Room mine	item
		    jr	    z, InitSentinel2		    ; Set this guard sleepy

		    dec	    b				    ; Not sleepy

InitSentinel2:
		    ld	    a, b
		    ld	    (SleepyGuardFlag), a	    ; Configure	sleepy property

		    ld	    a, c			    ; Room
		    cp	    39				    ; 3rd floor	building 1

		    push    af
		    call    z, HideGuardRoom39		    ; Hide one of he guards of room 39 depending on from which room the	player comes from
		    pop	    af

		    cp	    69				    ; Desert guards to building	2
		    jr	    nz,	InitSentinel4

		    ld	    b, 1
		    ld	    a, (PreviousRoom)
		    cp	    73				    ; Building 2 entrance
		    jr	    nz,	InitSentinel3

		    ld	    b, 0

InitSentinel3:
		    ld	    (ix+ACTOR.DESERT_GUARD), b	    ; 0	= Player from desert, 1	= From building	2

InitSentinel4:
		    jp	    GetSentinelLookDirs


;---------------------------------------------------------------------------
;
; Sentinel logic
;
;---------------------------------------------------------------------------

SentinelChkPlayer:
		    call    ListenShotsChkTouch		    ; Check if the player is touching a	guard, or using	a weapon
		    jp	    c, GuardSetAlarm		    ; Yes, trigger the alarm

		    jr	    SentinelLogic2


SentinelLogic:
		    ld	    a, (ix+ACTOR.REMOVE_GUARD)	    ; (!?) Is it used?
		    or	    a
		    jp	    nz,	RemoveActor_

		    ld	    a, (Room)
		    cp	    69				    ; Desert guards to building	2
		    jr	    z, SentinelLogic2		    ; Do not check if the guard	sees the player

		    ld	    a, (SleepyGuardFlag)
		    or	    a				    ; Is a sleepy guard?
		    jr	    nz,	SentinelChkPlayer	    ; Yes, check if the	player touchs him, or uses a weapon

		    call    ChkActSeePlayer		    ; Check if the guard sees the player

SentinelLogic2:
		    ld	    a, (AlertMode)
		    or	    a				    ; Alert mode?
		    jp	    nz,	TransformAlertGuard	    ; Yes, transform the sentinel guard	in alert guard

		    dec	    (ix+ACTOR.SENTINEL_WAIT)
		    ret	    nz				    ; Continue looking in the same direction

		    ld	    a, (ix+ACTOR.idxPathPoint)
		    inc	    a
		    cp	    (ix+ACTOR.Cnt_NumPathPoints)    ; Next path	point (direction to look at)
		    jr	    c, SentinelLogic3

		    xor	    a				    ; Start from the first point again

SentinelLogic3:
		    ld	    (ix+ACTOR.idxPathPoint), a

		    ld	    d, (ix+ACTOR.LookDirPointerHigh)
		    ld	    e, (ix+ACTOR.LookDirPointerLow) ; Pointer to look directions. Used by ID_SENTINEL
		    call    ADD_DE_A
		    jp	    SetSentinelLookDir_		    ; Look at another direction
