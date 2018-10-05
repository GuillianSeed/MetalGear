;----------------------------------------------------------------------------
;
; Enemies that can be punched
;
;----------------------------------------------------------------------------
PunchEnemies:	    db ID_GUARD_SLOW
		    db ID_GUARD_MEDIUM
		    db ID_GUARD_FAST
		    db ID_GUARD_ALERT
		    db ID_GUARD_REDALERT
		    db ID_SHOOTER
		    db ID_GUARD_ELEVATOR
		    db ID_GUARD_EXIT_LORRY
		    db ID_GUARD_SWITCH
		    db ID_LORRY_SHOOTER			    ; Used in the lorries in the desert	before building	3
		    db ID_SENTINEL
		    db ID_FAKE_MADNAR



;----------------------------------------------------------------------------
;
; Check	if the player punches an enemy
;
; In:
;   DE = Player	XY
;----------------------------------------------------------------------------

ChkPunchEnemy:
		    ld	    a, (ix+ACTOR.ID)		    ; Enemy type

		    ld	    b, 12			    ; Number of	enemy types that can be	punched
		    ld	    hl,	PunchEnemies		    ; List of enemy types that can be punched

ChkPunchEnemy2:
		    cp	    (hl)			    ; Can be punched?
		    jr	    z, ChkPunchEnemy3

		    inc	    hl
		    djnz    ChkPunchEnemy2		    ; Check next enemy type

		    ret


ChkPunchEnemy3:
		    ld	    a, (PlayerDirection)	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    dec	    a				    ; Up
		    ld	    hl,	PunchUpDat
		    jr	    z, ChkPunchEnemy4

		    dec	    a				    ; Down
		    ld	    hl,	PunchDownDat
		    jr	    z, ChkPunchEnemy4

		    dec	    a				    ; Left
		    ld	    hl,	PunchLeftDat
		    jr	    z, ChkPunchEnemy4

		    ld	    hl,	PunchRightDat

ChkPunchEnemy4:
		    call    ChkArea			    ; Check if the player is correctly punching	the enemy
		    ret	    nc				    ; No

		    ld	    a, (ix+ACTOR.StunnedCnt)
		    cp	    38h
		    ret	    nc				    ; It is not	possible to punch the enemy too	fast

		    ld	    (ix+ACTOR.StunnedCnt), 0	    ; Reset stunned counter

		    set	    6, (ix+ACTOR.TOUCH_INFO)	    ; Set this enemy as	punched

		    ld	    a, 8			    ; Punch enemy sfx
		    jp	    SetSoundEntry



;----------------------------------------------------------------------------
; Punch	areas depending	on the direction
;----------------------------------------------------------------------------
PunchUpDat:	    dw 0C0Ch
PunchLeftDat:	    dw 0C00h
		    dw 0C0Ch
PunchDownDat:	    dw 0CF4h
PunchRightDat:	    dw 0C00h
		    dw 0CF4h



;----------------------------------------------------------------------------
;
; Check	if a point is inside an	area of	an actor
;
; In:
;   HL = Pointer to area
;   IX = Pointer to actor
;   DE = Point XY
;
;----------------------------------------------------------------------------

ChkArea:
		    ld	    a, (ix+ACTOR.Y)
		    add	    a, (hl)			    ; Y	offset
		    inc	    hl
		    sub	    e				    ; Player Y
		    jr	    nc,	ChkArea2

		    neg

ChkArea2:
		    cp	    (hl)			    ; Y	radius
		    ret	    nc				    ; Not in the Y range

		    inc	    hl

		    ld	    a, (ix+ACTOR.X)
		    add	    a, (hl)			    ; X	offset
		    inc	    hl
		    sub	    d				    ; Player X
		    jr	    nc,	ChkArea3

		    neg

ChkArea3:
		    cp	    (hl)			    ; X	radius
		    ret
