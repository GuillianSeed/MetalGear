
;----------------------------------------------------------------------------
; Enemies size/shape id	(projectiles collision)
; This id is used to get the shape/size	data of	the enemy in order to check collisions with bullets, missile, rocket
;----------------------------------------------------------------------------
ActorShapeProject:  db 0FFh,0FFh,0FFh,	 0,   0,   2,0FFh,0FFh,	  3,   0,   0,	 2,   0,   0, 11h,0FFh
		    db	0Ah, 0Eh,   0,	 0,   0,   0,	2,   0,	14h,   0, 14h,	 0,0FFh,   0,	2,   0
		    db	  0,   0,0FFh, 12h,   2,   4,0FFh,0FFh,	  0,   6,0FFh,	 2,0FFh,0FFh,0FFh,   0
		    db	  0,   0,   0,	 0,   0,0FFh,	0,   0,	  0,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
		    db 0FFh


;----------------------------------------------------------------------------
; Enemies size/shape ids (explosive collision)
; This id is used to get the shape/size	data of	the enemy in order to check collisions with grenades, land mines and plastic bombs
;----------------------------------------------------------------------------
ActorShapeExpl:	    db 0FFh,0FFh,0FFh,	 1,   1,   1,0FFh,0FFh,	  3,   1,   1,	 2,   1,   1, 11h,0FFh
		    db	0Bh, 0Eh,   1,	 1,   1,   1,	2,   1,	15h,   1, 15h,	 1,0FFh,   1,	1,   1
		    db	  1, 1Bh,0FFh, 0Fh,0FFh,   5,0FFh,0FFh,	  1,   6,0FFh,0FFh,0FFh,0FFh,0FFh,   1
		    db	  1,   1,   1,	 1,   1,0FFh,	1,   1,	  1,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
		    db 0FFh

;----------------------------------------------------------------------------
; Enemies size/shape id	(player	collision)
; This id is used to get the shape/size	data of	the enemy in order to check collisions with the	player
;----------------------------------------------------------------------------
ActorsShapeTouch:   db 0FFh,   7,0FFh,	 8,   8,   8,	8,   8,	0Dh,   8,   8, 0Fh,   8,   8, 10h,0FFh
		    db 0FFh, 0Ch,   8,	 8,   8,   8, 0Fh,   8,	19h,   8, 19h,	 8,   8,   8,	8,   8
		    db	  8, 1Ah,   8, 13h,   9,0FFh, 0Fh,   8,	  8,0FFh, 0Fh,	 8,   8, 0Fh,	9,   8
		    db	17h, 17h, 17h, 17h,   8,   9, 18h, 17h,	  8,   9,   9,	 9,   9,   9, 0Fh,0FFh
		    db	16h

;----------------------------------------------------------------------------
; Damage caused	by touching an enemy
;----------------------------------------------------------------------------
ActorTouchDamage:   db	  0,   0,   0,	 2,   2,   0, 10h,   0,0FFh,   2,   2, 20h,   2,   2,0FFh,0FFh
		    db	  0,0FFh,   2,	 2,   2,   2, 20h,   2,	  2,   8,   2,	 2,   0,   2,	2,   8
		    db	  4,   4,   0,	 4,   8,   0,	0,   0,	  4,   0,   8,	 0,   0,   0,	8,   2
		    db	  0,   0,   0,	 0,   0, 10h,	0,   0,	  4,   8,   8,	 8,   8,   8, 10h,   0
		    db	10h

;----------------------------------------------------------------------------
; Shapes/sizes of actors used to check "touch" events
;
; Offset Y, distance Y,	offset X, distance X
;----------------------------------------------------------------------------
ImpactAreasInfo:    db 0F0h, 10h,   0,	 8
		    db	  0, 14h,   0, 14h
		    db	  0,   8,   0,	 8
		    db 0E8h, 18h,   0, 18h
		    db 0E0h, 20h,   0, 10h
		    db 0E0h, 10h,   0, 10h
		    db 0DCh, 20h,   0, 10h
		    db	  0,   8,   0, 10h
		    db	  0,   8,   0, 0Ch
		    db	10h, 0Ch,   0,	 8
		    db 0D0h, 30h,   0, 20h
		    db 0F0h, 10h,   0, 20h
		    db	  8, 18h,   0, 20h
		    db 0E8h, 18h,   0, 20h
		    db	  0, 18h,   0, 18h
		    db	14h, 10h,   0, 10h
		    db	48h, 48h,   0, 0Ch
		    db	48h, 48h,   0, 10h
		    db	  4, 10h,   0,	 8
		    db	14h,   8,   0, 0Ch
		    db	  0, 10h,   0, 10h
		    db 0F8h, 14h,   0, 14h
		    db	10h, 18h,   0, 18h
		    db 0F8h, 10h,   0, 10h
		    db 0F8h, 20h,   0, 20h
		    db	  0, 0Ch,   0, 0Ch
		    db 0FCh,   8,   0, 0Ch
		    db	  0, 14h,   0, 10h