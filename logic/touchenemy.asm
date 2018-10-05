
;----------------------------------------------------------------------------
;
; Check	if the player touches an enemie/actor
;
;----------------------------------------------------------------------------

ChkTouchEnemies:
		    xor	    a
		    ld	    (isOnBridge), a		    ; Not on a bridge by default

		    ld	    ix,	EnemyList		    ; Array of enemies structures

		    ld	    a, (PlayerY)
		    ld	    e, a
		    ld	    a, (PlayerX)
		    ld	    d, a			    ; DE = Player XY

		    ld	    b, 16			    ; Maximum number of	enemies	on a room

ChkTouchEnemies2:
		    push    bc
		    push    de

		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    bit	    7, a			    ; Is the enemy dying?
		    jr	    nz,	ChkTouchEnemies3	    ; Don't check it

		    and	    a				    ; Is the enemy active?
		    call    nz,	ChkTouchEnemy

ChkTouchEnemies3:
		    ld	    de,	80h			    ; Enemy structure size
		    add	    ix,	de			    ; IX = Pointer to next enemy

		    pop	    de
		    pop	    bc
		    djnz    ChkTouchEnemies2

		    ret



;----------------------------------------------------------------------------
;
; Check	if the player touches or punches an enemy
; Scorpion poison by contact
;
; In:
;   IX = Pointer to enemy
;
;----------------------------------------------------------------------------

ChkTouchEnemy:
		    ld	    a, (ix+ACTOR.TOUCH_INFO)	    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
		    and	    1Fh
		    ld	    (ix+ACTOR.TOUCH_INFO), a	    ; Remove "touched" and "punched" flags

		    ld	    a, (ix+ACTOR.ID)		    ; Enemy ID
		    cp	    ID_LASER
		    jp	    z, ChkTouchLaser		    ; Check laser beans

		    bit	    0, (ix+ACTOR.COLLISION_CFG)	    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
		    ret	    z				    ; This enemy can't be "touched"

		    cp	    ID_PITFALL
		    jp	    z, ChkPitfall		    ; Check if the player triggers a pitfall or	falls in it

		    cp	    ID_LASER_SHOT
		    jp	    z, ChkLaserShot		    ; Check if a laser from a camera hits the player

		    ld	    a, (ControlsTrigger)	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    20h				    ; Is the punch button pressed?
		    jr	    z, ChkTouchEnemy2

		    ld	    a, (PlayerAnimation)	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    dec	    a				    ; Is the player punching?
		    call    z, ChkPunchEnemy		    ; Check if the enemy is punched

		    bit	    6, (ix+ACTOR.TOUCH_INFO)	    ; Is the enemy punched?
		    ret	    nz				    ; Enemy punched

ChkTouchEnemy2:
		    ld	    a, (ix+ACTOR.ID)		    ; Enemy type

		    ld	    hl,	ActorsShapeTouch
		    call    GET_HL_A_DEC		    ; Get actor	shape/size
		    ld	    l, a
		    inc	    a
		    ret	    z				    ; #FF = No need to check collision

		    push    de
		    call    GetShapeInfo		    ; Get enemy's shape/size data
		    pop	    de

		    call    ChkArea			    ; Check if the player touchs the enemy
		    ret	    nc

		    ld	    a, (ix+ACTOR.ID)		    ; Actor ID
		    sub	    ID_BRIDGE
		    jp	    z, SetOnBridge		    ; The player is on a bridge

		    ld	    a, (ix+ACTOR.StunnedCnt)
		    and	    a				    ; Is the enemy is stunned?
		    ret	    nz				    ; Yes, no need to check damage

		    set	    7, (ix+ACTOR.TOUCH_INFO)	    ; Touching the player flag

		    ld	    a, (ix+ACTOR.ID)		    ; Enemy type
		    cp	    ID_LAND_MINE		    ; Is it a land mine?
		    jr	    nz,	ChkScorpion

		    ld	    (ix+ACTOR.LIFE), 0		    ; Land mine	destroyed

ChkScorpion:
		    ld	    a, (ix+ACTOR.ID)		    ; Enemy type (!?) No need to get it	again
		    cp	    ID_SCORPION			    ; Is it a scorpion?
		    jr	    nz,	TouchPlayer		    ; No

		    ld	    a, 1
		    ld	    (Poisoned),	a		    ; Set poisoned status

PlayDamageSfx:
		    ld	    a, 10h			    ; SFX damage
		    jp	    SetSoundEntry



;----------------------------------------------------------------------------
;
; The player has been touched by an enemy
; The damage amount depends on the enemy type
; When using the armor,	the damage is reduced to 50% (bullets and similars)
;
;----------------------------------------------------------------------------

TouchPlayer:
		    ld	    a, (ix+ACTOR.ID)		    ; Actor ID
		    cp	    ID_PRISONER1
		    jr	    c, TouchPlayer2

		    cp	    ID_CAMERA_LASER
		    ret	    c				    ; Prisoner,	Ellen, Grey Fox, and Madnar do not cause damage

		    cp	    ID_FAKE_MADNAR
		    ret	    z				    ; Fake Dr. Madnar does not cause damage

TouchPlayer2:
		    ld	    a, (DamageDelayTimer)
		    and	    a
		    ret	    nz				    ; Wait a bit before	damaging again

		    call    PlayDamageSfx		    ; Play damage SFX

		    ld	    a, 20h
		    ld	    (DamageDelayTimer),	a	    ; Set the damage delay to prevent continuos	damage

		    ld	    hl,	ActorTouchDamage	    ; List of damage values caused by each enemy type
		    ld	    (TempData),	hl

		    ld	    a, (ix+ACTOR.ID)		    ; Enemy type

		    push    af
		    dec	    a
		    call    GetTempPHL_A		    ; Get the damage caused by the enemy
		    ld	    b, a			    ; B	= Damage amount
		    pop	    af

		    cp	    ID_SGUNNER_SHOT
		    jr	    z, ChkUsingArmor

		    cp	    ID_GUARD_BULLET
		    jr	    z, ChkUsingArmor

		    cp	    ID_BULLET_HORIZ
		    jr	    c, DecrementLife		    ; Not a bullet

		    cp	    ID_BOOMERANG
		    jr	    nc,	DecrementLife		    ; Big explosion?

ChkUsingArmor:
		    ld	    a, (SelectedItem)
		    cp	    SELECTED_ARMOR		    ; Is the player using the armor?
		    jr	    nz,	DecrementLife		    ; No

		    srl	    b				    ; 50% damage

DecrementLife:
		    jp	    DecrementLife_B
