;----------------------------------------------------------------------------
; Check	trigger	events:
; - Big	Boss order to switch off your MSX
; - Madnar has been moved message
;----------------------------------------------------------------------------

ChkMadnarMsx:
		    ld	    a, (Room)
		    ld	    c, a
		    cp	    133
		    jr	    nz,	ChkSwitchMsxOff

		    ld	    a, (MadnarMoved)
		    and	    a
		    ret	    nz				    ; Event already triggered

		    ld	    a, 2
		    ld	    (EventCnt),	a
		    ld	    a, 0Ch
		    ld	    (GameMode),	a		    ; Set game mode: Madnar moved
		    ret

;----------------------------------------------------------------------------
; Trigger event	at room	111: Big Boss order to switch off your MSX
;----------------------------------------------------------------------------

ChkSwitchMsxOff:
		    ld	    a, c
		    sub	    111				    ; Basement building	3
		    ret	    nz

		    inc	    a
		    ld	    (SwitchOffMSXF), a		    ; 1	= Big Boss will	order to switch	off your MSX
		    ret

;----------------------------------------------------------------------------
; Trigger event	at room	113: Pretovich Madnar has been moved
;----------------------------------------------------------------------------

chkMadnarLate:
		    ld	    hl,	EventCnt
		    dec	    (hl)

		    ld	    a, 89			    ; TEXT: It's too late
		    jp	    z, SetTextUnskip_

		    ld	    a, (hl)
		    dec	    a
		    ret	    z

		    xor	    a
		    ld	    (GameMode),	a		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late
		    inc	    a
		    ld	    (MadnarMoved), a
		    ret