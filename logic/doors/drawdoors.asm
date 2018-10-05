;----------------------------------------------------------------------------
;
; Draw the doors in the	room
; Only closed doors are	drawn
;
;----------------------------------------------------------------------------

DrawDoors:
		    ld	    a, (DoorsInRoom)		    ; Number of	doors in the room
		    and	    a				    ; Any door in the room?
		    ret	    z				    ; No

		    ld	    b, a			    ; Number of	doors
		    ld	    hl,	DoorsList		    ; Pointer to array of doors	structures

DrawDoors2:
		    push    bc
		    push    hl

		    inc	    hl				    ; +1

		    ld	    a, (hl)
		    and	    a				    ; Is it open?
		    jr	    z, DrawDoors3		    ; Yes, no need to draw it

		    inc	    hl
		    inc	    hl				    ; +3
		    ld	    a, (hl)			    ; Type of door

		    inc	    hl
		    inc	    hl
		    ld	    e, (hl)			    ; Door Y

		    inc	    hl
		    ld	    d, (hl)			    ; Door X
		    ld	    (TempData),	de		    ; Door XY

		    call    DrawDoorType

DrawDoors3:
		    pop	    hl
		    ld	    de,	10h			    ; door structure size
		    add	    hl,	de			    ; Pointer to next door data
		    pop	    bc

		    djnz    DrawDoors2			    ; Check next door

DrawDoorDummy:
		    ret


DrawDoorType:
		    dec	    a
		    call    JumpIndex

		    dw DrawDoorNorth
		    dw DrawDoorSouth
		    dw DrawDoorWest
		    dw DrawDoorEast
		    dw DrawDoorElevator
		    dw DrawDoorDummy
		    dw DrawBasemWall60
		    dw DrawBasemWall61
		    dw DrawBasemWall59_96
		    dw DrawBasemWall58
		    dw DrawBasemWall63
		    dw DrawWallPrison2
		    dw DrawWallPrison2_
		    dw DrawWallPrison1
		    dw DrawWallPrison
		    dw DrawWallBuil3_108
		    dw DrawBasemWall93
		    dw DrawBasemWall100
		    dw DrawWallBasem112

;----------------------------------------------------------------------------
;
; Draw south door
;
;----------------------------------------------------------------------------

DrawDoorSouth:
		    ld	    de,	(TempData)		    ; Door location XY
		    ld	    hl,	0E0C0h			    ; Gfx. coordinates in VRAM page 1
		    ld	    bc,	2008h			    ; NX,NY
		    ld	    a, 48h
		    call    VDP_Copy_Dot		    ; Draw door

		    ld	    bc,	401h			    ; Width and	height in tiles
		    ld	    de,	(TempData)

PutDoorCollTiles:
		    ld	    hl,	DoorClosedTiles		    ; Transparent but collision	tiles
		    jp	    DrawTileBlkTimp2


;----------------------------------------------------------------------------
;
; Draw west door. Draw a 8x32 gfx in perspective
;
;----------------------------------------------------------------------------

DrawDoorWest:
		    ld	    b, 8			    ; NX (width)
		    ld	    de,	(TempData)		    ; Door XY
		    ld	    hl,	0E0A0h			    ; Door bitmap coordinates in VRAM page 1

DrawDoorWest2:
		    push    bc
		    push    hl
		    push    de

		    ld	    bc,	120h			    ; NX,NY (1,32)
		    ld	    a, 48h
		    call    VDP_Copy_Dot		    ; Draw 1 line of the door

		    pop	    de
		    pop	    hl

		    inc	    e
		    inc	    e
		    inc	    e
		    inc	    e				    ; DY + 4

		    inc	    d				    ; DX + 1

		    inc	    h				    ; SX+1
		    pop	    bc
		    djnz    DrawDoorWest2

		    ld	    de,	(TempData)
		    ld	    a, d
		    sub	    8
		    ld	    d, a			    ; Door X - 8
		    jr	    SetDoorEWColl


;----------------------------------------------------------------------------
;
; Draw east door. Draw a 8x32 gfx in perspective
;
;----------------------------------------------------------------------------

DrawDoorEast:
		    ld	    b, 8			    ; NX
		    ld	    de,	(TempData)		    ; Door XY
		    ld	    a, 28
		    add	    a, e
		    ld	    e, a			    ; Door X + 28
		    ld	    hl,	0E8A0h			    ; Door bitmap coordinates in VRAM page 1

DrawDoorEast2:
		    push    bc
		    push    hl
		    push    de

		    ld	    bc,	120h			    ; NX,NY (1,32)
		    ld	    a, 48h
		    call    VDP_Copy_Dot		    ; Draw 1 line of the door

		    pop	    de
		    pop	    hl

		    dec	    e
		    dec	    e
		    dec	    e
		    dec	    e				    ; DY - 4

		    inc	    d				    ; DX + 1

		    inc	    h				    ; Bitmap SX	+ 1

		    pop	    bc
		    djnz    DrawDoorEast2

		    ld	    de,	(TempData)

SetDoorEWColl:
		    ld	    bc,	204h			    ; Door size	in tiles (2x4) = 16x32
		    ld	    a, 20h
		    add	    a, e
		    ld	    e, a			    ; Dooy Y + 32 (collision zone)
		    jp	    PutDoorCollTiles		    ; Set transparent collision	tiles


;----------------------------------------------------------------------------
;
; Draw north door
;
;----------------------------------------------------------------------------

DrawDoorNorth:
		    ld	    de,	(TempData)		    ; Door XY
		    ld	    hl,	0C4A0h			    ; Door bitmap coordinates in VRAM page 1
		    ld	    bc,	1820h			    ; NX,NY (24	x 32)
		    ld	    a, 48h
		    call    VDP_Copy_Dot		    ; Draw door

		    ld	    bc,	404h			    ; Door size	in tiles (4 x 4)
		    ld	    de,	(TempData)
		    ld	    a, d
		    sub	    b
		    ld	    d, a			    ; DX - 4
		    jr	    PutDoorCollTiles



;----------------------------------------------------------------------------
;
; Draw elevator	door
;
;----------------------------------------------------------------------------

DrawDoorElevator:
		    ld	    de,	(TempData)		    ; Door XY
		    ld	    hl,	0C4C0h			    ; Door bitmap coordinates in VRAM page 1
		    ld	    bc,	1820h			    ; NX,NY (24	x 32)
		    ld	    a, 48h
		    call    VDP_Copy_Dot		    ; Draw door

		    ld	    bc,	404h			    ; Door size	in tiles (4 x 4)
		    ld	    de,	(TempData)
		    ld	    a, d
		    sub	    b
		    ld	    d, a			    ; DX - 4
		    jp	    PutDoorCollTiles




;----------------------------------------------------------------------------
;
; Draw breakable walls
;
;----------------------------------------------------------------------------

DrawBasemWall60:
		    ld	    de,	TilesBasemWall60
		    jr	    DrawWall


DrawBasemWall61:
		    ld	    de,	TilesBasemWall61
		    jr	    DrawWall


DrawBasemWall59_96:
		    ld	    de,	TilesBasemWall59
		    jr	    DrawWall


DrawBasemWall58:
		    ld	    de,	TilesBasemWall58
		    jr	    DrawWall


DrawBasemWall63:
		    ld	    de,	TilesBasemWall63
		    jr	    DrawWall


DrawWallPrison2:
		    ld	    de,	TilesWallPrison2
		    jr	    DrawWall


DrawWallPrison2_:
		    ld	    de,	TilesWallPrison2
		    jr	    DrawWall


DrawWallPrison1:
		    ld	    de,	TilesWallPrison1
		    jr	    DrawWall


; Prison: Elen and GreyFox

DrawWallPrison:
		    ld	    de,	TilesWallPrison
		    jr	    DrawWall


DrawWallBuil3_108:
		    ld	    de,	TilesWallBld3_108
		    jr	    DrawWall


DrawBasemWall93:
		    ld	    de,	TilesBasemWall93
		    jr	    DrawWall


DrawBasemWall100:
		    ld	    de,	TilesBasemWall100
		    jr	    DrawWall


DrawWallBasem112:
		    ld	    de,	TilesBasemWall112



;----------------------------------------------------------------------------
;
; Save background tiles	and draw a tiles block
;
;----------------------------------------------------------------------------

DrawWall:
		    ld	    hl,	(TempData)		    ; Wall XY

		    push    hl
		    push    de
		    call    SaveBackgTiles		    ; Save a block of background tiles
		    pop	    hl
		    pop	    de

		    jp	    DrawTileBlkTimp		    ; Draw a block of tiles


