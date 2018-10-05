;---------------------------------------------------------------------------
;
; Init guard that exits	from a lorry
; Used in rooms	5 and 7
;
;---------------------------------------------------------------------------

InitGuardLorry:
		    ld	    a, ID_GUARD_SLOW
		    call    CountEnemyType		    ; Get number of slow guards
		    push    af

		    ld	    a, ID_GUARD_EXIT_LORRY
		    call    CountEnemyType
		    pop	    bc
		    add	    a, b

		    ld	    (ix+ACTOR.NUM_GUARDS), a
		    ld	    (ix+ACTOR.IDX_SAME_ID), a
		    ld	    (ix+ACTOR.COLLISION_CFG), 0	    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed

		    call    InitGuardPath2		    ; Sets the path that the guard will	follow

		    ld	    a, (Room)
		    cp	    7				    ; Three lorries building 1,	next to	elevator room
		    jr	    nz,	InitGuardLorry2

		    ld	    a, (ix+ACTOR.IDX_SAME_ID)
		    dec	    a				    ; First guard?
		    jr	    z, InitGuardLorry2		    ; Yes

		    ld	    (ix+ACTOR.IdxGuardSpeed), 8	    ; Second guard walks faster	(Bank0:5A5B WalkSpeeds)

InitGuardLorry2:
		    ld	    a, (Room)
		    cp	    5				    ; Three lorries yard
		    ld	    hl,	Guard1ExitedLorry
		    jr	    z, ResetSpanwGuard

		    cp	    7				    ; Three lorries building 1,	next to	elevator room
		    jr	    nz,	NotResetSpanwGuard

		    ld	    a, (ix+ACTOR.IDX_SAME_ID)
		    dec	    a				    ; First guard?
		    inc	    hl				    ; Pointer to Guard2ExitedLorry
		    jr	    z, ResetSpanwGuard		    ; Yes

		    inc	    hl				    ; Pointer to Guard3ExitedLorry
		    dec	    a				    ; Second guard?
		    jr	    nz,	NotResetSpanwGuard	    ; No

ResetSpanwGuard:
		    ld	    (hl), 0			    ; The guard	has not	exited the lorry

NotResetSpanwGuard:
		    ld	    (ix+ACTOR.Moving), 1	    ; Enable movement
		    ld	    (ix+ACTOR.idxPathPoint), 0

		    ld	    a, (ControlConfig)		    ; Bit6: 1=Enable music/Player control
		    bit	    6, a
		    ld	    a, 64h
		    jr	    z, InitGuardLorry5

		    ld	    a, r
		    set	    7, a

InitGuardLorry5:
		    ld	    (ix+ACTOR.LORRY_TIMER), a
		    ld	    (ix+ACTOR.SpriteId), 2	    ; Guard down frame 1 sprite	ID
		    jp	    ResetActorSpeed

;----------------------------------------------------------------------------
;
; Spawn	soldier	logic
;
;----------------------------------------------------------------------------

GuardLorryLogic:
		    ld	    b, (ix+ACTOR.Status)
		    inc	    b
		    djnz    GuardExitingLorry

		    dec	    (ix+ACTOR.LORRY_TIMER)
		    ret	    nz				    ; Wait before the guard exits the lorry

		    ld	    a, (Room)
		    cp	    5				    ; Three lorries yard
		    ld	    hl,	Guard1ExitedLorry
		    jr	    z, SetGuardExitsLorry

		    cp	    7				    ; Three lorries building 1
		    jr	    nz,	GuardLorryLogic3

		    ld	    a, (ix+ACTOR.IDX_SAME_ID)
		    dec	    a				    ; First guard?
		    inc	    hl				    ; Pointer to Guard2ExitedLorry
		    jr	    z, SetGuardExitsLorry	    ; Yes

		    inc	    hl				    ; Pointer to Guard3ExitedLorry
		    dec	    a				    ; Second guard
		    jr	    nz,	GuardLorryLogic3	    ; No

SetGuardExitsLorry:
		    ld	    (hl), 1			    ; The guard	exits the lorry

GuardLorryLogic3:
		    ld	    (ix+ACTOR.LORRY_TIMER), 8

		    ld	    a, ID_GUARD_SLOW
		    call    SetActorSprColors2		    ; Update sprites colors

		    ld	    (ix+ACTOR.COLLISION_CFG), 3	    ; Enable collision with the	player and his shots
		    ld	    hl,	200h			    ; Y	speed
		    ld	    de,	0			    ; X	speed
		    call    SetActorSpeed		    ; The guard	walks down out of the lorrie
		    jr	    GuardLorryNextStat


;----------------------------------------------------------------------------
;
; Walk out of the lorrie and get the first path	point
;
;----------------------------------------------------------------------------

GuardExitingLorry:
		    djnz    GuardLorryWalk

		    dec	    (ix+ACTOR.LORRY_TIMER)
		    ret	    nz				    ; Still walking out	of the lorry

		    ld	    (ix+ACTOR.idxPathPoint2), 0
		    ld	    (ix+ACTOR.PathPointsCnt), -1

		    ld	    e, (ix+ACTOR.PointerL)
		    ld	    d, (ix+ACTOR.PointerH)	    ; DE = Pointer to path
		    inc	    de
		    call    GetPathPoint_		    ; Get the first destination	point

GuardLorryNextStat:
		    inc	    (ix+ACTOR.Status)		    ; Next status
		    ret

;----------------------------------------------------------------------------
;
; Guard	patrol (follow the path)
;
;----------------------------------------------------------------------------

GuardLorryWalk:
		    djnz    GuardEnterLorry

		    call    GuardLogic			    ; Guard logic: follow the path, stop, look around...

		    ld	    a, (AlertMode)
		    or	    a
		    jp	    nz,	TransformAlertGuard	    ;  In alert	mode the guard transforms into an alert	guard

		    ld	    a, (ix+ACTOR.idxPathPoint)
		    cp	    (ix+ACTOR.idxPathPoint2)	    ; Same path
		    ret	    z

		    ld	    (ix+ACTOR.idxPathPoint2), a
		    inc	    (ix+ACTOR.PathPointsCnt)	    ; Increment	destination points reached

		    ld	    a, (ix+ACTOR.PathPointsCnt)
		    cp	    (ix+ACTOR.Cnt_NumPathPoints)
		    ret	    c				    ; Has not reached the last destination (lorry entrance)

		    dec	    (ix+ACTOR.PathPointsCnt)

		    ld	    a, (ix+ACTOR.GuardStatus)
		    or	    a				    ; Walking?
		    jr	    z, GuardLorryWalkEnd	    ; Yes

		    inc	    (ix+ACTOR.Moving)		    ; Enable movement
		    ld	    (ix+ACTOR.GuardStatus), 0	    ; Force walk status

		    call    SetDirToPoint		    ; Continue walking to destination

GuardLorryWalkEnd:
		    ld	    hl,	-200h			    ; Speed Y
		    ld	    de,	0			    ; Speed X
		    call    SetActorSpeed		    ; The guard	walks up (into the lorry)

		    ld	    (ix+ACTOR.LORRY_TIMER), 8
		    ld	    (ix+ACTOR.SpriteId), 0	    ; Guard up sprite ID
		    jr	    GuardLorryNextStat


;---------------------------------------------------------------------------
; The guard walks into the lorry
;---------------------------------------------------------------------------

GuardEnterLorry:
		    dec	    (ix+ACTOR.LORRY_TIMER)
		    ret	    nz				    ; Still entering the lorry

		    ld	    a, (Room)
		    cp	    5				    ; Three lorries in the yard
		    ld	    hl,	Guard1ExitedLorry
		    jr	    z, GuardEnterLorry2

		    cp	    7				    ; Three lorries in building	1
		    jr	    nz,	GuardEnterLorry3

		    ld	    a, (ix+ACTOR.IDX_SAME_ID)
		    dec	    a
		    inc	    hl
		    jr	    z, GuardEnterLorry2

		    inc	    hl
		    dec	    a
		    jr	    nz,	GuardEnterLorry3

GuardEnterLorry2:
		    ld	    (hl), 0			    ; The guard	is inside the lorry

GuardEnterLorry3:
		    xor	    a
		    ld	    (ix+ACTOR.COLLISION_CFG), a	    ; Disable collisions with the player and his shots

		    ld	    c, a
		    call    SetSprColor			    ; Hide sprite

		    call    InitGuardLorry2
		    jp	    ResetActorStatus

