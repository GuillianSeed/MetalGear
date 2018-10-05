;---------------------------------------------------------------------------
;
; Init tank boss
;
;---------------------------------------------------------------------------

InitTank:
		    ld	    a, (BossTank_KO)
		    or	    a
		    jp	    nz,	DismissActor		    ; The tank is already destroyed

		    inc	    (ix+TANK.Moving)		    ; Enable movement
		    ld	    (ix+TANK.SpriteId),	16h	    ; Tank sprite ID

		    xor	    a
		    ld	    (ix+TANK.speedYdec), 80h
		    ld	    (ix+TANK.SpeedY), a

		    ld	    (ix+TANK.MachineGunTimer), 1Eh
		    ld	    (ix+TANK.MachineGunOn), a
		    ld	    (ix+TANK.MachineGunLeftRight), 1
		    ld	    (ix+TANK.NumberShots), a
		    ld	    (ix+TANK.CannonlDelay), 3Ch
		    ld	    (ix+TANK.MovingTime), 9Ah

		    ld	    hl,	BossTank_KO
		    ld	    (ix+TANK.KO_POINTER_L), l
		    ld	    (ix+TANK.KO_POINTER_H), h	    ; Pointer to defeated flag

SetBossMusic:
		    ld	    a, (GameMode)		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late
		    cp	    GAME_MODE_BINOCULARS	    ; Using binoculars?
		    ret	    z				    ; Do not change the	music

		    ld	    a, 3Eh			    ; Music: Mercenary
		    ld	    (AreaMusic), a
		    jp	    SetSoundEntryChk

;----------------------------------------------------------------------------
;
; Tank logic
;
;----------------------------------------------------------------------------

TankLogic:
		    dec	    (ix+TANK.CannonlDelay)
		    jp	    nz,	ChkMachineGun1		    ; Wait before shooting another shell

		    inc	    (ix+TANK.CannonlDelay)	    ; Leave the	cannon ready for shooting

; Shoot	if the player is in front of the tank

		    ld	    a, (PlayerX)
		    sub	    (ix+TANK.X)
		    add	    a, 4
		    cp	    9
		    jp	    nc,	ChkMachineGun1		    ; Player not in front of the tank

; Cannon shoots	a shell

		    ld	    c, ID_TANK_SHELL_BOSS	    ; Tank shell
		    ld	    a, (ix+TANK.Y)
		    add	    a, 4
		    ld	    e, a
		    ld	    d, (ix+TANK.X)
		    call    AddEnemy
		    ld	    (ix+TANK.CannonlDelay), 1Eh	    ; Shell shot delay

ChkMachineGun1:
		    bit	    0, (ix+TANK.MachineGunOn)
		    jp	    nz,	ChkMachineGun2

		    dec	    (ix+TANK.MachineGunTimer)
		    jp	    nz,	AnimateTank

; Start	firing
		    ld	    (ix+TANK.MachineGunTimer), 2Dh
		    ld	    (ix+TANK.MachineGunOn), 1

ChkMachineGun2:
		    dec	    (ix+TANK.MachineGunTimer)
		    jp	    nz,	TankMachineGun

;Stop firing
		    ld	    (ix+TANK.MachineGunTimer), 1Eh
		    ld	    (ix+TANK.MachineGunOn), 0

		    ld	    a, (ix+TANK.MachineGunLeftRight)
		    neg
		    ld	    (ix+TANK.MachineGunLeftRight), a

		    jp	    AnimateTank


TankMachineGun:
		    ld	    a, (ix+TANK.ANIM_CNT)
		    and	    7
		    jp	    nz,	AnimateTank		    ; Do not shot this iteration

		    ld	    c, ID_TANK_BULLET		    ; Bullet
		    ld	    a, (ix+TANK.Y)
		    sub	    0Eh
		    ld	    e, a			    ; Y	Bullet

		    bit	    7, (ix+TANK.MachineGunLeftRight)
		    ld	    a, 16			    ; Offset to	machine	gun X position
		    jp	    z, TankMachineGun2

		    neg					    ; -16

TankMachineGun2:
		    add	    a, (ix+TANK.X)
		    ld	    d, a			    ; X	Bullet
		    call    AddEnemy			    ; Add shot

; Set unsigned speed X of the bullet

		    ld	    bc,	TANK_SHOT.SpeedXUnsigned    ; Offset to	unsigned spped X of the	bullet
		    add	    hl,	bc			    ; HL = Pointer to TANK_BULLET actor, SpeedXUnsigned	property

		    ld	    a, (ix+TANK_SHOT.NumberShots)
		    inc	    a
		    and	    7
		    ld	    (ix+TANK.NumberShots), a
		    cp	    5
		    jp	    c, TankMachineGun3

		    sub	    8
		    neg

TankMachineGun3:
		    ld	    (hl), a			    ; Set unsigned bullet X speed (0-4)

; Animate tank


AnimateTank:
		    ld	    a, (ix+TANK.Status)
		    cp	    2				    ; Tank idle?
		    jp	    z, TankIdle			    ; No need to animate

		    ld	    a, 16h			    ; Tank frame 1 sprite ID
		    bit	    2, (ix+TANK.ANIM_CNT)
		    jp	    z, AnimateTank2

		    inc	    a				    ; Tank frame 2 sprite ID

AnimateTank2:
		    ld	    (ix+TANK.SpriteId),	a

		    ld	    a, (ix+TANK.ANIM_CNT)
		    and	    7Fh
		    jp	    nz,	TankStatusLogic

		    ld	    (ix+TANK.Moving), a		    ; Stop tank

		    ld	    a, (ix+TANK.Status)
		    ld	    (ix+TANK.StatusCopy), a

		    ld	    (ix+TANK.Status), 2		    ; Idle status
		    ld	    (ix+TANK.StopTime),	28h

TankStatusLogic:
		    ld	    a, (ix+TANK.Status)
		    call    JumpIndex

		    dw TankMove
		    dw TankMoveLong
		    dw TankIdle
		    dw TankAlive			    ; Not used (!?)

;----------------------------------------------------------------------------
;
; Tank moves up	and down
;
;----------------------------------------------------------------------------

TankMove:
		    dec	    (ix+TANK.MovingTime)
		    ret	    nz				    ; Continue moving

		    ld	    (ix+TANK.MovingTime), 32h

		    ld	    (ix+TANK.speedYdec), 80h	    ; 0.5 speed
		    ld	    b, 0			    ; Positive speed (moving down)

		    bit	    7, (ix+TANK.SpeedY)		    ; Was moving up?
		    jp	    nz,	TankMoveDown2		    ; Yes

		    dec	    b				    ; Negative speed (moving up)

		    call    GetRandom3
		    jp	    nz,	TankMoveDown2

		    ld	    (ix+TANK.Status), 1		    ; Move up
		    ld	    (ix+TANK.MovingTime), 9Ah

TankMoveDown2:
		    ld	    (ix+TANK.SpeedY), b
		    ret

;----------------------------------------------------------------------------
;
; Tank moves up	and then start moving down
;
;----------------------------------------------------------------------------

TankMoveLong:
		    dec	    (ix+TANK.MovingTime)
		    ret	    nz

		    ld	    (ix+TANK.MovingTime), 9Ah
		    ld	    (ix+TANK.Status), 0		    ; Move down
		    ld	    (ix+TANK.speedYdec), 80h
		    ld	    (ix+TANK.SpeedY), 0		    ; Speed Y =	0.5
		    ret


;----------------------------------------------------------------------------
;
; Tank idle
; Wait and restore previous status
;
;----------------------------------------------------------------------------

TankIdle:
		    dec	    (ix+TANK.StopTime)
		    ret	    nz

		    ld	    a, (ix+TANK.StatusCopy)
		    ld	    (ix+TANK.Status), a		    ; Restore previous status (moving up or down)
		    ld	    (ix+TANK.Moving), 1		    ; Enable movement
		    ret


TankAlive:
		    xor	    a				    ; Not used (!?)
		    ld	    (BossTank_KO), a
		    ret



