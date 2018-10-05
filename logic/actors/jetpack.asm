;----------------------------------------------------------------------------
;
; Init Jetpack guard (taking off)
;
;----------------------------------------------------------------------------

InitJetpackTakeoff:
		    call    GetDirToPlayer
		    ld	    (ix+JETPACK.Direction), a	    ; Look at the player

		    call    SetJetpackFloorSpr		    ; Update sprite ID depending on the	direction

InitJetpackTakeoff2:
		    call    ResetActorSpeed

		    ld	    (ix+JETPACK.Moving), 0	    ; Dosable movement
		    ld	    (ix+JETPACK.Wait), 20h	    ; Take off iterations / height
		    ld	    (ix+JETPACK.NextDirection),	0
		    ld	    (ix+JETPACK.TakeoffSpeed), -1   ; Take off speed
		    ld	    (ix+JETPACK.COLLISION_CFG),	2   ; Disable collision	with the player. Enable	collision woth his shots

		    ld	    a, (ix+JETPACK.Ydec)
		    ld	    (ix+JETPACK.Ydec_),	a

		    ld	    a, (ix+JETPACK.Y)
		    ld	    (ix+JETPACK.Y_), a

		    ld	    a, (ix+JETPACK.Xdec)
		    ld	    (ix+JETPACK.Xdec_),	a

		    ld	    a, (ix+JETPACK.X)
		    ld	    (ix+JETPACK.X_), a

		    ld	    a, (ix+JETPACK.ID)		    ; Bit 7 = Killed
		    cp	    ID_JETPACK_SWITCH
		    ld	    (ix+JETPACK.ID), ID_JETPACK_TAKEOFF ; Bit 7 = Killed

		    ld	    (ix+JETPACK.NumSprites), 4	    ; Do not update the	shadow
		    ret	    z

		    ld	    (ix+JETPACK.NumSprites), 6	    ; Update the shadow
		    ret

;---------------------------------------------------------------------------
;
; Jetpack that takeoffs
; Then transform into Jetpack actor
;
;---------------------------------------------------------------------------

JetpacTakeoff:
		    call    SetJetpackFlySpr		    ; Update jetpack sprite ID

		    dec	    (ix+JETPACK.Wait)		    ; Decrement	takeoff	time
		    jr	    z, JetpackTakeoffEnd	    ; Takeoff finished

		    ld	    a, (ix+JETPACK.TakeoffSpeed)    ; Takeoff speed
		    add	    a, (ix+JETPACK.Y)
		    ld	    (ix+JETPACK.Y), a		    ; Update Y

		    ld	    (ix+JETPACK.NumSprites), 4
		    ret


JetpackTakeoffEnd:
		    ld	    (ix+JETPACK.ID), ID_JETPACK	    ; Transform	into flying jetpack guard
		    ld	    (ix+JETPACK.Moving), 1	    ; Enable movement
		    ld	    (ix+JETPACK.Wait), 2Dh
		    ld	    (ix+JETPACK.NumSprites), 6
		    jp	    JetPackAlert

;---------------------------------------------------------------------------
;
; If the player	comes from inside the room, the	Jetpac does not	appear
;
;---------------------------------------------------------------------------

InitJetpackSwitch:
		    ld	    a, (PreviousRoom)
		    cp	    160				    ; Mine detector room
		    jp	    z, DismissActor0		    ; Remove the jetpack guard

		    ld	    (ix+ACTOR.Moving), 1	    ; Enable movement
		    ld	    (ix+ACTOR.COLLISION_CFG), 2	    ; Enable collisions	with player bullets
		    ld	    a, DIR_UP
		    ld	    (ix+ACTOR.Direction), a	    ; 1=Up, 2=Down, 3=Left, 4=Right

		    call    SetJetpackFlySpr2		    ; Update jetpack guard sprite

		    jp	    ResetActorSpeed		    ; Stop the movement

;---------------------------------------------------------------------------
;
; Jetpack switch logic
;
; Triggers the alarm
; Switch on the	power
; Converts into	Jetpack	actor
;
;---------------------------------------------------------------------------

JetpackSwitchLogic:
		    bit	    0, (ix+ACTOR.Status)
		    jr	    nz,	JetpackSwitchLogic2

		    ld	    (ix+ACTOR.NumSprites), 4
		    ld	    (ix+ACTOR.Status), 1
		    ld	    (ix+ACTOR.SpeedY), 2
		    call    SetJetpackFlySpr

		    ld	    a, (AlertMode)
		    or	    a
		    ret	    nz

		    ld	    a, 5Ah
		    jp	    SetAlertModeRespawn


JetpackSwitchLogic2:
		    ld	    a, (ix+ACTOR.Y)
		    cp	    86h
		    ret	    c				    ; Have not reached the switch yet

		    ld	    a, 15h			    ; SFX click
		    call    SetSoundEntryChk

		    ld	    de,	4470h			    ; Power switch XY
		    ld	    c, ID_POWER_SWITCH
		    call    AddEnemy			    ; Creates the power	switch actor

		    call    GetDirToPlayer
		    ld	    (ix+ACTOR.Direction), a	    ; Look at the player

		    call    SetJetpackFlySpr2		    ; Update guard sprite
		    jp	    InitJetpackTakeoff2

;---------------------------------------------------------------------------
;
; Init jetpack guard
;
;---------------------------------------------------------------------------

InitJetpack:
		    ld	    (ix+ACTOR.Moving), 1	    ; Enable movement
		    ld	    (ix+ACTOR.COLLISION_CFG), 2	    ; Enable collision with player shots

		    ld	    a, DIR_LEFT
		    ld	    (ix+ACTOR.Direction), a	    ; looking at the left

		    call    SetJetpackFlySpr2		    ; Set flying sprite
		    call    ResetActorSpeed
		    call    JetPackMove			    ; Update jetpack speed

		    ld	    (ix+ACTOR.Wait), 2Dh

		    call    SetRespawnTime

JetPackAlert:
		    ld	    a, (AlertMode)
		    or	    a
		    ret	    nz				    ; Not in alert mode

		    ld	    a, 1Eh
		    jp	    SetAlertModeRespawn


;---------------------------------------------------------------------------
;
; Jetpack guard	logic
; Update its speed and shoot
;
;---------------------------------------------------------------------------

JetpackLogic:
		    call    GetDirToPlayer
		    ld	    (ix+ACTOR.Direction), a	    ; Look at the player

		    call    SetJetpackFlySpr2		    ; Set flying sprite

		    call    JetPackMove			    ; Update speed

		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Do not shoot yet

		    ld	    a, r
		    xor	    (ix+ACTOR.ANIM_CNT)
		    and	    0Fh
		    add	    a, 1Eh
		    ld	    (ix+ACTOR.Wait), a		    ; Random time for next shot

		    ld	    c, ID_BULLET
		    jp	    AddEnemyShot2		    ; Shoot to the player

		    db 0DDh ; Ý
		    db	7Eh ; ~
		    db	11h


;----------------------------------------------------------------------------
;
; Update jetpack sprite	ID (on floor, shoter legs) depending on	its direction
;
;----------------------------------------------------------------------------

SetJetpackFloorSpr:
		    add	    a, 54h			    ; (#55 = JetPack up	sprite ID) - 1 (Up)
		    ld	    (ix+ACTOR.SpriteId), a
		    ret



;----------------------------------------------------------------------------
;
; Update jetpack sprite	ID (flying) depending on its direction
;
;----------------------------------------------------------------------------

SetJetpackFlySpr:
		    ld	    a, (ix+ACTOR.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right

SetJetpackFlySpr2:
		    add	    a, 58h
		    ld	    (ix+ACTOR.SpriteId), a
		    ret


;----------------------------------------------------------------------------
;
; Update jetpack speed
;
;----------------------------------------------------------------------------

JetPackMove:
		    ld	    l, (ix+ACTOR.speedYdec)
		    ld	    h, (ix+ACTOR.SpeedY)	    ; HL = Speed Y

		    bit	    7, (ix+ACTOR.ANIM_CNT)
		    ld	    b, 60h
		    jr	    z, JetPackMove2

		    ld	    b, 70h

JetPackMove2:
		    ld	    a, (ix+ACTOR.Y)
		    cp	    b
		    ld	    bc,	18h			    ; Acceleration down
		    jr	    c, JetPackMove3

		    ld	    bc,	-18h			    ; Acceleration up

JetPackMove3:
		    add	    hl,	bc			    ; Speed Y +	acceleration
		    ld	    (ix+ACTOR.speedYdec), l
		    ld	    (ix+ACTOR.SpeedY), h	    ; Update speed Y

		    ld	    l, (ix+ACTOR.SpeedXdec)
		    ld	    h, (ix+ACTOR.SpeedX)	    ; HL = Speed X

		    bit	    7, (ix+ACTOR.ANIM_CNT)
		    ld	    b, 78h
		    jr	    z, JetPackMove4

		    ld	    b, 88h

JetPackMove4:
		    ld	    a, (ix+ACTOR.X)
		    cp	    b
		    ld	    bc,	30h			    ; Acceleration right
		    jr	    c, JetPackMove5
		    ld	    bc,	-30h			    ; Acceleration left

JetPackMove5:
		    add	    hl,	bc			    ; Speed X +	acceleration
		    ld	    (ix+ACTOR.SpeedXdec), l
		    ld	    (ix+ACTOR.SpeedX), h	    ; Update speed X
		    ret

