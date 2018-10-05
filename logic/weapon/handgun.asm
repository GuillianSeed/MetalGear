
;----------------------------------------------------------------------------
;
; Check	if the player fires the	hand gun
;
;----------------------------------------------------------------------------

ChkHandGunShot:
		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    10h				    ; Fire button pressed?
		    ret	    z				    ; No

		    ld	    a, HAND_GUN
		    call    GetWeaponInvAdd		    ; Pointer to item in inventory

		    inc	    hl				    ; Pointer to hand gun ammo
		    ld	    (TempData),	hl

		    ld	    a, (hl)
		    inc	    hl
		    or	    (hl)			    ; Has ammo?

		    ld	    a, 15h			    ; Click sfx
		    jp	    z, SetSoundEntryChk		    ; No ammo -> click SFX

		    call    GetEmptyShotDat		    ; Get a pointer to an empty	shot structure
		    ret	    nc				    ; Too many shots on	screen

		    call    ReserveShotSpr		    ; Reserve the sprites needed for this shot
		    ret	    nc				    ; Not enough free sprites

		    ld	    hl,	(TempData)
		    ld	    c, 0			    ; Use type:	item is	not removed
		    call    DecItemUnits		    ; Decrement	ammo amount

		    ld	    (ix+PLAYER_SHOT.Timer), 10h	    ; Shot range counter
		    ld	    (ix+PLAYER_SHOT.KILL_BY_CONTACT), 1	; Kills	by contact

		    ld	    a, (PlayerY)
		    ld	    (ix+PLAYER_SHOT.Ydec), 0
		    ld	    (ix+PLAYER_SHOT.Ydec_Alt), 0
		    ld	    (ix+PLAYER_SHOT.Y_Alt), a	    ; Same Y used by the player
		    sub	    14
		    ld	    (ix+PLAYER_SHOT.Y),	a	    ; Player shots use two Ys (Y and Y - 14)

		    ld	    a, (PlayerX)
		    ld	    (ix+PLAYER_SHOT.Xdec), 0
		    ld	    (ix+PLAYER_SHOT.X),	a

		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    ld	    (ix+PLAYER_SHOT.Direction),	a

		    ld	    hl,	ShootDirSpeeds		    ; X	and Y speeds of	the bullet depending on	the direction
		    call    ADD_HL_2A_DEC
		    ld	    (ix+PLAYER_SHOT.speedYdec),	0
		    ld	    a, (hl)			    ; Shot speed Y
		    ld	    (ix+PLAYER_SHOT.speedY), a

		    inc	    hl
		    ld	    (ix+PLAYER_SHOT.speedXdec),	0
		    ld	    a, (hl)			    ; Shot speed X
		    ld	    (ix+PLAYER_SHOT.speedX), a

		    ld	    (ix+PLAYER_SHOT.SpriteID), 0

		    ld	    a, (InvSupressor)
		    and	    a				    ; Has the supressor?
		    ld	    a, 0Ch			    ; Hand gun shot sfx
		    jr	    z, ChkHandGunShot2		    ; No

		    ld	    a, 0Eh			    ; Supressor	sfx

ChkHandGunShot2:
		    push    af
		    call    SetSoundEntry		    ; Play shot	SFX
		    pop	    af

		    call    z, ChkAlertTrigger		    ; When not using the supressor, check is the noise triggers	the alarm

		    jp	    SetShotSpr


;----------------------------------------------------------------------------
; Speeds of the	bullet depending on the	direction
;----------------------------------------------------------------------------
ShootDirSpeeds:	    dw 0FAh
		    dw 6
		    dw -600h
		    dw 600h


;----------------------------------------------------------------------------
;
; Player bullet	logic
;
;----------------------------------------------------------------------------

PlayerBulletLogic:
		    dec	    (ix+PLAYER_SHOT.Timer)	    ; Decrement	range counter
		    jp	    z, RemoveShot		    ; Remove this shot

		    call    MovePlayerShot
		    call    MovePlayerShotAlt2
		    call    ChkShotCollision
		    jr	    nc,	PlayerBulletlogic2

		    call    ChkShotCollisionA
		    jp	    c, RemoveShot

PlayerBulletlogic2:
		    call    ChkShotBoundaries
		    jp	    SetShotSpr