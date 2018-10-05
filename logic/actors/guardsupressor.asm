;---------------------------------------------------------------------------
;
; Init guard supressor
; There	are 4 guards in	the room: two in the upper part, 1 to the right	and 1 to the left
;
;---------------------------------------------------------------------------

InitGuardSilencer:
		    ld	    a, (SupressorTaken)
		    or	    a				    ; Is the suppresor in the inventory?
		    jp	    nz,	DismissActor0		    ; Yes, remove the actor

		    ld	    a, 3Eh			    ; Music: Mercenary
		    ld	    (AreaMusic), a
		    call    SetSoundEntryChk

		    inc	    (ix+GUARD_SILENCER.Moving)	    ; Enable movement
		    call    ResetActorSpeed

		    ld	    a, r
		    and	    0Fh
		    inc	    a
		    ld	    (ix+GUARD_SILENCER.Wait), a	    ; Random wait (1-16)

		    bit	    7, (ix+GUARD_SILENCER.Y)	    ; Is the guard in the upper	part of	the room?
		    ld	    a, 9			    ; Guard Down sprite	ID
		    ld	    b, DIR_LEFT			    ; Guards in	the upper part of the screen move left and right
		    jp	    z, InitGuardSilencer2

		    inc	    a				    ; Guard left sprite	ID
		    ld	    b, DIR_UP			    ; Lower guards move	up and down
		    bit	    7, (ix+GUARD_SILENCER.X)
		    jp	    nz,	InitGuardSilencer2

		    inc	    a				    ; Down

InitGuardSilencer2:
		    ld	    (ix+GUARD_SILENCER.DirMovement), b
		    jp	    SetGuardSprId

;----------------------------------------------------------------------------
;
; Supressor guards logic
;
;----------------------------------------------------------------------------

GuardSilencerLogic:
		    bit	    0, (ix+GUARD_SILENCER.ChasingPlayer) ; Is the guard	chasing	the player?
		    jp	    nz,	GuardAlertLogic		    ; Chase the	player

		    call    ChkChasePlayer

		    ld	    a, (ix+GUARD_SILENCER.Status)
		    call    JumpIndex

		    dw GuardSilencIdle			    ; Idle
		    dw GuardSilencMovShot		    ; Walk and then shot
		    dw GuardSilencTurn			    ; Turn
		    dw GuardSilencWalk			    ; Walk


;----------------------------------------------------------------------------
;
; Wait and decide in which direction to	move
;
;----------------------------------------------------------------------------

GuardSilencIdle:
		    dec	    (ix+GUARD_SILENCER.Wait)
		    ret	    nz				    ; Wait

		    ld	    (ix+GUARD_SILENCER.Status),	1   ; Next status
		    ld	    (ix+GUARD_SILENCER.Wait), 0Eh

		    ld	    a, r
		    xor	    (ix+GUARD_SILENCER.ANIM_CNT)
		    and	    1
		    add	    a, (ix+GUARD_SILENCER.DirMovement)
		    ld	    (ix+GUARD_SILENCER.Direction), a ; Random direction	in the same axis (left/right or	up/down)

		    call    AnimateGuard2		    ; Update the guard sprite ID
		    jp	    SetWalkSpeedFast


;----------------------------------------------------------------------------
;
; Move and then	shot
;
;----------------------------------------------------------------------------

GuardSilencMovShot:
		    call    AnimateGuard		    ; Update walk animation
		    dec	    (ix+GUARD_SILENCER.Wait)
		    ret	    nz				    ; Continue walking

		    ld	    (ix+GUARD_SILENCER.Status),	2   ; Status to	turn back

		    call    ResetActorSpeed		    ; Stop the actor

		    ld	    a, r
		    xor	    (ix+GUARD_SILENCER.ANIM_CNT)
		    and	    7
		    inc	    a
		    ld	    (ix+GUARD_SILENCER.Wait), a	    ; Random wait in next status (1-8)

		    call    SetGuardSprId_		    ; Update guard sprite ID

		    bit	    1, (ix+GUARD_SILENCER.DirMovement) ; Facing	up/down	or left/right?
		    ld	    c, ID_BULLET_VERT		    ; Bullet from guard	shooter
		    jp	    nz,	AddEnemyShot2

		    dec	    c				    ; ID_BULLET_HORIZ
		    jp	    AddEnemyShot2


;----------------------------------------------------------------------------
;
; Wait after shooting and turn back
;
;----------------------------------------------------------------------------

GuardSilencTurn:
		    dec	    (ix+GUARD_SILENCER.Wait)
		    ret	    nz				    ; Wait

		    ld	    (ix+GUARD_SILENCER.Status),	3   ; Walk back
		    ld	    (ix+GUARD_SILENCER.Wait), 0Eh

		    ld	    a, (ix+GUARD_SILENCER.Direction) ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    GetOppositeDir
		    ld	    (ix+GUARD_SILENCER.Direction), a ; Set the opposite	direction

		    call    AnimateGuard2		    ; Set walk sprite ID depending on the direction
		    jp	    SetWalkSpeedFast


;----------------------------------------------------------------------------
;
; Walk back to the start position
;
;----------------------------------------------------------------------------

GuardSilencWalk:
		    call    AnimateGuard		    ; Update walk animation

		    dec	    (ix+GUARD_SILENCER.Wait)
		    ret	    nz				    ; Continue walking

		    ld	    (ix+GUARD_SILENCER.Status),	0   ; Set idle status. Restart logic

		    call    ResetActorSpeed		    ; Stop the guard

		    ld	    a, r
		    xor	    (ix+GUARD_SILENCER.ANIM_CNT)
		    and	    0Fh
		    inc	    a
		    ld	    (ix+GUARD_SILENCER.Wait), a	    ; Random wait time

SetGuardSprId_:
		    bit	    1, (ix+GUARD_SILENCER.DirMovement)
		    ld	    a, 9			    ; Guard down sprite	ID
		    jp	    nz,	SetGuardSprId

		    inc	    a				    ; Guard left sprite	ID
		    bit	    7, (ix+GUARD_SILENCER.X)	    ; Is the guard to the left or to the right of the room?
		    jp	    nz,	SetGuardSprId

		    inc	    a				    ; Guard right sprite ID

SetGuardSprId:
		    ld	    (ix+GUARD_SILENCER.SpriteId), a
		    ret


;----------------------------------------------------------------------------
;
; If the player	is too close to	the guard, the guard chases the	player
;
;----------------------------------------------------------------------------

ChkChasePlayer:
		    bit	    1, (ix+GUARD_SILENCER.DirMovement) ; Is this guard moving in the X or Y axis?
		    jp	    z, ChkChasePlayer2

		    ld	    a, (PlayerY)
		    sub	    (ix+GUARD_SILENCER.Y)
		    add	    a, 20h
		    cp	    41h
		    ret	    nc				    ; Not near the guards in the upper part of the room

		    jr	    ChkChasePlayer3


ChkChasePlayer2:
		    ld	    a, (PlayerX)
		    sub	    (ix+GUARD_SILENCER.X)
		    add	    a, 20h
		    cp	    41h
		    ret	    nc

ChkChasePlayer3:
		    ld	    (ix+GUARD_SILENCER.ChasingPlayer), 1

		    ld	    a, ID_GUARD_SILENCER	    ; To keep the actor	ID

		    pop	    hl				    ; Remove CALL return address to skip the logic of this actor

		    jp	    TransformAlertGuard2	    ; Setup the	guard to chase the player



