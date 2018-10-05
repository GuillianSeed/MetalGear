;----------------------------------------------------------------------------
;
; Render HUD
; Energy bar, rank, call sign, countdown, selected weapon and item
;
;----------------------------------------------------------------------------

RenderHUD:
		    call    DrawLife
		    call    DrawClass
		    call    DrawCallTimer
		    call    DrawWeaponHUD
		    jp	    DrawItemHUD


;----------------------------------------------------------------------------
;
; Draw CALL signal or destruction timer
;
; If there is no incoming call,	or the game is in weapon or equipment menu, the	CALL sign is erased
; If there is an incoming call the sign	is drawn and erased (blink effect)
;
;----------------------------------------------------------------------------

DrawCallTimer:
		    ld	    c, 0			    ; Mask to erase CALL sign

		    ld	    a, (RadioCallFlag)		    ; 1=Start incoming call, 2=Stop incoming call
		    dec	    a				    ; Incoming call?
		    jr	    nz,	DrawCallTimer2		    ; Erase

		    ld	    a, (GameMode)		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late
		    sub	    2				    ; Weapon menu?
		    jr	    z, DrawCallTimer2

		    dec	    a				    ; Equipment	menu?
		    jr	    z, DrawCallTimer2

		    ld	    a, (TickCounter)
		    bit	    3, a
		    jr	    nz,	DrawCallTimer2		    ; Erase/Blink effect

		    and	    7
		    ld	    a, 22h			    ; Incoming call SFX
		    call    z, SetSoundEntryChk

		    ld	    c, 0FFh			    ; Mask to draw the sign

DrawCallTimer2:
		    ld	    a, (DestructionTimerOn)
		    and	    a				    ; Destruction countdown activated?
		    jr	    nz,	DrawDestrucTimer	    ; Yes, draw	the countdown timer

		    ld	    hl,	txtCALL			    ; CALL sign	tiles data
		    jp	    PrintTextGetXY		    ; Draw/erase CALL sign


;----------------------------------------------------------------------------
;
; Draw destruction countdown
;
;----------------------------------------------------------------------------

DrawDestrucTimer:
		    ld	    a, (EndingStatus)
		    cp	    4
		    ret	    nc				    ; Outer Heaven already destroyed

		    ld	    c, 1
		    ld	    de,	70C1h			    ; Counter XY
		    ld	    a, (DestructTimerH)
		    rra
		    rra
		    rra
		    rra
		    call    PrintDigit			    ; Thousands

		    ld	    a, (DestructTimerH)
		    call    PrintDigit			    ; Hundreds

		    ld	    a, (DestructTimer)
		    rra
		    rra
		    rra
		    rra
		    call    PrintDigit			    ; Tens

		    ld	    a, (DestructTimer)
		    jp	    PrintDigit			    ; Units


;----------------------------------------------------------------------------
; Decrement 4 points of	life
;----------------------------------------------------------------------------

DecrementLife_4:
		    ld	    b, 4

;----------------------------------------------------------------------------
;
; Decrement life
;
; In:
;    B = Value
;----------------------------------------------------------------------------

DecrementLife_B:
		    ld	    hl,	Life			    ; LogoCnt
		    ld	    a, (hl)
		    and	    a				    ; Life = 0?
		    jr	    z, SetDead

DecrementLifeLoop:
		    dec	    (hl)			    ; Decrement	life
		    jr	    z, SetDead

		    djnz    DecrementLifeLoop

		    jp	    DrawLife			    ; Update life bar


;----------------------------------------------------------------------------
;
; Set dead status
;
;----------------------------------------------------------------------------

SetDead:
		    call    DrawLife			    ; Update life bar

		    ld	    a, CONTROL_DEAD
		    ld	    (PlayerControlMod),	a	    ; Set dead control mode

		    ld	    a, 6
		    ld	    (PlayerAnimation), a	    ; Dead animation

		    ld	    a, GAME_MODE_DEAD
		    ld	    (GameMode),	a		    ; Dead game	mode

		    ld	    a, 80h
		    ld	    (DeadTimer), a

		    xor	    a
		    ld	    (DamageDelayTimer),	a	    ; Reset damage delay timer

		    ld	    hl,	SprShootsAtt
		    ld	    de,	 SprShootsAtt+1
		    ld	    bc,	17h
		    ld	    (hl), 0E0h
		    ldir				    ; Remove all bullets

		    ld	    a, 44h			    ; Music: Just another dead soldier
		    jp	    SetSoundEntryChk


;---------------------------------------------------------------------------
;
; Draw life text and bar
;
;---------------------------------------------------------------------------

DrawLife:
		    ld	    hl,	txtLife
		    call    PrintTextXY			    ; Print "LIFE" text

		    ld	    hl,	31C1h			    ; XY
		    ld	    de,	3208h			    ; NX NY
		    ld	    c, 0Eh			    ; White
		    call    DrawRect			    ; Life bar box

		    ld	    a, (Life)			    ; Life value
		    and	    a				    ; 0?
		    jr	    z, EraseLifeBar		    ; No need to draw the energy bar

		    dec	    a				    ; 1?
		    jr	    z, EraseLifeBar		    ; No need to draw the energy bar

		    inc	    a
		    ld	    hl,	32C2h			    ; XY
		    ld	    c, 6			    ; NY
		    ld	    b, a			    ; NX
		    ld	    d, 0			    ; Page
		    ld	    a, 88h			    ; Color
		    call    FillRect			    ; Draw life	bar

EraseLifeBar:
		    ld	    a, (Life)			    ; LogoCnt
		    cp	    30h
		    ret	    z

		    cp	    2Fh
		    ret	    z				    ; No need to erase the missing energy

		    ld	    e, a
		    ld	    c, 32h
		    add	    a, c
		    ld	    h, a			    ; SX
		    ld	    l, 0C2h
		    ld	    a, 30h
		    sub	    e				    ; E	= Energy
		    ld	    b, a			    ; B	= NX to	erase
		    ld	    c, 6			    ; NY
		    xor	    a				    ; Color
		    ld	    d, a			    ; Page
		    jp	    FillRect			    ; Erase empty bar


;---------------------------------------------------------------------------
;
; Draw class text and stars
;
;---------------------------------------------------------------------------

DrawClass:
		    ld	    hl,	txtClass
		    call    PrintTextXY			    ; PRint "CLASS" text

		    ld	    de,	34C9h			    ; XY
		    ld	    a, (Class)			    ; Level
		    inc	    a
		    ld	    c, 3Bh			    ; Star tile
		    call    DrawStars

		    ld	    a, (Class)			    ; Logo end flag
		    sub	    3
		    ret	    z				    ; No need to erase/clear stars

		    neg
		    ld	    c, 0			    ; Clear missing stars

DrawStars:
		    ld	    b, a

DrawStar:
		    ld	    a, c
		    call    DrawChar

		    ld	    a, d
		    add	    a, 8			    ; X	= X + 8
		    ld	    d, a

		    djnz    DrawStar
		    ret



;
; (!?) Code not	used
;
		    ld	    c, 0




Render2Numbers_:
		    dec	    b
		    jr	    nz,	RenderTens		    ; It is not	the last byte

		    ld	    c, 0FFh			    ; Mask to force to draw the	byte with units	and tens even if they are 00

RenderTens:
		    inc	    b
		    ld	    a, (hl)
		    rra
		    rra
		    rra
		    rra
		    call    RenderNumber

RenderUnits:
		    ld	    a, (hl)
		    call    RenderNumber

		    dec	    hl
		    djnz    Render2Numbers_
		    ret


;----------------------------------------------------------------------------
;
; Render 3 digits number
;
; In:
;   HL = Pointer to number (high byte)
;    D = X
;    E = Y
;
; If the hundreds are 0, only the tens and units are draw
;----------------------------------------------------------------------------

Render3Numbers:
		    ld	    c, 0			    ; Mask to erase the	hundreds digit in case it is 0
		    ld	    b, 2			    ; 2	bytes
		    jr	    RenderUnits


;----------------------------------------------------------------------------
; Render 1 digit number
;   A =	value (0-9)
;   C =	0: Don't draw number if it is 0, 255: Draw it)
;  DE =	XY
;----------------------------------------------------------------------------

RenderNumber:
		    and	    0Fh				    ; Keeps the	previous mask (C) If the digit is 0
							    ; Used to skip hundreds digit if it	is 0
		    jr	    z, RenderNumber2

		    ld	    c, 0FFh

RenderNumber2:
		    add	    a, '0'
		    and	    c				    ; Print mask
		    call    DrawChar

		    ld	    a, d
		    add	    a, 8			    ; X	= X + 8
		    ld	    d, a
		    ret


