
;----------------------------------------------------------------------------
;
; Check	if the player launches a rocket
;
;----------------------------------------------------------------------------

ChkFireRocket:
		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    10h				    ; Fire button pressed?
		    ret	    z

		    ld	    a, ROCKET_LAUNCHER		    ; Rocket launcher
		    call    GetWeaponInvAdd		    ; Pointer to the weapon in inventory
		    inc	    hl
		    ld	    (TempData),	hl

		    ld	    a, (hl)			    ; Ammon amount (low	byte)
		    inc	    hl
		    or	    (hl)			    ; Has rockets?
		    ret	    z				    ; No

		    ld	    a, (PlayerShotsList)
		    and	    a
		    ret	    nz				    ; There is already a rocket	in the room

		    ld	    ix,	PlayerShotsList
		    call    ReserveShotSpr		    ; Reserve the sprites needed for the rocket
		    ret	    nc				    ; Not enough free sprites

		    ld	    hl,	(TempData)
		    ld	    c, 0			    ; Use type:	item is	not removed
		    call    DecItemUnits		    ; Decrement	number of rockets

		    ld	    (ix+PLAYER_SHOT.KILL_BY_CONTACT), 1	; Kills	by contact

		    ld	    a, (PlayerY)
		    ld	    (ix+PLAYER_SHOT.Ydec), 0
		    ld	    (ix+PLAYER_SHOT.Ydec_Alt), 0
		    ld	    (ix+PLAYER_SHOT.Y_Alt), a	    ; Rocket Y

		    sub	    16
		    ld	    (ix+PLAYER_SHOT.Y),	a	    ; Rocket Y on screen

		    ld	    a, (PlayerX)
		    ld	    (ix+PLAYER_SHOT.Xdec), 0
		    ld	    (ix+PLAYER_SHOT.X),	a	    ; Rocket X

		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    ld	    (ix+PLAYER_SHOT.Direction),	a

		    ld	    hl,	RocketSpeeds		    ; X	and Y speeds of	the rocket depending on	the direction
		    call    ADD_HL_2A_DEC

		    ld	    (ix+PLAYER_SHOT.speedYdec),	0
		    ld	    a, (hl)
		    ld	    (ix+PLAYER_SHOT.speedY), a	    ; Rocket speed Y

		    inc	    hl
		    ld	    (ix+PLAYER_SHOT.speedXdec),	0
		    ld	    a, (hl)
		    ld	    (ix+PLAYER_SHOT.speedX), a	    ; Rocket speed X

		    ld	    (ix+PLAYER_SHOT.SpriteID), 2    ; Rocket sprite ID

		    ld	    a, 13h			    ; SFX: Rocket/Tanks	shell shot
		    call    SetSoundEntryChk		    ; Play SFX

		    ld	    de,	idxSprRocket
		    call    LoadSprMissilRocket		    ; Load rocket sprite depending on its direction

		    jp	    SetShotSpr			    ; Add to shot structure the	attributes of the sprites used


;----------------------------------------------------------------------------
; Speeds of the	rocket depending on the	direction
;----------------------------------------------------------------------------
RocketSpeeds:	    db	 -5,   0
		    db	  5,   0
		    db	  0,  -5
		    db	  0,   5


;----------------------------------------------------------------------------
;
; Rocket logic
;
;----------------------------------------------------------------------------

PlayerRocketLogic:
		    ld	    a, (ix+PLAYER_SHOT.status)
		    call    JumpIndex

		    dw RocketMove
		    dw RocketExplode
		    dw MedExplosionLogic



;----------------------------------------------------------------------------
;
; Update rocket	position
; Check	collision with tiles
; Check	room boundaries
;
;----------------------------------------------------------------------------

RocketMove:
		    call    MovePlayerShot
		    call    MovePlayerShotAlt2		    ; Update rocket position

		    call    ChkShotCollision		    ; Check collision width tiles (lower part)
		    jr	    nc,	RocketMove2

		    call    ChkShotCollisionA		    ; Check collision width tiles (upper part)
		    jr	    c, NextRocketStat		    ; Set rocket explode status

RocketMove2:
		    call    ChkShotBoundaries		    ; Check if the rocket is in	the room boundaries
		    jp	    SetShotSpr			    ; Add to shot structure the	attributes of the sprites used



;----------------------------------------------------------------------------
;
; Rocket explode logic
;
;----------------------------------------------------------------------------

RocketExplode:
		    ld	    a, 1Ah			    ; SFX explosion
		    call    SetSoundEntryChk

		    ld	    (ix+PLAYER_SHOT.Timer), 15	    ; Explosion	timer
		    ld	    (ix+PLAYER_SHOT.SpriteID), 7    ; Explosion	(medium) sprite	ID
		    ld	    (ix+PLAYER_SHOT.KILL_BY_CONTACT), 0	; Does not kill	by contact

		    call    ChkAlertTrigger		    ; Check if the explosion triggers the alert

NextRocketStat:
		    inc	    (ix+PLAYER_SHOT.status)	    ; Next rocket status
		    ret


