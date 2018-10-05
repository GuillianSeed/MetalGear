
;----------------------------------------------------------------------------
;
; Check	if the player falls into a pitfall
;
; In:
;   DE = Player	XY
;----------------------------------------------------------------------------

ChkPitfall:
		    bit	    2, (ix+PITFALL.COLLISION_CFG)   ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
		    jr	    nz,	ChkTriggerPitfall	    ; The pitfall is closed.Check if the player	triggers it

		    ld	    b, (ix+PITFALL.HOLE_SIZE)	    ; Opening hole size
		    srl	    b				    ; size / 2

		    ld	    a, (ix+PITFALL.RENDER_DY)
		    add	    a, b
		    sub	    e				    ; Player Y
		    jr	    nc,	ChkPitfall2

		    neg

ChkPitfall2:
		    cp	    b				    ; hole size	/ 2
		    ret	    nc				    ; Not in the same Y	range

		    ld	    a, (ix+PITFALL.RENDER_DX)
		    add	    a, b
		    sub	    d				    ; Player X
		    jr	    nc,	ChkPitfall3

		    neg

ChkPitfall3:
		    cp	    b				    ; Hole size	/ 2
		    ret	    nc				    ; Not in the same X	range

		    ld	    b, 0FFh			    ; All life
		    jp	    DecrementLife_B		    ; Kill the player


;----------------------------------------------------------------------------
;
; Check	if the player triggers a pitfall
;
; In:
;   DE = Player	XY
;----------------------------------------------------------------------------

ChkTriggerPitfall:
		    ld	    a, (ix+PITFALL.Y)		    ; Pitfall Y	(centre)
		    sub	    e				    ; Player Y
		    jr	    nc,	ChkTriggerPitfall2

		    neg

ChkTriggerPitfall2:
		    cp	    40				    ; Pitfall trigger radius Y
		    ret	    nc

		    ld	    a, (ix+PITFALL.X)		    ; Pitfall X	(centre)
		    sub	    d				    ; Player X
		    jr	    nc,	ChkTriggerPitfall3

		    neg

ChkTriggerPitfall3:
		    cp	    40				    ; Pitfall trigger radius X
		    ret	    nc

		    set	    7, (ix+PITFALL.TOUCH_INFO)	    ; Trigger the pitfall
		    ret


