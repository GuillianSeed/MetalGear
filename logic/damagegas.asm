

;----------------------------------------------------------------------------
;
; Check	if the player is in a gas room
;
;----------------------------------------------------------------------------

ChkGasRooms:
		    ld	    a, (Room)
		    ld	    b, 9			    ; Number of	rooms with gas
		    ld	    hl,	GasRooms		    ; List of rooms with gas

ChkGasRooms2:
		    cp	    (hl)
		    jr	    z, ChkGasMask		    ; It is a gas room

		    inc	    hl				    ; Next room
		    djnz    ChkGasRooms2
		    ret


;----------------------------------------------------------------------------
;
; Check	if the player is using the gas mask
;
;----------------------------------------------------------------------------

ChkGasMask:
		    ld	    a, (SelectedItem)
		    cp	    SELECTED_GAS_MASK
		    ret	    z				    ; The gas mask is selected

		    ld	    c, 10h			    ; Damage delay

DecrementLife_C:
		    ld	    a, (DamageDelayTimer)
		    and	    a
		    ret	    nz				    ; Wait a bit to avoid continuous damage

		    ld	    a, c
		    ld	    (DamageDelayTimer),	a	    ; Set damage delay

DecrementLife_2:
		    ld	    b, 2
		    jp	    DecrementLife_B



;----------------------------------------------------------------------------
; Gas rooms
;----------------------------------------------------------------------------
GasRooms:	    db	 29,  94,  96,	97,  98, 100, 101, 112,	114

