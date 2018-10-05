;----------------------------------------------------------------------------
;
; Draw laser beams, if availables, when	wearing	goggles
;
;----------------------------------------------------------------------------

DrawLaserBeams:
		    ld	    a, (SelectedItem)
		    cp	    SELECTED_GOGGLES		    ; Using Goggles?
		    ret	    nz				    ; No

		    ld	    a, (AlertMode)
		    and	    a
		    ret	    nz				    ; No laser beams in	alert mode

		    ld	    a, (Room)
		    sub	    24				    ; Room with	lasers 1 (24)
		    jr	    z, DrawLaserBeams2

		    dec	    a				    ; Room with	lasers 2 (25)
		    jr	    z, DrawLaserBeams2

		    cp	    47				    ; Room with	lasers 3 (72)
		    ret	    nz

DrawLaserBeams2:
		    ld	    hl,	EnemyList		    ; Array of enemies in the room
		    ld	    a, (NumEnemies)
		    ld	    b, a

DrawLaserBeams3:
		    push    bc
		    push    hl

		    inc	    hl
		    bit	    0, (hl)			    ; Laser on?
		    jr	    z, DrawLaserBeams5

		    inc	    hl
		    inc	    hl

		    ld	    e, (hl)			    ; Y
		    inc	    hl
		    inc	    hl
		    ld	    d, (hl)			    ; X

		    ld	    a, 10h
		    call    ADD_HL_A_

		    ld	    b, (hl)			    ; Lenght
		    inc	    hl

		    ld	    a, (hl)			    ; 0=Vertical, 1=Horizontal
		    and	    a

		    ld	    c, 8			    ; Red color
		    ex	    de,	hl
		    jr	    nz,	DrawLaserBeams4

		    call    DrawLineVert_

		    jr	    DrawLaserBeams5


DrawLaserBeams4:
		    call    DrawLineHoriz_

DrawLaserBeams5:
		    pop	    hl
		    pop	    bc

		    ld	    a, 80h
		    call    ADD_HL_A_

		    djnz    DrawLaserBeams3
		    ret

;----------------------------------------------------------------------------
;
; Restore laser	background
;
;----------------------------------------------------------------------------

RestLasersBack:
		    ld	    hl,	EnemyList		    ; Array of enemies in the room
		    ld	    a, (NumEnemies)
		    ld	    b, a

RestLaserBack2:
		    push    bc
		    push    hl

		    inc	    hl
		    bit	    0, (hl)			    ; Laser beam on? (0=Off, 1=On)
		    jr	    z, RestLaserBack4

		    inc	    hl
		    inc	    hl
		    ld	    e, (hl)			    ; DY

		    inc	    hl
		    inc	    hl
		    ld	    d, (hl)			    ; DX

		    ld	    a, 17
		    call    ADD_HL_A_			    ; 22

		    ld	    c, (hl)			    ; 0=Vertical, 1=Horizontal
		    dec	    hl
		    ld	    b, (hl)			    ; Lenght

		    dec	    hl
		    ld	    a, (hl)			    ; SX

		    dec	    hl
		    ld	    l, (hl)			    ; SY

		    ld	    h, a			    ; SX

		    ld	    a, c
		    ld	    c, 2			    ; Beam width
		    rra					    ; Vertical or horizontal bean?
		    jr	    c, RestLaserBack3		    ; Horizontal

		    ld	    a, b
		    ld	    b, c
		    ld	    c, a

RestLaserBack3:
		    ld	    a, 1			    ; From page	1 to page 0
		    call    VdpCopyByteBnks

RestLaserBack4:
		    pop	    hl
		    pop	    bc

		    ld	    a, 80h
		    call    ADD_HL_A_

		    djnz    RestLaserBack2
		    ret
