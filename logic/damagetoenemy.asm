;----------------------------------------------------------------------------
;
; Check	if a player shot hits an enemy
;
;----------------------------------------------------------------------------

ChkPlayerShots:
		    ld	    a, (WeaponInUse)
		    and	    a
		    ret	    z				    ; Any weapon in use

		    ld	    hl,	ActorShapeProject	    ; Hand Gun,	SMG, rocket, missile
		    cp	    GRENADE_LAUNCHER
		    jr	    c, ChkPlayerShots2

		    cp	    ROCKET_LAUNCHER
		    jr	    z, ChkPlayerShots2

		    cp	    MISSILE
		    jr	    z, ChkPlayerShots2

		    ld	    hl,	ActorShapeExpl		    ; Grenade, land mine, plastic bomb

ChkPlayerShots2:
		    ld	    (TempData2), hl		    ; Enemy XY,	MetaTileSetAddr

		    call    GetWeaponDamages		    ; (TempPointer) = Pointer to damage	data

		    ld	    b, a			    ; Maximum number of	simultaneous "bullets"
		    ld	    ix,	PlayerShotsList

ChkPlayerShots3:
		    push    bc
		    ld	    a, (ix+PLAYER_SHOT.ID)		    ; Shot ID
		    and	    a				    ; Is the shot active?
		    call    nz,	ChkHitEnemies

		    ld	    de,	40h			    ; Shot structure size
		    add	    ix,	de			    ; IX = Pointer to next structure

		    pop	    bc
		    djnz    ChkPlayerShots3
		    ret




;----------------------------------------------------------------------------
;
; Check	if any enemy is	hit by a weapon
;
; In:
;   IX = Pointer to player shot	structure
;
;----------------------------------------------------------------------------

ChkHitEnemies:
		    ld	    a, (ix+PLAYER_SHOT.KILL_BY_CONTACT)
		    rra
		    ret	    nc				    ; This weapon does not kill	by contact

		    ld	    iy,	EnemyList		    ; Array of enemies structures
		    ld	    b, 16			    ; Maximum number of	enemies	on a room

ChkHitEnemies2:
		    push    bc

		    ld	    a, (iy+ACTOR.ID)		    ; Actor ID
		    and	    a				    ; Is it empty?
		    call    nz,	ChkEneHitByShot

		    ld	    de,	80h			    ; Enemy structure size
		    add	    iy,	de			    ; IY = pointer to next enemy

		    pop	    bc
		    djnz    ChkHitEnemies2
		    ret




;----------------------------------------------------------------------------
;
; Check	if a enemy is hit by a weapon
; Check	the plastic bombs order	in Metal Gear
;
; In:
;   IX = Pointer to player shot	structure
;   IY = Pointer to enemy structure
;----------------------------------------------------------------------------

ChkEneHitByShot:
		    bit	    1, (iy+ACTOR.COLLISION_CFG)	    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
		    ret	    z				    ; This actor is not	affected by player's shots

		    ld	    a, (iy+ACTOR.ID)		    ; Bit 7 = Killed
		    ld	    hl,	(TempData2)		    ; List of actor shape IDs
		    call    GET_HL_A_DEC		    ; Get the type of shape/size used to check the collision
		    inc	    a
		    ret	    z				    ; This enemy has no	"shape/size"

		    call    GetShapeInfo		    ; Get enemy	shape/size info

		    ld	    a, (iy+ACTOR.TOUCH_INFO)	    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
		    and	    0E0h
		    ld	    (iy+ACTOR.TOUCH_INFO), a	    ; Clear shot ID

		    ld	    a, (iy+ACTOR.Y)		    ; Enemy Y
		    add	    a, (hl)			    ; Actor shape offsetY
		    inc	    hl
		    sub	    (ix+PLAYER_SHOT.Y)		    ; Shot Y
		    jr	    nc,	ChkEnemyHitByShot2

		    neg

ChkEnemyHitByShot2:
		    cp	    (hl)			    ; Detection	area radious Y (NY / 2)
		    ret	    nc				    ; Different	Y range

		    inc	    hl
		    ld	    a, (iy+ACTOR.X)		    ; Enemy X
		    add	    a, (hl)			    ; Add shape/size offset X
		    inc	    hl
		    sub	    (ix+PLAYER_SHOT.X)
		    jr	    nc,	ChkEnemyHitByShot3

		    neg

ChkEnemyHitByShot3:
		    cp	    (hl)			    ; Shape radious X
		    ret	    nc				    ; Different	X range

		    ld	    c, (ix+PLAYER_SHOT.status)

; Rocket, land mine and	missile	explode	by contact

		    ld	    a, (ix+PLAYER_SHOT.ID)		    ; FF = Remove actor	and release sprites
		    cp	    ROCKET_LAUNCHER
		    jr	    z, ChkEnemyHitByShot4

		    cp	    LAND_MINE
		    jr	    z, ChkEnemyHitByShot4

		    cp	    MISSILE
		    jr	    nz,	ChkEnemyHitByShot5

ChkEnemyHitByShot4:
		    inc	    c
		    dec	    c
		    jr	    nz,	ChkEnemyHitByShot5	    ; Already exploding

		    inc	    (ix+PLAYER_SHOT.status)	    ; Exploding

ChkEnemyHitByShot5:
		    ld	    a, (ix+PLAYER_SHOT.ID)		    ; Shot ID
		    or	    (iy+ACTOR.TOUCH_INFO)	    ; Add shot ID to bits0-3
		    ld	    (iy+ACTOR.TOUCH_INFO), a	    ; Save shot	ID

		    ld	    a, (iy+ACTOR.ID)		    ; Actor ID
		    dec	    a
		    call    GetTempPHL_A
		    ld	    c, a			    ; Damage of	weapon to enemy
		    inc	    a
		    jr	    z, NoDamage

;
; Check	plastic	bombs on Metal Gear
;
		    ld	    a, (WeaponInUse)
		    cp	    PLASTIC_BOMB		    ; Using plastic bombs?
		    jr	    nz,	DecEnemyLife		    ; No

		    ld	    a, (iy+ACTOR.ID)		    ; Actor ID
		    cp	    ID_METAL_GEAR		    ; Is it Metal Gear?
		    jr	    nz,	DecEnemyLife		    ; No

		    ld	    a, (ix+PLAYER_SHOT.status)
		    dec	    a				    ; Is it exploding?
		    jr	    nz,	NoDamage		    ; No

		    ld	    a, (iy+ACTOR.X)		    ; Metal Gear X (center point)
		    cp	    (ix+PLAYER_SHOT.X)		    ; Is the bomb in the right or left leg?

		    ld	    a, 1			    ; Left
		    jr	    nc,	ChkBombOrder

		    inc	    a				    ; Right

ChkBombOrder:
		    ld	    de,	 BombOrderBuffer+0Fh
		    ld	    hl,	 BombOrderBuffer+0Eh
		    ld	    bc,	0Fh
		    lddr

		    ld	    (de), a			    ; Save bomb	location in the	sequence

		    ld	    hl,	PlasticBombOrder
		    ld	    b, 10h

ChkBombOrder2:
		    ld	    a, (de)
		    cp	    (hl)			    ; Is the bomb located in the right order?
		    jr	    nz,	NoDamage		    ; No

		    inc	    de
		    inc	    hl
		    djnz    ChkBombOrder2

		    xor	    a
		    ld	    (EnemyListEntry1+0Dh), a	    ; Actor.LIFE: Kill laser camera 1
		    ld	    (EnemyListEntry2+0Dh), a	    ; Actor.LIFE: Kill laser camera 2

		    ld	    c, 2			    ; Metal Gear life points

DecEnemyLife:
		    ld	    a, (iy+ACTOR.LIFE)		    ; 0=Kill the actor
		    sub	    c				    ; Damage value
		    jr	    nc,	SetEnemyLife

		    xor	    a				    ; No life

SetEnemyLife:
		    ld	    (iy+ACTOR.LIFE), a		    ; Set the remaining	life value

NoDamage:
		    ld	    a, (ix+PLAYER_SHOT.ID)		    ; Shot/weapon ID
		    cp	    GRENADE_LAUNCHER
		    jp	    c, RemoveShot		    ; Remove the bullet	(hand gun or SMG). The other weapons explode

		    ret

;----------------------------------------------------------------------------
;
; Plastic bombs	(inverted: last...first) secuence in Metal Gear
; R,R,L,R,L,L,R,L,L,R,R,L,R,L,R,R
;
;----------------------------------------------------------------------------
PlasticBombOrder:   db B_RIGHT
		    db B_RIGHT
		    db B_LEFT
		    db B_RIGHT
		    db B_LEFT
		    db B_RIGHT
		    db B_RIGHT
		    db B_LEFT
		    db B_LEFT
		    db B_RIGHT
		    db B_LEFT
		    db B_LEFT
		    db B_RIGHT
		    db B_LEFT
		    db B_RIGHT
		    db B_RIGHT
