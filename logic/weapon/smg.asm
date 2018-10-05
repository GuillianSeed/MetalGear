;----------------------------------------------------------------------------
;
; SMG no ammo SFX
;
;----------------------------------------------------------------------------

SMG_NoAmmo:
		    ld	    a, 15h			    ; Click sfx
		    call    SetSoundEntryChk

ResetSMGunCnt:
		    ld	    (hl), 0
		    inc	    hl
		    ld	    (hl), 0
		    ret



;----------------------------------------------------------------------------
;
; Check	if the player fires the	Sub Machine Gun	(SMG)
;
;----------------------------------------------------------------------------

ChkSMGShot:
		    ld	    hl,	SubMachGunTimer
		    ld	    a, (ControlsHold)		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    10h				    ; Fire button hold?
		    jr	    z, ResetSMGunCnt

		    inc	    (hl)			    ; Increment	autofire timer

		    ld	    a, (hl)
		    cp	    2
		    ret	    nz				    ; Shoot each 2 iterations

		    ld	    (hl), 0			    ; Reset autofire timer

		    inc	    hl
		    inc	    (hl)			    ; Burst direction counter

		    ld	    a, (hl)
		    cp	    9				    ; Burst counter
		    jr	    nz,	chkSMGShot2

		    ld	    (hl), 1			    ; Reset counter

chkSMGShot2:
		    ld	    a, SUB_MACHINE_GUN		    ; Sub machine Gun ID
		    call    GetWeaponInvAdd		    ; Pointer to item in inventory

		    inc	    hl
		    ld	    (TempData),	hl

		    ld	    a, (hl)			    ; Ammo amount (low byte)
		    inc	    hl
		    or	    (hl)			    ; There is ammo?
		    jr	    z, SMG_NoAmmo

		    call    GetEmptyShotDat		    ; Get a pointer to an empty	shot structure
		    ret	    nc				    ; Can't add more shots

		    call    ReserveShotSpr		    ; Reserve the sprites needed for this shot
		    ret	    nc				    ; Can't add more sprites

		    ld	    hl,	(TempData)		    ; Pointer to ammo amount
		    ld	    c, 0			    ; Use type:	item is	not removed
		    call    DecItemUnits		    ; Decrement	ammo

		    ld	    (ix+PLAYER_SHOT.Timer), 10h	    ; Range counter
		    ld	    (ix+PLAYER_SHOT.KILL_BY_CONTACT), 1	; Kills	by contact

		    ld	    a, (PlayerY)
		    ld	    (ix+PLAYER_SHOT.Ydec), 0
		    ld	    (ix+PLAYER_SHOT.Ydec_Alt), 0
		    ld	    (ix+PLAYER_SHOT.Y_Alt), a	    ; Same Y used by the player
		    sub	    14
		    ld	    (ix+PLAYER_SHOT.Y),	a

		    ld	    a, (PlayerX)
		    ld	    (ix+PLAYER_SHOT.Xdec), 0
		    ld	    (ix+PLAYER_SHOT.X),	a

		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    ld	    (ix+PLAYER_SHOT.Direction),	a
		    dec	    a
		    add	    a, a
		    add	    a, a
		    add	    a, a
		    add	    a, a			    ; Direction	x16
		    ld	    hl,	SMG_BulletSpeeds
		    call    ADD_HL_2A			    ; HL = Pointer to burst of bullets speeds

		    ld	    a, (BurstCnt)
		    dec	    a
		    add	    a, a
		    call    ADD_HL_2A			    ; Each bullet in the burst has a different movement

		    ld	    a, (hl)
		    ld	    (ix+PLAYER_SHOT.speedYdec),	a
		    inc	    hl
		    ld	    a, (hl)
		    ld	    (ix+PLAYER_SHOT.speedY), a

		    inc	    hl
		    ld	    a, (hl)
		    ld	    (ix+PLAYER_SHOT.speedXdec),	a
		    inc	    hl
		    ld	    a, (hl)
		    ld	    (ix+PLAYER_SHOT.speedX), a

		    ld	    (ix+PLAYER_SHOT.SpriteID), 0

		    ld	    a, (InvSupressor)
		    and	    a
		    ld	    a, 0Dh			    ; SFX: SMG shot
		    jr	    z, SetSMG_Sfx

		    ld	    a, 0Eh			    ; SFX: Shot	using the supressor

SetSMG_Sfx:
		    push    af
		    call    SetSoundEntryChk		    ; Play SFX
		    pop	    af

		    call    z, ChkAlertTrigger		    ; When not using the supressor, check is the noise triggers	the alarm

		    jp	    SetShotSpr			    ; Add to shot structure the	attributes of the sprites used

;----------------------------------------------------------------------------
;
; SMG bullets speeds
;
; 16 bytes per player direction
; 2 bytes per range
; 8 ranges
;
;----------------------------------------------------------------------------
SMG_BulletSpeeds:   db	  0,0FAh,   0,	 0,   0,0FAh, 80h,0FEh,	  0,0FAh,   0,0FDh,   0,0FAh, 80h,0FEh
		    db	  0,0FAh,   0,	 0,   0,0FAh, 80h,   1,	  0,0FAh,   0,	 3,   0,0FAh, 80h,   1
		    db	  0,   6,   0,	 0,   0,   6, 80h,0FEh,	  0,   6,   0,0FDh,   0,   6, 80h,0FEh
		    db	  0,   6,   0,	 0,   0,   6, 80h,   1,	  0,   6,   0,	 3,   0,   6, 80h,   1
		    db	  0,   0,   0,0FAh, 80h,   1,	0,0FAh,	  0,   3,   0,0FAh, 80h,   1,	0,0FAh
		    db	  0,   0,   0,0FAh, 80h,0FEh,	0,0FAh,	  0,0FDh,   0,0FAh, 80h,0FEh,	0,0FAh
		    db	  0,   0,   0,	 6, 80h,   1,	0,   6,	  0,   3,   0,	 6, 80h,   1,	0,   6
		    db	  0,   0,   0,	 6, 80h,0FEh,	0,   6,	  0,0FDh,   0,	 6, 80h,0FEh,	0,   6
