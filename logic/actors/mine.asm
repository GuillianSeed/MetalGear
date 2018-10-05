;---------------------------------------------------------------------------
;
; Save mines background	and draw mines if mine detector	is selected
;
;---------------------------------------------------------------------------

InitMines:
		    ld	    a, ID_LAND_MINE		    ; Mine ID
		    call    CountEnemyType
		    dec	    a
		    ld	    (ix+ACTOR.IDX_SAME_ID), a	    ; Index of the mine

		    ld	    h, (ix+ACTOR.X)
		    ld	    l, (ix+ACTOR.Y)
		    call    GetMineBackXY		    ; Get mine coordinates and X coordinate in VRAM to store the background

		    ld	    d, a			    ; DX
		    ld	    e, 160			    ; DY (VRAM page 1 background buffer)
		    ld	    bc,	1010h			    ; NX,NY (16x16)
		    ld	    a, 10h			    ; From VRAM	page 0 to 1
		    call    VDP_Copy_Dot		    ; Save mine	background

		    ld	    a, (SelectedItem)
		    cp	    SELECTED_MINE_DETECTOR	    ; Mine detector
		    ret	    nz				    ; Mine detector not	selected. Don't draw mines on screen

DrawMine:
		    ld	    a, (ix+ACTOR.X)		    ; mine X
		    sub	    3
		    ld	    d, a
		    ld	    a, (ix+ACTOR.Y)		    ; Mine Y
		    sub	    3
		    ld	    e, a

		    ld	    hl,	9565h			    ; Mine bitmap XY in	VRAM page 1
		    ld	    bc,	505h			    ; NX,NY (5x5)
		    ld	    a, 48h			    ; From VRAM	page 1 to 0 (transparency)
		    jp	    VDP_Copy_Dot		    ; Draw mine


;----------------------------------------------------------------------------
;
; Get mine background coordinates and offset X in VRAM buffer
;
; In:
;   HL = Mine XY
;
; Out:
;   HL = Background SX,	SY
;    A = Background DX in VRAM page 1
;----------------------------------------------------------------------------

GetMineBackXY:
		    ld	    a, h
		    sub	    8
		    ld	    h, a
		    ld	    a, l
		    sub	    8
		    ld	    l, a

		    ld	    a, (ix+ACTOR.IDX_SAME_ID)
		    rlca
		    rlca
		    rlca
		    rlca				    ; x16
		    ret


;---------------------------------------------------------------------------
;
; Draw mines if	the mine detector is selected
;
;---------------------------------------------------------------------------

DrawMines:
		    ld	    a, (SelectedItem)
		    cp	    SELECTED_MINE_DETECTOR
		    ret	    nz				    ; Mine detector not	selected

		    ld	    ix,	EnemyList		    ; Array of enemies in the room
		    ld	    b, 10h			    ; Max. number of enemies

DrawMines2:
		    ld	    a, (ix+ACTOR.ID)		    ; Bit 7 = Killed
		    cp	    ID_LAND_MINE		    ; Is this enemy a mine?
		    call    z, DrawMines3		    ; Draw the mine

		    ld	    de,	80h			    ; Actor structure size
		    add	    ix,	de			    ; IX = Pointer to next enemy

		    djnz    DrawMines2
		    ret


DrawMines3:
		    ld	    l, (ix+ACTOR.Y)
		    ld	    h, (ix+ACTOR.X)		    ; (!?) HL is not used!

		    push    bc
		    call    DrawMine			    ; Draw the mine
		    pop	    bc

		    ret



