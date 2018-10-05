;----------------------------------------------------------------------------
;
; Check	if the player uses a weapon
;
; Weapons can't be used in elevators, water, inside the cardboard box or while skydiving
;----------------------------------------------------------------------------

ChkWeaponShot:
		    ld	    a, (SelectedWeapon)
		    and	    a
		    ret	    z				    ; No weapon	selected

		    ld	    a, (Room)
		    cp	    204
		    ret	    z				    ; Brick wall (parachute)

		    cp	    224
		    ret	    nc				    ; Inside elevator

		    ld	    a, (PlayerAnimation)	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    cp	    2
		    ret	    z				    ; In water

		    cp	    4
		    ret	    z				    ; In deep water

		    cp	    7
		    ret	    z				    ; Inside the box

		    ld	    a, (SelectedWeapon)
		    dec	    a
		    call    JumpIndex

		    dw ChkHandGunShot
		    dw ChkSMGShot
		    dw ChkGrenadeShot
		    dw ChkFireRocket
		    dw ChkPBombShot
		    dw ChkLMineShot
		    dw ChkMissileShot

;----------------------------------------------------------------------------
;
; Get pointer to an empty shot structure (if available)
;
; Out:
;  IX =	Shot data address
;  Cy =	It is not possible to add another shot
;
;----------------------------------------------------------------------------

GetEmptyShotDat:
		    ld	    hl,	PlayerShotsList
		    ld	    de,	40h			    ; Shot structure size
		    ld	    b, 6			    ; Max. number of shots

GetEmptyShotDat2:
		    ld	    a, (hl)
		    and	    a
		    jp	    z, GetEmptyShotDat3

		    add	    hl,	de
		    djnz    GetEmptyShotDat2

		    and	    a
		    ret


GetEmptyShotDat3:
		    push    hl
		    pop	    ix
		    scf
		    ret

;----------------------------------------------------------------------------
;
; Reserve the needed sprites for the shot and add them to the actor
;
; In:
;   IX = Pointer to shot structure/actor
;
; Out:
;   Cy = Sprites reserved
;   NC = It was	not possible to	reserve	the sprites
;
;----------------------------------------------------------------------------

ReserveShotSpr:
		    ld	    a, (SelectedWeapon)
		    dec	    a
		    ld	    hl,	NumSprShot		    ; Number of	sprites	per shot type
		    call    ADD_HL_A

		    ld	    c, (hl)			    ; Number of	sprites	used per shot type

		    push    ix
		    pop	    iy				    ; IY = IX

		    ld	    de,	20h			    ; Offset to	number of sprites used by the actor
		    add	    iy,	de
		    ld	    (iy+0), c			    ; Number of	sprites	used
		    inc	    iy				    ; Pointer to layer+attributes of actor's sprites

		    ld	    hl,	SprShootsAtt
		    ld	    e, 4			    ; First shot sprite	layer
		    ld	    b, 6

ReserveShotSpr2:
		    ld	    a, (hl)
		    cp	    0E0h			    ; Free sprite?
		    jr	    nz,	ReserveShotSpr3

		    ld	    (iy+0), e			    ; Sprite layer
		    ld	    (hl), 0E1h
		    dec	    c				    ; Decrement	number of sprites used/needed
		    jp	    z, ReserveShotSpr4		    ; All sprites reserved

		    inc	    iy				    ; Sprite Y
		    inc	    iy				    ; Sprite X
		    inc	    iy				    ; Sprite pattern
		    inc	    iy				    ; Sprite color
		    inc	    iy				    ; Pointer to next sprite layer in the actor	structure

ReserveShotSpr3:
		    inc	    e				    ; Next sprite layer

		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl				    ; Pointer to next sprite attributes	in RAM buffer
		    djnz    ReserveShotSpr2

;Could not reserve enough sprites for the shot
		    push    ix
		    pop	    hl

		    call    RemoveShot			    ; Release actor and	sprite

		    xor	    a				    ; Clear carry flag
		    ret


ReserveShotSpr4:
		    ld	    a, (SelectedWeapon)
		    ld	    (ix+0), a			    ; Shot ID/type
		    ld	    (ix+1), 0
		    ld	    (ix+2), 0
		    scf					    ; Carry flag = Sprites reserved
		    ret

;----------------------------------------------------------------------------
; Number of sprites used by each shot of a weapon
;----------------------------------------------------------------------------
NumSprShot:	    db	  1
		    db	  1				    ; SMG
		    db	  2				    ; Grenade
		    db	  4				    ; Rocket
		    db	  4				    ; Plastic bomb
		    db	  2				    ; Land mine
		    db	  4				    ; Missile


;----------------------------------------------------------------------------
;
; Player shots logic
;
;----------------------------------------------------------------------------

PlayerShotsLogic:
		    ld	    hl,	PlayerShotsList
		    ld	    b, 6			    ; Max. number of player shots

PlayerShotsLogic2:
		    push    bc
		    push    hl

		    ld	    a, (hl)
		    and	    a				    ; Empty shot structure?
		    call    nz,	PlayerShotLogic

		    pop	    hl
		    ld	    de,	40h			    ; Shot structure size
		    add	    hl,	de			    ; Pointer to next shot structure
		    pop	    bc

		    djnz    PlayerShotsLogic2
		    ret


PlayerShotLogic:
		    push    hl
		    pop	    ix

		    inc	    a				    ; ID = FF?
		    jp	    z, RemoveShot		    ; Release the actor	and sprites used

		    dec	    a
		    dec	    a				    ; Adjust shot IDs to start at 0
		    call    JumpIndex

		    dw PlayerBulletLogic
		    dw PlayerBulletLogic
		    dw PlayerGrenadeLogic
		    dw PlayerRocketLogic
		    dw PlayerPBombLogic
		    dw PlayerMineLogic
		    dw PlayerMissileLogic


;----------------------------------------------------------------------------
;
; Update player	shots sprites from structures to sprites attributes in RAM
;
;----------------------------------------------------------------------------

SetPlayerShotSpr:
		    ld	    hl,	PlayerShotsList
		    ld	    b, 6			    ; Max. number of player shots

SetPlayerShotSpr2:
		    push    bc
		    push    hl

		    ld	    a, (hl)
		    and	    a				    ; Empty shot structure?
		    jr	    z, SetPlayerShotSpr5

		    ld	    a, 20h			    ; +#20 = Number of sprites
		    call    ADD_HL_A

		    ld	    b, (hl)			    ; Number of	sprites
		    inc	    hl
		    ld	    c, 0FFh			    ; for the LDIs

SetPlayerShotSpr3:
		    push    bc
		    ld	    a, (hl)			    ; Sprite layer
		    ld	    de,	SprAttRAM
		    add	    a, a
		    add	    a, a			    ; Sprite layer x4
		    ld	    b, a			    ; Save offset to sprite attributes
		    call    ADD_DE_A			    ; DE = pointer to sprite attributes

		    inc	    hl
		    ldi					    ; Sprite Y
		    ldi					    ; Sprite X
		    ldi					    ; Sprite pattern
		    push    hl

		    ld	    de,	SpritesColors
		    ld	    a, b			    ; B	= Sprite layer x4
		    call    HL_4xA			    ; Layer x 16 (16 lines per sprite)
		    add	    hl,	de

		    ex	    de,	hl			    ; DE = Pointer to sprite color table

		    pop	    hl				    ; HL = Pointer to sprite color attribute

		    ld	    a, (hl)			    ; Sprite color
		    inc	    hl
		    ld	    b, 16			    ; Number of	sprite lines

SetPlayerShotSpr4:
		    ld	    (de), a			    ; Set the color in all lines
		    inc	    de
		    djnz    SetPlayerShotSpr4

		    pop	    bc
		    djnz    SetPlayerShotSpr3

SetPlayerShotSpr5:
		    pop	    hl
		    ld	    de,	40h			    ; Player shot structure size
		    add	    hl,	de			    ; Pointer to next structure
		    pop	    bc

		    djnz    SetPlayerShotSpr2

		    ret



;----------------------------------------------------------------------------
;
; Update player's shot position
;
;----------------------------------------------------------------------------

MovePlayerShot:
		    ld	    e, (ix+PLAYER_SHOT.Ydec)
		    ld	    d, (ix+PLAYER_SHOT.Y)	    ; DE = Shoot Y

		    ld	    l, (ix+PLAYER_SHOT.speedYdec)
		    ld	    h, (ix+PLAYER_SHOT.speedY)	    ; HL = Shot	speed

		    add	    hl,	de			    ; Calc. shot Y

		    ld	    (ix+PLAYER_SHOT.Ydec), l
		    ld	    (ix+PLAYER_SHOT.Y),	h

MovePlayerShotX:
		    ld	    e, (ix+PLAYER_SHOT.Xdec)
		    ld	    d, (ix+PLAYER_SHOT.X)	    ; DE = Shot	X

		    ld	    l, (ix+PLAYER_SHOT.speedXdec)
		    ld	    h, (ix+PLAYER_SHOT.speedX)	    ; HL = Shot	speed X

		    add	    hl,	de			    ; Calc. shot X

		    ld	    (ix+PLAYER_SHOT.Xdec), l
		    ld	    (ix+PLAYER_SHOT.X),	h
		    ret


MovePlayerShotAlt:
		    call    MovePlayerShotX

MovePlayerShotAlt2:
		    ld	    e, (ix+PLAYER_SHOT.Ydec_Alt)
		    ld	    d, (ix+PLAYER_SHOT.Y_Alt)	    ; Same Y used by the player

		    ld	    l, (ix+PLAYER_SHOT.speedYdec)
		    ld	    h, (ix+PLAYER_SHOT.speedY)

		    add	    hl,	de

		    ld	    (ix+PLAYER_SHOT.Ydec_Alt), l
		    ld	    (ix+PLAYER_SHOT.Y_Alt), h	    ; Same Y used by the player
		    ret


;----------------------------------------------------------------------------
;
; Check	shot collision with tiles
;
;----------------------------------------------------------------------------

ChkShotCollision:
		    ld	    l, (ix+PLAYER_SHOT.Y)
		    jr	    ChkShotCollision2


;----------------------------------------------------------------------------
;
; Check	shot collision with tiles
;
;----------------------------------------------------------------------------

ChkShotCollisionA:
		    ld	    l, (ix+PLAYER_SHOT.Y_Alt)	    ; Same Y used by the player

ChkShotCollision2:
		    ld	    c, (ix+PLAYER_SHOT.Direction)
		    ld	    b, 2			    ; Size/Shape
		    ld	    h, (ix+PLAYER_SHOT.X)
		    jp	    ChkTileCollision_

;----------------------------------------------------------------------------
;
; Check	if the shot is in the screen boundaries
; If not, remove the shot and sprites used
;
;----------------------------------------------------------------------------

ChkShotBoundaries:
		    ld	    a, (ix+PLAYER_SHOT.Y)
		    cp	    184				    ; Bottom and top limits
		    jp	    nc,	RemoveShot

		    ld	    a, (ix+PLAYER_SHOT.X)
		    cp	    248				    ; Right limit
		    jp	    nc,	RemoveShot

		    cp	    9				    ; Left limit
		    ret	    nc

RemoveShot:
		    push    ix
		    pop	    de

		    ld	    (ix+PLAYER_SHOT.ID), 0		    ; Disable the actor

		    ld	    a, PLAYER_SHOT.NumSprites
		    call    ADD_DE_A

		    ld	    a, (de)			    ; Number of	sprites	used by	the actor
		    ld	    b, a

		    inc	    de				    ; Pointer to sprite	layer

RemoveShot2:
		    ld	    a, (de)			    ; Sprite layer

		    ld	    hl,	SprAttRAM
		    add	    a, a
		    call    ADD_HL_2A

		    ld	    (hl), 0E0h			    ; Hides/set	free the sprite

		    inc	    de				    ; Sprite Y
		    inc	    de				    ; Sprite X
		    inc	    de				    ; Sprite pattern
		    inc	    de				    ; Sprite color
		    inc	    de				    ; Sprite layer
		    djnz    RemoveShot2
		    ret
