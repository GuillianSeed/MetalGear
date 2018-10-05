;----------------------------------------------------------------------------
;
; Incoming call	life cicle
;
; Waits	before the CALL	starts
; CALL in progress
; CALL ends
;----------------------------------------------------------------------------

ChkIncomingCall:
		    ld	    hl,	IncomingCallTimer
		    ld	    a, (hl)
		    and	    a
		    ret	    z				    ; Incoming call not	in progress

		    ld	    a, (RadioCallFlag)		    ; 1=Start incoming call, 2=Stop incoming call
		    cp	    2				    ; Stop incoming call?
		    ret	    z

		    dec	    a				    ; Incoming call in progress?
		    jr	    z, ChkIncomingCall2

		    dec	    (hl)
		    ret	    nz				    ; Incoming call delay

		    ld	    (hl), 58h			    ; Set incoming call	timer
		    ld	    a, 1
		    ld	    (RadioCallFlag), a		    ; Start incoming call

ChkIncomingCall2:
		    dec	    (hl)			    ; Decrement	incoming call timer
		    ret	    nz

		    ld	    a, 2
		    ld	    (RadioCallFlag), a		    ; Stop incoming call
		    ret