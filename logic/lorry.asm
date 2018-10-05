;---------------------------------------------------------------------------
;
; Check	if the actual room is a	lorry that is moving to	other location
;
;---------------------------------------------------------------------------

ChkLorryMov:
		    ld	    a, (Room)
		    ld	    bc,	6
		    ld	    hl,	MovingLorries
		    cpir
		    ret	    nz

		    ld	    a, 90h
		    ld	    (EventCnt),	a
		    ld	    a, GAME_MODE_LORRY
		    ld	    (GameMode),	a		    ; Set lorry	mode
		    ret

;----------------------------------------------------------------------------
; List of lorries that move to other location
;----------------------------------------------------------------------------
MovingLorries:	    db	199, 217, 219, 213, 215, 173



;---------------------------------------------------------------------------
; Moving lorry logic
; Print	"I goofed. The lorry started to move"
; Play engine SFX
; Vertical screen movements
;---------------------------------------------------------------------------

LorryMoving:
		    ld	    hl,	EventCnt
		    dec	    (hl)
		    jr	    z, LorryEnd

		    ld	    a, (hl)

LorryMoving2:
		    cp	    8Eh
		    jr	    nz,	LorryMovFX

		    ld	    a, (LorryMovTextF)
		    and	    a
		    jr	    nz,	LorryMovFX

		    inc	    a
		    ld	    (LorryMovTextF), a

		    ld	    a, 91			    ; TEXT: I goodfed. The lorry started to move
		    jp	    SetTextUnskip_

;----------------------------------------------------------------------------
;
; Shake	the screen vertically to simulate movement
;
;----------------------------------------------------------------------------

LorryMovFX:
		    ld	    a, (hl)
		    ld	    c, a
		    cp	    8Dh
		    ld	    a, 1Fh			    ; Sfx: Lorry moving
		    call    z, SetSoundEntry__

		    ld	    a, c
		    cp	    80h
		    ret	    nc

		    and	    0Eh
		    rra
		    ld	    hl,	VertScrollOffset
		    call    ADD_HL_A_
		    ld	    a, (hl)
		    jr	    SetVertScroll		    ; Shake screen


;----------------------------------------------------------------------------
;
; Scroll register values
;
;----------------------------------------------------------------------------
VertScrollOffset:   db 2
		    db -1
		    db 1
		    db -2
		    db 2
		    db -3
		    db -1
		    db 0


LorryEnd:
		    ld	    a, 28h			    ; Stop lorry engine	sfx
		    call    SetSoundEntry__
		    xor	    a
		    ld	    (GameMode),	a		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late

SetVertScroll:
		    ld	    b, a
		    ld	    c, 23
		    jp	    WRTVDP
