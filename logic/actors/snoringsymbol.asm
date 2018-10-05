;---------------------------------------------------------------------------
;
; Initialize sleeping sign
;
;---------------------------------------------------------------------------

InitSnoringSymbol:
		    ld	    a, r			    ; Random value
		    ld	    (ix+ACTOR.ANIM_CNT), a
		    ld	    (ix+ACTOR.COLLISION_CFG), 0	    ; Disable collision	with the player	and his	shots
		    ld	    (ix+ACTOR.COUNTER),	0E0h
		    ld	    (ix+ACTOR.SpriteId), 3Ah	    ; Snoring symbol frame 1 sprite ID
		    ret





;---------------------------------------------------------------------------
;
; Snoring symbol logic
;
;---------------------------------------------------------------------------

SnoringSymbolLogic:
		    ld	    a, (AlertMode)
		    or	    a
		    jr	    nz,	RemoveSnoringSymbol	    ; Remove the actor in alert	mode

		    ld	    a, (ix-80h)			    ; Previous actor ID
		    or	    a				    ; Is it empty?
		    jr	    z, RemoveSnoringSymbol	    ; Remove the sign. The guard is dead

		    ld	    bc,	0F3Ah			    ; B	= Timer	mask, C	= Zzz sprite ID
		    call    AnimZzzSign			    ; Animate the symbol

		    ld	    a, (Room)
		    cp	    140				    ; 3	sleeping guards	(mines)
		    ret	    z				    ; These guards do not wake up

		    dec	    (ix+ACTOR.COUNTER)		    ; This counter is useless. The sign	is removed by the guard	when he	wakes up.
		    ret	    nz				    ; Continue showing the sign

		    ld	    a, (SleepyGuardFlag)
		    or	    a
		    ret	    nz				    ; There is at least	a sleepy guard

RemoveSnoringSymbol:
		    jp	    DismissActor0
