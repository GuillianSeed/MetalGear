;---------------------------------------------------------------------------
;
; Boss Bulldozer
; Moves	a bit and stop,	then repeat but	faster
;
;---------------------------------------------------------------------------

BulldozerLogic:
		    ld	    a, (ix+BULLDOZER.Y)
		    cp	    160
		    jp	    nc,	StopBulldozer		    ; The bulldozer has	reached	the bottom of the room

		    ld	    a, (ix+BULLDOZER.Status)
		    call    JumpIndex

		    dw BuldozerMoving
		    dw BuldozerStop1
		    dw BuldozerMoving
		    dw BuldozerStop2
		    dw BuldozerMoving
		    dw BuldozerStop3
		    dw BulldozerDummy


BuldozerMoving:
		    dec	    (ix+BULLDOZER.Timer)
		    ret	    nz

		    call    StopBulldozer

		    ld	    (ix+BULLDOZER.Timer), 10h
		    jr	    BulldozerNextStat

;----------------------------------------------------------------------------
; First	stop point
;----------------------------------------------------------------------------

BuldozerStop1:
		    dec	    (ix+BULLDOZER.Timer)
		    ret	    nz				    ; Continue stopped

		    ld	    de,	80h			    ; Speed Y

;----------------------------------------------------------------------------
; Set Bulldozer	speed and moving time
;----------------------------------------------------------------------------

BuldozerSetSpeed:
		    call    SetActorSpeedY
		    ld	    (ix+BULLDOZER.Timer), 30h

BulldozerNextStat:
		    jp	    NextActorStatus

;----------------------------------------------------------------------------
; Second stop point
;----------------------------------------------------------------------------

BuldozerStop2:
		    dec	    (ix+BULLDOZER.Timer)
		    ret	    nz				    ; Continue stopped

		    ld	    de,	0C0h			    ; Speed Y
		    jr	    BuldozerSetSpeed

;----------------------------------------------------------------------------
; Third	stop point
;----------------------------------------------------------------------------

BuldozerStop3:
		    dec	    (ix+BULLDOZER.Timer)
		    ret	    nz				    ; Continue stopped

		    ld	    de,	0E0h			    ; Speed Y
		    jr	    BuldozerSetSpeed

;----------------------------------------------------------------------------
; Stops	the Bulldozer
;----------------------------------------------------------------------------

StopBulldozer:
		    ld	    de,	0			    ; Speed Y
		    jp	    SetActorSpeedY




;----------------------------------------------------------------------------
;
; Init bulldozer
;
;----------------------------------------------------------------------------

InitBulldozer:
		    ld	    a, (Bulldozer_KO)
		    or	    a
		    jp	    nz,	DismissActor		    ; Remove actor

		    ld	    hl,	BossTank_KO		    ; (!?) It should be	"Bulldozer_KO"
		    ld	    (ix+BULLDOZER.KO_POINTER_L), l
		    ld	    (ix+BULLDOZER.KO_POINTER_H), h  ; This pointer is not user

		    ld	    (ix+BULLDOZER.Timer), 30h
		    ld	    (ix+BULLDOZER.SpriteId), 13h    ; Bulldozer	sprite ID
		    inc	    (ix+BULLDOZER.Moving)	    ; Enable movement

		    ld	    de,	0			    ; Speed X
		    ld	    hl,	60h			    ; Speed Y
		    call    SetActorSpeed		    ; Set Bulldozer start speed

		    jp	    SetBossMusic		    ; Boss music (Mercenary theme)


;----------------------------------------------------------------------------
;
; Set Bulldozer	dead flag and restore area music
;
;----------------------------------------------------------------------------

SetBulldozerKO:
		    ld	    a, 1
		    ld	    (Bulldozer_KO), a
		    call    SetAreaMusic

BulldozerDummy:
		    ret
