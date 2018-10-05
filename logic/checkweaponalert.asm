;----------------------------------------------------------------------------
;
; Check	if the alert is	triggered by using a weapon
; Some rooms are secure
;
;----------------------------------------------------------------------------

ChkAlertTrigger:
		    ld	    a, (IsolatedRoom)		    ; Can't use binoculars. Shooting does not trigger the alarm
		    cp	    1
		    ret	    z				    ; It is an isolated	room

		    ld	    a, (Room)
		    ld	    hl,	RoomShotSecure
		    ld	    b, 55

ChkAlertTrigger2:
		    cp	    (hl)
		    ret	    z				    ; The alert	is not triggered in this room

		    inc	    hl
		    djnz    ChkAlertTrigger2

		    ld	    a, (AlertMode)
		    and	    a
		    ret	    nz				    ; Already in alert mode

		    ld	    a, 5Ah
		    jp	    SetAlertModeRespawn		    ; Trigger the alert


;----------------------------------------------------------------------------
;
; Rooms	where the alert	is not triggered by using a weapon
;
;----------------------------------------------------------------------------
RoomShotSecure:	    db	  5,   6,   9,	10,  20,  29,  37,  50,	 64,  65,  66,	67,  68,  71,  83, 102
		    db	103, 110, 119, 120, 150, 193, 208, 209,	 54,  55,  56,	57,  58,  59,  60,  61
		    db	 62,  63,  93,	94,  95,  96,  97,  98,	 99, 100, 101, 111, 112, 113, 114, 115
		    db	116, 118, 123, 124, 125, 220, 221