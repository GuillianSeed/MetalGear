
;----------------------------------------------------------------------------
;
; Check	if the player triggers the alert by touching a laser bean
;
; In:
;   DE = Player	XY
;
;----------------------------------------------------------------------------

ChkTouchLaser:
		    bit	    0, (ix+ACTOR.Status)
		    ret	    z				    ; Laser bean off

		    bit	    0, (ix+ACTOR.DestinationX)	    ; Vertical or horizontal laser bean?
		    jr	    nz,	ChkTouchLaser4		    ; Vertical laser bean

		    ld	    a, d
		    sub	    (ix+ACTOR.X)
		    jr	    nc,	ChkTouchLaser2

		    neg

ChkTouchLaser2:
		    cp	    4				    ; Laser width/2
		    ret	    nc

		    ld	    a, (ix+ACTOR.DestinationY)
		    srl	    a
		    ld	    b, a
		    add	    a, 8
		    add	    a, (ix+ACTOR.Y)
		    sub	    e
		    jr	    nc,	ChkTouchLaser3

		    neg

ChkTouchLaser3:
		    cp	    b				    ; Laser lenght/2
		    ret	    nc

		    jr	    TouchLaserAlarm


ChkTouchLaser4:
		    ld	    a, e
		    sub	    (ix+ACTOR.Y)
		    jr	    nc,	ChkTouchLaser5

		    neg

ChkTouchLaser5:
		    cp	    4				    ; Laser height/2
		    ret	    nc

		    ld	    a, (ix+ACTOR.DestinationY)
		    srl	    a
		    ld	    b, a
		    add	    a, (ix+ACTOR.X)
		    sub	    d
		    jr	    nc,	ChkTouchLaser6

		    neg

ChkTouchLaser6:
		    cp	    b				    ; Laser lenght/2
		    ret	    nc

TouchLaserAlarm:
		    set	    7, (ix+ACTOR.TOUCH_INFO)	    ; The laser	bean has been touched

		    ld	    a, 5Ah			    ; Respawn time
		    call    SetAlertModeRespawn		    ; Trigger the alert

		    push    ix
		    call    RestLaserBack_		    ; Restore laser background
		    call    RemoveLaserBeans		    ; Remove laser beans
		    pop	    ix
		    ret


;----------------------------------------------------------------------------
;
; Disable all laser beans in the room
;
;----------------------------------------------------------------------------

RemoveLaserBeans:
		    ld	    ix,	EnemyList		    ; Array of enemies in the room
		    ld	    b, 16			    ; Max. number of enemies

RemoveLaserBeans2:
		    ld	    a, (ix+ACTOR.ID)		    ; Actor ID
		    and	    a				    ; Is the enemy active?
		    call    nz,	DismissActor0		    ; Dismiss the enemy

		    ld	    de,	80h			    ; Enemy structure size
		    add	    ix,	de			    ; IX = Pointer to next enemy

		    djnz    RemoveLaserBeans2
		    ret