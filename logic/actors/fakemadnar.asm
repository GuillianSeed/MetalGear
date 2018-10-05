;---------------------------------------------------------------------------
;
; Fake Madnar logic
;
;---------------------------------------------------------------------------

FakeMadnadLogic:
		    ld	    a, (ix+ACTOR2.Status)
		    call    JumpIndex

		    dw FakeMadnarWait
		    dw FakeMadnarSpeak
		    dw FakeMadnarTrap
		    dw FakeMadnarFall


;----------------------------------------------------------------------------
;
; Waits	until the player rescues him
;
;----------------------------------------------------------------------------

FakeMadnarWait:
		    ld	    b, 0Fh
		    call    Anim2FramesActor		    ; Animate actor each 16 iterations
		    bit	    7, (ix+ACTOR2.TOUCH_INFO)	    ; Is Snake touching	the fake Madnar?
		    ret	    z				    ; No

		    ld	    (ix+ACTOR2.SpriteId), 40h	    ; Free fake	Madnar sprite ID
		    jp	    NextActorStatus


;----------------------------------------------------------------------------
;
; Fake Madnar tells Snake that it is a trap
;
;----------------------------------------------------------------------------

FakeMadnarSpeak:
		    ld	    a, 109			    ; TEXT: ;YOU ARE CAUGHT IN A TRAP.*IN FACT,*WE HAVE	CONFINED DR. PETTROVICH	ON THE SECOND FLOOR.* I	WILL GET YOU FOXHOUNDER!
		    call    SetTextUnskippable

		    jp	    NextActorStatus


;----------------------------------------------------------------------------
;
; Setup	falling	movement and add a pitfall
;
;----------------------------------------------------------------------------

FakeMadnarTrap:
		    call    NextActorStatus

		    inc	    (ix+ACTOR2.MOVING)		    ; Enable movement
		    ld	    de,	100h			    ; Speed Y
		    call    SetActorSpeedY		    ; Set the Y	speed to simulate he is	falling	into the trap

		    ld	    a, 1
		    ld	    (RescuedArray+16h),	a	    ; Mark as rescued
		    ld	    (ix+ACTOR2.Timer), 10h

		    ld	    de,	8060h			    ; Pitfall location
		    ld	    c, ID_PITFALL
		    jp	    AddEnemy			    ; Add a pitfall in the room


;----------------------------------------------------------------------------
;
; Fake Madnar falls (FALL_TIME)	and disappears
;
;----------------------------------------------------------------------------

FakeMadnarFall:
		    dec	    (ix+ACTOR2.Timer)
		    ret	    nz				    ; Continue falling

		    jp	    DismissActor0		    ; Remove actor

