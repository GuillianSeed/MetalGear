;---------------------------------------------------------------------------
;
; Init shoot gunner
;
;---------------------------------------------------------------------------

InitShotGunner:
		    ld	    hl,	ShotGunnerStat		    ; Bit1=Shot	Gunner speech, 0=Dead
		    bit	    0, (hl)			    ; Is he dead?
		    jp	    nz,	DismissActor		    ; Yes, remove actor

		    ld	    (ix+SHOT_GUNNER.SpriteId), 5Dh  ; Shot Gunner sprite ID
		    ld	    (ix+SHOT_GUNNER.IntroDelay), 2  ; Intro delay to allow sprites refresh
		    inc	    (ix+SHOT_GUNNER.Moving)	    ; 0=Does not move

		    ld	    a, (PlayerX)
		    cp	    (ix+SHOT_GUNNER.X)
		    ld	    a, 4			    ; Right speed
		    ld	    b, a			    ; Right
		    jr	    nc,	InitShotGunner2

		    ld	    a, -4			    ; Left speed
		    dec	    b				    ; Left

InitShotGunner2:
		    ld	    (ix+SHOT_GUNNER.SpeedX), a
		    ld	    (ix+SHOT_GUNNER.Direction),	b   ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    (ix+SHOT_GUNNER.Wait), 0Bh
		    ld	    (ix+SHOT_GUNNER.COLLISION_CFG), 0 ;	Disable	collisions with	the player and his shots
		    ret



;----------------------------------------------------------------------------
;
; Shoot	gunner logic
;
;----------------------------------------------------------------------------

ShotGunnerLogic:
		    ld	    a, (ix+SHOT_GUNNER.Status)
		    call    JumpIndex

		    dw ShotGunnerIntro
		    dw ShotGunnerRoll
		    dw SGunnerShotLogic


;----------------------------------------------------------------------------
;
; Shoot	gunner intro speech
;
;----------------------------------------------------------------------------

ShotGunnerIntro:
		    dec	    (ix+SHOT_GUNNER.IntroDelay)	    ; Intro delay to allow sprites refresh
		    ret	    nz

		    ld	    hl,	ShotGunnerStat		    ; Bit1=Shot	Gunner speech, 0=Dead
		    bit	    1, (hl)			    ; Intro speech done?
		    jr	    nz,	ShotGunnerIntro2	    ; Yes, next	status

		    set	    1, (hl)			    ; Mark intro speech	as done

		    ld	    a, 61			    ; TEXT: I'M SHOOT GUNNER!*NOBODY HAS*EVER BEEN ABLE TO ESCAPE FROM HERE.
		    call    SetTextUnskippable

ShotGunnerIntro2:
		    ld	    (ix+ACTOR.Status), 1
		    jp	    SetBossMusic


;----------------------------------------------------------------------------
;
; Shoot	gunner roll logic
; Collisions with the player and his shots are disabled
;
;----------------------------------------------------------------------------

ShotGunnerRoll:
		    call    SetSGunnerRollSpr		    ; Update rolling animation

		    bit	    7, (ix+ACTOR.SpeedX)	    ; Moving to	the right or to	the left?
		    ld	    c, DIR_LEFT
		    jr	    nz,	ShotGunnerRoll2

		    inc	    c				    ; Right

ShotGunnerRoll2:
		    ld	    b, 0			    ; Shape/size
		    call    ChkTileCollision
		    jr	    c, ShotGunnerStop		    ; Collision

		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Continue rolling

ShotGunnerStop:
		    ld	    (ix+ACTOR.SpeedX), 0
		    ld	    (ix+ACTOR.SpriteId), 5Dh	    ; Shot Gunner standing sprite ID
		    ld	    (ix+ACTOR.Wait), 2Dh
		    ld	    (ix+ACTOR.Status), 2	    ; Shoot status
		    ld	    (ix+ACTOR.COLLISION_CFG), 3	    ; Enable collisions	with the player	and his	shots
		    ret



;----------------------------------------------------------------------------
;
; Shoot	gunner shoot logic
;
;----------------------------------------------------------------------------

SGunnerShotLogic:
		    dec	    (ix+ACTOR.Wait)		    ; Decrement	shoot timer
		    jr	    z, SGunnerThinkDir

		    ld	    a, (PlayerY)
		    cp	    166
		    jr	    c, SGunnerShotLogic2

		    ld	    a, (PlayerX)
		    cp	    170
		    ret	    nc				    ; The player is behind the boxes

SGunnerShotLogic2:
		    ld	    a, (ix+ACTOR.ANIM_CNT)
		    and	    0Fh
		    ret	    nz				    ; Shoot delay

		    ld	    c, ID_SGUNNER_SHOT
		    jp	    AddEnemyShot2		    ; Create shot


SGunnerThinkDir:
		    ld	    a, (PlayerX)
		    cp	    (ix+ACTOR.X)
		    ld	    a, 4			    ; Right speed
		    ld	    b, a			    ; Right
		    jr	    nc,	SGunnerThinkDir2

		    ld	    a, -4			    ; Left speed
		    dec	    b				    ; Left

SGunnerThinkDir2:
		    ld	    (ix+ACTOR.SpeedX), a
		    ld	    (ix+ACTOR.Direction), b	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    (ix+ACTOR.Status), 1	    ; Rolling status
		    ld	    (ix+ACTOR.Wait), 0Bh
		    ld	    (ix+ACTOR.COLLISION_CFG), 0	    ; Disable collisions while rolling


;----------------------------------------------------------------------------
;
; Update rolling animation
;
;----------------------------------------------------------------------------

SetSGunnerRollSpr:
		    ld	    hl,	SGunnerRollSpr		    ; Rolling animation	sprite IDs
		    ld	    a, (ix+ACTOR.ANIM_CNT)
		    and	    6
		    rra					    ; (0-3)
		    call    ADD_HL_A
		    ld	    a, (hl)			    ; Rolling sprite ID
		    ld	    (ix+ACTOR.SpriteId), a
		    ret


;----------------------------------------------------------------------------
;
; Shoot	gunner rolling sprites IDs
;
;----------------------------------------------------------------------------
SGunnerRollSpr:	    db 5Eh
		    db 5Fh
		    db 60h
		    db 5Fh




;----------------------------------------------------------------------------
;
; Init Shoot Gunner shot
;
;----------------------------------------------------------------------------

InitShotGunnerShot:
		    inc	    (ix+ACTOR.Moving)		    ; Enable movement
		    ld	    (ix+ACTOR.SpriteId), 6Eh	    ; Shotgun shot frame 1 sprite ID
		    ld	    (ix+ACTOR.COLLISION_CFG), 1	    ; Enable collisions	with the player
		    ld	    (ix+ACTOR.Wait), 0

		    ld	    a, 90h			    ; Shot speed
		    call    CalcShot2			    ; Calc shoot speed/direction towards the player
		    call    SetActorSpeed		    ; DE = Speed X, HL = Speed Y

		    ld	    a, 0Fh			    ; SFX Shotgun shot
		    jp	    SetSoundEntryChk

;---------------------------------------------------------------------------
;
; Shoot	Gunner shot logic
; The shot expands while moving
;
;---------------------------------------------------------------------------


ShotGunnerShot:
		    inc	    (ix+ACTOR.Wait)

		    ld	    a, (ix+ACTOR.Wait)
		    cp	    7
		    ld	    bc,	26Eh			    ; B=2 Shape/size, C=#6E Shotgun shot frame 1 sprite	ID
		    jr	    c, ShotGunnerShot2

		    cp	    14
		    inc	    c				    ; Frame 2
		    jr	    c, ShotGunnerShot2

		    cp	    21
		    inc	    c				    ; Frame 3
		    jr	    c, ShotGunnerShot2

		    inc	    c				    ; Frame 4
		    dec	    b				    ; Shape/size 1

ShotGunnerShot2:
		    ld	    (ix+ACTOR.SpriteId), c	    ; Update shot sprite ID

		    ld	    c, DIR_DOWN
		    call    ChkTileCollision		    ; Check collisions
		    ret	    nc				    ; Has not collide

		    jp	    DismissActor0		    ; Remove shot
