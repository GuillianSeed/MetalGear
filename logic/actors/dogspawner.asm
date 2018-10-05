;---------------------------------------------------------------------------
;
; Init dog spawner
;
;---------------------------------------------------------------------------

InitSpawnDog:
		    call    GetPlayerXY			    ; D	= Player X, E =	Player Y
		    ld	    a, d			    ; Player X
		    ld	    c, 20
		    cp	    c
		    jr	    nc,	SpawnDogInit2

		    ld	    a, d			    ; (!?) previous check is useless

SpawnDogInit2:
		    ld	    (ix+DOG.SpawnX), a		    ; Same X as	the player
		    ld	    (ix+DOG.SpawnY), e		    ; Same Y as	the player
		    ld	    (ix+DOG.Timer), 30h
		    ld	    (ix+DOG.COLLISION_CFG), 0	    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
		    ret

;---------------------------------------------------------------------------
;
; Dog spawner logic
; Spawn	as many	dogs as	there were in the previous room
;
;---------------------------------------------------------------------------

SpawnDogLogic:
		    dec	    (ix+DOG.Timer)
		    ret	    nz				    ; Spawn delay

		    ld	    hl,	NumBasementDogs		    ; Number of	dogs in	the previous room
		    ld	    a, (hl)
		    or	    a				    ; Any dog?
		    jp	    z, DismissActor0		    ; A	dog can	not be spawned if there	was no one in the previous room

		    dec	    (hl)			    ; Decrement	the number of dogs to spawn

		    ld	    (ix+DOG.Timer), 30h
		    ld	    e, (ix+DOG.SpawnY)
		    ld	    d, (ix+DOG.SpawnX)
		    ld	    c, ID_DOG_BASEMENT
		    jp	    AddEnemy			    ; Spawn a dog



