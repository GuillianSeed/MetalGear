;----------------------------------------------------------------------------
;
; Elevator room	logic
;
;----------------------------------------------------------------------------

ElevatorRoomLogic:
		    ld	    a, (ElevatorStatus)
		    ld	    b, a
		    djnz    ElevatorNextRoom

; Floor	reached
		    xor	    a
		    ld	    (GameMode),	a		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late

		    ld	    a, (ControlsHold)		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    and	    0Ch				    ; Left/Right
		    jr	    z, ElevatorLogic2

		    and	    4
		    ld	    a, 3			    ; Left
		    jr	    z, ElevatorLogic2

		    inc	    a				    ; Right

ElevatorLogic2:
		    ld	    (PlayerDirectionNew), a	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    ret


ElevatorNextRoom:
		    djnz    MoveElevator

		    ld	    a, (ElevatorDir)		    ; 1=up, 2=down
		    ld	    (NextRoomDirect), a		    ; 4=Right, 3=Left, 2=Down, 1=Up
		    ld	    a, 1
		    ld	    (GameMode),	a		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late
		    ret


MoveElevator:
		    call    GetDirLeftRight_

		    ld	    a, (Room)
		    ld	    b, a

		    ld	    a, (ControlsHold)		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    ld	    d, a

		    ld	    a, (ElevatorDir)		    ; 1=up, 2=down
		    ld	    hl,	ElevatorY
		    dec	    a				    ; Moving up	or down?
		    jr	    nz,	ElevatorDown

; moving up
		    ld	    a, (PlayerY)
		    dec	    a
		    ld	    (PlayerY), a

		    dec	    (hl)
		    ld	    a, (hl)
		    cp	    24				    ; Upper boundary
		    jr	    c, ElevatorExitRoom

		    ld	    c, a			    ; C=Elevator Y
		    ld	    a, (Room)
		    ld	    b, a

		    cp	    248				    ; Long underground elevator	room
		    jr	    z, ChkDoNotStop

		    cp	    249				    ; Long underground elevator	room
		    jr	    z, ChkDoNotStop

		    cp	    250				    ; Long underground elevator	room
		    jr	    nz,	ChkStopFloor

ChkDoNotStop:
		    ld	    a, d			    ; D=ControlsHold
		    rra					    ; Up?
		    jr	    c, SetElevatorSpr

ChkStopFloor:
		    ld	    a, c			    ; Elevator Y
		    cp	    38h
		    jr	    z, ElevatorNextStatus_

		    ld	    a, b			    ; Room
		    cp	    247				    ; Long underground elevator	room upper floor
		    jr	    nz,	ChkStopFloor2

		    ld	    a, d			    ; ControlsHold
		    rra					    ; Up?
		    jr	    c, SetElevatorSpr

ChkStopFloor2:
		    ld	    a, c			    ; Elevator Y
		    cp	    78h
		    jr	    z, ElevatorNextStatus_

		    cp	    0B8h
		    jr	    z, ElevatorNextStatus_

		    jr	    SetElevatorSpr


ElevatorDown:
		    ld	    a, (PlayerY)
		    inc	    a
		    ld	    (PlayerY), a

		    inc	    (hl)
		    ld	    a, (hl)
		    cp	    208
		    jr	    nc,	ElevatorExitRoom

		    ld	    c, a
		    ld	    a, b			    ; B=Room
		    cp	    247
		    jr	    z, ChkDoNotStop2

		    cp	    248
		    jr	    z, ChkDoNotStop2

		    cp	    249
		    jr	    nz,	ElevatorDown3

ChkDoNotStop2:
		    ld	    a, d
		    and	    2
		    jr	    nz,	SetElevatorSpr

ElevatorDown3:
		    ld	    a, c			    ; Elevator Y
		    cp	    0B8h
		    jr	    z, ElevatorNextStatus_

		    ld	    a, b
		    cp	    0FAh
		    jr	    nz,	ElevatorDown4

		    ld	    a, d
		    rra
		    jr	    c, SetElevatorSpr

ElevatorDown4:
		    ld	    a, c
		    cp	    78h
		    jr	    z, ElevatorNextStatus_

		    cp	    38h
		    jr	    z, ElevatorNextStatus_

		    jr	    SetElevatorSpr


ElevatorNextStatus_:
		    call    SetElevatorSpr

ElevatorNextStatus:
		    ld	    hl,	ElevatorStatus
		    inc	    (hl)
		    ret


ElevatorExitRoom:
		    call    ElevatorNextStatus
		    inc	    (hl)
		    ret


;----------------------------------------------------------------------------
;
; Update elevator sprites attributes and colors
;
;----------------------------------------------------------------------------

SetElevatorSpr:
		    ld	    hl,	SprElevatorDat
		    ld	    de,	SprElevatorAttr
		    ld	    bc,	0CFFh

SetElevatorSpr2:
		    ld	    a, (ElevatorY)
		    add	    a, (hl)
		    ld	    (de), a			    ; Sprite Y
		    inc	    hl
		    inc	    e

		    ld	    a, (ElevatorX)
		    add	    a, (hl)
		    ld	    (de), a			    ; Sprite X
		    inc	    hl
		    inc	    e

		    ldi					    ; Sprite pattern
		    inc	    hl
		    inc	    e
		    djnz    SetElevatorSpr2

; Set sprites colors
		    ld	    de,	SprElevatorCol
		    ld	    hl,	SprElevatorDat
		    ld	    c, 0Ch			    ; Number of	sprites	used in	the elevator
		    inc	    hl
		    inc	    hl
		    inc	    hl

SetElevatorSpr3:
		    ld	    a, (hl)
		    ld	    b, 10h			    ; 16 lines per sprite

SetElevatorSpr4:
		    ld	    (de), a
		    inc	    de
		    djnz    SetElevatorSpr4

		    inc	    hl
		    inc	    hl
		    inc	    hl
		    inc	    hl
		    dec	    c
		    jr	    nz,	SetElevatorSpr3
		    ret

;----------------------------------------------------------------------------
; Elevator attributes
; Offset Y, offset X, sprite, color
;----------------------------------------------------------------------------
SprElevatorDat:	    db 0D0h,0F8h, 38h, 0Ch
		    db 0D0h,0F8h, 3Ch, 4Bh
		    db 0E0h,0F0h, 40h,	 2
		    db 0E0h,0F0h, 44h, 4Dh
		    db 0E0h,   0, 48h,	 2
		    db 0E0h,   0, 4Ch, 4Dh
		    db 0F0h,0F0h, 50h,	 2
		    db 0F0h,0F0h, 54h, 4Dh
		    db 0F0h,   0, 58h,	 2
		    db 0F0h,   0, 5Ch, 4Dh
		    db	  0,0F8h, 60h, 0Ch
		    db	  0,0F8h, 64h, 4Bh