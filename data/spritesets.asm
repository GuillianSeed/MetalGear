;----------------------------------------------------------------------------
;
; Spritesets used in each room
;
; A spriteset is a "pack" of sprites used in that room
;----------------------------------------------------------------------------
SpritesetRooms:	    db	  2,   2,   2,	29,   2,   2,	6,   2,	  2,  23,   6,	 2,   2,   2,  22,   2
		    db	 23,   2,   2,	 2,  11,  22,  29,  29,	 29,  29,  28,	22,  22,  24,	2,  22
		    db	  2,   2,   2,	29,  22,  23,	2,   2,	  5,   5,   5,	29,   5,  21,  21,  29
		    db	  5,  29,  12,	 2,  29,   2,	2,   6,	  6,  10,   6,	 6,   6,   6,	6,   6
		    db	 23,  13,  13,	13,  29,  29,  31,  14,	 31,  31,  31,	31,  23,  31,  31,  31
		    db	 30,  31,  31,	15,  31,  30,  30,  30,	 31,   5,  31,	31,   5,  26,  24,  16
		    db	 24,  24,  24,	 1,  24,  24,	4,   4,	 23,   2,   2,	 2,  29,  26,  20,  20
		    db	 24,  26,  24,	20,   1,   1,  25,  18,	  1,   1,   1,	 1,   1,   1,	2,   2
		    db	  1,   3,   2,	 2,   2,   2,	3,   1,	  3,   2,  28,	 1,  28,  19,	1,   1
		    db	  3,   3,   3,	 2,   3,   2,	2,   1,	  3,  19,   5,	 1,  29,   2,	2,   3
		    db	  5,   3,   5,	 2,   9,   1,	8,   8,	  1,   1,   1,	 1,   1,   1,	1,   1
		    db	 31,  31,  31,	31,   3,  31,	7,  30,	 30,  30,   3,	 5,   1,   7,	3,  19
		    db	  1,  17,   3,	 3,   1,   1,	3,   1,	  1,   1,   3,	 3,   1,  19,	2,   6
		    db	  4,   4,   4,	 2,   2,   0,	0,   0,	 29,   0,   0,	 0,   2,   5,	0,   0
		    db	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0,   0,   0,	0,   0
		    db	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0

;----------------------------------------------------------------------------
;
; Spritesets index
;
;----------------------------------------------------------------------------
idxSprSet:	    dw SprSetElevator
		    dw SprSetNone
		    dw SprSetGuard
		    dw SprSetPrisoner
		    dw SprSetScorpion
		    dw SprSetJetGuard			    ; 5
		    dw SprSetDog
		    dw SprSetMadnar
		    dw SprSetElen
		    dw SprSetPrisoner2
		    dw SprSetSGunner			    ; 10
		    dw SprSetMGunKid
		    dw SprSetHindD
		    dw SprSetTank
		    dw SprSetBulldozer
		    dw SprSetArnold			    ; 15
		    dw SprSetFireTrop
		    dw SprSetCowardDuck
		    dw SprSetBigBoss
		    dw SprSetRolBarrel
		    dw SprSetLaserCam2			    ; 20
		    dw SprSetBridge
		    dw SprSetCamGuard
		    dw SprSetExpGuard
		    dw SprSetGas
		    dw SprSetLaserCam			    ; 25
		    dw SprSetNone
		    dw SprSetPrisDog
		    dw SprZzzGuard
		    dw SprSetGuard
		    dw SprSetGuard			    ; 30
		    dw SprSetGuard

;----------------------------------------------------------------------------
;
; Spritesets
;
; +0: First sprite pattern
; +1: Pointer to sprite	gfx
;----------------------------------------------------------------------------
SprSetElevator:	    db 38h
		    dw SprElevator
SprSetNone:	    db 0FFh

SprSetGuard:	    db 50h
		    dw SprBullet
		    db 60h
		    dw SprGuard
		    db 0E0h
		    dw SprZzz
		    db 0FFh

SprSetPrisoner:	    db 0D0h
		    dw SprPrisoner
		    db 0FFh

SprSetScorpion:	    db 60h
		    dw SprScorpion
		    db 0FFh

SprSetJetGuard:	    db 38h
		    dw SprExplosionS
		    db 60h
		    dw SprGuard
		    db 50h
		    dw SprBullet
		    db 60h
		    dw SprJetGuard
		    db 0E0h
		    dw SprShadow
		    db 0FFh

SprSetDog:	    db 60h
		    dw SprDog
		    db 0FFh

SprSetMadnar:	    db 0D0h
		    dw SprMadnar
		    db 0FFh

SprSetElen:	    db 0D0h
		    dw SprElen
		    db 0FFh

SprSetPrisoner2:    db 0D0h
		    dw SprPrisoner2
		    db 0FFh

SprSetSGunner:	    db 60h
		    dw SprShotGunner
		    db 0A0h
		    dw SprSGunnerShot
		    db 0FFh

SprSetMGunKid:	    db 50h
		    dw SprBullet
		    db 60h
		    dw SprMGunKid
		    db 0FFh

SprSetHindD:	    db 38h
		    dw SprExplosionS
		    db 50h
		    dw SprBullet
		    db 60h
		    dw SprAirScrew
		    db 0E0h
		    dw SprExplosionB
		    db 0FFh

SprSetTank:	    db 38h
		    dw SprExplosionS
		    db 50h
		    dw SprBullet
		    db 54h
		    dw SprCannonShell
		    db 60h
		    dw SprTank
		    db 0E0h
		    dw SprExplosionB
		    db 0FFh

SprSetBulldozer:    db 38h
		    dw SprExplosionS
		    db 60h
		    dw SprBulldozer
		    db 0E0h
		    dw SprExplosionB
		    db 0FFh

SprSetArnold:	    db 38h
		    dw SprArnold
		    db 0FFh

SprSetFireTrop:	    db 50h
		    dw SprFlame
		    db 60h
		    dw SprFireTrooper
		    db 0FFh

SprSetCowardDuck:   db 50h
		    dw SprBoomenrang
		    db 60h
		    dw SprCowardDuck
		    db 0D0h
		    dw SprPrisoner
		    db 0FFh

SprSetBigBoss:	    db 50h
		    dw SprBullet
		    db 60h
		    dw SprBigBoss
		    db 0FFh

SprSetRolBarrel:    db 0D0h
		    dw SprRollingBarrel
		    db 0FFh

SprSetLaserCam:	    db 60h
		    dw SprExplosionB
SprSetLaserCam2:    db 38h
		    dw SprExplosionS
		    db 0DCh
		    dw SprLaser
		    db 0E0h
		    dw SprCamera
		    db 0FFh

SprSetBridge:	    db 0F4h
		    dw SprBridge
		    db 0FFh

SprSetCamGuard:	    db 0E0h
		    dw SprCamera
		    db 50h
		    dw SprBullet
		    db 60h
		    dw SprGuard
		    db 0FFh

SprSetExpGuard:	    db 38h
		    dw SprExplosionS
		    db 50h
		    dw SprBullet
		    db 60h
		    dw SprGuard
		    db 0E0h
		    dw SprExplosionB
		    db 0FFh

SprSetGas:	    db 0E0h
		    dw SprGas
		    db 0FFh

SprSetPrisDog:	    db 0D0h
		    dw SprPrisoner
		    db 60h
		    dw SprDog
		    db 0FFh

SprZzzGuard:	    db 50h
		    dw SprBullet
		    db 60h
		    dw SprGuard
		    db 0E0h
		    dw SprZzz
		    db 0FFh

		    db 50h				    ; (!?) Spriteset not used
		    dw SprBullet
		    db 60h
		    dw SprGuard
		    db 0E0h
		    dw SprZzz
		    db 0FFh
