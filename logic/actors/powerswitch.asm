;----------------------------------------------------------------------------
;
; Initialize power switch
;
;----------------------------------------------------------------------------

InitPowerSwitch:
		    ld	    (ix+POWER_SWITCH.BRIGHT), 4	    ; Palette RGB component start value

		    ld	    a, 1			    ; Fade in mode
		    ld	    (ix+POWER_SWITCH.BRIGHT_DELTA), a
		    ld	    (PowerSwitchOn), a		    ; Power switch status 1=On,	0=Off/destroyed
		    ret



;----------------------------------------------------------------------------
;
; Power	switch
; Fades	in/out the electrified floor color
;
;----------------------------------------------------------------------------

PowerSwitchLogic:
		    ld	    a, (ix+POWER_SWITCH.ANIM_CNT)
		    and	    3
		    ret	    nz

		    ld	    a, (ix+POWER_SWITCH.BRIGHT)
		    add	    a, (ix+POWER_SWITCH.BRIGHT_DELTA) ;	Increment or decrement the bright value
		    ld	    (ix+POWER_SWITCH.BRIGHT), a

		    cp	    7				    ; Max. bright value? (RGB component	0-7)
		    call    nc,	ChkRevertFade

		    ld	    a, (ix+POWER_SWITCH.BRIGHT)
		    ld	    d, a
		    rlca
		    rlca
		    rlca
		    rlca
		    or	    d
		    ld	    e, d
		    ld	    d, a			    ; DE = RGB color value

		    ld	    a, (Room)
		    ld	    b, 5
		    cp	    116				    ; Electrified floor	before Metal Gear
		    jr	    z, PowerSwitchLogic2

		    cp	    40				    ; Electrified floor	roof building 1
		    jr	    z, PowerSwitchLogic2

		    ld	    b, 9

PowerSwitchLogic2:
		    ld	    a, b
		    jp	    SetPaletteColor		    ; Change the electric floor	color


;----------------------------------------------------------------------------
;
; Swap fade in / fade out animation
;
;----------------------------------------------------------------------------

ChkRevertFade:
		    inc	    a
		    ld	    b, 6
		    jr	    nz,	ChkRevertFade2

		    ld	    b, 1

ChkRevertFade2:
		    ld	    (ix+POWER_SWITCH.BRIGHT), b	    ; Set the next bright value

		    ld	    a, (ix+POWER_SWITCH.BRIGHT_DELTA)
		    ld	    b, -1			    ; Fade out value
		    dec	    a
		    jr	    z, ChkRevertFade3

		    ld	    b, 1			    ; Fade in value

ChkRevertFade3:
		    ld	    (ix+POWER_SWITCH.BRIGHT_DELTA), b ;	Set the	new delta
		    ret
