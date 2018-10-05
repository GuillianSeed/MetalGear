;----------------------------------------------------------------------------
;
; Init shot to player
;
;----------------------------------------------------------------------------

InitShotToPlayer:
		    inc	    (ix+ACTOR.Moving)		    ; Enable movement
		    ld	    (ix+ACTOR.COLLISION_CFG), 1	    ; Enable collisions	with the player
		    ld	    (ix+ACTOR.SpriteId), 72h	    ; Bullet sprite ID

		    ld	    a, 90h
		    call    CalcShot2
		    jp	    SetActorSpeed		    ; Shoot to player
