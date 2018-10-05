
;----------------------------------------------------------------------------
;
; Check	if the player launches a grenade
;
;----------------------------------------------------------------------------

ChkGrenadeShot:
		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    10h				    ; Fire button pressed?
		    ret	    z				    ; No

		    ld	    a, GRENADE_LAUNCHER
		    call    GetWeaponInvAdd		    ; Pointer to item in inventory
		    inc	    hl
		    ld	    (TempData),	hl

		    ld	    a, (hl)			    ; Ammo amount (low byte)
		    inc	    hl
		    or	    (hl)			    ; Has grenades?
		    ret	    z				    ; No

		    call    GetEmptyShotDat		    ; Get a pointer to an empty	shot structure
		    ret	    nc				    ; Can't add more shots

		    call    ReserveShotSpr		    ; Reserve the sprites needed for this shot
		    ret	    nc				    ; Can't add more sprites

		    ld	    hl,	(TempData)
		    ld	    c, 0			    ; Use type:	item is	not removed
		    call    DecItemUnits		    ; Decrement	number of grenades

		    ld	    (ix+PLAYER_SHOT.Timer), 18h	    ; Range counter
		    ld	    (ix+PLAYER_SHOT.KILL_BY_CONTACT), 0	; Does not kill	by contact

		    ld	    a, (PlayerY)
		    ld	    (ix+PLAYER_SHOT.Ydec), 0
		    ld	    (ix+PLAYER_SHOT.Ydec_Alt), 0
		    sub	    16
		    ld	    (ix+PLAYER_SHOT.Y),	a
		    ld	    (ix+PLAYER_SHOT.Y_Alt), a	    ; Same Y used by the player

		    ld	    a, (PlayerX)
		    ld	    (ix+PLAYER_SHOT.Xdec), 0
		    ld	    (ix+PLAYER_SHOT.X),	a

		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    ld	    (ix+PLAYER_SHOT.Direction),	a

		    ld	    hl,	GrenadeSpeeds		    ; X	and Y speeds of	the grenade depending on the direction
		    call    ADD_HL_2A_DEC

		    ld	    (ix+PLAYER_SHOT.speedYdec),	0
		    ld	    a, (hl)
		    ld	    (ix+PLAYER_SHOT.speedY), a	    ; Grenade speed Y

		    inc	    hl
		    ld	    (ix+PLAYER_SHOT.speedXdec),	0
		    ld	    a, (hl)
		    ld	    (ix+PLAYER_SHOT.speedX), a	    ; Grenade speed X

		    ld	    (ix+PLAYER_SHOT.SpriteID), 1    ; Grenade sprite ID

		    ld	    a, 12h			    ; SFX Grenade launch
		    call    SetSoundEntryChk		    ; Play SFX

		    jp	    SetShotSpr			    ; Add to shot structure the	attributes of the sprites used


;----------------------------------------------------------------------------
; Speeds of the	grenade	depending on the direction
;----------------------------------------------------------------------------
GrenadeSpeeds:	    db -3
		    db 0
		    db 3
		    db 0
		    db 0
		    db -3
		    db 0
		    db 3


;----------------------------------------------------------------------------
;
; Player grenade logic
;
;----------------------------------------------------------------------------

PlayerGrenadeLogic:
		    ld	    a, (ix+PLAYER_SHOT.status)
		    call    JumpIndex

		    dw MoveGrenade
		    dw SmallExplosionLogic



;----------------------------------------------------------------------------
;
; Grenade movement logic
; Update the grenade coordinates, and the visual coordinates to	simulate a parabole
;
;----------------------------------------------------------------------------

MoveGrenade:
		    dec	    (ix+PLAYER_SHOT.Timer)	    ; Decrement	explosion timer
		    jp	    z, GrenadeExplode

		    call    MovePlayerShotAlt		    ; Update "real" grenade coordinates

		    ld	    a, (ix+PLAYER_SHOT.Timer)
		    ld	    hl,	GrenadeYOffsets		    ; Parabole movements Y offsets
		    call    ADD_HL_A			    ; Get pointer to parabole Y	offset

		    ld	    h, (hl)
		    ld	    l, 0
		    ld	    e, (ix+PLAYER_SHOT.Ydec_Alt)
		    ld	    d, (ix+PLAYER_SHOT.Y_Alt)	    ; Same Y used by the player
		    add	    hl,	de
		    ld	    (ix+PLAYER_SHOT.Ydec), l
		    ld	    (ix+PLAYER_SHOT.Y),	h	    ; Update "visual" grenade coordinates

		    call    ChkShotBoundaries		    ; Check if the grenade exits the room

		    jp	    SetShotSpr			    ; Add to shot structure the	attributes of the sprites used


;----------------------------------------------------------------------------
; Grenade parabole Y offsets
;----------------------------------------------------------------------------
GrenadeYOffsets:    db	10h
		    db	  8
		    db	  0
		    db	 -4,  -8,-0Ch,-10h,-14h,-18h,-1Ch,-20h,-24h,-26h,-28h,-26h,-24h,-20h,-1Ch,-18h
		    db -14h,-10h,-0Ch,	-8,  -4,   0



;----------------------------------------------------------------------------
;
; Grenade explode logic
; Play explosion SFX and setup explosion animation
;
;----------------------------------------------------------------------------

GrenadeExplode:
		    ld	    a, 1Ah			    ; SFX explosion
		    call    SetSoundEntryChk		    ; Play SFX

		    inc	    (ix+PLAYER_SHOT.status)	    ; Next grenade status

		    ld	    (ix+PLAYER_SHOT.Timer), 0Fh	    ; Explosion	timer
		    ld	    (ix+PLAYER_SHOT.SpriteID), 3    ; Explosion	sprite ID
		    ld	    (ix+PLAYER_SHOT.KILL_BY_CONTACT), 1	; Kills	by contact

		    jp	    ChkAlertTrigger		    ; Check if the explosion triggers the alert




;----------------------------------------------------------------------------
;
; Small	explosion logic	(grenade and mine)
;
;----------------------------------------------------------------------------

SmallExplosionLogic:
		    ld	    (ix+PLAYER_SHOT.KILL_BY_CONTACT), 0	; Kills	only when the grenade explodes

		    dec	    (ix+PLAYER_SHOT.Timer)	    ; Decrement	explosion timer
		    jp	    z, RemoveShot		    ; Remove the sprites and set free the shot structure

		    ld	    a, (ix+PLAYER_SHOT.Timer)
		    cp	    0Ah
		    ld	    c, 3			    ; Explosion	frame 1	sprite ID
		    jr	    nc,	SmallExplosionLogic2

		    cp	    5
		    inc	    c				    ; Explosion	frame 2	sprite ID
		    jr	    nc,	SmallExplosionLogic2

		    inc	    c				    ; Explosion	frame 3	sprite ID

SmallExplosionLogic2:
		    ld	    (ix+PLAYER_SHOT.SpriteID), c    ; Set the sprite ID	of current explosion frame
		    jp	    SetShotSpr			    ; Add to shot structure the	attributes of the sprites used



