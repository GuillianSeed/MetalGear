;----------------------------------------------------------------------------
;
; Set sound
;
; In:
;    A = Sound ID
;
;----------------------------------------------------------------------------

SetSound:
		    ld	    c, a
		    cp	    53h				    ; Big Boss Dead sfx?
		    jr	    nz,	SetSound2

		    ld	    (BigBossDeadSnd), a		    ; Clear flag in case Big Boss explosion was	playing

SetSound2:
		    cp	    4Dh				    ; Sfx: pause
		    jr	    z, SaveSoundState

		    cp	    59h				    ; Pause music? (enter radio	mode)
		    jr	    z, SaveSoundState

		    jr	    SetSound3


SaveSoundState:
		    ld	    a, c
		    ld	    hl,	SoundWorkArea
		    ld	    de,	SoundWorkArea2
		    call    CopySoundData		    ; Save the current music status so it can be restored later

		    ld	    a, 1
		    ld	    (SoundDataSaved), a

SetSound3:
		    ld	    hl,	 SoundWorkArea+2
		    ld	    b, 1			    ; 1	channel

		    ld	    a, c
		    cp	    29h				    ; Is it a sfx?
		    jr	    c, SetSfx

		    cp	    5Ch				    ; Mute all (Music +	SFX)?
		    jr	    c, SetMusic

		    inc	    b				    ; Extra channel/work area for the SFX

SetMusic:
		    inc	    b
		    inc	    b

		    ld	    a, (SoundDataSaved)
		    or	    a				    ; Was the music paused?
		    jr	    nz,	SetMusic2

		    xor	    a
		    ld	    (FadeStepCnt), a
		    ld	    (VolumeFadeVal), a
		    ld	    (MusicToSet), a		    ; New music	to play	(fade out current one)

SetMusic2:
		    ld	    a, c
		    cp	    59h				    ; Pause music (enter radio mode)
		    jr	    z, GetSoundData_

		    xor	    a
		    ld	    (SoundWorkAreaSfx+2), a	    ; Mute sfx

GetSoundData_:
		    jr	    GetSoundData



;----------------------------------------------------------------------------
;
; Set SFX
;
;----------------------------------------------------------------------------

SetSfx:
		    ld	    l, (SoundWorkAreaSfx+2)&255		;72h			    ; (!?) #C072 SoundWorkAreaSfx+2
		    ld	    a, (SoundWorkAreaC+2)
		    cp	    59h				    ; Music paused/stopped
		    ret	    nc

		    ld	    a, (hl)			    ; Current sfx ID
		    ld	    e, a
		    ld	    a, c			    ; New sfx ID
		    cp	    e
		    ret	    c				    ; Previous sfx has higher priority

;----------------------------------------------------------------------------
;
; Setup	music/sfx
;
; C = Sound ID
; B = Number of	channels
;
;----------------------------------------------------------------------------;


GetSoundData:
		    ld	    a, c
		    ld	    de,	idxSoundData-2
		    add	    a, a
		    jr	    nc,	GetSoundData2
		    inc	    d

GetSoundData2:
		    add	    a, e
		    ld	    e, a
		    jr	    nc,	GetSoundData3
		    inc	    d				    ; DE = Pointer to music/sfx	data

GetSoundData3:
		    dec	    l
		    dec	    l				    ; HL = Start of channel data

GetSoundData4:
		    ld	    (hl), 1			    ; NOTE_COUNTER
		    inc	    l
		    inc	    l
		    ld	    (hl), c			    ; +2: Sound	ID
		    inc	    l

		    ld	    a, (de)
		    ld	    (hl), a
		    inc	    l
		    inc	    de
		    ld	    a, (de)
		    ld	    (hl), a			    ; +3-4: Pointer to sfx/music data

		    ld	    a, 7
		    add	    a, l
		    ld	    l, a
		    xor	    a
		    ld	    (hl), a			    ; +11: LOOP_CNT

		    ld	    a, 3
		    add	    a, l
		    ld	    l, a
		    ld	    a, 1
		    ld	    (hl), a			    ; +14: NOTE_MODE

		    inc	    l
		    dec	    a
		    ld	    (hl), a
		    inc	    l
		    ld	    (hl), a			    ; +15: FREQ_MOD

		    ld	    a, 9
		    add	    a, l
		    ld	    l, a
		    ld	    (hl), 0			    ; +24: RETURN_H (reset CALL	command)

		    ld	    a, 7
		    add	    a, l
		    ld	    l, a			    ; +30: HL =	Pointer	to next	channel	data / work area
		    inc	    de				    ; DE = Pointer to next channel data

idxSoundScore:
		    djnz    GetSoundData4
		    ret

