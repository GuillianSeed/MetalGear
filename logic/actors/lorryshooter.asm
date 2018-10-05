;----------------------------------------------------------------------------
;
; Init lorry shooter
; Used in the lorries in the desert before building 3
;
;----------------------------------------------------------------------------

InitLorryShooter:
		    call    HideSprColor		    ; Non visible

		    ld	    (ix+ACTOR.COLLISION_CFG), 0	    ; Disable collisions with the player and his shots

		    ld	    a, DIR_DOWN
		    ld	    (ix+ACTOR.Direction), a	    ; Looking down

		    call    GuardLookDirection2

		    ld	    a, (GameMode)		    ; Do not change music when using the binoculars
		    cp	    GAME_MODE_BINOCULARS	    ; Binoculars mode
		    jr	    z, LorrySetRndWait

		    ld	    a, 32h			    ; Alert music
		    ld	    (AreaMusic), a
		    call    SetSoundEntryChk

LorrySetRndWait:
		    ld	    a, r
		    xor	    (ix+ACTOR.ANIM_CNT)
		    and	    0Fh
		    inc	    a
		    ld	    (ix+ACTOR.Wait), a		    ; Random wait
		    ret

;----------------------------------------------------------------------------
;
; Lorry	shooter	logic
; Guard	that exits and enters a	lorry while shooting
;
;----------------------------------------------------------------------------

LorryShooterLogic:
		    ld	    a, (ix+ACTOR.Status)
		    call    JumpIndex

		    dw LorryShooterThink		    ; Wait and decide to shoot or exit the lorry
		    dw LorryShooterWait			    ; After showing up and shooting, the guard waits before entering the lorry
		    dw LorryShooterWalkOut		    ; Walks out	the lorry and shoots
		    dw LorryShooterWaitOut		    ; Waits outside the	lorry
		    dw LorryShooterWalkIn		    ; Walks towards the	lorry


;----------------------------------------------------------------------------
;
; Wait and decide to exit the lorry or shot from inside
;
;----------------------------------------------------------------------------

LorryShooterThink:
		    dec	    (ix+ACTOR.Wait)
		    ret	    nz

		    call    GetRandom3
		    cp	    1
		    jp	    c, LorryShooterShot		    ; Shot from	inside the lorry

		    jp	    z, LorryShooterShow		    ; A	guard shows up and shoots

		    ld	    (ix+ACTOR.Status), 2	    ; Exit the lorry
		    ld	    (ix+ACTOR.SpeedY), 2	    ; Speed Y
		    inc	    (ix+ACTOR.Moving)		    ; Enable movement
		    ld	    (ix+ACTOR.Wait), 0Ah
		    jr	    LorShooterSetCol		    ; Enable collisions	and set	sprites	colors



;----------------------------------------------------------------------------
;
; Shoot	and wait
;
;----------------------------------------------------------------------------

LorryShooterShow:
		    ld	    (ix+ACTOR.Status), 1	    ; Wait status
		    ld	    (ix+ACTOR.Wait), 1Eh
		    call    GuardLookDirection
		    call    LorShooterSetCol

LorryShooterShot:
		    ld	    c, ID_BULLET
		    jp	    AddEnemyShot2



;----------------------------------------------------------------------------
;
; Wait and disable collisions, hide sprite and set think status
;
;----------------------------------------------------------------------------

LorryShooterWait:
		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Conitnue waiting

		    ld	    (ix+ACTOR.Status), 0	    ; Think status
		    ld	    (ix+ACTOR.COLLISION_CFG), 0	    ; Disable collisions
		    call    HideSprColor		    ; Hide actor
		    jr	    LorrySetRndWait



;----------------------------------------------------------------------------
;
; Exit the lorry walking and shoots
;
;----------------------------------------------------------------------------

LorryShooterWalkOut:
		    call    AnimateGuard
		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Walks out	the lorry

		    ld	    (ix+ACTOR.Status), 3	    ; Wait status
		    ld	    (ix+ACTOR.SpeedY), 0	    ; Stop actor
		    ld	    (ix+ACTOR.Wait), 19h

		    call    GetDirToPlayer
		    ld	    (ix+ACTOR.Direction), a	    ; Face the player

		    call    GuardLookDirection2		    ; Update guard sprite
		    jr	    LorryShooterShot		    ; Shoots



;----------------------------------------------------------------------------
;
; Wait and start walking back into the lorry
;
;----------------------------------------------------------------------------

LorryShooterWaitOut:
		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Waits after shooting

		    ld	    (ix+ACTOR.Status), 4	    ; Walk into	the lorry status
		    ld	    (ix+ACTOR.SpeedY), -2	    ; Speed Y to move towards the lorry
		    ld	    (ix+ACTOR.Direction), DIR_UP    ; Up
		    ld	    (ix+ACTOR.Wait), 0Ah
		    ret



;----------------------------------------------------------------------------
;
; Walk into the	lorry
;
;----------------------------------------------------------------------------

LorryShooterWalkIn:
		    call    AnimateGuard		    ; Update walk animation
		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Walks towards the	lorry

		    xor	    a
		    ld	    (ix+ACTOR.Status), a	    ; Set think	status
		    ld	    (ix+ACTOR.SpeedY), a	    ; Stop moving
		    ld	    (ix+ACTOR.Moving), 1	    ; Enable movement
		    ld	    (ix+ACTOR.Direction), DIR_DOWN  ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    (ix+ACTOR.COLLISION_CFG), a	    ; Disable collisions
		    call    HideSprColor		    ; Hice actor
		    jp	    LorrySetRndWait



;----------------------------------------------------------------------------
;
; Enable collision with	the player and his shots
; Set sprites colors
;
;----------------------------------------------------------------------------

LorShooterSetCol:
		    ld	    (ix+ACTOR.COLLISION_CFG), 3	    ; Enable collisions	with the player	and his	shots

		    ld	    de,	24Dh
		    ld	    (ix+ACTOR.Spr1Color), d
		    ld	    (ix+ACTOR.Spr2Color), e
		    ld	    (ix+ACTOR.Spr3Color), d
		    ld	    (ix+ACTOR.Spr4Color), e
		    ret
