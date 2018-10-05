;----------------------------------------------------------------------------
;
; Tileset used in each room
; Each nibble is the tileset id	of a room
;
;----------------------------------------------------------------------------

 

RoomGfxSetIds:	    db	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0
		    db	  0,   0,   0,	 0, 22h, 22h, 20h,   2,	22h, 52h, 22h, 11h, 11h, 11h, 11h, 11h
		    db	11h, 11h, 11h,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0, 22h, 22h, 21h, 11h
		    db	11h, 11h, 11h, 11h, 10h,   0,	0,   1,	11h, 11h, 12h, 60h, 10h, 41h, 11h, 44h
		    db	44h, 44h, 44h, 44h, 44h, 44h, 44h, 44h,	44h, 44h, 44h, 44h, 44h, 44h, 44h, 44h
		    db	44h, 44h, 44h, 44h, 44h, 44h, 44h, 44h,	44h, 44h, 44h, 44h, 44h, 44h, 44h, 44h
		    db	44h, 44h, 44h, 44h, 44h, 44h, 34h, 44h,	11h, 10h,   4, 44h, 44h, 44h, 11h, 10h
		    db	33h, 30h,   0,	 0,   0,   0,	0,   0,	33h, 33h, 33h, 33h, 33h, 37h



;----------------------------------------------------------------------------
;
; Tilesets index
;
;----------------------------------------------------------------------------
idxTileSets:	    dw TileSetBuilding
		    dw TileSetBasemDeser
		    dw TileSetRoof
		    dw TileSetElevator
		    dw TileSetLorryRoom
		    dw TileSetHindD
		    dw TileSetMetalGear
		    dw TileSetEnding
 
;----------------------------------------------------------------------------
;
; +0: bit7=Load	collision tiles, bit6=Flip tiles
; +1: Number of	tiles to decode
; +3: Destination tile number
; +4: Pointer to gfx data
;
;----------------------------------------------------------------------------

TileSetBuilding:    db 1
		    db 87h
		    db 3
		    dw GfxBuilding

		    db 21h
		    db 28h
		    db 0A8h
		    dw GfxBuilding2

		    db 41h
		    db 0D8h

;
; Basement and desert
;
TileSetBasemDeser:  db 1
		    db 56h
		    db 3
		    dw GfxBasemDesert

		    db 21h
		    db 10h
		    db 0A8h
		    dw GfxBasemDesert2

		    db 41h
		    db 0D8h

;
; Roof
;
TileSetRoof:	    db 1
		    db 6Ch
		    db 3
		    dw GfxRoof
		    db 80h

;
; Elevators and	ladders
;
TileSetElevator:    db 1
		    db 15h
		    db 3
		    dw GfxElevators
		    db 80h

;
; Lorry	and isolated rooms
;
TileSetLorryRoom:   db 1
		    db 8Ah
		    db 3
		    dw GfxLorryRooms
		    db 80h

;
; Hind D
;
TileSetHindD:	    db 1
		    db 8
		    db 3
		    dw GfxHindD

		    db 21h
		    db 25h
		    db 0Bh
		    dw GfxHindD2

		    db 41h
		    db 4Bh

;
; Metal	Gear
;
TileSetMetalGear:   db 1
		    db 7Ch
		    db 3
		    dw GfxBuilding

		    db 21h
		    db 48h
		    db 0A1h
		    dw GfxMetalGear

		    db 80h

;
; Nuclear explosion (ending)
;
TileSetEnding:	    db 1
		    db 2Ah
		    db 1
		    dw GfxEnding

		    db 21h
		    db 0Eh
		    db 0A0h
		    dw GfxEnding2

		    db 41h
		    db 0D0h

;----------------------------------------------------------------------------
;
; Tile collision data index
;
; Each bit sets	the collision property of a tile
;
;----------------------------------------------------------------------------

IdxColisTiles:	    dw CollTilesBuilding
		    dw CollTilesBasem
		    dw CollTilesRoof
		    dw CollTilesElevator
		    dw CollTilesLorry
		    dw CollTilesHindD
		    dw CollTilesMetalGear

CollTilesBuilding:  db 0A7h, 8Fh, 1Fh,0FCh,0CCh,0FFh,0FFh,0CCh,0D3h, 7Fh,0FFh,0FFh,   0,0FAh,	1, 1Fh
		    db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh, 27h,0BFh,0FFh,0FFh,0FFh,0FFh, 27h,0BFh,0FFh,0FFh

CollTilesBasem:	    db 0A7h, 8Fh, 1Fh,0CCh,0FFh,0FFh,0FFh,0FFh,	  0,   0,0CCh, 7Fh,0FFh,0FFh,0FFh,0FFh
		    db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh, 27h,0FFh,0FFh,0FFh,0FFh,0FFh, 27h,0FFh,0FFh,0FFh

CollTilesRoof:	    db 0A7h, 0Fh, 13h, 3Fh,0FFh,0FFh,0FFh,0BFh,	78h, 3Fh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
		    db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0BFh,0FFh,0FFh,0FFh,0FFh,0FFh,0BFh,0FFh,0FFh

CollTilesElevator:  db 0AFh, 30h,0FDh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
		    db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh

CollTilesLorry:	    db 0A7h, 8Fh, 19h, 33h,0FFh,0FFh,0F0h, 9Eh,0E1h,0FFh,0FFh, 3Fh,0FFh,0FFh,0FFh,0FEh
		    db	1Fh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh

CollTilesHindD:	    db 0A6h,0BFh,0EFh,0FFh,0FEh,0DFh,0FFh,0FFh,0FFh,0FEh,0EFh,0FFh,0FEh,0BFh,0FFh,0FFh
		    db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh

CollTilesMetalGear: db 0A7h, 8Fh, 1Fh,0FCh,0FFh,0FFh,0FFh,0FFh,0D3h, 7Fh,0FFh,0FFh,   0,0FAh,	1,0FFh
		    db 0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
