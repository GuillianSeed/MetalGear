
;----------------------------------------------------------------------------
;
; Init tanks shell
; Falling shells in the	desert
;
;----------------------------------------------------------------------------

InitTankShell:
		    ld	    (ix+SHELL_DESERT.Moving), 1	    ; Enable movement
		    ld	    (ix+SHELL_DESERT.COLLISION_CFG), 1 ; Enable	collisions with	the player
		    ld	    (ix+SHELL_DESERT.SpriteId),	7Eh ; Tank shell sprite	ID

		    ld	    a, r
		    ld	    hl,	TickCounter
		    xor	    (hl)
		    and	    0Fh
		    add	    a, 0Ah
		    ld	    (ix+SHELL_DESERT.Timer), a	    ; Flying time

		    and	    1
		    ld	    (ix+13h), a			    ; Moving left or right

		    call    ResetActorSpeed
		    ld	    (ix+SHELL_DESERT.SpeedY), 6
		    ret

;----------------------------------------------------------------------------
;
; Tanks	shell logic
; Falling shells in the	desert
;
;----------------------------------------------------------------------------

ThankShellLogic:
		    ld	    de,	18h			    ; Right speed
		    bit	    0, (ix+SHELL_DESERT.LeftRight)  ; Moving left or right?
		    jr	    z, ThankShellLogic2

		    ld	    de,	-18h			    ; Left speed

ThankShellLogic2:
		    call    AddActorSpeedX		    ; Update X speed
		    dec	    (ix+SHELL_DESERT.Timer)	    ; Decrement	flying time
		    ret	    nz				    ; Still in the air

		    ld	    (ix+SHELL_DESERT.Timer), 12h
		    ld	    (ix+SHELL_DESERT.ID), ID_BIG_EXPLOSION	; Transform the	actor into an explosion
		    ld	    (ix+SHELL_DESERT.Moving), 0	    ; Do not move

		    ld	    a, 1Ah			    ; SFX explosion
		    jp	    SetSoundEntryChk

