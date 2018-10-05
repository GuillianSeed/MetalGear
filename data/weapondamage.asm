;----------------------------------------------------------------------------
; Pointers to weapon damage info
;----------------------------------------------------------------------------
idxWeaponPow:	    dw BulletDamage
		    dw BulletDamage
		    dw GrenadeDamage
		    dw RocketDamage
		    dw PlasBombDamage
		    dw MineDamage
		    dw MissileDamage

;----------------------------------------------------------------------------
; +0: Max. number of bullets
; +1...: Damage	caused to each enemy type
;----------------------------------------------------------------------------

		    db 6
BulletDamage:	    db 0FFh,0FFh,0FFh,	 2,   2,   0,0FFh,0FFh,	  0,   2,   2,	 0,   2,   2,	0,0FFh
		    db	  0,   0,   2,	 2,   2,   2,	0,   2,	  2,   0,   2,	 2,0FFh,   2,	2,   0
		    db	  2,   2,0FFh,	 2,   0,   0,0FFh,0FFh,	  2,   2,0FFh,0FFh,0FFh,0FFh,0FFh,   2
		    db	  2,   2,   2,	 2,   0,0FFh,	2,   2,	  2,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
		    db 0FFh


		    db 2
GrenadeDamage:	    db 0FFh,0FFh,0FFh,	 5,   5,   5,0FFh,0FFh,0FFh,   5,   5,0FFh,   5,   5,0FFh,0FFh
		    db 0FFh,   5,   5,	 5,   5,   5,0FFh,   5,	  5,0FFh,   5,	 5,0FFh,   5,	5,   0
		    db	  5,   5,0FFh,	 5,0FFh,   5,0FFh,0FFh,	  5,   5,0FFh,0FFh,0FFh,0FFh,0FFh,   5
		    db	  5,   5,   5,	 5,   0,0FFh,	5,   5,	  5,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
		    db 0FFh


		    db 1
RocketDamage:	    db 0FFh,0FFh,0FFh, 0Ah, 0Ah, 0Ah,0FFh,0FFh,	  0, 0Ah, 0Ah,	 0, 0Ah, 0Ah,	0,0FFh
		    db	  0,   0, 0Ah, 0Ah, 0Ah, 0Ah,	0, 0Ah,	0Ah, 0Ah, 0Ah, 0Ah,0FFh, 0Ah, 0Ah, 0Ah
		    db	0Ah, 0Ah,0FFh, 0Ah,   0,   0,0FFh,0FFh,	0Ah, 0Ah,0FFh,0FFh,0FFh,0FFh,0FFh, 0Ah
		    db	0Ah, 0Ah, 0Ah, 0Ah,   0,0FFh, 0Ah, 0Ah,	0Ah,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
		    db 0FFh


		    db	  1
PlasBombDamage:	    db 0FFh,0FFh,0FFh,	 5,   5,   5,0FFh,0FFh,	  0,   5,   5,	 0,   5,   5,	0,0FFh
		    db	  5,   0,   5,	 5,   5,   5,	0,   5,	  5,   0,   5,	 5,0FFh,   5,	5,   0
		    db	  5,   5,0FFh,	 5,0FFh,   0,0FFh,0FFh,	  5,   5,0FFh,0FFh,0FFh,0FFh,0FFh,   5
		    db	  5,   5,   5,	 5,   0,0FFh,	5,   5,	  5,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
		    db 0FFh


		    db	  3
MineDamage:	    db 0FFh,0FFh,0FFh,	 5,   5,0FFh,0FFh,0FFh,	  5,   5,   5,	 0,   5,   5,	0,0FFh
		    db	  0,   0,   5,	 5,   5,   5,	0,   5,	  5,   0,   5,	 5,0FFh,   5,	5,   0
		    db	  5,   5,0FFh,	 5,0FFh,   0,0FFh,0FFh,	  5,   0,0FFh,	 0,0FFh,0FFh,0FFh,   5
		    db	  5,   5,   5,	 5,0FFh,0FFh,	5,   5,	  5,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
		    db 0FFh


		    db	  1
MissileDamage:	    db 0FFh,0FFh,0FFh,	 5,   5,   5,0FFh,0FFh,	  0,   5,   5,	 0,   5,   5,	0,0FFh
		    db	  0,   0,   5,	 5,   5,   5,	0,   5,	  5,   0,   5,	 5,0FFh,   5,	5,   0
		    db	  5,   5,0FFh,	 5,   0,   0,0FFh,0FFh,	  5,   5,0FFh,	 5,0FFh,0FFh,0FFh,   5
		    db	  5,   5,   5,	 5,   0,0FFh,	5,   5,	  5,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
		    db 0FFh