;----------------------------------------------------------------------------
;
; Weapons sprites index
;
;----------------------------------------------------------------------------
idxSprWeapon:	    dw SprBullet
		    dw SprBullet
		    dw SprGrenade
		    dw idxSprRocket
		    dw SprPlasticBomb
		    dw SprMine
		    dw idxSprRocket


idxSprRocket:	    dw SprRocketUp
		    dw SprRocketDown
		    dw SprRocketLeft
		    dw SprRocketRight


idxSprMissile:	    dw SprMissileUp
		    dw SprMissileDown
		    dw SprMissileLeft
		    dw SprMissileRight


idxShotSprAtt:	    dw SprBulletAttr
		    dw SprGrenadeAttr
		    dw SprRocketAttr
		    dw SprExplosS1Attr			    ; Explosion	(small)
		    dw SprExplosS2Attr
		    dw SprExplosS3Attr
		    dw SpPBombAttr
		    dw SprExplosB1Attr			    ; Explosion	(big)
		    dw SprExplosB2Attr
		    dw SprExplosB3Attr
		    dw SprMineAttr
		    dw SprMissilAttr

;----------------------------------------------------------------------------
;
; Weapons attributes
;
; Offset Y, osset X, sprite pattern, color (bit6= CC, OR color)
;
;----------------------------------------------------------------------------
SprBulletAttr:	    db 0F8h,0F8h, 10h, 0Eh

SprGrenadeAttr:	    db 0F8h,0F8h, 10h,	 7
		    db 0F8h,0F8h, 14h, 4Ah

SprRocketAttr:	    db 0F8h,0F8h, 10h,	 7
		    db 0F8h,0F8h, 14h, 4Ch
		    db	80h, 80h

SprExplosS1Attr:    db 0F8h,0F8h, 20h,	 6
		    db 0F8h,0F8h, 24h, 48h

SprExplosS2Attr:    db 0F8h,0F8h, 28h,	 6
		    db 0F8h,0F8h, 2Ch, 48h

SprExplosS3Attr:    db 0F8h,0F8h, 30h,	 6
		    db 0F8h,0F8h, 34h, 48h

SpPBombAttr:	    db 0F8h,0F8h, 10h,	 7
		    db 0F8h,0F8h, 14h, 4Ah
		    db	80h, 80h

SprExplosB1Attr:    db 0F8h,0F8h, 18h,	 6
		    db 0F8h,0F8h, 1Ch, 48h
		    db	80h, 80h

SprExplosB2Attr:    db 0F8h,0F8h, 20h,	 6
		    db 0F8h,0F8h, 24h, 48h
		    db	80h, 80h

SprExplosB3Attr:    db 0F0h,0F0h, 28h, 0Eh
		    db 0F0h,   0, 2Ch, 0Eh
		    db	  0,0F0h, 30h, 0Eh
		    db	  0,   0, 34h, 0Eh

SprMineAttr:	    db 0F8h,0F8h, 10h, 0Ch
		    db 0F8h,0F8h, 14h, 47h

SprMissilAttr:	    db 0F8h,0F8h, 10h,	 8
		    db 0F8h,0F8h, 14h, 0Fh
		    db	80h, 80h
