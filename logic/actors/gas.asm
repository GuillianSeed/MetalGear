;---------------------------------------------------------------------------
;
; Init gas
;
;---------------------------------------------------------------------------

InitGas:
		    ld	    (ix+GAS.COLLISION_CFG), 0	    ; Do not detect collisions with the	player or his shots

		    ld	    a, r
		    ld	    (ix+GAS.TIMER), a		    ; Wait time	before showing the gas sprite
		    ld	    (ix+GAS.SpriteId), 38h	    ; Gas sprite ID
		    ret

;---------------------------------------------------------------------------
;
; Gas logic
; Animate, show	and hide gas sprites
;
;---------------------------------------------------------------------------

GasLogic:
		    ld	    a, (ix+ACTOR.Status)
		    call    JumpIndex

		    dw GasWait
		    dw GasShow


GasWait:
		    dec	    (ix+GAS.TIMER)		    ; Decrement	hidden time
		    ret	    nz				    ; The gas is not visible yet

		    ld	    (ix+GAS.TIMER), 20h		    ; Set visible time

		    ld	    a, 2			    ; Sprite color 1
		    ld	    c, 4Dh			    ; Sprite color 2
		    call    SetSprColor			    ; Set gas sprites colors

		    jp	    NextActorStatus		    ; Next status


GasShow:
		    ld	    b, 7			    ; Animation	bit mask (each 8 iterations)
		    call    Anim2FramesActor

		    dec	    (ix+GAS.TIMER)		    ; Decrement	visible	time
		    ret	    nz				    ; Don't hide the gas yet

		    call    HideSprColor		    ; Hide gas sprites setting their colors to 0

		    call    InitGas			    ; Select a new hidden time
		    jp	    ResetActorStatus		    ; Start the	logic again
