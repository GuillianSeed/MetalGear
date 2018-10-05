;----------------------------------------------------------------------------
;
; Pitfall logic
;
;----------------------------------------------------------------------------

PitfallLogic:
		    ld	    b, (ix+PITFALL.Status)
		    inc	    b
		    djnz    PitfallLogic2

		    bit	    7, (ix+PITFALL.TOUCH_INFO)	    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
		    ret	    z				    ; Pitfall not triggered

		    ld	    (ix+PITFALL.COLLISION_CFG),	1   ; Enable collision with the	player
		    ld	    (ix+PITFALL.Visible), 1
		    ld	    h, (ix+PITFALL.X)
		    ld	    l, (ix+PITFALL.Y)
		    ld	    (ix+PITFALL.RENDER_DX), h
		    ld	    (ix+PITFALL.RENDER_DY), l
		    ld	    (ix+PITFALL.RENDER_SX), 60h
		    ld	    (ix+PITFALL.RENDER_SY), 0C0h
		    ld	    (ix+PITFALL.HOLE_SIZE), 0

		    ld	    a, 7			    ; SFX pitfall opening
		    call    SetSoundEntryChk

NextPitfallStat:
		    jp	    NextActorStatus


PitfallLogic2:
		    dec	    b
		    ret	    nz				    ; Do nothing if the	pitfall	if fully open

		    ld	    a, (ix+PITFALL.HOLE_SIZE)
		    add	    a, 2			    ; Increment	pitfall	hole
		    ld	    (ix+PITFALL.HOLE_SIZE), a

		    cp	    40h				    ; Fully opened width and height
		    jr	    c, PitfallLogic3		    ; Still opening

		    ld	    (ix+PITFALL.DestinationX), 16h
		    ld	    (ix+PITFALL.RENDER_SX), 40h
		    ld	    (ix+PITFALL.RENDER_SY), 0A0h    ; (64, 160)	Coordinates of pitfall opened image in VRAM page 1

		    res	    0, (ix+PITFALL.RENDER_DY)
		    res	    0, (ix+PITFALL.RENDER_DX)
		    jr	    nc,	NextPitfallStat		    ; Idle status

PitfallLogic3:
		    dec	    (ix+PITFALL.RENDER_DY)
		    dec	    (ix+PITFALL.RENDER_DX)
		    dec	    (ix+PITFALL.RENDER_SY)
		    dec	    (ix+PITFALL.RENDER_SX)

		    call    GetPitfallCoord		    ; HL = SX, SY, DE =	DX, DY

		    ld	    b, (ix+PITFALL.HOLE_SIZE)	    ; NX
		    ld	    c, 1			    ; NY (1 pixel horizontal line)
		    ld	    a, 1			    ; From page	1 to 0
		    call    VDP_Copy_Byte		    ; Draw upper part

		    call    GetPitfallCoord

		    ld	    b, (ix+PITFALL.HOLE_SIZE)
		    ld	    c, 1			    ; NY (1 pixel horizontal line)

		    ld	    a, b
		    add	    a, e
		    ld	    e, a			    ; DY = DY +	hole size

		    ld	    a, b
		    add	    a, l
		    ld	    l, a			    ; SY = SY +	hole size

		    ld	    a, 1
		    call    VDP_Copy_Byte		    ; Draw lower part

		    ld	    a, (ix+PITFALL.HOLE_SIZE)
		    ld	    c, a			    ; NY = Hole	size
		    rra
		    rra
		    ret	    c				    ; No need to draw right and	left parts in this iteration. Draw every two iterations.

		    ld	    b, 2			    ; NX
		    ld	    a, 1			    ; From page	1 to 0
		    call    GetPitfallCoord		    ; HL = SX, SY, DE =	DX, DY
		    call    VDP_Copy_Byte		    ; Draw left	part

		    call    GetPitfallCoord		    ; HL = SX, SY, DE =	DX, DY

		    ld	    a, (ix+PITFALL.HOLE_SIZE)
		    ld	    c, a			    ; NY = Hole	size

		    sub	    2				    ; NX to draw
		    ld	    b, a

		    ld	    a, d
		    add	    a, b
		    ld	    d, a			    ; DX = DX +	(hole size - 2)

		    ld	    a, h
		    add	    a, b
		    ld	    h, a			    ; SX = SX +	(hole size - 2)

		    ld	    b, 2			    ; NX
		    ld	    a, 1			    ; From page	1 to 0
		    jp	    VDP_Copy_Byte		    ; Draw right part



;----------------------------------------------------------------------------
;
; Get pitfall render coordinates
;
; Out:
;   DE = DX, DY	(Screen)
;   HL = SX, SY	(VRAM buffer)
;----------------------------------------------------------------------------

GetPitfallCoord:
		    ld	    d, (ix+PITFALL.RENDER_DX)
		    ld	    e, (ix+PITFALL.RENDER_DY)
		    ld	    h, (ix+PITFALL.RENDER_SX)
		    ld	    l, (ix+PITFALL.RENDER_SY)
		    ret


;----------------------------------------------------------------------------
;
; Initialize pitfall
;
;----------------------------------------------------------------------------

InitPitfall:
		    ld	    hl,	ColorsPitfall		    ; Colors used by the pitfalltiles
		    ld	    c, 4			    ; Number of	colors
		    call    SetColorsIndexes2		    ; Configure	colors to unpack the tiles

		    ld	    hl,	GfxPitfall		    ; Pitfall compressed graphics
		    ld	    de,	GfxPitfallBuffer	    ; Buffer used to unpack the	pitfall	tiles
		    ld	    b, 0Ch
		    call    SetupPitfall		    ; Unpack pitfall tiles and draw it fully open in VRAM buffer

		    ld	    (ix+ACTOR.COLLISION_CFG), 5	    ; Enable collision with the	player and set the pitfall as closed

		    ld	    a, (Room)
		    cp	    190				    ; Isolated room in basement	building 2 (CARD 1)
		    ret	    nz				    ; (!?) There is no pitfall in that room. Only a prisoner

		    ld	    (ix+PITFALL.Status), 2	    ; Open
		    ld	    (ix+PITFALL.HOLE_SIZE), 3Fh	    ; Fully open

		    ld	    a, (ix+PITFALL.X)		    ; Pitfall center X
		    sub	    20h				    ; Pitfall width / 2
		    ld	    (ix+PITFALL.RENDER_DX), a

		    ld	    a, (ix+PITFALL.Y)		    ; Pitfall center Y
		    sub	    20h				    ; Pitfall height / 2
		    ld	    (ix+PITFALL.RENDER_DY), a

		    ld	    (ix+PITFALL.RENDER_SX), 40h
		    ld	    (ix+PITFALL.RENDER_SY), 0A0h    ; VRAM page	1 coordinates of the image of a	pitfall	fully opened
		    jr	    RenderPitfallP0		    ; Draw the pitfall

;----------------------------------------------------------------------------
;
; Draw the pitfalls that are open(ing)
;
;----------------------------------------------------------------------------

DrawOpenPitfalls:
		    xor	    a
		    ld	    (TempData),	a		    ; Pitfall not draw in VRAM buffer

DrawOpenPitfalls2:
		    ld	    b, 10h
		    ld	    hl,	EnemyList		    ; Array of enemies in the room

DrawOpenPitfalls3:
		    ld	    a, ID_PITFALL
		    cp	    (hl)			    ; Is it a pitfall?

		    push    bc
		    call    z, DrawOpenPitfalls4	    ; Draw the pitfall
		    pop	    bc

		    ld	    de,	80h
		    add	    hl,	de
		    djnz    DrawOpenPitfalls3
		    ret


DrawOpenPitfalls4:
		    push    hl

		    ld	    hl,	TempData
		    ld	    a, (hl)
		    inc	    (hl)
		    or	    a				    ; Already drawn in buffer?
		    call    z, DrawPitfall_		    ; Draw pitfall in page 1

		    pop	    hl
		    push    hl
		    pop	    ix

		    ld	    a, (ix+PITFALL.Visible)
		    or	    a				    ; Visible?
		    ret	    z				    ; No

		    push    hl
		    call    RenderPitfallP0		    ; Draw pitfall on screen
		    pop	    hl
		    ret


RenderPitfallP0:
		    call    GetPitfallCoord
		    res	    0, d
		    res	    0, h			    ; Even SX and DX

		    ld	    a, (ix+PITFALL.HOLE_SIZE)
		    cp	    40h
		    jr	    c, RenderPitfallP0_2	    ; Not too big

		    ld	    a, 3Fh			    ; Limit hole size
		    ld	    (ix+PITFALL.HOLE_SIZE), a

RenderPitfallP0_2:
		    ld	    b, (ix+PITFALL.HOLE_SIZE)
		    ld	    c, b			    ; BC = NX, NY
		    inc	    c
		    ld	    a, 1			    ; From page	1 to 0
		    jp	    VDP_Copy_Byte		    ; Draw pitfall


