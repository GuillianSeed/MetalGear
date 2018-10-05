;----------------------------------------------------------------------------
;
; Setup	ending
;
;----------------------------------------------------------------------------

EndingSetup:
		    call    DisableScreenBnk

		    call    ClearScreen_

		    ld	    a, 251
		    ld	    (Room), a			    ; Ending room. Not really a	room, but used to load the right tileset
		    call    LoadRoomTiles_		    ; load tileset used	in the ending
		    call    ChkRoomPal_			    ; Set the palette

		    xor	    a
		    ld	    (EndingStatus), a
		    ld	    hl,	200h
		    ld	    (DestructTimer), hl		    ; Remaining	time

		    ld	    a, GAME_MODE_RADIO		    ; Radio
		    ld	    (GameMode),	a		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late

		    ld	    a, 80h
		    ld	    (PlayerX), a
		    ld	    (PlayerY), a

		    ld	    a, FREQ_BIGBOSS_BUILDING2	    ; Big boss
		    ld	    (RadioFreq), a
		    jp	    EnableScreenBnk


;----------------------------------------------------------------------------
;
; Ending 1: Explosion and Snake	turns back
;
;----------------------------------------------------------------------------

EndingLogic:
		    ld	    a, (EndingStatus)
		    ld	    b, a
		    djnz    EndingLogic2

		    call    EndingSnakeRun		    ; Snake running animation

		    ld	    hl,	EndingCnt
		    dec	    (hl)
		    jp	    nz,	EndingExplosion		    ; Animate explosion

		    ld	    a, 80h
		    ld	    (EndingCnt), a

		    xor	    a
		    ld	    (SnakeSprId), a
		    call    EndingSnakeRun3

		    ld	    hl,	8040h
		    ld	    bc,	4028h
		    ld	    d, a
		    call    FillRect_			    ; Erase the	explosion
		    jr	    NextEndingStatus


;----------------------------------------------------------------------------
;
; Ending 2: Snake stares back
;
;----------------------------------------------------------------------------

EndingLogic2:
		    djnz    EndingLogic3

		    ld	    hl,	EndingCnt
		    dec	    (hl)
		    ret	    nz

		    xor	    a
		    ld	    (EndingCnt), a
		    jr	    NextEndingStatus


;----------------------------------------------------------------------------
;
; Ending 3: Second explosion
;
;----------------------------------------------------------------------------

EndingLogic3:
		    djnz    EndingLogic4

		    ld	    hl,	EndingCnt
		    dec	    (hl)
		    jp	    nz,	EndingExplosion
		    jr	    NextEndingStatus


;----------------------------------------------------------------------------
;
; Ending 4: Draw radio
;
;----------------------------------------------------------------------------

EndingLogic4:
		    djnz    EndingLogic5

		    ld	    a, (SoundWorkAreaB+2)
		    and	    a
		    ret	    nz				    ; Waits until the explosion	sfx ends

		    call    ClearSprites_
		    call    EraseSprAttRAM_
		    call    DrawRadio_

		    ld	    a, 40h
		    ld	    (EndingCnt), a
		    jr	    NextEndingStatus


;----------------------------------------------------------------------------
;
; Ending 5: Wait switch	to SEND	mode
;
;----------------------------------------------------------------------------

EndingLogic5:
		    djnz    EndingLogic6

		    ld	    hl,	EndingCnt
		    dec	    (hl)
		    ret	    nz

		    call    DrawSend_

		    ld	    a, 9Bh			    ; TEXT: THIS IS SOLID SNAKE... METAL GEAR'S DESTRUCTION IS A SUCCESS.* OPERATION  INTRUDE N313 FINISHED!...* EVERYTHING IS FINISHED.* I WILL GO BACK NOW. ...OVER
		    jr	    EndingSetText__


;----------------------------------------------------------------------------
;
; Ending 6: Snake informs mission is finished
;
;----------------------------------------------------------------------------

EndingLogic6:
		    djnz    EndingLogic7

		    call    EndingTextBox
		    ret	    nz

		    call    DrawRecv_			    ; Print RECV mode

		    ld	    a, 50h
		    call    SetSoundEntry__

		    jr	    NextEndingStatus


;----------------------------------------------------------------------------
;
; Ending 7: Auto tune to news frequency	120.77
;
;----------------------------------------------------------------------------

EndingLogic7:
		    djnz    EndingLogic8

		    ld	    a, (TickCounter)
		    and	    3
		    ret	    nz

		    ld	    hl,	RadioFreq
		    ld	    a, (hl)
		    add	    a, 1
		    daa
		    ld	    (hl), a			    ; Increment	frequency

		    call    DrawRadioFreq_		    ; Update frequency display

		    ld	    a, (RadioFreq)
		    cp	    FREQ_NEWS
		    ret	    nz

		    ld	    a, 10h
		    ld	    (RadioLedDelay), a		    ; Delay before the first/next led turns on

		    xor	    a
		    ld	    (RadioLedCnt), a
		    ld	    (EquipRadioStatus),	a	    ; Equip and	radio status

NextEndingStatus:
		    ld	    hl,	EndingStatus
		    inc	    (hl)
		    ret


;----------------------------------------------------------------------------
;
; Ending 8: Radio gets signal
;
;----------------------------------------------------------------------------

EndingLogic8:
		    djnz    EndingLogic9

		    call    RadioSignalUp_		    ; Draw leds	turning	on

		    ld	    a, (EquipRadioStatus)	    ; Equip and	radio status
		    dec	    a
		    ret	    nz

		    ld	    a, 5Ch
		    call    SetSoundEntry__

		    ld	    a, 31			    ; Text: This is radio KNK...

EndingSetText__:
		    jr	    EndingSetText_


;----------------------------------------------------------------------------
;
; Ending 9: News on the	radio about the	explosion
;
;----------------------------------------------------------------------------

EndingLogic9:
		    djnz    EndingLogic10

		    call    EndingTextBox		    ; Show KNK news
		    ret	    nz

		    ld	    a, 41h			    ; Ending music
		    call    SetSoundEntry__

		    ld	    a, 45			    ; TEXT: Staff...

EndingSetText_:
		    jr	    EndingSetText


;----------------------------------------------------------------------------
;
; Ending 10: Staff
;
;----------------------------------------------------------------------------

EndingLogic10:
		    djnz    EndingLogic11

		    call    EndingTextBox		    ; Show staff
		    ret	    nz

		    ld	    a, 5Ch			    ; Mute music
		    ld	    (MusicToSet), a		    ; New music	to play	(fade out current one)

		    call    CopyPalToRAM_

		    jr	    NextEndingStatus


;----------------------------------------------------------------------------
;
; Ending 11: Fade out
;
;----------------------------------------------------------------------------

EndingLogic11:
		    djnz    EndingLogic12

		    call    FadeOutLogic_
		    ret	    nc				    ; Fade in progess...

		    call    ClearScreen_

		    ld	    a, 70h
		    ld	    (EndingCnt), a
		    jr	    NextEndingStatus


;----------------------------------------------------------------------------
;
; Ending 12: Wait
;
;----------------------------------------------------------------------------

EndingLogic12:
		    djnz    EndingLogic13

		    ld	    hl,	EndingCnt
		    dec	    (hl)
		    ret	    nz

		    ld	    a, 5Ch
		    call    SetSoundEntry__

		    ld	    a, 0Eh			    ; Color 14
		    ld	    de,	7707h			    ; White
		    call    SetPaletteColor_

		    ld	    a, 15			    ; TEXT: LISTEN! SOLID SNAKE... I'LL NEVER DIE...* I'LL GET YOU.
							    ; ONE DAY.*	SEE YOU	AGAIN...

EndingSetText:
		    call    NextEndingStatus
		    jp	    SetTextUnskip_


;----------------------------------------------------------------------------
;
; Ending 13: Big boss threat
;
;----------------------------------------------------------------------------

EndingLogic13:
		    djnz    EndingEscaping

		    call    EndingTextBox		    ; Show Big Boss threat
		    ret	    nz

		    call    EnableScreenBnk
		    jr	    NextEndingStatus


;----------------------------------------------------------------------------
;
; Ending 0: Snake runs away
; Countdown decrements
;----------------------------------------------------------------------------

EndingEscaping:
		    call    EndingSnakeRun		    ; Snake running animation

		    ld	    hl,	DestructTimerH
		    ld	    a, (hl)
		    dec	    hl
		    or	    (hl)
		    jr	    z, EndingTimerEnd		    ; The timer	reached	zero

		    ld	    a, (hl)
		    sub	    1
		    daa
		    ld	    (hl), a
		    jr	    nc,	EndingEscaping2

		    inc	    hl
		    dec	    (hl)

EndingEscaping2:
		    jp	    DrawDestrucTimer_

;----------------------------------------------------------------------------
;
; Erase	time display
;
;----------------------------------------------------------------------------

EndingTimerEnd:
		    xor	    a
		    ld	    (EndingCnt), a

		    ld	    hl,	70C0h			    ; X,Y
		    ld	    bc,	2010h			    ; width, height
		    ld	    d, a			    ; Black color, page	0
		    call    FillRect_
		    jp	    NextEndingStatus


;----------------------------------------------------------------------------
;
; Ending textbox
; Out:
;    Z = Text finished
;
;----------------------------------------------------------------------------

EndingTextBox:
		    call    TextBoxLogic_

		    ld	    a, (GameMode)		    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late
		    cp	    GAME_MODE_RADIO
		    ret


;----------------------------------------------------------------------------
;
; Running away logic
;
;----------------------------------------------------------------------------

EndingSnakeRun:
		    ld	    a, (TickCounter)
		    bit	    3, a
		    ld	    a, 4
		    jr	    z, EndingSnakeRun2
		    inc	    a

EndingSnakeRun2:
		    ld	    (SnakeSprId), a		    ; Run frame

		    ld	    hl,	(PlayerXdec)
		    ld	    de,	-8
		    add	    hl,	de
		    ld	    (PlayerXdec), hl		    ; Moving slowly to the left

EndingSnakeRun3:
		    call    SetSnakeSprAttr_
		    jp	    SetSnakeSprPatt_


;----------------------------------------------------------------------------
;
; Ending explosion logic
;
; Draws	the different explosion	frames and alternate two palettes to simulate light changes
;----------------------------------------------------------------------------

EndingExplosion:
		    ld	    a, (hl)			    ; Ending counter
		    cp	    0E8h
		    ld	    c, a
		    ld	    a, 56h			    ; Sfx: explosion
		    jp	    z, SetSoundEntry__

		    ld	    a, c			    ; Ending counter
		    cp	    0E0h
		    ld	    de,	9060h
		    ld	    hl,	ExploxionTiles1
		    jr	    z, EndDrawExplos		    ; Draw explosion frame 1

		    cp	    0D0h
		    ld	    de,	8050h
		    ld	    hl,	ExploxionTiles2
		    jr	    z, EndDrawExplos		    ; Draw explosion frame 2

		    cp	    0C0h
		    jr	    z, EndDrawExplosBig		    ; Draw explosion frame 3

		    ret	    nc

		    ld	    c, a
		    and	    7
		    ret	    nz

		    bit	    4, c
		    ld	    a, 0Fh			    ; Explosion	palette	1
		    jr	    nz,	EndingExplosion2

		    ld	    a, 0Dh			    ; Explosion	palette	2

EndingExplosion2:
		    jp	    SetRoomPal_


EndDrawExplosBig:
		    ld	    e, 40h
		    ld	    hl,	ExploxionTiles3

EndDrawExplos:
		    jp	    DrawTileBlock_
