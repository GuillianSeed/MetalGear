;----------------------------------------------------------------------------
;
; Checks if an actor collides with a tile
;
; In:
;   IX = Pointer to actor
;    C = Direction (1=Up, 2=Down, 3=Left, 4=Right)
;    B = Size /	shape
; Out:
;    A = Direction
;   Cy = Collision
;
;----------------------------------------------------------------------------

ChkTileCollision:
		    ld	    l, (ix+ACTOR.Y)
		    ld	    h, (ix+ACTOR.X)		    ; HL = Actor XY

ChkTileCollision_:
		    ld	    (TempData),	hl		    ; Actor XY
		    ld	    a, b			    ; Actor size/shape
		    add	    a, a
		    add	    a, a			    ; Bx4
		    add	    a, c			    ; C=Player direction
		    add	    a, a
		    add	    a, a			    ; B*16 + C*4

		    ld	    hl,	BoxColliderDat-4
		    ld	    d, 0
		    ld	    e, a
		    add	    hl,	de

		    ld	    b, 2			    ; Checks two points	per direction

ChkTileCollision2:
		    ld	    a, (TempData)		    ; Actor Y
		    add	    a, (hl)			    ; Offset Y
		    ld	    e, a
		    inc	    hl

		    ld	    a, (TempData+1)		    ; Actor X
		    add	    a, (hl)			    ; Offset X
		    inc	    hl
		    push    hl

		    ld	    h, a			    ; X
		    ld	    l, e			    ; Y
		    call    CoordToBuffTile		    ; Get pointer to tile in X,Y

		    ld	    d, 0
		    ld	    e, (hl)			    ; Get tile

		    ld	    hl,	CollisionTiles		    ; Collision	property of the	tiles (bit 0 = 1 collision)
		    add	    hl,	de
		    ld	    a, (hl)			    ; Get tile collision property
		    rra

		    pop	    hl
		    jr	    c, ChkTileCollision4

ChkTileCollision3:
		    djnz    ChkTileCollision2

ChkTileCollision4:
		    ld	    a, c			    ; Direction
		    ret


;----------------------------------------------------------------------------
;
; Shapes/sizes used to check collisions
;
;----------------------------------------------------------------------------

; Offset Y, offset X
; Size/shape 0
BoxColliderDat:	    db -5
							    ; Up (-5,-6) & (-5,5)
		    db -6
		    db -5
		    db 5

		    db 4				    ; Down (4,-6) & (4,5)
		    db -6
		    db 4
		    db 5

		    db -4				    ; Left (-4,	-8) & (3, -8)
		    db -8
		    db 3
		    db -8

		    db -4				    ; Right (-4, 7) & (3, 7)
		    db 7
		    db 3
		    db 7



; Size/shape 1
		    db -9				    ; Up (-9,-8) & (-9,	7)
		    db -8
		    db -9
		    db 7

		    db 8				    ; Down (8, -8) & (8, 7)
		    db -8
		    db 8
		    db 7

		    db -8				    ; Left (-8,	-9) & (7, -9)
		    db -9
		    db 7
		    db -9

		    db -8				    ; Right (-8, 8) & (7, 8)
		    db 8
		    db 7
		    db 8


; Size/shape 2
		    db -5				    ; Up (-5, -4) & (-5, 3)
		    db -4
		    db -5
		    db 3

		    db 4				    ; Down (4, -4) & (4, 3)
		    db -4
		    db 4
		    db 3

		    db -4				    ; Left (-4,	-5) & (3, -5)
		    db -5
		    db 3
		    db -5

		    db -4				    ; Right (-4, 4) & (3, 4)
		    db 4
		    db 3
		    db 4



;----------------------------------------------------------------------------
;
; Get the tiles	where the player is
;
; Out:
;    L = left tile
;    H = right tile
;
;----------------------------------------------------------------------------

GetTilePlayer:
		    ld	    a, (PlayerX)
		    sub	    4
		    ld	    h, a
		    ld	    a, (PlayerY)
		    ld	    l, a

GetTileInXY:
		    call    CoordToBuffTile
		    ld	    a, (hl)
		    inc	    hl
		    ld	    l, (hl)
		    ld	    h, a
		    ret

;----------------------------------------------------------------------------
;
; Check	enemy bullet collision
; Bullets do not collide with raillings	(used in water areas)
; Left and right railling are ignored. Also, when a collision is detected, a new check is done two rows	of tiles lower.	This si	done to	let the	bullets	pass the raillings
;
; Out:
;   NC = Not colliding
;----------------------------------------------------------------------------

BulletLogic:
		    ld	    l, (ix+ACTOR.Y)
		    ld	    h, (ix+ACTOR.X)

		    call    CoordToBuffTile

		    ld	    b, 2

BulletLogic2:
		    ld	    d, 0
		    ld	    a, (hl)			    ; Tile number
		    cp	    6Bh				    ; Railling left
		    ret	    z

		    cp	    6Eh				    ; Railling right
		    ret	    z

		    ld	    e, a			    ; DE = tile	number
		    push    hl

		    ld	    hl,	CollisionTiles		    ; Collision	property of the	tiles (bit 0 = 1 collision)
		    add	    hl,	de
		    ld	    a, (hl)			    ; Tile collision property
		    rra					    ; Collision	property

		    pop	    hl

		    ret	    nc				    ; The bullet is not	colliding

		    ld	    de,	40h			    ; Offset to	two tiles lines	down
		    add	    hl,	de
		    djnz    BulletLogic2

		    jp	    DismissActor0
