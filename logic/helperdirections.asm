
;----------------------------------------------------------------------------
;
; Get the direction towards the	player
;
; Out:
;   A =	Direction far
;   B =	Direction near
;
;----------------------------------------------------------------------------

GetDirToPlayer:
		    ld	    a, (PlayerY)
		    sub	    (ix+ACTOR.Y)
		    ld	    d, DIR_DOWN			    ; Down
		    jr	    nc,	GetDirToPlayer2

		    dec	    d				    ; Up
		    neg

GetDirToPlayer2:
		    ld	    b, a			    ; Y	distance

		    ld	    a, (PlayerX)
		    sub	    (ix+ACTOR.X)
		    ld	    e, DIR_RIGHT		    ; Right
		    jr	    nc,	GetDirToPlayer3

		    dec	    e				    ; Left
		    neg

GetDirToPlayer3:
		    cp	    b				    ; Distance X > distande Y?
		    ld	    a, d
		    ld	    b, e
		    ret	    c

		    ld	    a, e
		    ld	    b, d
		    ret

;----------------------------------------------------------------------------
;
; Get the opossite direction towards the player
;
; Out:
;   A =	Direction far
;   B =	Direction near
;
;----------------------------------------------------------------------------

GetOppositePlayer:
		    call    GetDirToPlayer

		    ld	    c, b
		    call    GetOppositeDir
		    ld	    b, a
		    ld	    a, c

GetOppositeDir:
		    dec	    a
		    xor	    1
		    inc	    a
		    ret