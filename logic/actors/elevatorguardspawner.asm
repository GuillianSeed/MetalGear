;---------------------------------------------------------------------------
;
; Init elevator	guard spawner
; If the player	comes from the elevator, the spawn time	is shorter because there are no	guards
;
;---------------------------------------------------------------------------

InitSpawnGuardElev:
		    ld	    (ix+ELEV_GUARD_SPAWNER.COLLISION_CFG), 0 ; Disable collision

		    ld	    a, (PreviousRoom)
		    cp	    240				    ; Elevator
		    ld	    (ix+ELEV_GUARD_SPAWNER.Wait), 1Eh
		    ld	    (ix+ELEV_GUARD_SPAWNER.WaitLoops), 5 ; Enought time	for the	player to move away
		    ret	    z

		    ld	    (ix+ELEV_GUARD_SPAWNER.WaitLoops), 13h ; Enough time for the guards	waiting	and leaving
		    ret


;---------------------------------------------------------------------------
;
; Elevator guard spawner logic
; Spawns the first guard. This guard will spawn	the second guard
;
;---------------------------------------------------------------------------

SpawnGuardElev:
		    ld	    a, (AlertMode)
		    or	    a
		    jp	    nz,	DismissActor0		    ; Remove the actor

		    dec	    (ix+ELEV_GUARD_SPAWNER.Wait)
		    ret	    nz				    ; Wait time

		    ld	    (ix+ELEV_GUARD_SPAWNER.Wait), 1Eh
		    dec	    (ix+ELEV_GUARD_SPAWNER.WaitLoops) ;	Decrement wait loops
		    ret	    nz

		    ld	    (ix+ELEV_GUARD_SPAWNER.WaitLoops), 17h ; Enough time for the guards	logic (enter, wait and leave)
		    ld	    c, ID_GUARD_ELEVATOR
		    ld	    de,	0F230h
		    jp	    AddEnemy			    ; Spawn the	first guard