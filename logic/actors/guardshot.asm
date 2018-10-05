;---------------------------------------------------------------------------
;
; Init guard shot
;
; In:
;   IX = Pointer to actor
;---------------------------------------------------------------------------

InitGuardShot:
		    inc	    (ix+ACTOR.Moving)		    ; 0=Does not move
		    ld	    (ix+ACTOR.COLLISION_CFG), 1	    ; Check collision with the player
		    ld	    (ix+ACTOR.SpriteId), 72h	    ; Bullet sprite ID

		    ld	    a, 90h			    ; Shot speed
		    call    CalcShot2			    ; Calculate	speeds to move towards the player
		    call    SetActorSpeed		    ; DE = Speed X, HL = Speed Y

		    ld	    a, 5			    ; SFX shot
		    jp	    SetSoundEntry