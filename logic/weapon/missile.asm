
;----------------------------------------------------------------------------
;
; Check	if the player launches a missile
;
;----------------------------------------------------------------------------

ChkMissileShot:
		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    10h				    ; Fire button pressed?
		    ret	    z

		    ld	    a, MISSILE
		    call    GetWeaponInvAdd		    ; Get pointer to missiles in inventory
		    inc	    hl
		    ld	    (TempData),	hl

		    ld	    a, (hl)			    ; Number of	missiles (low byte)
		    inc	    hl
		    or	    (hl)			    ; Does the player have missiles?
		    ret	    z				    ; No missiles left

		    ld	    a, (PlayerShotsList)
		    and	    a
		    ret	    nz				    ; Only one missile each time

		    ld	    ix,	PlayerShotsList
		    call    ReserveShotSpr		    ; Reserve sprites needed for the missile
		    ret	    nc				    ; Not enough free sprites

		    ld	    hl,	(TempData)
		    ld	    c, 1			    ; Type: consumable item
		    call    DecItemUnits		    ; Decrement	missiles

		    ld	    (ix+PLAYER_SHOT.KILL_BY_CONTACT), 1	; The missile kills by contact

		    ld	    a, (PlayerY)
		    ld	    (ix+PLAYER_SHOT.Ydec), 0
		    ld	    (ix+PLAYER_SHOT.Ydec_Alt), 0
		    ld	    (ix+PLAYER_SHOT.Y_Alt), a	    ; Same Y used by the player
		    sub	    10h
		    ld	    (ix+PLAYER_SHOT.Y),	a	    ; Missile Y

		    ld	    a, (PlayerX)
		    ld	    (ix+PLAYER_SHOT.Xdec), 0
		    ld	    (ix+PLAYER_SHOT.X),	a	    ; Missile X

		    ld	    a, 14h			    ; SFX missile launched
		    call    SetSoundEntryChk

		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right

SetMissileSpr:
		    ld	    (ix+PLAYER_SHOT.Direction),	a   ; Missile direction

		    ld	    hl,	MissileIniSpeed		    ; Missile speeds depending on the direction
		    call    ADD_HL_2A_DEC

		    ld	    (ix+PLAYER_SHOT.speedYdec),	0
		    ld	    a, (hl)
		    ld	    (ix+PLAYER_SHOT.speedY), a	    ; Missile speed Y

		    inc	    hl
		    ld	    (ix+PLAYER_SHOT.speedXdec),	0
		    ld	    a, (hl)
		    ld	    (ix+PLAYER_SHOT.speedX), a	    ; Missile speed X

		    ld	    (ix+PLAYER_SHOT.SpriteID), 0Bh  ; Missile sprite ID

		    ld	    de,	idxSprMissile
		    call    LoadSprMissilRocket		    ; Load missile sprites depending on	its direction

		    jp	    SetShotSpr			    ; Add to shot structure the	attributes of the sprites used



;----------------------------------------------------------------------------
; Missiles speeds per direction
;----------------------------------------------------------------------------
MissileIniSpeed:    db -4
		    db 0
		    db 4
		    db 0
		    db 0
		    db -4
		    db 0
		    db 4


;----------------------------------------------------------------------------
;
; Missile logic
;
;----------------------------------------------------------------------------

PlayerMissileLogic:
		    ld	    a, (ix+PLAYER_SHOT.status)
		    call    JumpIndex

		    dw ControlMissile
		    dw MissileExplode
		    dw MedExplosionLogic



;----------------------------------------------------------------------------
;
; Missile remote control logic
;
;----------------------------------------------------------------------------

ControlMissile:
		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    rra
		    ld	    c, DIR_UP
		    jr	    c, ControlMissile2		    ; Up

		    inc	    c
		    rra
		    jr	    c, ControlMissile2		    ; Down

		    inc	    c
		    rra
		    jr	    c, ControlMissile2		    ; Left

		    inc	    c
		    rra
		    jr	    nc,	ControlMissile3		    ; Right

ControlMissile2:
		    ld	    a, c
		    call    SetMissileSpr		    ; Update the missile direction, speed and sprite

ControlMissile3:
		    call    MovePlayerShot		    ; Update missile position (upper point)
		    call    MovePlayerShotAlt2		    ; Update missile position (lower point)

		    call    ChkShotCollision		    ; Check collision with tiles (upper)
		    jr	    nc,	ControlMissile4

		    call    ChkShotCollisionA		    ; Check collision with tiles (lower)
		    jr	    c, NextMissileStat

ControlMissile4:
		    call    ChkShotBoundaries		    ; Check room boundaries

		    ld	    de,	idxSprMissile
		    call    LoadSprMissilRocket		    ; Update missile sprites depending on its direction

		    jp	    SetShotSpr			    ; Add to shot structure the	attributes of the sprites used



;----------------------------------------------------------------------------
;
; Missile explode logic
;
;----------------------------------------------------------------------------

MissileExplode:
		    ld	    a, 1Ah			    ; SFX explosion
		    call    SetSoundEntryChk

		    ld	    (ix+PLAYER_SHOT.KILL_BY_CONTACT), 0	; The explosion	does not kill by contact
		    ld	    (ix+PLAYER_SHOT.Timer), 0Fh	    ; Explosion	timer
		    ld	    (ix+ACTOR.SpriteId), 7	    ; Medium explosionsprite ID

		    call    ChkAlertTrigger		    ; Check if the explosion triggers the alert

NextMissileStat:
		    inc	    (ix+PLAYER_SHOT.status)	    ; Next status
		    ret
