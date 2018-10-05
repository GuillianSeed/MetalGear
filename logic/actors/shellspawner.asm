;----------------------------------------------------------------------------
;
; Init tank shells spawner
;
;----------------------------------------------------------------------------

InitSpawnTankShell:
		    ld	    a, (BossTank_KO)
		    or	    a
		    jp	    nz,	DismissActor		    ; The tank is destroyed, so	there are no shells falling

		    ld	    (ix+ACTOR.COLLISION_CFG), 0	    ; Disable collisions with the player and his shots
		    ld	    (ix+ACTOR.Wait), 14h
		    ret



;----------------------------------------------------------------------------
;
; Spawn	tank shell logic
;
; Status 0: Wait, SFX and set status 1
; Status 1: Wait, create a new shell, set status 0
;
;----------------------------------------------------------------------------


SpawnTankShell:
		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Wait before shooting a new shell

		    bit	    0, (ix+ACTOR.Status)
		    jr	    nz,	SpawnTankShell2

		    ld	    (ix+ACTOR.Status), 1
		    ld	    (ix+ACTOR.Wait), 14h	    ; Delay between the	shot sfx and shell spawning

		    ld	    a, 0Bh			    ; Shell shot sfx
		    jp	    SetSoundEntryChk



;----------------------------------------------------------------------------
;
; Create a new shell
;
;----------------------------------------------------------------------------


SpawnTankShell2:
		    ld	    (ix+ACTOR.Status), 0
		    ld	    (ix+ACTOR.Wait), 32h

		    ld	    a, (ix+ACTOR.ANIM_CNT)
		    and	    3
		    ld	    a, (PlayerX)
		    jr	    z, SpawnTankShell3		    ; Shell X =	Player X

		    ld	    a, r
		    xor	    (ix+ACTOR.ANIM_CNT)
		    srl	    a
		    ld	    b, a
		    srl	    a
		    add	    a, b
		    add	    a, 20h			    ; Random shell X

SpawnTankShell3:
		    ld	    c, ID_TANK_SHELL_AIR	    ; Tank shell falling from the sky
		    ld	    d, a			    ; X
		    ld	    e, 0			    ; Y	= 0
		    jp	    AddEnemy			    ; Spawn a tank shell
