;----------------------------------------------------------------------------
;
; High nibble =	Music ID
; 0 = Theme of Tara
; 1 = Sneaking mission
; 2 = TX55 Metal Gear
; 4 = Escape beyond Big	Boss
;
; bit3 = Incoming call (Big boss, Schneider...)
; bits 2-0:
;	1 = Shooting does not trigger the alarm
;     <>0 = Can't use binoculars
;
;----------------------------------------------------------------------------
RoomsMusic:	    db	  8,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0
	IF (JAPANESE)
		    db	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   8,	0,   8
	ELSE
		    db	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   8,	0,   0
	ENDIF
		    db	  0,   0,   0,	 0,   0,   8,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0
		    db	  0,   0,   0,	 0,   0,   8, 10h, 10h,	10h, 10h, 10h, 10h, 10h, 10h, 10h, 10h
		    db	  0,   0,   0,	 0,   0,   8,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0
		    db	  0,   0,   0,	 0,   0,   0,	0,   0,	40h, 40h, 40h, 40h, 40h, 10h, 10h, 10h
		    db	10h, 10h, 10h, 18h, 10h, 10h,	0,   0,	  8,   0,   0,	 0,   8,   0,	0, 18h
		    db	10h, 10h, 10h, 18h, 18h,   0, 20h, 18h,	  0,   0, 11h, 10h, 10h, 18h,	1,   1
		    db	  1,   1,   1,	 1,   1,   1,	1,   1,	  1,   1,   1,	 1,   1,   1,	1,   1
		    db	  1,   1,   1,	 1,   1,   1,	1,   1,	  1,   1,   1,	 1,   1,   1,	1,   1
		    db	  1,   1,   1,	 1, 11h, 19h, 11h, 11h,	11h, 11h, 11h, 11h, 11h,   1,	1,   1
		    db	  1,   1,   9,	 1,   1,   1,	1,   1,	  1,   1, 41h, 41h, 11h, 11h, 11h, 11h
		    db	  9,   9, 11h,	 1, 11h, 11h,	1,   1,	11h,   1,   1, 11h,   1,   1,	1, 11h
		    db	  0,   0,   0,	 0,   0,   1,	1,   1,	  1,   1,   1,	 1, 10h, 10h,	0,   0
		    db	21h, 21h, 21h,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0
		    db	  1,   1,   1,	 1,   1,   1,	1,   1,	  1,   1,   1

;----------------------------------------------------------------------------
;
; Map zones
;
; Each nibble corresponds to a room
;
; 0 = Building 1 - 1st floor and desert
; 1 = Building 1 - 2nd floor
; 2 = Building 1 - 3rd floor
; 3 = Building 1 - roof
; 4 = Building 1 - Basement
; 5 = Building 2 - 1st floor
; 6 = Building 2 - 2nd floor
; 7 = Building 2 - roof
; 8 = Building 2 - Basement
; 9 = Building 2 - desert
; A = Building 3 - 1st floor, Building 2 -1st floor water channel (!?)
;
; There	are some rooms/values that does	not seem to match. Perhaps the rooms where modified/reused for other areas.
;----------------------------------------------------------------------------


idxMapZones:	    db	  0,   0,   0,	 0,   0,   0,	0,   0
		    db	11h, 11h, 11h, 11h, 11h, 11h, 22h, 22h
		    db	22h, 22h, 22h, 22h, 33h, 33h, 33h, 33h
		    db	33h, 33h, 33h, 44h, 44h, 44h, 44h, 44h
		    db	  0,   0,   0, 55h, 55h, 55h, 55h, 56h
		    db	66h, 66h, 66h, 66h, 77h, 77h, 78h, 88h
		    db	88h, 88h, 88h, 55h, 55h, 55h, 99h, 9Ah
		    db 0AAh,0AAh,0A3h,0AAh,   0, 44h, 44h,   0
		    db	  0,   0,   0,	 0,   0,   1, 11h, 11h
		    db	11h, 22h, 22h, 22h, 22h,   0, 22h, 22h
		    db	33h, 33h, 44h, 44h, 44h, 44h, 40h,   0
		    db	55h, 55h, 56h, 66h, 66h, 77h, 88h, 88h
		    db	99h,0A1h, 88h, 60h,0A9h, 68h,	6, 58h
		    db	50h,   5, 55h, 55h, 55h, 55h, 44h,   0
		    db 0AAh,0A0h,   0,	 0,   0,   0,	0,   0
		    db	  0,   0,   0,	 0,   0,   0
