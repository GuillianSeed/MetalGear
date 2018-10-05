;----------------------------------------------------------------------------
;
; Init tank shell (boss)
;
;----------------------------------------------------------------------------

InitTankShellBoss:
		    ld	    (ix+ACTOR.Moving), 1	    ; Enable movement
		    ld	    (ix+ACTOR.COLLISION_CFG), 1	    ; Enable collisions	with player
		    ld	    (ix+ACTOR.SpriteId), 7Eh	    ; Bullet sprite ID

		    call    ResetActorSpeed

		    ld	    (ix+ACTOR.SpeedY), 6	    ; Bullet speed Y (moving down)

		    ld	    a, 13h			    ; SFX shell	shot
		    jp	    SetSoundEntryChk



;----------------------------------------------------------------------------
;
; Init tank shot
;
;----------------------------------------------------------------------------

InitTankShot:
		    ld	    (ix+TANK_SHOT.SpriteId), 72h    ; Bullet sprite ID
		    ld	    (ix+TANK_SHOT.COLLISION_CFG), 1 ; Enable collisions	with the player
		    jp	    ResetActorSpeed



;----------------------------------------------------------------------------
;
; Tank shot logic
;
;----------------------------------------------------------------------------

TankShotLogic:
		    bit	    0, (ix+TANK_SHOT.Status)
		    ret	    nz				    ; Already initialized

		    ld	    (ix+TANK_SHOT.Status), 1	    ; Initialized
		    ld	    (ix+TANK_SHOT.Moving), 1	    ; Enable movement
		    ld	    (ix+TANK_SHOT.SpeedY), 6

		    ld	    a, (ix+TANK_SHOT.SpeedXUnsigned)
		    add	    a, -2
		    ld	    (ix+TANK_SHOT.SpeedX), a	    ; Burst speed X

		    ld	    a, 5			    ; SFX bullet shot
		    jp	    SetSoundEntryChk