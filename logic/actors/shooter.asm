;----------------------------------------------------------------------------
;
; Init shooter guard
; Used in room 206 (East elevator, Build 2-1)
; And roof building 2 (88, 90, 91) Always in alert mode
;
;----------------------------------------------------------------------------

InitShooter:
		    ld	    (ix+SHOOTER.Direction), 1	    ; Facing up	by default
		    ld	    (ix+SHOOTER.TransformTimer), 3  ; Shooter iteration	before transformint into alert guard

		    ld	    a, (Room)
		    cp	    206				    ; Building 2, elevator east
		    jr	    z, InitShooterElev

		    ld	    hl,	AlertMode
		    ld	    (hl), 1			    ; Trigger alert mode

		    ld	    hl,	0A80h
		    ld	    (AlertRespawnTimer), hl

		    sub	    90
		    jr	    z, InitShooterRoom90	    ; Room 90

		    dec	    a
		    jr	    z, InitShooterRoom91	    ; Room 91

; Room 88
		    ld	    a, (PlayerY)
		    rla					    ; Is the player in the upper or lower part of the screen?
		    jr	    c, InitShooter2

		    ld	    (ix+SHOOTER.Y), 0A8h	    ; Relocate the guard to the	south of the screen

InitShooter2:
		    ld	    a, (ix+SHOOTER.X)
		    cp	    98h
		    ld	    b, DIR_LEFT			    ; Left
		    jr	    z, InitShooter5

		    inc	    b				    ; Right
		    jr	    InitShooter5

;----------------------------------------------------------------------------
; Relocate the guards depending	on the player entry point
;----------------------------------------------------------------------------

InitShooterRoom90:
		    ld	    (ix+SHOOTER.NextDirection),	0

		    ld	    a, (PlayerY)
		    rla
		    jr	    c, SetShooterDir

		    ld	    (ix+SHOOTER.Y), 90h
		    jr	    SetShooterDir

;----------------------------------------------------------------------------
; There	are 4 guards. The one in the middle moves to the right.	The others to the left
;----------------------------------------------------------------------------

InitShooterRoom91:
		    ld	    a, (ix+SHOOTER.X)
		    cp	    78h
		    ld	    b, 4			    ; Right
		    jr	    z, InitShooter5

		    dec	    b				    ; Left

InitShooter5:
		    ld	    (ix+SHOOTER.NextDirection),	b
		    jr	    SetShooterDir

;---------------------------------------------------------------------------
;
; Init shooters	in room	206 (building 1, elevator east)
;
;---------------------------------------------------------------------------

InitShooterElev:
		    ld	    (ix+SHOOTER.NextDirection),	0   ; Has not decided where to move

		    ld	    a, (PlayerY)
		    rla					    ; Is the player in the upper or lower part of the screen?
		    jr	    nc,	SetShooterDir

		    ld	    (ix+SHOOTER.Y), 38h		    ; Relocate the guard to the	north

SetShooterDir:
		    bit	    7, (ix+SHOOTER.Y)		    ; Is the guard in the upper	or lower part of the screen?
		    jr	    nz,	SetShooterDir2

		    ld	    (ix+SHOOTER.Direction), DIR_DOWN ; Set the guard facing down

SetShooterDir2:
		    call    GuardLookDirection
		    call    ResetActorSpeed

		    ld	    a, (ix+SHOOTER.X)
		    ld	    (ix+SHOOTER.StartX), a	    ; Store initial guard X

		    jp	    SetRandomWait

;---------------------------------------------------------------------------
;
; Shooter guard	logic
;
;---------------------------------------------------------------------------

ShooterLogic:
		    ld	    a, (PlayerY)
		    sub	    (ix+SHOOTER.Y)
		    add	    a, 10h
		    cp	    21h
		    ld	    a, ID_GUARD_ALERT
		    jp	    c, TransformAlertGuard2	    ; Transforms into alert guard if the player	is too close

		    ld	    a, (ix+SHOOTER.Status)
		    call    JumpIndex

		    dw ShooterWait
		    dw ShooterWalk
		    dw ShooterShot
		    dw ShooterHide

;---------------------------------------------------------------------------
;
; The guard waits. Then	decide to move left or right. After 3 iteration	it transforms into alert guard
;
;---------------------------------------------------------------------------


ShooterWait:
		    dec	    (ix+SHOOTER.Wait)
		    ret	    nz				    ; Wait idle

		    dec	    (ix+SHOOTER.TransformTimer)	    ; After 3 movements	the guard transforms into "alert guard"
		    ld	    a, ID_GUARD_ALERT
		    jp	    z, TransformAlertGuard2

		    inc	    (ix+SHOOTER.Status)		    ; Walk status
		    ld	    (ix+SHOOTER.Moving), 1	    ; Enable movement
		    ld	    (ix+SHOOTER.Wait), 0Ah

		    ld	    a, (ix+SHOOTER.NextDirection)
		    or	    a				    ; The guard	has decided a direction	(left/right) to	move
		    jp	    nz,	ShooterSetDir

		    ld	    a, r
		    xor	    (ix+SHOOTER.ANIM_CNT)
		    and	    1
		    add	    a, 3			    ; Decide to	move left or right

ShooterSetDir:
		    ld	    (ix+SHOOTER.Direction), a	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    AnimateGuard2
		    jp	    SetWalkSpeedFast

;---------------------------------------------------------------------------
;
; The guard walks (left	or right) Then set shoot status	and look up or down
;
;---------------------------------------------------------------------------


ShooterWalk:
		    call    AnimateGuard		    ; Update walk animation

		    dec	    (ix+SHOOTER.Wait)
		    ret	    nz				    ; Continue walking

		    inc	    (ix+SHOOTER.Status)		    ; Set shoot	status
		    ld	    (ix+SHOOTER.Moving), 0	    ; Stop moving

		    call    SetRandomWait

		    bit	    7, (ix+SHOOTER.Y)		    ; Is the guard in the upper	or lower part of the screen?
		    ld	    a, DIR_UP			    ; Up
		    jp	    nz,	GuardLookDirection2

		    inc	    a				    ; Down
		    jp	    GuardLookDirection2

;---------------------------------------------------------------------------
;
; The guard waits, shoots and turns to his hide	position
;
;---------------------------------------------------------------------------


ShooterShot:
		    dec	    (ix+SHOOTER.Wait)
		    jp	    z, ShooterTurnBack

		    ld	    a, (ix+SHOOTER.ANIM_CNT)
		    and	    0Fh
		    ret	    nz				    ; Wait before shooting

		    ld	    c, ID_BULLET_VERT		    ; Bullet from guard	shooter
		    jp	    AddEnemyShot2		    ; Shoot


;---------------------------------------------------------------------------
;
; Setup	the movement to	go back
;
;---------------------------------------------------------------------------


ShooterTurnBack:
		    inc	    (ix+SHOOTER.Status)		    ; Status to	move back to his initial position

		    ld	    a, (ix+SHOOTER.SpeedX)
		    neg
		    ld	    (ix+SHOOTER.SpeedX), a	    ; Opposite speed

		    ld	    (ix+SHOOTER.Moving), 1	    ; Enable movement

		    ld	    a, (ix+SHOOTER.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    GetOppositeDir
		    ld	    (ix+SHOOTER.Direction), a	    ; Opposite direction

		    jp	    AnimateGuard2		    ; Update guard sprite


;---------------------------------------------------------------------------
;
; Go back to the initial position
;
;---------------------------------------------------------------------------


ShooterHide:
		    call    AnimateGuard		    ; Update walk animation

		    ld	    a, (ix+SHOOTER.X)
		    sub	    (ix+ACTOR.Cnt_NumPathPoints)    ; Guard start X
		    ret	    nz				    ; The guard	is not in the initial position

		    ld	    (ix+SHOOTER.Status), a	    ; Idle status
		    ld	    (ix+SHOOTER.Moving), a	    ; Do not move

		    bit	    7, (ix+SHOOTER.Y)
		    ld	    a, DIR_UP			    ; Look up
		    jp	    nz,	ShooterHide2

		    inc	    a				    ; Look down

ShooterHide2:
		    call    GuardLookDirection2		    ; Set the right sprite ID

SetRandomWait:
		    ld	    a, r
		    xor	    (ix+SHOOTER.ANIM_CNT)
		    and	    3Fh
		    inc	    a
		    ld	    (ix+SHOOTER.Wait), a	    ; Random wait time
		    ret
