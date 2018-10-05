;----------------------------------------------------------------------------
;
; Bridge logic
; Setup	bridges	speeds depending on their index
; Move bridges
;----------------------------------------------------------------------------

BridgeLogic:
		    ld	    a, (ix+BRIDGE.Status)
		    dec	    a
		    jp	    z, BridgeCtrlLogic

		    ld	    hl,	EnemyList		    ; Array of enemies in the room
		    ld	    de,	80h			    ; Actor structure size
		    ld	    bc,	1000h			    ; B	= Max. number of enemies, C = Bridge actor counter
		    ld	    a, ID_BRIDGE

BridgeLogic2:
		    cp	    (hl)			    ; Is it a bridge part?
		    jr	    nz,	BridgeLogic3

		    inc	    c				    ; Increment	number of bridge actors
		    push    hl				    ; Save bridge actor

BridgeLogic3:
		    add	    hl,	de
		    djnz    BridgeLogic2



		    ld	    a, c			    ; Number of	bridge actors
		    or	    a				    ; Any bridge actors?
		    jr	    z, NextBridgeStatus

		    push    ix
		    pop	    hl				    ; HL = Pointer to bridge actor

		    ld	    a, BRIDGE.NumberOfBridges
		    or	    l
		    ld	    l, a
		    ld	    b, c
		    ld	    (hl), b			    ; Number of	bridge actors

		    inc	    l

; Save the pointers to the bridge actor

BridgeLogic4:
		    pop	    de				    ; Pointer to bridge	actor

		    ld	    (hl), e
		    inc	    l
		    ld	    (hl), d			    ; Save the pointer to the bridge part
		    inc	    l
		    djnz    BridgeLogic4


; Set the speed	of each	bridge actor

		    ld	    de,	BridgesSpeeds
		    ld	    c, (ix+BRIDGE.NumberOfBridges)

		    push    ix
		    pop	    hl				    ; HL = Pointer to bridge control actor

		    ld	    a, BRIDGE.PointersToBridges
		    add	    a, l
		    ld	    l, a			    ; Pointer to bridges pointers

BridgeLogic5:
		    push    de				    ; Bridges speeds

		    ld	    e, (hl)
		    inc	    l
		    ld	    d, (hl)			    ; DE = Pointer to bridge actor
		    inc	    l

		    ld	    (ix+BRIDGE.P_NextBridge_L),	l
		    ld	    (ix+BRIDGE.P_NextBridge_H),	h

		    ex	    de,	hl

		    ld	    a, BRIDGE.speedYdec
		    add	    a, l
		    ld	    l, a
		    ld	    (hl), 0
		    inc	    l
		    ld	    (hl), 0			    ; Reset Y speed (do	not move in Y axis)
		    inc	    l

		    pop	    de				    ; Bridges speeds X

		    ld	    b, 2

BridgeLogic6:
		    ld	    a, (de)
		    inc	    de
		    ld	    (hl), a			    ; Set bridge speed X
		    inc	    l
		    djnz    BridgeLogic6

		    ld	    l, (ix+BRIDGE.P_NextBridge_L)
		    ld	    h, (ix+BRIDGE.P_NextBridge_H)   ; HL = Pointer to next bridge actor
		    dec	    c				    ; Decrement	number of bridges
		    jr	    nz,	BridgeLogic5

NextBridgeStatus:
		    jp	    NextActorStatus






;----------------------------------------------------------------------------
;
; Move bridges and change the direction	of the movement
;
;----------------------------------------------------------------------------

BridgeCtrlLogic:
		    dec	    (ix+BRIDGE.MOVEMENT_CNT)
		    ret	    nz				    ; Continue moving the bridge

		    ld	    (ix+BRIDGE.MOVEMENT_CNT), 20h
		    ld	    c, (ix+BRIDGE.NumberOfBridges)

		    push    ix
		    pop	    hl

		    ld	    a, BRIDGE.PointersToBridges
		    add	    a, l
		    ld	    l, a

BridgeCtrlLogic2:
		    ld	    e, (hl)
		    inc	    l
		    ld	    d, (hl)			    ; DE = Pointer to bridge
		    inc	    l
		    ld	    (ix+BRIDGE.P_NextBridge_L),	l
		    ld	    (ix+BRIDGE.P_NextBridge_H),	h

		    ex	    de,	hl
		    ld	    a, BRIDGE.SpeedXdec
		    add	    a, l
		    ld	    l, a
		    ld	    e, (hl)
		    inc	    l
		    ld	    d, (hl)			    ; DE = Bridge X speed

		    call    ChangeSignDE		    ; Move in the opposite direction

		    ld	    (hl), d
		    dec	    l
		    ld	    (hl), e			    ; Set new bridge speed X

		    ld	    l, (ix+BRIDGE.P_NextBridge_L)
		    ld	    h, (ix+BRIDGE.P_NextBridge_H)
		    dec	    c
		    jr	    nz,	BridgeCtrlLogic2
		    ret


;----------------------------------------------------------------------------
;
; Speed	of each	bridge actor
;
;----------------------------------------------------------------------------
BridgesSpeeds:	    dw 40h
		    dw 80h
		    dw 0C0h
		    dw 100h
		    dw 100h
		    dw 0C0h
		    dw 80h
		    dw 40h





;----------------------------------------------------------------------------
;
; Initialize bridge
;
;----------------------------------------------------------------------------

InitBridge:
		    inc	    (ix+BRIDGE.MOVING)		    ; Enable movement
		    ld	    (ix+BRIDGE.SpriteId), 35h	    ; Bridge sprite ID
		    ld	    (ix+BRIDGE.MOVEMENT_CNT), 10h
		    ld	    (ix+BRIDGE.COLLISION_CFG), 1    ; Enable collosion with the	player
		    ret


