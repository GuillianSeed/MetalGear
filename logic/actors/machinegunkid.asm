;----------------------------------------------------------------------------
;
; Init MachineGun Kid
;
;----------------------------------------------------------------------------


InitMachGunKid:
		    ld	    hl,	MachGunStatus		    ; Bit0 = Dead, 1 = Speech done
		    bit	    0, (hl)			    ; Is he dead?
		    jp	    nz,	DismissActor		    ; Yes, remove actor

		    ld	    (ix+ACTOR2.SpriteId), 31h	    ; Machinegun Kid frame 1 sprite ID
		    ld	    (ix+ACTOR2.TIMER), 2
		    ret



;----------------------------------------------------------------------------
;
; MachineGun Kid logic
;
;----------------------------------------------------------------------------


MachGunKidLogic:
		    ld	    a, (ix+ACTOR.Status)
		    call    JumpIndex

		    dw MachGunKidIntro
		    dw MG_ThinkMovement
		    dw MG_MoveToShot
		    dw MG_Shooting
		    dw MG_MoveToHide


;----------------------------------------------------------------------------
;
; MachineGun Kid intro speech
;
;----------------------------------------------------------------------------


MachGunKidIntro:
		    dec	    (ix+ACTOR2.TIMER)
		    ret	    nz				    ; Intro delay to allow sprites refresh

		    ld	    hl,	MachGunStatus		    ; Bit0 = Dead, 1 = Speech done
		    bit	    1, (hl)			    ; Speech done?
		    jr	    nz,	MachGunKidIntro2

		    set	    1, (hl)
		    ld	    a, 79			    ; TEXT: I'm Machine Gun...
		    call    SetTextUnskippable

MachGunKidIntro2:
		    ld	    (ix+ACTOR2.MOVING),	1	    ; Enable movement
		    call    SetBossMusic		    ; Set boss music (Mercenary	theme)
		    jp	    MG_ChoseDir


;----------------------------------------------------------------------------
;
; MachineGun Kid thinks	next movement
; If the player	is hidden in the same wall, waits and then he chooses a	random direction
; If the player	is in a	different wall,	moves towards him
;
;----------------------------------------------------------------------------


MG_ThinkMovement:
		    dec	    (ix+ACTOR.Wait)
		    jr	    nz,	MG_ChkSameWall

		    ld	    a, r
		    xor	    (ix+ACTOR2.ANIM_CNT)
		    rra					    ; Random direction
		    ld	    b, DIR_LEFT			    ; Left
		    ld	    a, -4
		    jr	    c, MG_ThinkMovement2

		    inc	    b				    ; Right
		    ld	    a, 4

MG_ThinkMovement2:
		    ld	    (ix+ACTOR2.Direction), b	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    (ix+ACTOR2.SpeedX),	a

MG_ThinkMovement3:
		    ld	    (ix+ACTOR2.SpriteId), 33h
		    ld	    (ix+ACTOR2.Wait), 8
		    ld	    (ix+ACTOR2.Status),	2
		    ret


;----------------------------------------------------------------------------
;
; Check	if the player is in the	same wall
;
;----------------------------------------------------------------------------


MG_ChkSameWall:
		    ld	    a, (PlayerX)
		    sub	    (ix+ACTOR2.X)
		    add	    a, 8
		    cp	    11h
		    ret	    c				    ; In the same wall

; Move towards the player

		    ld	    a, (PlayerX)
		    cp	    (ix+ACTOR2.X)
		    ld	    b, DIR_LEFT
		    ld	    a, -4			    ; Left speed
		    jr	    c, MG_ThinkMovement5

		    inc	    b				    ; Right
		    ld	    a, 4			    ; Right speed

MG_ThinkMovement5:
		    ld	    (ix+ACTOR2.Direction), b	    ; (!?) Why not jumping to MG_ThinkMovement2?
		    ld	    (ix+ACTOR2.SpeedX),	a
		    jr	    MG_ThinkMovement3



;----------------------------------------------------------------------------
;
; MachineGun Kid walks in the chosen direction and then	shoots
;
;----------------------------------------------------------------------------


MG_MoveToShot:
		    bit	    2, (ix+ACTOR2.ANIM_CNT)
		    ld	    a, 33h			    ; Walk frame 1 sprite ID
		    jr	    z, MG_MoveToShot2
		    inc	    a				    ; Frame 2

MG_MoveToShot2:
		    ld	    (ix+ACTOR2.SpriteId), a

		    dec	    (ix+ACTOR2.Wait)
		    ret	    nz				    ; Continue walking

		    ld	    (ix+ACTOR2.SpriteId), 31h	    ; Shooting sprite ID
		    ld	    (ix+ACTOR2.Wait), 28h
		    ld	    (ix+ACTOR2.Status),	3	    ; Shooting status
		    ld	    (ix+ACTOR2.SpeedX),	0	    ; Stops
		    ret



;----------------------------------------------------------------------------
;
; MachineGun Kid shoots	a burst	of bullets
;
;----------------------------------------------------------------------------


MG_Shooting:
		    ld	    a, (PlayerX)
		    sub	    (ix+ACTOR2.X)
		    add	    a, 30h
		    cp	    61h
		    jr	    nc,	MG_ChoseDir

		    dec	    (ix+ACTOR2.Wait)		    ; Shooting timer
		    jr	    z, MG_ChoseDir

		    ld	    a, (ix+ACTOR2.Wait)
		    and	    3
		    ld	    (ix+ACTOR2.SpriteId), 31h	    ; MGK shooting sprite ID
		    ret	    nz				    ; Do not shoot this	iteration

		    ld	    (ix+ACTOR2.SpriteId), 32h	    ; Recoil spr

		    ld	    c, ID_SHOT_M_GUN_KID
		    call    AddEnemyShot2		    ; Create shot

		    ld	    bc,	M_GUN_KID_SHOT.BurstDir
		    add	    hl,	bc			    ; HL = Shot	actor BurstDir field

		    ld	    a, (ix+ACTOR2.Timer)	    ; Burst counter
		    inc	    a
		    and	    7
		    ld	    (ix+ACTOR2.Timer), a

		    cp	    5
		    jr	    c, MG_Shooting2

		    sub	    8
		    neg

MG_Shooting2:
		    ld	    (hl), a			    ; Burst direction (0-4)
							    ; Shot speed = (direction *	64) - #80
		    ret



;----------------------------------------------------------------------------
;
; MachineGun Kid chooses where to move
; Check	left and right limits
; Moves	toward the player
;
;----------------------------------------------------------------------------


MG_ChoseDir:
		    ld	    a, (ix+ACTOR2.X)
		    ld	    c, a
		    cp	    0E0h			    ; Right limit
		    ld	    a, -4
		    ld	    b, DIR_LEFT
		    jr	    z, MG_ChoseDir2		    ; Move to the left

; Check	left limit

		    ld	    a, c			    ; MGK X
		    cp	    20h				    ; Left limit
		    ld	    a, 4
		    ld	    b, a			    ; Right
		    jr	    z, MG_ChoseDir2		    ; Move to the right

; Moves	towards	the player

		    ld	    a, (PlayerX)
		    cp	    c				    ; MGK X
		    dec	    b				    ; Left
		    ld	    a, -4			    ; Left speed
		    jr	    c, MG_ChoseDir2

		    inc	    b				    ; Right
		    ld	    a, 4			    ; Right speed

MG_ChoseDir2:
		    ld	    (ix+ACTOR2.Direction), b	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    (ix+ACTOR2.SpeedX),	a
		    ld	    (ix+ACTOR2.SpriteId), 33h	    ; Machinegun Kid walk sprite ID
		    ld	    (ix+ACTOR2.Wait), 8
		    ld	    (ix+ACTOR2.Status),	4	    ; Hide status
		    ld	    (ix+ACTOR2.MOVING),	1	    ; Enable movement
		    ret


;----------------------------------------------------------------------------
;
; MachineGun Kid moves to hide
; Update walk animation
; Set think status
;
;----------------------------------------------------------------------------


MG_MoveToHide:
		    bit	    2, (ix+ACTOR2.ANIM_CNT)
		    ld	    a, 33h			    ; Machinegun Kid walk sprite ID
		    jr	    z, MG_MoveToHide2

		    inc	    a				    ; Walk frame 2

MG_MoveToHide2:
		    ld	    (ix+ACTOR2.SpriteId), a

		    dec	    (ix+ACTOR2.Wait)
		    ret	    nz				    ; Continue moving

		    ld	    (ix+ACTOR2.Status),	1	    ; Think status
		    ld	    (ix+ACTOR2.SpeedX),	0	    ; Do not move
		    ld	    (ix+ACTOR2.Wait), 2Dh
		    ld	    (ix+ACTOR2.SpriteId), 31h	    ; Machinegun Kid fire sprite ID
		    ret




;----------------------------------------------------------------------------
;
; Init MachineGun Kid shot
;
;----------------------------------------------------------------------------


InitMGunKidShot:
		    ld	    (ix+M_GUN_KID_SHOT.Moving),	1   ; Enable movement
		    ld	    (ix+M_GUN_KID_SHOT.COLLISION_CFG), 1 ; Enable collisions with the player
		    ld	    (ix+M_GUN_KID_SHOT.SpriteId), 72h ;	Bullet sprite ID
		    ret

;---------------------------------------------------------------------------
;
; MachineGun Kid shot logic
;
;---------------------------------------------------------------------------


MGunKidShotLogic:
		    bit	    0, (ix+M_GUN_KID_SHOT.Configured)
		    ret	    nz				    ; Do nothing

		    ld	    (ix+M_GUN_KID_SHOT.Configured), 1 ;	Shot already configured

		    ld	    hl,	-80h			    ; Speed to the left

		    ld	    a, (ix+M_GUN_KID_SHOT.BurstDir)
		    or	    a				    ; Clear carry flag
		    rra
		    rra
		    rra
		    ld	    d, 0
		    rl	    d
		    ld	    e, a			    ; DE = A * 64

		    add	    hl,	de			    ; 0-4 directions = -#80 , -#40, #00, #40, #80 speeds

		    ld	    (ix+M_GUN_KID_SHOT.SpeedXdec), l
		    ld	    (ix+M_GUN_KID_SHOT.SpeedX),	h   ; Set shot X speed
		    ld	    (ix+M_GUN_KID_SHOT.SpeedY),	5

		    ld	    a, 5			    ; SFX Shot
		    jp	    SetSoundEntryChk

