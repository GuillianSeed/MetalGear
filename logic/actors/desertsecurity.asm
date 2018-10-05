;---------------------------------------------------------------------------
;
; Init desert security
;
; This is not a	visible	guard
; This logic checks if Snake is	wearing	the uniform near the guards.
; In that case,	they will open the door	and let	him go in
; If Snake comes from building 2, this logic is	dismissed
;
;---------------------------------------------------------------------------

InitDesertSecurity:
		    call    StopAlert

		    ld	    a, (PreviousRoom)
		    cp	    73				    ; 2nd building fisrt room
		    jp	    z, RemoveActor_		    ; The players comes	from building 2. Remove	the actor

		    ld	    (ix+ACTOR2.TIMER), 10h	    ; Wait time	before warning text
		    ld	    (ix+ACTOR.COLLISION_CFG), 0	    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
		    ret

;---------------------------------------------------------------------------
;
; Desert security logic
;
;---------------------------------------------------------------------------

DesertSecurityLogic:
		    ld	    a, (AlertMode)
		    or	    a				    ; Alert mode?
		    jp	    nz,	RemoveActor_		    ; Remove this actor

		    call    ChkDesertGuardTxt

		    ld	    a, (ix+ACTOR2.Status)
		    call    JumpIndex

		    dw DesertSecurity1
		    dw DesertSecurity2


;----------------------------------------------------------------------------
;
; Checks if Snake is near the guards.
; If so, checks	if he is wearing the uniform to	open the door, or trigger the alarm
;
;----------------------------------------------------------------------------

DesertSecurity1:
		    call    GetPlayerXY			    ; D	= Player X, E =	Player Y
		    ld	    a, e			    ; Player Y
		    cp	    128
		    ret	    nc				    ; Not near the guards

		    ld	    a, d			    ; Player X
		    cp	    38h				    ; Minimum X
		    ret	    c				    ; Not near the guards

		    cp	    0B8h			    ; Maximum X
		    ret	    nc				    ; Snake is not near	the guards

		    inc	    (ix+ACTOR2.Status)		    ; Next status

DesertSecurity2:
		    ld	    a, (SelectedItem)
		    cp	    SELECTED_UNIFORM		    ; Uniform
		    jr	    z, DesertSecurity3		    ; Let Snake	pass in

		    ld	    a, 1Eh			    ; Respawn time
		    call    SetAlertModeRespawn		    ; Trigger the alert

		    jp	    DismissActor0		    ; Remove the security logic	actor


;----------------------------------------------------------------------------
;
; Wait and show	warning	message	about an intruder
;
;----------------------------------------------------------------------------

ChkDesertGuardTxt:
		    ld	    a, (AlertMode)
		    or	    a
		    ret	    nz				    ; Alert on

		    ld	    a, (ix+ACTOR2.TIMER)
		    or	    a
		    ret	    z

		    dec	    (ix+ACTOR2.TIMER)		    ; Decrement	wait time
		    ret	    nz

		    ld	    hl,	DesertGuardsTextF
		    ld	    a, (hl)
		    or	    a
		    ret	    nz				    ; Text already shown

		    ld	    (hl), 1			    ; Set "text shown" flag

		    ld	    a, 35			    ; TEXT: PROBABLY,FOXHOUNDER	GAINED ACCESS. DON'T MAKE WAY FOR HIM, AT ANY COST.
		    jp	    SetTextUnskippable


;----------------------------------------------------------------------------
;
; Check	building 2 door	status
; 0 = Closed
; 1 = Opening
; 2 = Open
;
;----------------------------------------------------------------------------

DesertSecurity3:
		    ld	    a, (ix+ACTOR2.DOOR_STATUS)
		    or	    a
		    jr	    nz,	DesertSecurity4		    ; Not opened yet

		    inc	    (ix+ACTOR2.DOOR_STATUS)

		    ld	    a, 127			    ; TEXT: Come in
		    jp	    SetTextUnskippable


DesertSecurity4:
		    cp	    2
		    ret	    nc

		    ld	    a, 1
		    ld	    (DoorBuild2LockedF), a	    ; Open door	flag
		    ld	    (byte_C62D), a

		    inc	    (ix+ACTOR2.DOOR_STATUS)	    ; Next door	status
		    ret
