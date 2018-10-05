;---------------------------------------------------------------------------
;
; Init dog
;
;---------------------------------------------------------------------------

InitDog:
		    ld	    a, r
		    ld	    hl,	TickCounter
		    xor	    (hl)
		    and	    3				    ; Random number 0-3

		    add	    a, a
		    add	    a, a
		    add	    a, a			    ; x8
		    add	    a, 20h
		    ld	    (ix+ACTOR2.Wait), a		    ; Sleeping time

		    ld	    (ix+ACTOR2.SpriteId), 14h	    ; Dog lying
		    ld	    (ix+ACTOR2.COLLISION_CFG), 3    ; Check collision with the player and his shots
		    jp	    ResetActorSpeed

;----------------------------------------------------------------------------
;
; Dog logic
;
;----------------------------------------------------------------------------

DogLogic:
		    ld	    a, (ix+ACTOR2.Status)
		    call    JumpIndex

		    dw DogSleep
		    dw DogListen
		    dw DogMove


;----------------------------------------------------------------------------
;
; The dog is sleeping for (Wait) time.
; Then wakes up	and sets how much time he will be listening
;
;----------------------------------------------------------------------------

DogSleep:
		    dec	    (ix+ACTOR2.Wait)
		    ret	    nz				    ; Continue sleeping

		    call    GetRandom3			    ; Random number 0-3
		    add	    a, 5
		    add	    a, a
		    add	    a, a			    ; Random number 20-32
		    ld	    (ix+ACTOR2.Timer), a	    ; Listening	time

		    add	    a, a
		    ld	    (ix+ACTOR2.Wait), a

		    ld	    (ix+ACTOR2.Status),	1
		    ld	    (ix+ACTOR2.SpriteId), 15h
		    ret


;----------------------------------------------------------------------------
;
; Listen for (LISTEN_TIME) time
; Then randomly	choose to continue sleeping or to start	moving
;
;----------------------------------------------------------------------------

DogListen:
		    dec	    (ix+ACTOR2.Timer)
		    ret	    nz				    ; Continue listening

		    ld	    a, r
		    xor	    (ix+ACTOR2.ANIM_CNT)
		    rra
		    jr	    c, DogStartMoving

		    ld	    (ix+ACTOR2.Status),	0	    ; Sleep again
		    ld	    (ix+ACTOR2.SpriteId), 14h	    ; Dog laying sprite	ID
		    ret


DogStartMoving:
		    ld	    (ix+ACTOR.Status), 2	    ; Set moving status
		    ld	    (ix+ACTOR.Moving), 1	    ; Enable movement

		    call    GetDirToPlayer		    ; Get the direction	to move	towards	the player

		    exx
		    call    ChkDogCollision		    ; Check if the dog collides	with an	obstacle
		    jr	    nc,	DogStartMoving2
		    exx

		    ld	    a, b			    ; Move in the other	axis

DogStartMoving2:
		    ld	    (ix+ACTOR.Direction), a	    ; Set moving direction

		    call    AnimateRunningDog2		    ; Set running dog sprite
		    call    SetChaseSpeed		    ; Set the dog's speed depending on its direction
		    jr	    DogMove4			    ; Set how much time	it will	run in the same	direction



;----------------------------------------------------------------------------
;
; The dog runs in the same direction (WAIT) time
; Then bark, select a new direction and	time to	move towards the player
;
;----------------------------------------------------------------------------

DogMove:
		    call    AnimateRunningDog

		    ld	    a, (ix+ACTOR.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    ChkDogCollision		    ; Check collisions
		    jr	    c, DogMove2			    ; Can not continue moving in that direction

		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Continue running in this direction

		    ld	    a, 3			    ; SFX Bark
		    call    SetSoundEntryChk

DogMove2:
		    call    GetDirToPlayer		    ; Get the direction	to move	towards	the player

		    exx
		    call    ChkDogCollision		    ; Check if the dog collides	with an	obstacle
		    jr	    nc,	DogMove3
		    exx

		    ld	    a, b			    ; Move in the other	axis

DogMove3:
		    ld	    (ix+ACTOR.Direction), a	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    AnimateRunningDog2
		    call    SetChaseSpeed

DogMove4:
		    call    GetRandom3
		    add	    a, 5
		    add	    a, a
		    add	    a, a			    ; Random number 20-32
		    ld	    (ix+ACTOR.Wait), a		    ; How much time the	dog will run in	the same direction
		    ret


;----------------------------------------------------------------------------
;
; Animate running dog
;
;----------------------------------------------------------------------------

AnimateRunningDog:
		    ld	    a, (ix+ACTOR.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right

AnimateRunningDog2:
		    add	    a, a
		    add	    a, 1Eh			    ; #20 Dog up sprite	ID (#20	- Up * 2 = #1E)

		    bit	    2, (ix+ACTOR.ANIM_CNT)	    ; Animate each 4 iterations
		    jr	    nz,	AnimateRunningDog3

		    inc	    a				    ; Second animation frame

AnimateRunningDog3:
		    ld	    (ix+ACTOR.SpriteId), a	    ; Set dog moving sprite ID
		    ret


;----------------------------------------------------------------------------
;
; Set the dog speed depending on its direction
;
;----------------------------------------------------------------------------

SetChaseSpeed:
		    ld	    a, (ix+ACTOR.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    de,	DogSpeeds-2
		    call    GetPointerDE2A
		    ld	    (ix+ACTOR.SpeedY), e

_DummyAddr2:
		    ld	    (ix+ACTOR.SpeedX), d
		    ret


;----------------------------------------------------------------------------
; Dog speeds
;----------------------------------------------------------------------------
DogSpeeds:	    db -3
		    db 0
		    db 3
		    db 0
		    db 0
		    db -3
		    db 0
		    db 3


;----------------------------------------------------------------------------
;
; Check	dog collisions
;
; In:
;    A = Direction
;
; Out:
;   Cy = Collision
;----------------------------------------------------------------------------

ChkDogCollision:
		    ld	    c, a			    ; Direction
		    ld	    de,	DirCollisionPoints-2
		    call    GetPointerDE2A		    ; Get pointer to location to check offsets

		    ld	    a, e			    ; Y	offset
		    add	    a, (ix+ACTOR.Y)
		    ld	    b, a

		    ld	    a, d			    ; X	offset
		    add	    a, (ix+ACTOR.X)

		    ld	    l, b
		    ld	    h, a			    ; HL = Actor XY
		    ld	    b, 1			    ; Size/shape of the	actor

_dummyAddr:
		    jp	    ChkTileCollision_

;----------------------------------------------------------------------------
; Offset per direction to check	the collisions
;----------------------------------------------------------------------------
DirCollisionPoints: db -8
		    db 0

		    db 8
		    db 0

		    db 0
		    db -8

		    db 0
		    db 8
