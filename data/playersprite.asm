;----------------------------------------------------------------------------
;
; Solid	Snake sprites index
;
;----------------------------------------------------------------------------

idxSnakeSpr:	    dw SprSnakeUp
		    dw SprSnakeUp1
		    dw SprSnakeUp2
		    dw SprSnakeDown
		    dw SprSnakeDown1
		    dw SprSnakeDown2
		    dw SprSnakeLeft
		    dw SprSnakeLeft1
		    dw SprSnakeLeft2
		    dw SprSnakeRight
		    dw SprSnakeRight1			    ; 10
		    dw SprSnakeRight2
		    dw SprSnakeUpW
		    dw SprSnakeUp1W
		    dw SprSnakeUp2W
		    dw SprSnakeDownW
		    dw SprSnakeDown1W
		    dw SprSnakeDown2W
		    dw SprSnakeLeftW
		    dw SprSnakeLeft1W
		    dw SprSnakeLeft2W			    ; 20
		    dw SprSnakeRightW
		    dw SprSnakeRight1W
		    dw SprSnakeRight2W
		    dw SprSnakePunchU
		    dw SprSnakePunchD
		    dw SprSnakePunchL
		    dw SprSnakePunchR
		    dw SprSnakeWaterU
		    dw SprSnakeWaterD
		    dw SprSnakeWaterL			    ; 30
		    dw SprSnakeWaterR
		    dw SprSnakeWaterUW
		    dw SprSnakeWaterDW
		    dw SprSnakeWaterLW
		    dw SprSnakeWaterRW
		    dw SprParachute
		    dw SprWaterShadow
		    dw SprWaterShadow2
		    dw SprSnakeClimb1
		    dw SprSnakeClimb2			    ; 40
		    dw SprSnakeLeaned			    ; Dying animation
		    dw SprBox
		    dw SprSnakeDead
		    dw SprBox
		    dw SprSnakeWaterU			    ; (!?) Repeated sprites. Perhaps the water animation used more frames?
		    dw SprSnakeWaterD
		    dw SprSnakeWaterL
		    dw SprSnakeWaterR
		    dw SprSnakeWaterUW
		    dw SprSnakeWaterDW
		    dw SprSnakeWaterLW
		    dw SprSnakeWaterRW

;----------------------------------------------------------------------------
;
; Attributes sets IDs
;
;----------------------------------------------------------------------------
SnakeSprAttIds:	    db	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0
		    db	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 6,   1,   1,	1,   1
		    db	  1,   1,   1,	 1,   5,   4,	4,   0,	  0,   2,   3,	 7,   8,   9,	9,   9
		    db	  9,   9,   9,	 9,   9

;----------------------------------------------------------------------------
;
; Solid	Snake sprite attributes	index
;
;----------------------------------------------------------------------------
idxSnakeSprAttr:    dw SnakeAttrShare
		    dw SnakeAttrWater
		    dw SnakeAttrShare			    ; Dying (!?) Probably it had its own attributes
		    dw SnakeAttrBox
		    dw WaterShadowAttr
		    dw SnakeAttrParach
		    dw SnakeAttrPunchR
		    dw SnakeAttrDead
		    dw SnakeAttrBox2
		    dw SnakeAttrWaterW

;----------------------------------------------------------------------------
; Solid	Snake sprite attributes
;
; +0: Number of	sprites
; +1: Y	offset,	X offset, spr. pattern , color (bit6=CC	bit, OR	color)
;
;----------------------------------------------------------------------------
SnakeAttrShare:	    db 4
		    db 0E8h,0F8h,   0,	 7
		    db 0E8h,0F8h,   4, 4Ah
		    db 0F8h,0F8h,   8,	 7
		    db 0F8h,0F8h, 0Ch, 4Ch

SnakeAttrWater:	    db 4
		    db 0F6h,0F8h,   0,	 7
		    db 0F6h,0F8h,   4, 4Ah
		    db	80h,   0,   0,	 0
		    db	80h,   0,   0,	 0

SnakeAttrBox:	    db 4
		    db 0E4h,0F8h,   0,	 7
		    db 0E4h,0F8h,   4, 4Ah
		    db 0F4h,0F8h,   8,	 7
		    db 0F4h,0F8h, 0Ch, 4Ah

WaterShadowAttr:    db 4
		    db 0F8h,0F8h,   0, 0Eh
		    db 0F8h,0F8h,   4, 0Fh
		    db	80h,   0,   0,	 0
		    db	80h,   0,   0,	 0

SnakeAttrParach:    db 12
		    db 0E8h,0F8h, 28h,	 7
		    db 0E8h,0F8h, 2Ch, 4Ah
		    db 0F8h,0F8h,   0,	 7
		    db 0F8h,0F8h,   4, 4Ch
		    db 0C8h,0F0h,   8, 0Dh
		    db 0C8h,0F0h, 0Ch, 4Eh
		    db 0C8h,   0, 10h, 0Dh
		    db 0C8h,   0, 14h, 4Eh
		    db 0D8h,0F0h, 18h, 0Dh
		    db 0D8h,0F0h, 1Ch, 0Fh
		    db 0D8h,   0, 20h, 0Dh
		    db 0D8h,   0, 24h, 0Fh

SnakeAttrPunchR:    db 4
		    db 0E8h,0FBh,   0,	 7
		    db 0E8h,0FBh,   4, 4Ah
		    db 0F8h,0F8h,   8,	 7
		    db 0F8h,0F8h, 0Ch, 4Ch

SnakeAttrDead:	    db 6
		    db 0E8h,0F8h,   0,	 7		    ;
		    db 0E8h,0F8h,   4, 4Ah		    ;
		    db 0F8h,0F8h,   8,	 7		    ;
		    db 0F8h,0F8h, 0Ch, 4Ch		    ;
		    db	80h,   0,   0,	 0		    ; (!?) Empty sprites. Perhaps where	used to	add blood (seen	on old screenshot)
		    db	80h,   0,   0,	 0

SnakeAttrBox2:	    db 4
		    db 0E3h,0F8h,   0,	 7
		    db 0E3h,0F8h,   4, 4Ah
		    db 0F3h,0F8h,   8,	 7
		    db 0F3h,0F8h, 0Ch, 4Ah

SnakeAttrWaterW:    db 4
		    db 0F5h,0F8h,   0,	 7
		    db 0F5h,0F8h,   4, 4Ah
		    db	80h,   0,   0,	 0
		    db	80h,   0,   0,	 0

SnakeAttrDamage:    db 4
		    db	  0,   0,   0,	 8
		    db	  0,   0,   0, 47h
		    db	  0,   0,   0,	 8
		    db	  0,   0,   0, 47h