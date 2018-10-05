;----------------------------------------------------------------------------
;
; Initialize alert guard
;
;----------------------------------------------------------------------------

InitGuardAlert:
		    ld	    (ix+ALERT_GUARD.Status), 4	    ; Wait and check alert. Then go to status 0

		    ld	    a, (AlertMode)
		    or	    a
		    jr	    nz,	InitGuardAlert4		    ; In alert mode

		    ld	    a, (Room)
		    cp	    127				    ; Lorry card 1
		    jr	    nz,	InitGuardAlert2

		    ld	    a, (Guard1ExitedLorry)	    ; Is the guard outside the lorry?
		    jr	    ChkDismissGuard


InitGuardAlert2:
		    sub	    131				    ; Second lorry in room 7 (there are	4 soldiers inside)
		    jr	    nz,	InitGuardAlert3

		    ld	    a, (Guard2ExitedLorry)
		    jr	    ChkDismissGuard


InitGuardAlert3:
		    dec	    a
		    jr	    nz,	InitGuardAlert4
		    ld	    a, (Guard3ExitedLorry)

ChkDismissGuard:
		    or	    a
		    jp	    nz,	DismissActor0		    ; Remove the actor if the guard exited the lorry

InitGuardAlert4:
		    ld	    (ix+ALERT_GUARD.COLLISION_CFG), 3 ;	Enable collisions with the player and his shots

		    call    GetDirToPlayer
		    ld	    (ix+ALERT_GUARD.Direction),	a   ; 1=Up, 2=Down, 3=Left, 4=Right

		    call    AnimateGuard2
		    call    SetWalkSpeedFast

		    xor	    a
		    ld	    (ix+ALERT_GUARD.speedYdec),	a
		    ld	    (ix+ALERT_GUARD.SpeedXdec),	a
		    ld	    (ix+ALERT_GUARD.BaseSpriteId), a
		    ld	    (ix+ALERT_GUARD.Counter), 14h
		    inc	    a
		    ld	    (ix+ALERT_GUARD.Moving), a	    ; 0=Does not move
		    ld	    (ix+ALERT_GUARD.WalkAwayDir), a

SetRespawnTime:
		    ld	    a, (Room)
		    ld	    hl,	0			    ; No respawning
		    cp	    216
		    jr	    z, SetRespawnTime3

		    cp	    187
		    jr	    z, SetRespawnTime2

		    cp	    154
		    jr	    z, SetRespawnTime2

		    sub	    88
		    cp	    5
		    ret	    nc				    ; Roof building 2

SetRespawnTime2:
		    ld	    h, 0Ah
		    ld	    a, r
		    and	    0Fh
		    add	    a, 10h
		    ld	    l, a			    ; Random respawn time

SetRespawnTime3:
		    ld	    (AlertRespawnTimer), hl
		    ret


;----------------------------------------------------------------------------
;
; Alert	guard logic
;
;----------------------------------------------------------------------------

GuardAlertLogic:
		    call    ChkGuardWater		    ; Check if the guard enters	in the water, or is about to enter a door/lorry

		    ld	    a, (ix+ALERT_GUARD.Status)
		    call    JumpIndex

		    dw GuardWalk
		    dw GuardWaitShot
		    dw GuardAvoidObstacle
		    dw GuardWalkAwayShot
		    dw GuardWaitChkAlert



;----------------------------------------------------------------------------
;
; Chase	the player
; Randomly shoot
;
;----------------------------------------------------------------------------

GuardWalk:
		    call    AnimateGuard		    ; Animate guard

		    ld	    b, 0			    ; Shape/size
		    ld	    c, (ix+ALERT_GUARD.Direction)   ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    ChkTileCollision
		    jp	    c, GuardWalk2		    ; Collision

		    dec	    (ix+ALERT_GUARD.Counter)
		    ret	    nz				    ; Continue walking in the same direction

GuardWalk2:
		    call    ChkNearPlayer		    ; Is the guard near	the player?
		    jp	    c, SetGuardWalkAway

GuardChasePlayer:
		    call    GetDirToPlayer		    ; Get the direction	towards	the player

		    exx
		    ld	    b, 0			    ; Shape/size
		    ld	    c, a			    ; Direction	to check
		    call    ChkTileCollision		    ; Check if it is possible to move in that direction
		    exx
		    jp	    nc,	GuardChasePlayer2	    ; It is possible to	move

		    ld	    (ix+ALERT_GUARD.Status), 2	    ; Skip obstacle status
		    ld	    (ix+ALERT_GUARD.WalkAwayDir), a
		    ld	    a, b			    ; Try the other axis direction
		    jp	    GuardSetNewDirection


GuardChasePlayer2:
		    ld	    (ix+ALERT_GUARD.Direction),	a   ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    AnimateGuard2
		    call    SetWalkSpeedFast

		    ld	    a, r
		    xor	    (ix+ALERT_GUARD.ANIM_CNT)
		    and	    7
		    add	    a, 0Fh
		    ld	    b, a
		    and	    3
		    jp	    z, SetGuardRndCounter	    ; Decide to	shot or	continue walking

GuardShot:
		    ld	    (ix+ALERT_GUARD.Counter), b
		    ld	    (ix+ALERT_GUARD.Status), 1
		    ld	    (ix+ALERT_GUARD.Moving), 0	    ; Disable movement

AddEnemyShot:
		    ld	    c, ID_GUARD_BULLET

AddEnemyShot2:
		    ld	    a, (ix+ACTOR.Y)
		    sub	    10h
		    ld	    e, a
		    ld	    d, (ix+ACTOR.X)
		    jp	    AddEnemy			    ; Add a shot


;(!?) Unused code

	IF (JAPANESE)
		db 0CDh,0A5h, 83h,0DDh, 77h, 11h,0DDh, 36h, 12h, 1Eh,0CDh, 6Fh,0A9h,0C3h, 54h,0A9h
	ELSE
		db 0CDh, 56h, 83h,0DDh, 77h, 11h,0DDh, 36h, 12h, 1Eh,0CDh, 23h,0A9h,0C3h,   8,0A9h
	ENDIF


;----------------------------------------------------------------------------
;
; Walk away from the player
;
;----------------------------------------------------------------------------

SetGuardWalkAway:
		    call    GetOppositePlayer		    ; Get the opposite direction to the	player

		    exx
		    ld	    b, 0
		    ld	    c, a
		    call    ChkTileCollision		    ; Check if it is possible to move in the new direction
		    jp	    nc,	GuardChasePlayer2	    ; Yes

		    exx
		    ld	    (ix+ALERT_GUARD.Status), 3
		    ld	    (ix+ALERT_GUARD.WalkAwayDir), a
		    ld	    a, b
		    jp	    GuardSetNewDirection



;----------------------------------------------------------------------------
;
; Wait after shooting
; Read alert guards shoot again	after waiting
; Continue chasing the player
;
;----------------------------------------------------------------------------

GuardWaitShot:
		    call    GetDirToPlayer
		    call    GuardLookDirection2

		    dec	    (ix+ALERT_GUARD.Counter)
		    ret	    nz				    ; continue waiting

		    call    SetGuardRndCounter

		    ld	    (ix+ALERT_GUARD.Status), 0	    ; Walk status
		    ld	    (ix+ALERT_GUARD.Moving), 1	    ; Enable movement

		    ld	    a, (ix+ALERT_GUARD.ID)		    ; Bit 7 = Killed
		    cp	    ID_GUARD_REDALERT
		    jp	    z, AddEnemyShot
		    ret



;----------------------------------------------------------------------------
;
; Set guard action time
;
;----------------------------------------------------------------------------

SetGuardRndCounter:
		    ld	    a, (ix+ALERT_GUARD.ID)		    ; Bit 7 = Killed
		    cp	    ID_GUARD_REDALERT
		    ld	    b, 14h
		    jp	    nz,	SetGuardRndCounter2

		    ld	    b, 0Ah

SetGuardRndCounter2:
		    ld	    a, r
		    xor	    (ix+ALERT_GUARD.ANIM_CNT)
		    and	    0Fh
		    add	    a, b
		    ld	    (ix+ALERT_GUARD.Counter), a
		    ret



;----------------------------------------------------------------------------
;
; Avoid	an obstacle
;
;----------------------------------------------------------------------------

GuardAvoidObstacle:
		    call    AnimateGuard

		    ld	    b, 0			    ; Shape/size
		    ld	    c, (ix+ALERT_GUARD.WalkAwayDir)
		    call    ChkTileCollision
		    jp	    nc,	ContinueThisWay

		    ld	    b, 0			    ; Shape/size
		    ld	    c, (ix+ALERT_GUARD.Direction)   ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    ChkTileCollision
		    ret	    nc

		    ld	    a, (ix+ALERT_GUARD.WalkAwayDir)
		    call    GetOppositeDir

		    ld	    b, 0			    ; Shape/size
		    ld	    c, a			    ; Direction
		    call    ChkTileCollision
		    jp	    nc,	ContinueThisWay

		    ld	    a, (ix+ALERT_GUARD.Direction)   ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    GetOppositeDir

ContinueThisWay:
		    ld	    (ix+ALERT_GUARD.Status), 0	    ; Chase the	player status

GuardSetNewDirection:
		    ld	    (ix+ALERT_GUARD.Direction),	a   ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    AnimateGuard2
		    call    SetWalkSpeedFast
		    jp	    SetGuardRndCounter


;----------------------------------------------------------------------------
;
; Walk away and	then shot
;
;----------------------------------------------------------------------------

GuardWalkAwayShot:
		    call    AnimateGuard

		    ld	    b, 0
		    ld	    c, (ix+ALERT_GUARD.Direction)   ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    ChkTileCollision
		    jp	    c, GuardChasePlayer		    ; Can not continue.	Chase the player again

		    dec	    (ix+ALERT_GUARD.Counter)
		    ret	    nz				    ; Continue walking away

		    call    ChkNearPlayer		    ; Check if the player is near
		    jp	    c, SetGuardWalkAway		    ; Yes, walk	away

		    ld	    b, 14h
		    jp	    GuardShot			    ; Shoot to the player



;----------------------------------------------------------------------------
;
; Wait,	start following	the player and trigger the alert
;
;----------------------------------------------------------------------------

GuardWaitChkAlert:
		    dec	    (ix+ALERT_GUARD.WalkAwayDir)
		    ret	    nz

		    ld	    (ix+ALERT_GUARD.Status), 0	    ; Chase the	player status

		    ld	    a, (AlertMode)
		    or	    a
		    ret	    nz				    ; Already in alert

		    jp	    SetAlertMode		    ; Trigger the alert



;----------------------------------------------------------------------------
;
; Set guard walk speed
;
;----------------------------------------------------------------------------

SetWalkSpeed:
		    ld	    a, (ix+ALERT_GUARD.Direction)   ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    de,	DirectionSpeeds

SetWalkSpeed2:
		    call    GetPointerDE2A
		    ld	    (ix+ALERT_GUARD.SpeedY), e
		    ld	    (ix+ALERT_GUARD.SpeedX), d
		    ret



;----------------------------------------------------------------------------
;
; Set guard walk fast speed
;
;----------------------------------------------------------------------------

SetWalkSpeedFast:
		    ld	    a, (ix+ALERT_GUARD.Direction)   ; 1=Up, 2=Down, 3=Left, 4=Right

SetWalkSpeedFast2:
		    ld	    de,	DirectionSpeeds2

DirectionSpeeds:
		    jr	    SetWalkSpeed2

		    db -1
		    db 0
		    db 1
		    db 0
		    db 0
		    db -1
DirectionSpeeds2:   db 0
		    db 1
		    db -2
		    db 0
		    db 2
		    db 0
		    db 0
		    db -2
		    db 0
		    db 2


;----------------------------------------------------------------------------
;
; Animate a guard actor	depending on his direction and base animation sprite
;
;----------------------------------------------------------------------------

AnimateGuard:
		    ld	    a, (ix+ACTOR.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right

AnimateGuard2:
		    dec	    a
		    add	    a, a
		    bit	    2, (ix+ACTOR.ANIM_CNT)
		    jp	    z, AnimateGuard3

		    inc	    a

AnimateGuard3:
		    add	    a, (ix+ACTOR.BASE_SPR_ID)	    ; Sprite base ID (i.e.: guard normal = 0, guard in water = #49)
		    ld	    (ix+ACTOR.SpriteId), a
		    ret


;----------------------------------------------------------------------------
;
; Set the sprite frame that matchs the actor direction
;
;----------------------------------------------------------------------------

GuardLookDirection:
		    ld	    a, (ix+ACTOR.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right

GuardLookDirection2:
		    add	    a, 7			    ; Guard up (8) - 1 sprite ID
		    add	    a, (ix+ACTOR.BASE_SPR_ID)
		    ld	    (ix+ACTOR.SpriteId), a
		    ret


;----------------------------------------------------------------------------
;
; Check	if the enemy is	near the player
;
;----------------------------------------------------------------------------

ChkNearPlayer:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    cp	    ID_GUARD_REDALERT
		    scf
		    ccf
		    ret	    nz

GetDistancePlayer:
		    ld	    a, (PlayerX)
		    sub	    (ix+ACTOR.X)
		    jp	    nc,	GetDistancePlayer2

		    neg

GetDistancePlayer2:
		    ld	    b, a
		    ld	    a, (PlayerY)
		    sub	    (ix+ACTOR.Y)
		    jp	    nc,	GetDistancePlayer3

		    neg

GetDistancePlayer3:
		    cp	    b
		    jp	    nc,	GetDistancePlayer4
		    ld	    a, b

GetDistancePlayer4:
		    cp	    30h
		    ret

;----------------------------------------------------------------------------
;
; Check	if the guard enters in water
; If the guard is about	to enter a lorry or door, turn in the opposite direction
;
;----------------------------------------------------------------------------

ChkGuardWater:
		    ld	    a, (ix+ACTOR.X)
		    sub	    4
		    ld	    h, a
		    ld	    l, (ix+ACTOR.Y)
		    call    GetTileInXY			    ; Get tiles	under guard's feet

		    ld	    a, l			    ; Left tile
		    dec	    a				    ; Is an exit? door,	lorry
		    jp	    z, MoveAwayExit

		    ld	    a, h			    ; Right tile
		    dec	    a				    ; Is an exit? door,	lorry
		    jp	    z, MoveAwayExit

		    ld	    a, (Room)
		    cp	    70				    ; First water room.	Water room before Bulldozer
		    ret	    c

		    ld	    (ix+ACTOR.BASE_SPR_ID), 0	    ; Guard up sprite ID

		    ld	    a, l
		    cp	    6Dh				    ; Water tile
		    jp	    z, ChkGuardWater2

		    sub	    6Fh
		    cp	    8
		    ret	    nc				    ; Not a water tile

		    ld	    a, h
		    jp	    z, ChkGuardWater2

		    sub	    6Fh
		    cp	    8
		    ret	    nc				    ; Not a water tile

ChkGuardWater2:
		    ld	    (ix+ACTOR.BASE_SPR_ID), 49h	    ; Guard up in water	sprite ID
		    ret


;----------------------------------------------------------------------------
;
; Turn 180 degrees
;
;----------------------------------------------------------------------------

MoveAwayExit:
		    ld	    (ix+ACTOR.Status), 0	    ; Chase the	player mode
		    ld	    (ix+ACTOR.Wait), 0Ah

		    ld	    a, (ix+ACTOR.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    GetOppositeDir

		    ld	    (ix+ACTOR.Direction), a	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    AnimateGuard2

		    jp	    SetWalkSpeedFast



;----------------------------------------------------------------------------
;
; Get a	random number from 0 to	3
;
; Out:
;    A = number	(0-3)
;
;----------------------------------------------------------------------------

GetRandom3:
		    ld	    a, r
		    xor	    (ix+ACTOR.ANIM_CNT)
		    and	    3
		    ret
