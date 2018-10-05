;----------------------------------------------------------------------------
;
; Init scorpion
;
;----------------------------------------------------------------------------

InitScorpion:
		    ld	    (ix+ACTOR.Status), 2	    ; Wait status
		    ld	    (ix+ACTOR.Wait), 8

		    ld	    a, r
		    ld	    hl,	TickCounter
		    xor	    (hl)
		    and	    3
		    inc	    a
		    jp	    SetScorpionSprId		    ; Random scorpion sprite



;----------------------------------------------------------------------------
;
; Scorpion logic
;
;----------------------------------------------------------------------------

ScorpionLogic:
		    ld	    a, (ix+ACTOR.Status)
		    call    JumpIndex

		    dw ScorpionWander
		    dw ScorpionAttack
		    dw ScorpionWait



;----------------------------------------------------------------------------
;
; The scorpion moves in	random directions. If the scorpion detects the player, walks towards him
;
;----------------------------------------------------------------------------


ScorpionWander:
		    call    GetDistancePlayer
		    cp	    51h				    ; Near enough?
		    jr	    c, ScorpionSeePlayer	    ; Yes

		    call    ChkScorpionLimits		    ; Is the scorpion inside the room limits?
		    jr	    c, ScorpionTurn		    ; No, move in the opposite direction

		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Continue moving

ScorpionNewDir:
		    call    RandomWait5_8		    ; Walk iterations /	distance

		    call    GetRandom3
		    inc	    a
		    ld	    (ix+ACTOR.Direction), a	    ; Random direction

		    call    SetScorpionSprId		    ; Update scorpion sprite depending on the direction
		    call    ChkScorpionLimits		    ; Is the scorpion inside the room limits?
		    jr	    c, ScorpionTurn		    ; No, move in the opposite direction

		    jr	    ScorpionSetSpeed		    ; Set scorpion speed depending on the direction


;----------------------------------------------------------------------------
; Set the speed	to move	toward the player
;----------------------------------------------------------------------------

ScorpionSeePlayer:
		    ld	    (ix+ACTOR.Status), 1	    ; Status atack
		    ld	    (ix+ACTOR.Wait), 8
		    call    CalcShot			    ; Calculate	the speed to move towards the player
		    jp	    SetActorSpeed		    ; Update scorpion speed

;----------------------------------------------------------------------------
; Turn in the opposite direction
;----------------------------------------------------------------------------

ScorpionTurn:
		    ld	    a, (ix+ACTOR.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    GetOppositeDir
		    ld	    (ix+ACTOR.Direction), a	    ; 1=Up, 2=Down, 3=Left, 4=Right

		    call    SetScorpionSprId
		    jr	    ScorpionSetSpeed


;----------------------------------------------------------------------------
;
; Move in the selected direction towards the player for	a while
;
;----------------------------------------------------------------------------

ScorpionAttack:
		    call    ChkScorpionLimits		    ; Check room limits
		    jr	    c, ScorpionAttackEnd

		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Continue moving in the same direction

ScorpionAttackEnd:
		    inc	    (ix+ACTOR.Status)		    ; Wait status
		    ld	    (ix+ACTOR.Wait), 14h
		    jp	    ResetActorSpeed		    ; Stop the scorpion


;----------------------------------------------------------------------------
;
; Wait,	select a new direction and start moving	again
;
;----------------------------------------------------------------------------

ScorpionWait:
		    dec	    (ix+ACTOR.Wait)
		    ret	    nz

		    ld	    (ix+ACTOR.Status), 0	    ; Moving status
		    ld	    (ix+ACTOR.Moving), 1	    ; Enable movement
		    jr	    ScorpionNewDir		    ; Select a random direction


RandomWait5_8:
		    call    GetRandom3
		    add	    a, 5
		    ld	    (ix+ACTOR.Wait), a
		    ret



; (!?) Unused code

		    ld	    a, (ix+ACTOR.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right

;----------------------------------------------------------------------------
;
; Set scorpion sprite ID
;
;----------------------------------------------------------------------------

SetScorpionSprId:
		    add	    a, a
		    add	    a, 60h			    ; Scorpion sprite id
		    bit	    2, (ix+ACTOR.ANIM_CNT)

		    jp	    z, SetScorpionSprId2
		    inc	    a

SetScorpionSprId2:
		    ld	    (ix+ACTOR.SpriteId), a
		    ret


ScorpionSetSpeed:
		    ld	    a, (ix+ACTOR.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    de,	ScorpionSpeedDat-2
		    call    GetPointerDE2A

		    ld	    (ix+ACTOR.SpeedY), e

DummyAddr3:
		    ld	    (ix+ACTOR.SpeedX), d
		    ret

;----------------------------------------------------------------------------
;
; Scorpion speed dependin on its direction
; It moves diagonally
;
;----------------------------------------------------------------------------
ScorpionSpeedDat:   db -1
		    db -1

		    db 1
		    db 1

		    db 1
		    db -1

		    db -1
		    db 1

;----------------------------------------------------------------------------
;
; Check	scorpion movement boundaries
;
;----------------------------------------------------------------------------

ChkScorpionLimits:
		    ld	    a, (ix+ACTOR.Y)
		    add	    a, 50h
		    cp	    61h
		    ret	    c

		    ld	    a, (ix+ACTOR.X)
		    add	    a, 10h
		    cp	    21h
		    ret

