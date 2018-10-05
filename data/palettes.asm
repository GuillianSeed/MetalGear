;----------------------------------------------------------------------------
; Palette of weapon screen
;----------------------------------------------------------------------------
PalMenuWeapon:	    db	  0,   0,   0
		    db	  6, 70h,   7
		    db	  8, 70h,   0
		    db	0Ch, 33h,   3
		    db	0Eh, 77h,   7
		    db	0Fh,   0,   0
		    db 0FFh

;----------------------------------------------------------------------------
; Palette of radio screen
;----------------------------------------------------------------------------
RadioPalette:	    db	  1, 10h,   2
		    db	  2, 42h,   3
		    db	  3, 55h,   7
		    db	  4, 31h,   2
		    db	  5, 40h,   0
		    db	  9, 23h,   2
		    db	0Bh, 20h,   1
		    db	0Ch, 33h,   3
		    db	0Dh,   5,   2
		    db	0Eh, 77h,   7
		    db	0Fh,   0,   0
		    db 0FFh

;----------------------------------------------------------------------------
;
; Room palettes	ids
; Each nibble is a palette ID
;
;----------------------------------------------------------------------------
IdsRoomPal:	    db	  0,   0,   2, 20h,   2, 20h,	0,   0,	11h, 11h, 11h, 11h, 11h, 11h, 33h, 33h
		    db	33h, 33h, 33h, 33h, 88h, 88h, 88h, 88h,	88h,0C8h, 88h,0EEh,0EEh,0EEh,0EEh,0EEh
		    db	55h, 55h, 55h,	 0,   0,   0,	0,   1,	11h, 11h, 11h, 11h, 88h, 88h, 8Eh,0EEh
		    db 0EEh,0EEh,0EEh, 55h, 50h,   0,	0, 0Eh,0EEh,0EEh,0E8h, 99h, 50h,0EEh,0EEh, 77h
		    db	74h, 77h, 74h, 47h, 46h, 66h, 66h, 66h,	44h, 46h, 46h, 66h, 46h, 66h, 66h, 66h
		    db	64h, 66h, 44h, 44h, 66h, 66h, 67h, 77h,	66h, 66h, 46h, 46h, 66h, 46h, 64h, 44h
		    db	66h, 44h, 66h, 47h, 66h, 44h, 87h, 77h,	55h, 50h,   7, 77h, 77h, 77h,0EEh,   0
		    db	11h, 10h,   0,	 0,   0,   0,	0,   0,	19h, 98h, 81h, 11h, 11h, 1Dh

;----------------------------------------------------------------------------
;
; Index	of palettes used in the	rooms
;
;----------------------------------------------------------------------------
idxRoomPalettes:    dw RoomPalette0
		    dw RoomPalette1
		    dw RoomPalette2
		    dw RoomPalette3
		    dw RoomPalette4
		    dw RoomPalette5
		    dw RoomPalette6
		    dw RoomPalette7
		    dw RoomPalette8
		    dw RoomPalette9
		    dw RoomPalette10
		    dw RoomPalette11
		    dw RoomPalette12
		    dw RoomPalette13
		    dw RoomPalette14
		    dw RoomPalette15

;----------------------------------------------------------------------------
;
; Room palettes
;
;----------------------------------------------------------------------------
RoomPalette0:	    db	  1, 12h,   2
		    db	  3,   1,   1
		    db	  5, 31h,   2
		    db	  9, 20h,   1
		    db 0FFh

RoomPalette1:	    db	  1, 22h,   2
		    db	  3, 11h,   1
		    db	  5, 13h,   2
		    db	  9,   2,   1
		    db 0FFh

RoomPalette2:	    db	  1, 22h,   2
		    db	  3, 11h,   1
		    db	  5, 31h,   2
		    db	  9,   0,   2
		    db 0FFh

RoomPalette3:	    db	  1, 21h,   2
		    db	  3, 10h,   1
		    db	  5, 22h,   2
		    db	  9, 11h,   1
		    db 0FFh

RoomPalette4:	    db	  1, 22h,   2
		    db	  3, 11h,   1
		    db	  5, 12h,   2
		    db	  9,   1,   1
		    db 0FFh

RoomPalette5:	    db	  1, 53h,   4
		    db	  3, 42h,   3
		    db	  5, 41h,   2
		    db	  9, 20h,   2
		    db 0FFh

RoomPalette6:	    db	  1, 22h,   2
		    db	  3, 11h,   1
		    db	  5, 31h,   2
		    db	  9, 20h,   1
		    db 0FFh

RoomPalette7:	    db	  1, 31h,   2
		    db	  3, 20h,   1
		    db	  5, 12h,   2
		    db	  9,   1,   1
		    db 0FFh

RoomPalette8:	    db	  1, 40h,   2
		    db	  3, 30h,   1
		    db	  5, 12h,   2
		    db	  9,   1,   1
		    db 0FFh

RoomPalette9:	    db	  1, 22h,   2
		    db	  3, 10h,   1
		    db	  5, 32h,   3
		    db	  9, 11h,   1
		    db 0FFh

; Gray
RoomPalette10:	    db	  1, 44h,   4
		    db	  3, 11h,   1
		    db	  5, 22h,   2
		    db	  9,   0,   0
		    db 0FFh

;Black
RoomPalette11:	    db	  1,   0,   0
		    db	  3,   0,   0
		    db	  5,   0,   0
		    db	  9,   0,   0
		    db	0Ch,   0,   0
		    db 0FFh

RoomPalette12:	    db	  1, 10h,   3
		    db	  3, 30h,   1
		    db	  5, 12h,   2
		    db	  9,   1,   1
		    db 0FFh

RoomPalette13:	    db	  1, 70h,   4
		    db	  3, 40h,   0
		    db	  8, 70h,   0
		    db	  9, 70h,   7
		    db 0FFh

RoomPalette14:	    db	  1, 22h,   2
		    db	  3, 11h,   1
		    db	  5, 11h,   2
		    db	  9,   0,   1
		    db	0Ch, 33h,   3
		    db 0FFh

RoomPalette15:	    db	  1, 70h,   7
		    db	  3, 40h,   0
		    db	  8, 70h,   4
		    db	  9, 70h,   4
		    db 0FFh

;----------------------------------------------------------------------------
;
; Index	of sprite palette sets
;
;----------------------------------------------------------------------------
idxSprSetPals:	    dw SprsetPal0
		    dw SprsetPalNone
		    dw SprsetPal2
		    dw SprsetPal3
		    dw SprsetPal4
		    dw SprsetPal5
		    dw SprsetPal6
		    dw SprsetPal7
		    dw SprsetPal8
		    dw SprsetPal9
		    dw SprsetPal10
		    dw SprsetPal11
		    dw SprsetPalNone
		    dw SprsetPal13
		    dw SprsetPal14
		    dw SprsetPal15
		    dw SprsetPal16
		    dw SprsetPal17
		    dw SprsetPal18
		    dw SprsetPal19
		    dw SprsetPal20
		    dw SprsetPalNone
		    dw SprsetPal2
		    dw SprsetPal2
		    dw SprsetPal24
		    dw SprsetPal24
		    dw SprsetPalNone
		    dw SprsetPal27
		    dw SprsetPal27
		    dw SprsetPal29
		    dw SprsetPal30
		    dw SprsetPal31

;----------------------------------------------------------------------------
;
; Sprite palette sets
;
; color	index, RGB
;----------------------------------------------------------------------------
SprsetPal0:	    db	  2, 27h,   2
		    db	0Bh, 22h,   2
		    db	0Dh, 55h,   5
SprsetPalNone:	    db 0FFh

SprsetPal2:	    db	  4, 50h,   0
		    db	0Bh, 50h,   0
		    db	  2, 22h,   2
		    db	0Dh, 42h,   3
		    db 0FFh

SprsetPal3:	    db	  2, 21h,   1
		    db	0Dh, 53h,   4
		    db 0FFh

SprsetPal4:	    db	  2, 40h,   0
		    db	0Dh, 70h,   0
		    db 0FFh

SprsetPal5:	    db	  2, 30h,   2
		    db	0Dh, 53h,   4
		    db 0FFh

SprsetPal6:	    db	0Dh, 73h,   4
		    db 0FFh

SprsetPal7:	    db	  2, 21h,   2
		    db	0Dh, 53h,   4
		    db	0Bh, 55h,   5
		    db 0FFh

SprsetPal8:	    db	0Dh, 53h,   4
		    db	0Bh, 41h,   0
		    db 0FFh

SprsetPal9:	    db	  2, 13h,   2
		    db	0Dh, 42h,   3
		    db 0FFh

SprsetPal10:	    db	  2, 12h,   1
		    db	0Dh, 42h,   3
		    db 0FFh

SprsetPal11:	    db	  2, 41h,   2
		    db	0Dh, 53h,   4
		    db 0FFh

SprsetPal13:	    db	0Bh, 12h,   2
		    db 0FFh

SprsetPal14:	    db	0Bh, 12h,   1
		    db 0FFh

SprsetPal15:	    db	  2,   2,   1
		    db	0Bh, 21h,   3
		    db	0Dh, 53h,   4
		    db 0FFh

SprsetPal16:	    db	  2, 77h,   7
		    db	0Dh, 53h,   4
		    db 0FFh

SprsetPal17:	    db	  2, 20h,   2
		    db	0Dh, 53h,   4
		    db 0FFh

SprsetPal18:	    db	  2, 12h,   2
		    db	0Dh, 53h,   4
		    db 0FFh

SprsetPal19:	    db	  2, 44h,   4
		    db	0Dh, 22h,   2
		    db 0FFh

SprsetPal20:	    db	  4, 50h,   0
		    db	0Bh, 50h,   0
		    db	  2, 22h,   2
		    db	0Dh, 53h,   4
		    db 0FFh

SprsetPal24:	    db	  2, 55h,   5
		    db	0Dh, 22h,   2
		    db 0FFh

SprsetPal27:	    db	  2, 21h,   1
		    db	0Dh, 53h,   4
		    db 0FFh

SprsetPal29:	    db	  2, 20h,   0
		    db	0Dh, 42h,   3
		    db 0FFh

SprsetPal30:	    db	  2,   3,   0
		    db	0Dh, 42h,   3
		    db 0FFh

SprsetPal31:	    db	  2,   0,   2
		    db	0Dh, 42h,   3
		    db 0FFh
