;----------------------------------------------------------------------------
;
; Text box appear effect
; Draw a growing text box
;
; Out:
;   Cy = Effect	finished
;----------------------------------------------------------------------------

DrawTextBoxIn:
		    ld	    hl,	TextBoxEff_Cnt
		    dec	    (hl)
		    jr	    z, DrawTextBoxIn4

		    ld	    c, 0			    ; Black color
		    call    DrawTextBoxIn3		    ; Fix to erase the bottom line of the interior

		    ld	    a, (TextBoxEff_DY)
		    ld	    hl,	TextBoxStepY
		    sub	    (hl)
		    ld	    (TextBoxEff_DY), a		    ; New text box Y

		    ld	    a, (hl)
		    ld	    hl,	TextBoxEff_NY
		    add	    a, a
		    add	    a, (hl)
		    ld	    (hl), a			    ; New text box height (NY)

DrawTextBoxIn2:
		    ld	    a, (TextBoxEff_DX)
		    ld	    hl,	TextBoxStepX
		    sub	    (hl)
		    ld	    (TextBoxEff_DX), a		    ; New text box X

		    ld	    a, (hl)
		    ld	    hl,	TextBoxEff_NX
		    add	    a, a
		    add	    a, (hl)
		    ld	    (hl), a			    ; New text box width (NX)

		    ld	    hl,	(TextBoxEff_DY)
		    inc	    h
		    inc	    l				    ; HL = Rectangle XY

		    ld	    bc,	(TextBoxEff_NY)
		    dec	    c
		    dec	    c
		    dec	    b
		    dec	    b				    ; BC = Rectangle NX, NY

		    xor	    a				    ; Black color
		    ld	    d, a			    ; Page 0
		    call    FillRect			    ; Text box interior

		    ld	    a, (TextBoxEff_Col)
		    ld	    c, a			    ; Color

DrawTextBoxIn3:
		    ld	    hl,	(TextBoxEff_DY)
		    ld	    de,	(TextBoxEff_NY)
		    inc	    e
		    call    DrawRect			    ; Text box border
		    and	    a
		    ret


DrawTextBoxIn4:
		    scf
		    ret
