;----------------------------------------------------------------------------
;
; Number of sprites used by each enemy
;
;----------------------------------------------------------------------------
NumSprEnemies:	    db	  0,   2,   0,	 4,   4,   2,	2,   2,	12h,   4,   4,	 4,   4,   4, 12h,   0
		    db	  8, 12h,   4,	 6,   6,   6,	2,   4,	  4,   8,   4,	 4,   0,   4,	2,   4
		    db	  4,   4,   0,	 4,   2,   8,	0,   0,	  4,   8,   4,	 0,   4,   0,	2,   4
		    db	  4,   4,   4,	 4,   2, 0Ah,	4,   4,	  4,   2,   2,	 1,   2,   1,	1,   2

;----------------------------------------------------------------------------
;
; Index	of actors sprites colors
;
;----------------------------------------------------------------------------
idxActorSprCols:    dw ActorSprNoColor
		    dw ActorSprColors2
		    dw ActorSprNoColor
		    dw ActorSprColors3
		    dw ActorSprColors3
		    dw ActorSprColors3
		    dw ActorSprColors4
		    dw ActorSprColors4
		    dw ActorSprColors5
		    dw ActorSprColors3
		    dw ActorSprColors3
		    dw ActorSprColors6
		    dw ActorSprColors3
		    dw ActorSprColors3
		    dw ActorSprColors3
		    dw ActorSprNoColor
		    dw ActorSprColors4
		    dw ActorSprColors7
		    dw ActorSprColors4
		    dw ActorSprColors8
		    dw ActorSprColors8
		    dw ActorSprColors8
		    dw ActorSprColors6
		    dw ActorSprColors3
		    dw ActorSprColors9
		    dw ActorSprColors10
		    dw ActorSprColors11
		    dw ActorSprColors3
		    dw ActorSprNoColor
		    dw ActorSprColors3
		    dw ActorSprColors3
		    dw ActorSprColors3
		    dw ActorSprColors3
		    dw ActorSprColors3
		    dw ActorSprNoColor
		    dw ActorSprColors3
		    dw ActorSprColors4
		    dw ActorSprColors12
		    dw ActorSprNoColor
		    dw ActorSprColors7
		    dw ActorSprColors13
		    dw ActorSprColors4
		    dw ActorSprColors12
		    dw ActorSprNoColor
		    dw ActorSprColors3
		    dw ActorSprNoColor
		    dw ActorSprColors12
		    dw ActorSprColors3
		    dw ActorSprColors3
		    dw ActorSprColors14
		    dw ActorSprColors10
		    dw ActorSprColors15
		    dw ActorSprColors3
		    dw ActorSprColors4
		    dw ActorSprColors16
		    dw ActorSprColors3
		    dw ActorSprColors3
		    dw ActorSprColors17
		    dw ActorSprColors17
		    dw ActorSprColors17
		    dw ActorSprColors17
		    dw ActorSprColors17
		    dw ActorSprColors17
		    dw ActorSprColors18


ActorSprColors2:    db	0Ch, 0Ch

ActorSprColors5:    db	0Bh, 4Ch, 0Bh, 4Ch, 0Bh, 4Ch, 0Bh, 4Ch,	0Bh, 4Ch, 0Bh, 4Ch, 0Bh, 4Ch, 0Bh, 4Ch
		    db	0Bh, 4Ch

ActorSprColors3:    db	  2, 4Dh,   2, 4Dh,   2, 4Dh,	2, 4Dh,	  2, 4Dh,   2, 4Dh,   2, 4Dh,	2, 4Dh
		    db	  2, 4Dh

ActorSprColors13:   db	  2, 4Dh

ActorSprColors8:    db	  2, 4Dh,   2, 4Dh,   9,   9

ActorSprColors18:   db	0Eh,   0

ActorSprColors9:    db	0Dh, 0Fh

ActorSprColors11:   db	0Dh, 0Fh,   0,	 0

ActorSprColors10:   db	  2, 4Dh,   2, 4Dh, 0Bh, 4Dh, 0Bh, 4Dh

ActorSprColors14:   db	0Dh, 4Bh, 0Dh, 4Bh

ActorSprColors6:    db	  7, 4Ah,   7, 4Ah

ActorSprColors16:   db	0Dh, 4Eh, 0Bh, 4Eh

ActorSprColors15:   db	0Dh, 4Eh, 0Eh, 4Bh

ActorSprColors7:    db	0Bh, 4Ch, 0Bh, 4Ch, 0Bh, 4Ch, 0Bh, 4Ch,	0Bh, 4Ch, 0Bh, 4Ch, 0Bh, 4Ch, 0Bh, 4Ch
		    db	0Bh, 4Ch

ActorSprColors12:   db	0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh, 0Eh

ActorSprColors4:    db	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0

ActorSprColors17:   db	0Eh
		    db	0Eh

ActorSprNoColor:

;----------------------------------------------------------------------------
;
; Default actors' life
;
;----------------------------------------------------------------------------
idxActorLife:	    db 0FFh,0FFh,0FFh,	 2,   2,   5,0FFh, 1Eh,	37h,   2,   4,	 2,   4,   4,	2,0FFh
		    db	  2, 28h,   2,	 2,   2,   2,0FFh,   2,	  2, 28h,   2,	 2, 80h,   2,	2, 28h
		    db	14h, 14h,0FFh, 1Eh,0FFh, 64h,0FFh,0FFh,	14h,0F0h, 14h,	 2,   2,   2,	2,   2
		    db	  2,   2,   2,	 2,   2,   2,	2,   2,	  4,   2,   2,	 2,   2,   2,	2,   2

;----------------------------------------------------------------------------
;
; Pointer to sprite offsets and	patterns
;
;----------------------------------------------------------------------------
idxSprites:	    dw GuardWalkUp1
		    dw GuardWalkUp2
		    dw GuardWalkDown1
		    dw GuardWalkDown2
		    dw GuardWalkLeft1
		    dw GuardWalkLeft2
		    dw GuardWalkRight1
		    dw GuardWalkRight2
		    dw GuardUp				    ; 8
		    dw GuardDown
		    dw GuardLeft
		    dw GuardRight
		    dw Fire1
		    dw Fire1
		    dw Fire1
		    dw Fire1
		    dw Fire1				    ; #10
		    dw Fire2
		    dw Bulldozer
		    dw Bulldozer
		    dw DogLying
		    dw DogListening
		    dw Tank1
		    dw Tank2
		    dw CowardDuck1			    ; #18
		    dw CowardDuck2
		    dw CowardDuckFire
		    dw CameraUp
		    dw CameraUp
		    dw CameraDown
		    dw CameraLeft
		    dw CameraRight
		    dw DogUp1				    ; #20
		    dw DogUp2
		    dw DogDown1
		    dw DogDown2
		    dw DogLeft1
		    dw DogLeft2
		    dw DogRight1
		    dw DogRight2
		    dw FireTrooperL1			    ; #28
		    dw FireTrooperL2
		    dw FireTrooperD1
		    dw FireTrooperD2
		    dw FireTrooperR1
		    dw FireTrooperR2
		    dw FireTrooperFL
		    dw FireTrooperFD
		    dw FireTrooperFR			    ; #30
		    dw MachGunKidF1
		    dw MachGunKidF2
		    dw MachGunKid1
		    dw MachGunKid2
		    dw Bridge
		    dw RollBarrels1
		    dw RollBarrels2
		    dw Gas1				    ; #38
		    dw Gas2
		    dw Zzz1
		    dw Zzz2
		    dw Zzz3
		    dw Prisoner
		    dw Prisoner
		    dw Prisoner2
		    dw PrisonerFree			    ; #40
		    dw BigBossUp1
		    dw BigBossUp2
		    dw BigBossDown1
		    dw BigBossDown2
		    dw BigBossLeft1
		    dw BigBossLeft2
		    dw BigBossRight1
		    dw BigBossRight2			    ; #48
		    dw GuardWaterUp1
		    dw GuardWaterUp2
		    dw GuardWaterDown1
		    dw GuardWaterDown2
		    dw GuardWaterLeft1
		    dw GuardWaterLeft2
		    dw GuardWaterRight1
		    dw GuardWaterRight2			    ; #50
		    dw GuardWaterUp
		    dw GuardWaterDown
		    dw GuardWaterLeft
		    dw GuardWaterRight
		    dw JetPackUp_
		    dw JetPackDown_
		    dw JetPackLeft_
		    dw JetPackRight_			    ; #58
		    dw JetPackUp
		    dw JetPackDown
		    dw JetPackLeft
		    dw JetPackRight
		    dw ShotGunner
		    dw ShotGunRol1
		    dw ShotGunRol2
		    dw ShotGunRol3			    ; #60
		    dw CameraLaser
		    dw ScorpionUL1
		    dw ScorpionUL2
		    dw ScorpionDR1
		    dw ScorpionDR2
		    dw ScorpionLD1
		    dw ScorpionLD2
		    dw ScorpionRU1			    ; #68
		    dw ScorpionRU2
		    dw SmallExplosion1
		    dw SmallExplosion2
		    dw SmallExplosion3
		    dw ShotGunShot1
		    dw ShotGunShot1
		    dw ShotGunShot2
		    dw ShotGunShot3			    ; #70
		    dw ShotGunShot4
		    dw Bullet
		    dw BigExplosion1
		    dw BigExplosion2
		    dw BigExplosion3
		    dw Boomerang1
		    dw Boomerang1
		    dw Boomerang2			    ; #78
		    dw Boomerang3
		    dw NormalExplosion1
		    dw NormalExplosion2
		    dw NormalExplosion3
		    dw TankShell
		    dw TankShell
		    dw BossExplosion1
		    dw BossExplosion2			    ; #80
		    dw BossExplosion3
		    dw ArnoldLeft1
		    dw ArnoldLeft2
		    dw ArnoldRight1
		    dw ArnoldRight2
		    dw HindDProp1
		    dw HindDProp2
		    dw HindDProp3			    ; #88
		    dw ExplosionMG
		    dw ExplosionMG2
		    dw ExplosionMG3
		    dw ExplosionMG4
		    dw ExplosionMG5
		    dw ExplosionMG6
;----------------------------------------------------------------------------
;
; Sprites offsets and patterns
;
; Offset Y, offset X, Sprite pattern
;
; If offset Y >	#90 && < #A6 then:
; OffsetY-#91 =	Idx predefined/common sprite offsets
; next bytes are sprite	patterns
;
;----------------------------------------------------------------------------
GuardWalkUp1:	    db	91h, 70h, 74h, 90h, 94h
GuardWalkUp2:	    db	92h, 70h, 74h,0D0h,0D4h
GuardWalkDown1:	    db	91h, 60h, 64h, 80h, 84h
GuardWalkDown2:	    db	92h, 60h, 64h,0C0h,0C4h
GuardWalkLeft1:	    db	91h, 68h, 6Ch, 88h, 8Ch
GuardWalkLeft2:	    db	92h, 68h, 6Ch,0C8h,0CCh
GuardWalkRight1:    db	91h, 78h, 7Ch, 98h, 9Ch
GuardWalkRight2:    db	92h, 78h, 7Ch,0D8h,0DCh
GuardUp:	    db	91h, 70h, 74h,0B0h,0B4h
GuardDown:	    db	91h, 60h, 64h,0A0h,0A4h
GuardLeft:	    db	91h, 68h, 6Ch,0A8h,0ACh
GuardRight:	    db	91h, 78h, 7Ch,0B8h,0BCh
Fire1:		    db	95h, 50h, 54h
Fire2:		    db	95h, 58h, 5Ch
Bulldozer:	    db 0E8h,0E8h, 60h
		    db 0E8h,0E8h, 64h
		    db 0E8h,0F8h, 68h
		    db 0E8h,0F8h, 6Ch
		    db 0E8h,   8, 70h
		    db 0E8h,   8, 74h
		    db 0F8h,0E8h, 78h
		    db 0F8h,0E8h, 7Ch
		    db 0F8h,0F8h, 80h
		    db 0F8h,0F8h, 84h
		    db 0F8h,   8, 88h
		    db 0F8h,   8, 8Ch
		    db	  8,0E8h, 90h
		    db	  8,0E8h, 94h
		    db	  8,0F8h, 98h
		    db	  8,0F8h, 9Ch
		    db	  8,   8,0A0h
		    db	  8,   8,0A4h
DogLying:	    db	95h,0E0h,0E4h,0E0h,0E4h
DogListening:	    db	95h,0E8h,0ECh,0E8h,0ECh
Tank1:		    db	96h, 60h, 64h, 68h, 6Ch, 70h, 74h, 78h,	7Ch, 80h, 84h, 88h, 8Ch, 90h, 94h, 98h
		    db	9Ch,0A0h,0A4h
Tank2:		    db	96h, 60h, 64h, 68h, 6Ch, 70h, 74h, 78h,	7Ch, 80h, 84h, 88h, 8Ch,0A8h,0ACh, 98h
		    db	9Ch,0B0h,0B4h
CowardDuck1:	    db	91h, 60h, 64h, 68h, 6Ch
CowardDuck2:	    db 0E5h,0F9h, 60h
		    db 0E5h,0F9h, 64h
		    db 0F5h,0F8h, 78h
		    db 0F5h,0F8h, 7Ch
CowardDuckFire:	    db	91h, 70h, 74h, 78h, 7Ch
CameraUp:	    db	95h,0E0h,0E4h
CameraDown:	    db	95h,0E8h,0ECh
CameraLeft:	    db	95h,0F0h,0F4h
CameraRight:	    db	95h,0F8h,0FCh
DogUp1:		    db	9Fh,0A0h,0A4h,0A8h,0ACh
DogUp2:		    db	9Fh,0B0h,0B4h,0B8h,0BCh
DogDown1:	    db	9Fh, 60h, 64h, 68h, 6Ch
DogDown2:	    db	9Fh, 70h, 74h, 78h, 7Ch
DogLeft1:	    db 0A0h, 80h, 84h, 88h, 8Ch
DogLeft2:	    db 0A0h, 90h, 94h, 98h, 9Ch
DogRight1:	    db 0A0h,0C0h,0C4h,0C8h,0CCh
DogRight2:	    db 0A0h,0D0h,0D4h,0D8h,0DCh
FireTrooperL1:	    db	93h, 60h, 64h, 78h, 7Ch
FireTrooperL2:	    db	94h, 60h, 64h, 88h, 8Ch
FireTrooperD1:	    db	93h, 68h, 6Ch, 78h, 7Ch
FireTrooperD2:	    db	94h, 68h, 6Ch, 88h, 8Ch
FireTrooperR1:	    db	93h, 70h, 74h, 78h, 7Ch
FireTrooperR2:	    db	93h, 70h, 74h, 88h, 8Ch
FireTrooperFL:	    db	93h, 60h, 64h, 80h, 84h
FireTrooperFD:	    db	93h, 68h, 6Ch, 80h, 84h
FireTrooperFR:	    db	93h, 70h, 74h, 80h, 84h
MachGunKidF1:	    db 0A5h, 60h, 64h, 70h, 74h
MachGunKidF2:	    db 0A5h, 68h, 6Ch, 70h, 74h
MachGunKid1:	    db 0A5h, 60h, 64h, 70h, 74h
MachGunKid2:	    db 0A5h, 60h, 64h, 78h, 7Ch
Bridge:		    db 0F8h,0F0h,0F4h,0F8h,   0,0F8h
RollBarrels1:	    db 97h
		    db 0D0h,0D4h
		    db 0D8h,0DCh
		    db 0D8h,0DCh
		    db 0D8h,0DCh
		    db 0D8h,0DCh
		    db 0D8h,0DCh
		    db 0D8h,0DCh
		    db 0D8h,0DCh
		    db 0E0h,0E4h
RollBarrels2:	    db	97h,0E8h,0ECh,0F0h,0F4h,0F0h,0F4h,0F0h,0F4h,0F0h,0F4h,0F0h,0F4h,0F0h,0F4h,0F0h
		    db 0F4h,0F8h,0FCh
Gas1:		    db	95h,0E0h,0E4h
Gas2:		    db	95h,0E8h,0ECh
Zzz1:		    db 0A4h,0E0h
Zzz2:		    db 0A4h,0E4h
Zzz3:		    db 0A4h,0E8h
Prisoner:	    db	91h,0D0h,0D4h,0E0h,0E4h
Prisoner2:	    db	91h,0D8h,0DCh,0E0h,0E4h
PrisonerFree:	    db	91h,0E8h,0ECh,0F0h,0F4h
BigBossUp1:	    db	98h, 70h, 74h, 90h, 94h
BigBossUp2:	    db	98h, 70h, 74h,0B0h,0B4h
BigBossDown1:	    db	98h, 60h, 64h, 80h, 84h
BigBossDown2:	    db	98h, 60h, 64h,0A0h,0A4h
BigBossLeft1:	    db	98h, 68h, 6Ch, 88h, 8Ch
BigBossLeft2:	    db	98h, 68h, 6Ch,0A8h,0ACh
BigBossRight1:	    db	98h, 78h, 7Ch, 98h, 9Ch
BigBossRight2:	    db	98h, 78h, 7Ch,0B8h,0BCh
GuardWaterUp1:	    db 0A1h, 70h, 74h, 70h, 74h
GuardWaterUp2:	    db 0A2h, 70h, 74h, 70h, 74h
GuardWaterDown1:    db 0A1h, 60h, 64h, 60h, 64h
GuardWaterDown2:    db 0A2h, 60h, 64h, 60h, 64h
GuardWaterLeft1:    db 0A1h, 68h, 6Ch, 68h, 6Ch
GuardWaterLeft2:    db 0A2h, 68h, 6Ch, 68h, 6Ch
GuardWaterRight1:   db 0A1h, 78h, 7Ch, 78h, 7Ch
GuardWaterRight2:   db 0A2h, 78h, 7Ch, 78h, 7Ch
GuardWaterUp:	    db 0A2h, 70h, 74h, 70h, 74h
GuardWaterDown:	    db 0A2h, 60h, 64h, 60h, 64h
GuardWaterLeft:	    db 0A2h, 68h, 6Ch, 68h, 6Ch
GuardWaterRight:    db 0A2h, 78h, 7Ch, 78h, 7Ch
JetPackUp_:	    db	9Bh, 70h, 74h, 90h, 94h,0E0h,0E0h
JetPackDown_:	    db	9Bh, 60h, 64h, 80h, 84h,0E0h,0E0h
JetPackLeft_:	    db	9Bh, 68h, 6Ch, 88h, 8Ch,0E0h,0E0h
JetPackRight_:	    db	9Bh, 78h, 7Ch, 98h, 9Ch,0E0h,0E0h
JetPackUp:	    db	9Ch, 70h, 74h, 90h, 94h,0E0h,0E0h
JetPackDown:	    db	9Ch, 60h, 64h, 80h, 84h,0E0h,0E0h
JetPackLeft:	    db	9Ch, 68h, 6Ch, 88h, 8Ch,0E0h,0E0h
JetPackRight:	    db	9Ch, 78h, 7Ch, 98h, 9Ch,0E0h,0E0h
ShotGunner:	    db	91h, 60h, 64h, 68h, 6Ch
ShotGunRol1:	    db	9Ah, 70h, 74h, 78h, 7Ch
ShotGunRol2:	    db	9Ah, 80h, 84h, 88h, 8Ch
ShotGunRol3:	    db	9Ah, 90h, 94h, 98h, 9Ch
CameraLaser:	    db	  8,0F8h,0DCh
		    db	18h,0F8h,0DCh
		    db	28h,0F8h,0DCh
		    db	38h,0F8h,0DCh
		    db	48h,0F8h,0DCh
		    db	58h,0F8h,0DCh
		    db	68h,0F8h,0DCh
		    db	78h,0F8h,0DCh
		    db	88h,0F8h,0DCh
		    db	8Fh,0F8h,0DCh
ScorpionUL1:	    db	95h, 60h, 64h
ScorpionUL2:	    db	95h, 68h, 6Ch
ScorpionDR1:	    db	95h, 90h, 94h
ScorpionDR2:	    db	95h, 98h, 9Ch
ScorpionLD1:	    db	95h, 70h, 74h
ScorpionLD2:	    db	95h, 78h, 7Ch
ScorpionRU1:	    db	95h, 80h, 84h
ScorpionRU2:	    db	95h, 88h, 8Ch
SmallExplosion1:    db	95h, 38h, 3Ch
SmallExplosion2:    db	95h, 40h, 44h
SmallExplosion3:    db	95h, 48h, 4Ch
ShotGunShot1:	    db	95h,0A0h,0A0h,0A0h,0A0h
ShotGunShot2:	    db	95h,0A4h,0A4h,0A4h,0A4h
ShotGunShot3:	    db	95h,0A8h,0A8h,0A8h,0A8h
ShotGunShot4:	    db 0F0h,0F0h,0ACh,0F0h,   0,0B0h,	0,0F0h,0B4h,   0,   0,0B8h
Bullet:		    db	95h, 50h, 50h
BigExplosion1:	    db	95h,0E0h,0E4h,0E0h,0E4h
BigExplosion2:	    db	95h,0E8h,0ECh,0E8h,0ECh
BigExplosion3:	    db 0F0h,0F0h,0F0h,0F0h,   0,0F4h,	0,0F0h,0F8h,   0,   0,0FCh
Boomerang1:	    db	95h, 50h
Boomerang2:	    db	95h, 54h
Boomerang3:	    db	95h, 58h
NormalExplosion1:   db 0E8h,0F8h, 38h
		    db 0E8h,0F8h, 3Ch
		    db	9Dh,   0,   0
		    db	  0,   0
NormalExplosion2:   db 0E8h,0F8h, 40h
		    db 0E8h,0F8h, 44h
		    db	9Dh,   0,   0
		    db	  0,   0
NormalExplosion3:   db 0E8h,0F8h, 48h
		    db 0E8h,0F8h, 4Ch
		    db	9Dh,   0,   0
		    db	  0,   0
TankShell:	    db	95h, 54h, 58h, 54h, 58h
BossExplosion1:	    db	9Eh,0E0h,0E4h, 38h, 3Ch, 38h, 3Ch,   0,	  0,   0,   0,	 0,   0,   0,	0,   0
		    db	  0,   0,   0
BossExplosion2:	    db	9Eh,0E8h,0ECh, 40h, 44h, 40h, 44h,   0,	  0,   0,   0,	 0,   0,   0,	0,   0
		    db	  0,   0,   0
BossExplosion3:	    db 0D8h,0E8h,0F0h,0D8h,0F8h,0F4h,0E8h,0E8h,0F8h,0E8h,0F8h,0FCh,0D0h,0F8h, 48h,0D0h
		    db 0F8h, 4Ch,0F0h,	 0, 48h,0F0h,	0, 4Ch,	9Dh,   0,   0,	 0,   0,   0,	0,   0
		    db	  0,   0,   0
ArnoldLeft1:	    db	99h, 78h, 7Ch, 80h, 84h, 88h, 8Ch, 90h,	94h
ArnoldLeft2:	    db	99h,0A8h,0ACh,0B0h,0B4h, 98h, 9Ch,0A0h,0A4h
ArnoldRight1:	    db	99h, 38h, 3Ch, 40h, 44h, 48h, 4Ch, 50h,	54h
ArnoldRight2:	    db	99h, 68h, 6Ch, 70h, 74h, 58h, 5Ch, 60h,	64h

HindDProp1:	    db 0B0h,0C0h, 60h
		    db 0B0h,0D0h, 64h
		    db 0C0h,0C0h, 68h
		    db 0C0h,0D0h, 6Ch
		    db 0B0h, 20h, 90h
		    db 0B0h, 30h, 94h
		    db 0C0h, 20h, 98h
		    db 0C0h, 30h, 9Ch

HindDProp2:	    db 0D0h,0D0h, 70h
		    db 0D0h,0E0h, 74h
		    db 0E0h,0D0h, 78h
		    db 0E0h,0E0h, 7Ch
		    db 0D0h,0D0h, 70h
		    db 0D0h,0E0h, 74h
		    db 0E0h,0D0h, 78h
		    db 0E0h,0E0h, 7Ch

HindDProp3:	    db 0D0h, 10h, 80h
		    db 0D0h, 20h, 84h
		    db 0E0h, 10h, 88h
		    db 0E0h, 20h, 8Ch
		    db 0D0h, 10h, 80h
		    db 0D0h, 20h, 84h
		    db 0E0h, 10h, 88h
		    db 0E0h, 20h, 8Ch

ExplosionMG:	    db 0D0h,0F8h, 38h
		    db 0D0h,0F8h, 3Ch
		    db 0F0h,   0, 38h
		    db 0F0h,   0, 3Ch
		    db	9Dh,   0,   0
		    db	  0,   0

ExplosionMG2:	    db 0D0h,0F8h, 40h
		    db 0D0h,0F8h, 44h
		    db 0F0h,   0, 40h
		    db 0F0h,   0, 44h
		    db 0E0h,0F0h, 38h
		    db 0E0h,0F0h, 3Ch
		    db	9Dh,   0,   0

ExplosionMG3:	    db 0D0h,0F8h, 48h
		    db 0D0h,0F8h, 4Ch
		    db 0F0h,   0, 48h
		    db 0F0h,   0, 4Ch
		    db 0E0h,0F0h, 40h
		    db 0E0h,0F0h, 44h
		    db 0C8h,   0, 60h
		    db 0C8h,   0, 64h

ExplosionMG4:	    db 0E0h,0F0h, 48h
		    db 0E0h,0F0h, 4Ch
		    db 0C8h,   0, 68h
		    db 0C8h,   0, 6Ch
		    db 0E0h,0F8h, 60h
		    db 0E0h,0F8h, 64h
		    db	9Dh,   0,   0

ExplosionMG5:	    db 0C0h,0F8h, 70h
		    db 0C0h,   8, 74h
		    db 0D0h,0F8h, 78h
		    db 0D0h,   8, 7Ch
		    db 0E0h,0F8h, 68h
		    db 0E0h,0F8h, 6Ch
		    db	9Dh,   0,   0

ExplosionMG6:	    db 0D8h,0F0h, 70h
		    db 0D8h,   0, 74h
		    db 0E8h,0F0h, 78h
		    db 0E8h,   0, 7Ch
		    db	9Dh,   0,   0
		    db	  0,   0

;----------------------------------------------------------------------------
;
; Shared sprites offsets
;
;----------------------------------------------------------------------------
SprOffsets1:	    db	-27,  -8
		    db	-27,  -8
		    db	-11,  -8
		    db	-11,  -8

SprOffsets2:	    db	-26,  -8
		    db	-26,  -8
		    db	-11,  -8
		    db	-11,  -8

SprOffsets3:	    db 0F5h,0F8h
		    db 0F5h,0F8h
		    db	  4,0F8h
		    db	  4,0F8h

SprOffsets4:	    db 0F6h,0F8h
		    db 0F6h,0F8h
		    db	  4,0F8h
		    db	  4,0F8h

SprOffsets5:	    db	 -8,  -8
		    db	 -8,  -8
		    db	 -8,  -8
		    db	 -8,  -8

SprOffsets6:	    db 0D0h,0E8h
		    db 0D0h,0E8h
		    db 0D0h,0F8h
		    db 0D0h,0F8h
		    db 0D0h,   8
		    db 0D0h,   8
		    db 0E0h,0E8h
		    db 0E0h,0E8h
		    db 0E0h,0F8h
		    db 0E0h,0F8h
		    db 0E0h,   8
		    db 0E0h,   8
		    db 0F0h,0E8h
		    db 0F0h,0E8h
		    db 0F0h,0F8h
		    db 0F0h,0F8h
		    db 0F0h,   8
		    db 0F0h,   8

SprOffsets7:	    db	  0,0F8h
		    db	  0,0F8h
		    db	10h,0F8h
		    db	10h,0F8h
		    db	20h,0F8h
		    db	20h,0F8h
		    db	30h,0F8h
		    db	30h,0F8h
		    db	40h,0F8h
		    db	40h,0F8h
		    db	50h,0F8h
		    db	50h,0F8h
		    db	60h,0F8h
		    db	60h,0F8h
		    db	70h,0F8h
		    db	70h,0F8h
		    db	80h,0F8h
		    db	80h,0F8h

SprOffsets8:	    db	-32,  -7
		    db	-32,  -7
		    db	-16,  -8
		    db	-16,  -8


SprOffsets9:	    db	-32, -16
		    db	-32, -16
		    db	-32,   0
		    db	-32,   0
		    db	-16, -16
		    db	-16, -16
		    db	-16,   0
		    db	-16,   0


SprOffsets10:	    db	-32,  -8
		    db	-32,  -8
		    db	-16,  -8
		    db	-16,  -8


SprOffsets11:	    db	-31,  -8
		    db	-31,  -8
		    db	-16,  -8
		    db	-16,  -8
		    db	  0,  -8
		    db	  0,  -8


SprOffsets12:	    db 0E0h,0F8h
		    db 0E0h,0F8h
		    db 0F0h,0F8h
		    db 0F0h,0F8h
		    db	1Eh,0F8h
		    db	1Eh,0F8h


SprOffsets14:	    db	-32, -16
		    db	-32, -16
		    db	-48,  -8
		    db	-48,  -8
		    db	-16,   0
		    db	-16,   0


SprOffsets13:	    db	-31,   0
		    db	-31,   0
		    db	-31,   0
		    db	-31,   0
		    db	-31,   0
		    db	-31,   0
		    db	-31,   0
		    db	-31,   0
		    db	-31,   0
		    db	-31,   0
		    db	-31,   0
		    db	-31,   0


SprOffsets15:	    db	-16,  -8
		    db	-16,  -8
		    db	  0,  -8
		    db	  0,  -8


SprOffsets16:	    db	 -8, -16
		    db	 -8, -16
		    db	 -8,   0
		    db	 -8,   0


SprOffsets17:	    db	-16,  -8
		    db	-16,  -8
		    db	-16,  -8
		    db	-16,  -8


SprOffsets18:	    db	-15,  -8
		    db	-15,  -8
		    db	-15,  -8
		    db	-15,  -8


SprOffsets19:	    db	 -8, -16
		    db	 -8, -16
		    db	 -8, -16
		    db	 -8, -16


SprOffsets20:	    db	-32,  -8
		    db	-32,  -8
		    db	-16,  -8
		    db	-16,  -8