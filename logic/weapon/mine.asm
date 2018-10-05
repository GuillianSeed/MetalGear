;----------------------------------------------------------------------------
;
; Check	if the player sets a land mine
;
;----------------------------------------------------------------------------

ChkLMineShot:
		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    10h				    ; Fire button pressed?
		    ret	    z

		    ld	    a, LAND_MINE
		    call    GetWeaponInvAdd		    ; Pointer to the land mines	in the inventory

		    inc	    hl
		    ld	    (TempData),	hl		    ; Pointer to number	of mines

		    ld	    a, (hl)
		    inc	    hl
		    or	    (hl)			    ; Has mines?
		    ret	    z				    ; No mines left

		    call    GetEmptyShotDat		    ; Get a pointer to an empty	shot structure
		    ret	    nc				    ; Can't put the mine

		    call    ReserveShotSpr		    ; Reserve sprites needed for the land mine
		    ret	    nc				    ; There are	no enough free sprites

		    ld	    hl,	(TempData)
		    ld	    c, 1			    ; Type: consumable item
		    call    DecItemUnits		    ; Decrement	number of mines

		    ld	    (ix+PLAYER_SHOT.KILL_BY_CONTACT), 1	; Kills	by contact

		    ld	    a, (PlayerY)
		    ld	    (ix+PLAYER_SHOT.Y),	a	    ; Mine Y
		    ld	    (ix+PLAYER_SHOT.Ydec), 0

		    ld	    a, (PlayerX)
		    ld	    (ix+PLAYER_SHOT.X),	a	    ; Mine X
		    ld	    (ix+PLAYER_SHOT.Xdec), 0

		    ld	    (ix+PLAYER_SHOT.SpriteID), 0Ah  ; Mine sprite ID

		    ld	    a, 17h			    ; SFX plastic bomb/mine set
		    call    SetSoundEntryChk

		    jp	    SetShotSpr			    ; Add to shot structure the	attributes of the sprites used


;----------------------------------------------------------------------------
;
; Mine logic
;
;----------------------------------------------------------------------------

PlayerMineLogic:
		    ld	    a, (ix+PLAYER_SHOT.status)
		    call    JumpIndex

		    dw MineDummy
		    dw MineExplode
		    dw SmallExplosionLogic


;----------------------------------------------------------------------------
;
; Mine explode
;
;----------------------------------------------------------------------------

MineExplode:
		    ld	    a, 1Ch			    ; SFX plastic bomb/mine explosion
		    call    SetSoundEntryChk

		    inc	    (ix+PLAYER_SHOT.status)	    ; Next status (small explosion)

		    ld	    (ix+PLAYER_SHOT.KILL_BY_CONTACT), 0	; The explosion	does not kill by contact
		    ld	    (ix+PLAYER_SHOT.Timer), 0Fh	    ; Explosion	timer
		    ld	    (ix+ACTOR.SpriteId), 3	    ; Small explosion sprite ID

		    call    ChkAlertTrigger		    ; Check if the explosion triggers the alert

;----------------------------------------------------------------------------
;
; Do nothing. Just wait	until an enemy touchs the mine
;
;----------------------------------------------------------------------------

MineDummy:
		    ret