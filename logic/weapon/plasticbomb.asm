;----------------------------------------------------------------------------
;
; Check	if the player sets a plastic bomb
;
;----------------------------------------------------------------------------

ChkPBombShot:
		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    10h				    ; Fire button pressed?
		    ret	    z

		    ld	    a, PLASTIC_BOMB
		    call    GetWeaponInvAdd		    ; Pointer to the weapon in inventory
		    inc	    hl
		    ld	    (TempData),	hl

		    ld	    a, (hl)			    ; Plastic bomb units (low byte)
		    inc	    hl
		    or	    (hl)			    ; Has plastic bombs?
		    ret	    z				    ; No

		    ld	    a, (PlayerShotsList)
		    and	    a
		    ret	    nz				    ; Only one plastic bomb can	be set

		    ld	    ix,	PlayerShotsList
		    call    ReserveShotSpr		    ; Reserve the sprites needed for the plastic bomb
		    ret	    nc				    ; Not enough free sprites

		    ld	    hl,	(TempData)
		    ld	    c, 1			    ; Use type:	the item is consumable and removed from	inventory if all units are used
		    call    DecItemUnits

		    ld	    (ix+PLAYER_SHOT.Timer), 30h	    ; Plastic bomb timer
		    ld	    (ix+PLAYER_SHOT.KILL_BY_CONTACT), 0	; Does not kill	by contact

		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    dec	    a
		    add	    a, a
		    add	    a, a
		    ld	    de,	PBombDirOffset		    ; Location offsets depending on the	direction
		    call    ADD_DE_A

		    ld	    a, (de)
		    ld	    c, a
		    inc	    de
		    ld	    a, (de)
		    ld	    b, a			    ; BC = offset Y

		    inc	    de
		    ld	    hl,	(PlayerYdec)
		    add	    hl,	bc
		    ld	    (ix+PLAYER_SHOT.Ydec), l
		    ld	    (ix+PLAYER_SHOT.Y),	h	    ; Plastic bomb Y

		    ld	    a, (de)
		    ld	    c, a
		    inc	    de
		    ld	    a, (de)
		    ld	    b, a			    ; BC = offset X

		    ld	    hl,	(PlayerXdec)
		    add	    hl,	bc
		    ld	    (ix+PLAYER_SHOT.Xdec), l
		    ld	    (ix+PLAYER_SHOT.X),	h	    ; Plastic bomb X

		    ld	    (ix+PLAYER_SHOT.SpriteID), 6    ; Plastic bomb sprite ID

		    ld	    a, 17h			    ; SFX: Plastic bomb/mine set
		    call    SetSoundEntryChk

		    jp	    SetShotSpr			    ; Add to shot structure the	attributes of the sprites used


;----------------------------------------------------------------------------
;
; Plastic bomb location	offsets	depending on the direction
;
;----------------------------------------------------------------------------
PBombDirOffset:	    db	  0,-10h,   0,	 0
		    db	  0,   8,   0,	 0
		    db	  0,   0,   0,-0Ch
		    db	  0,   0,   0, 0Ch


;----------------------------------------------------------------------------
;
; Plastic bomb logic
;
;----------------------------------------------------------------------------

PlayerPBombLogic:
		    ld	    a, (ix+PLAYER_SHOT.status)
		    call    JumpIndex

		    dw PBombTimer
		    dw PBombExplode
		    dw MedExplosionLogic



;----------------------------------------------------------------------------
;
; Plastic bomb countdown
;
;----------------------------------------------------------------------------

PBombTimer:
		    dec	    (ix+PLAYER_SHOT.Timer)	    ; Decrement	plastic	bomb timer
		    ret	    nz				    ; Do not explode yet

		    ld	    (ix+PLAYER_SHOT.KILL_BY_CONTACT), 1
		    jr	    PBombNextStat



;----------------------------------------------------------------------------
;
; Plastic bomb explode
;
;----------------------------------------------------------------------------

PBombExplode:
		    ld	    a, 1Ch			    ; SFX plastic bomb/mine explosion
		    call    SetSoundEntryChk

		    ld	    (ix+PLAYER_SHOT.Timer), 0Fh	    ; Explosion	timer
		    ld	    (ix+PLAYER_SHOT.SpriteID), 7    ; Medium explosion sprite ID

		    call    ChkAlertTrigger		    ; Check if the explosion triggers the alert

PBombNextStat:
		    inc	    (ix+PLAYER_SHOT.status)	    ; Set next plastic bomb status
		    ret



;----------------------------------------------------------------------------
;
; Medium explosion logic
;
;----------------------------------------------------------------------------

MedExplosionLogic:
		    ld	    (ix+PLAYER_SHOT.KILL_BY_CONTACT), 0

		    dec	    (ix+PLAYER_SHOT.Timer)	    ; Decrement	explosion timer
		    jp	    z, RemoveShot		    ; Explosion	finished

		    ld	    a, (ix+PLAYER_SHOT.Timer)
		    ld	    c, 7			    ; Medium explosion frame 1 sprite ID
		    cp	    0Ah
		    jr	    nc,	MedExplosionLogic2

		    inc	    c				    ; Medium explosion frame 2 sprite ID
		    cp	    5
		    jr	    nc,	MedExplosionLogic2

		    inc	    c				    ; Medium explosion frame 3 sprite ID

MedExplosionLogic2:
		    ld	    (ix+PLAYER_SHOT.SpriteID), c
		    jp	    SetShotSpr			    ; Add to shot structure the	attributes of the sprites used

