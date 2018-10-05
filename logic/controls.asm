;----------------------------------------------------------------------------
;
; Read controls	status
; Update "hold" and "trigger" values
;
;----------------------------------------------------------------------------

UpdateControls:
		    ld	    a, (ControlConfig)		    ; Bit6: 1=Enable music/Player control
		    bit	    6, a
		    ret	    z

		    call    ReadFKeys			    ; Read F1-F5 and RETURN keys

		    ld	    hl,	FKeysHold		    ; 0	0 RET F5 F4 F3 F2 F1
		    call    StoreControls		    ; Update hold and trigger status

		    call    ReadControls		    ; Read controls (keyboard and joystick)

StoreControls_:
		    ld	    hl,	ControlsHold		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up

StoreControls:
		    ld	    c, (hl)
		    ld	    (hl), a			    ; Hold
		    xor	    c
		    and	    (hl)
		    dec	    hl
		    ld	    (hl), a			    ; Trigger
		    ret

;-------------------------------------------------------------
;
; Read controls
;
; Out:
;    A = Result
;    bit 5 = Fire2 / M
;    bit 4 = Fire / Space
;    bit 3 = Right
;    bit 2 = Left
;    bit 1 = Down
;    bit 0 = Up
;-------------------------------------------------------------

ReadControls:
		    ld	    e, 8Fh
		    ld	    a, 0Fh			    ; I/O port B
		    call    WRTPSG

		    ld	    a, 0Eh
		    di
		    call    RDPSG			    ; Read joystick 1

		    ei
		    cpl
		    and	    3Fh
		    push    af

		    ld	    a, 4
		    call    SNSMAT			    ; Read keyboard row	4
		    rra
		    rra
		    rra
		    ld	    e, 20h			    ; Fire 2 bit
		    jr	    nc,	ReadControls2		    ; M

		    rra
		    jr	    nc,	ReadControls2		    ; N

		    ld	    e, 0

ReadControls2:
		    ld	    a, 8
		    call    SNSMAT			    ; Read keyboard row	8
		    cpl
		    rrca
		    rrca
		    ld	    b, a
		    and	    4				    ; Left
		    or	    e
		    ld	    c, a
		    ld	    a, b
		    rrca
		    rrca
		    ld	    b, a
		    and	    18h				    ; Space, right
		    or	    c
		    ld	    c, a
		    ld	    a, b
		    rrca
		    and	    3				    ; down, up
		    or	    c
		    pop	    bc
		    or	    b
		    ret

;-------------------------------------------------------------
;
; Read function	keys and RETURN
;
; Out:
;    A = 0 0 RET F5 F4 F3 F2 F1
;-------------------------------------------------------------

ReadFKeys:
		    ld	    a, 6
		    call    SNSMAT			    ; Read keyboard row	6
		    cpl
		    rlca
		    rlca
		    rlca
		    and	    7
		    ld	    e, a			    ; x	x x x x	F3 F2 F1

		    ld	    a, 7
		    call    SNSMAT			    ; Read keyboard row	7
		    cpl
		    ld	    c, a
		    rlca
		    rlca
		    rlca
		    and	    18h
		    or	    e				    ; x	x x F5 F4 F3 F2	F1

		    ld	    e, a
		    ld	    a, c
		    rra
		    rra
		    and	    20h				    ; Return
		    or	    e
		    ret
