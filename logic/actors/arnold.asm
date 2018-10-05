;---------------------------------------------------------------------------
;
; Init Arnold
;
;---------------------------------------------------------------------------

InitArnold:
		    ld	    a, (Card7Taken)
		    or	    a
		    jp	    nz,	DismissActor		    ; Remove Arnolds if	card 7 was already obtained

		    ld	    (ix+ARNOLD.Moving),	1	    ; Enable movement
		    ld	    (ix+ARNOLD.COLLISION_CFG), 3    ; Enable collisions	with the player	and his	shots

		    ld	    a, (ix+ARNOLD.Y)
		    rlca
		    rlca
		    and	    1
		    add	    a, DIR_LEFT
		    ld	    (ix+ARNOLD.Direction), a	    ; 1=Up, 2=Down, 3=Left, 4=Right

		    call    SetArnoldSprStill2
		    call    ResetActorSpeed
		    jp	    SetArnoldRndWait		    ; Set random wait time

;---------------------------------------------------------------------------
;
; Arnold logic
;
;---------------------------------------------------------------------------

ArnoldLogic:
		    ld	    a, (ix+ARNOLD.TOUCH_INFO)	    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
		    and	    0Fh				    ; Type of weapon colliding
		    jp	    nz,	ArnoldBounceBack	    ; Arnold hit by a bullet

		    ld	    a, (ix+ARNOLD.Status)
		    call    JumpIndex

		    dw ArnoldWatch
		    dw ArnoldTowardsPlayer
		    dw ArnoldReturn
		    dw ArnoldBounceBack3


;----------------------------------------------------------------------------
;
; Check	if Arnold can see the player. If so, look at it	and start runnig towards him
;
;----------------------------------------------------------------------------

ArnoldWatch:
		    ld	    a, (PlayerY)
		    sub	    (ix+ARNOLD.Y)
		    add	    a, 10h
		    cp	    21h				    ; Check if the player is in	the same Y range
		    jr	    nc,	ArnoldWaitTurn		    ; Can not see the player. Randomly turn back

ArnoldSeePlayer:
		    ld	    (ix+ARNOLD.Status),	1	    ; Status: run towards the player
		    call    SetArnoldRndWait

		    ld	    a, (PlayerX)
		    cp	    (ix+ARNOLD.X)		    ; Check if the player is to	the right or to	the left

		    ld	    a, DIR_LEFT
		    jr	    c, ArnoldSeePlayer2
		    inc	    a				    ; Right

ArnoldSeePlayer2:
		    ld	    (ix+ARNOLD.Direction), a	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    b, 4			    ; Animation	delay
		    call    SetArnoldWalkSpr

		    jp	    SetChaseSpeed


;----------------------------------------------------------------------------
;
; Wait and select a random direction (just the sprite ID)
;
;----------------------------------------------------------------------------

ArnoldWaitTurn:
		    dec	    (ix+ARNOLD.Wait)
		    ret	    nz				    ; Continue waiting

ArnoldTurn:						    ; Set random wait time
		    call    SetArnoldRndWait

		    ld	    a, r
		    xor	    (ix+ARNOLD.ANIM_CNT)
		    and	    1
		    add	    a, a
		    add	    a, 82h			    ; Sprite ID	Arnold left
		    ld	    (ix+ARNOLD.SpriteId), a	    ; Randomly select right or left sprite
		    ret


;----------------------------------------------------------------------------
;
; Run towards the player
;
;----------------------------------------------------------------------------

ArnoldTowardsPlayer:
		    ld	    a, (PlayerY)
		    sub	    (ix+ARNOLD.Y)
		    add	    a, 10h
		    cp	    21h
		    jr	    nc,	ArnoldStopChase		    ; Arnold can't see the player

		    ld	    b, 4			    ; Animation	delay
		    call    SetArnoldWalkSpr

		    ld	    b, 0			    ; Shape/size

ArnoldTowards2:						    ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    c, (ix+ARNOLD.Direction)
		    call    ChkTileCollision
		    jr	    c, ArnoldSeePlayer

		    dec	    (ix+ARNOLD.Wait)
		    ret	    nz

		    jr	    ArnoldSeePlayer


;----------------------------------------------------------------------------
;
; Stop running towards the player and start walking back
;
;----------------------------------------------------------------------------

ArnoldStopChase:
		    ld	    (ix+ARNOLD.Status),	2	    ; Walk back	status
		    ld	    a, (ix+ARNOLD.X)
		    cp	    80h
		    jr	    z, ArnoldReturn2

		    ld	    a, 4			    ; Right
		    jr	    c, ArnoldStopChase2
		    dec	    a				    ; Left

ArnoldStopChase2:
		    ld	    (ix+ARNOLD.Direction), a	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    b, DIR_RIGHT
		    call    SetArnoldWalkSpr2
		    jp	    SetWalkSpeed


;----------------------------------------------------------------------------
;
; Arnold walks back to his initial position (centre of the room)
;
;----------------------------------------------------------------------------

ArnoldReturn:
		    ld	    a, (PlayerY)
		    sub	    (ix+ARNOLD.Y)
		    add	    a, 10h
		    cp	    21h
		    jr	    c, ArnoldSeePlayer		    ; Arnold sees the player and start running towards him

		    ld	    b, 8
		    call    SetArnoldWalkSpr
		    ld	    a, (ix+ARNOLD.X)
		    cp	    80h				    ; Center of	the room
		    ret	    nz				    ; Continue walking

ArnoldReturn2:
		    call    SetArnoldSprStill

		    ld	    (ix+ARNOLD.Status),	0	    ; Watch status
		    ld	    (ix+ARNOLD.SpeedX),	0	    ; Stop moving
		    jr	    SetArnoldRndWait


;----------------------------------------------------------------------------
;
; Arnold hit
;
;----------------------------------------------------------------------------

ArnoldBounceBack:
		    add	    a, 3			    ; Depending	on the type of weapon, the push	time is	bigger
		    ld	    (ix+ARNOLD.PushBackCnt), a

		    ld	    a, (ix+ARNOLD.SpeedX)
		    ld	    (ix+ARNOLD.SpeedXCopy), a

		    ld	    a, (PlayerX)		    ; (!?) Check player	location to select push	speed. Using a missile could push Arnold in the	wrong direction	(towards the missile)
		    cp	    (ix+ARNOLD.X)

		    ld	    a, 2			    ; Push speed to the	right
		    jr	    c, ArnoldBounceBack2
		    ld	    a, -2			    ; Push speed to the	left

ArnoldBounceBack2:
		    ld	    (ix+ARNOLD.SpeedX),	a

		    ld	    a, (ix+ARNOLD.Status)
		    ld	    (ix+ARNOLD.OldStatus), a	    ; Save Arnold status

		    ld	    (ix+ARNOLD.Status),	3	    ; Bouncing back status
		    ld	    (ix+ARNOLD.COLLISION_CFG), 1    ; Disable collisions with player shots
		    ld	    (ix+ARNOLD.TOUCH_INFO), 0	    ; Erase shot impact	info

ArnoldBounceBack3:
		    bit	    7, (ix+ARNOLD.SpeedX)	    ; Moving to	the right or to	the left?
		    ld	    bc,	DIR_RIGHT
		    jr	    z, ArnoldBounceBack4
		    dec	    c				    ; Left

ArnoldBounceBack4:
		    call    ChkTileCollision
		    ld	    a, 0			    ; Reset speed X to avoid moving out	of the room
		    jr	    c, ArnoldBounceBack5	    ; Collision

		    dec	    (ix+ARNOLD.PushBackCnt)
		    ret	    nz

		    ld	    a, (ix+ARNOLD.SpeedXCopy)

ArnoldBounceBack5:
		    ld	    (ix+ARNOLD.SpeedX),	a

		    ld	    a, (ix+ARNOLD.OldStatus)
		    ld	    (ix+ARNOLD.Status),	a	    ; Restore previous status

		    ld	    (ix+ARNOLD.COLLISION_CFG), 3    ; Enable collision with the	player and his shots

		    ld	    b, 4			    ; Animation	iterations

SetArnoldWalkSpr:
		    ld	    a, (ix+ARNOLD.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right

SetArnoldWalkSpr2:
		    add	    a, a
		    ld	    c, a			    ; C	= Direction x 2

		    ld	    a, (ix+ARNOLD.ANIM_CNT)
		    and	    b
		    ld	    a, c
		    jr	    z, SetArnoldSpr

		    inc	    a

SetArnoldSpr:
		    add	    a, 7Ch			    ; Left/Right 3/4 x 2 = 6/8 (#82 Arnold left, #84 Arnold right)
		    ld	    (ix+ARNOLD.SpriteId), a
		    ret


SetArnoldSprStill:
		    ld	    a, (ix+ARNOLD.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right

SetArnoldSprStill2:
		    add	    a, a
		    jr	    SetArnoldSpr


;----------------------------------------------------------------------------
;
; Set random wait time
;
;----------------------------------------------------------------------------

SetArnoldRndWait:
		    ld	    a, r
		    xor	    (ix+ACTOR.ANIM_CNT)
		    srl	    a
		    srl	    a
		    srl	    a
		    ld	    b, a
		    srl	    a
		    add	    a, b			    ; x24
		    inc	    a
		    ld	    (ix+ARNOLD.Wait), a
		    ret
