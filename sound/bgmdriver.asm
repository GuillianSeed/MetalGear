

;----------------------------------------------------------------------------
;
;
; Sound	driver
;
;
;----------------------------------------------------------------------------


UpdateSound:
		    ld	    a, (SoundDataSaved)
		    or	    a
		    jr	    nz,	UpdateSound2

; Check	if Big Boss explosion is playing and ending
; In that case play escape music

		    ld	    a, (BigBossDeadSnd)
		    cp	    53h				    ; Playing Big Boss dead sfx?
		    jr	    nz,	UpdateSound2		    ; No

		    ld	    a, (SoundWorkAreaB+2)
		    or	    a				    ; Has finished Big Boss dead sfx?
		    jr	    nz,	UpdateSound2		    ; No

		    xor	    a
		    ld	    (BigBossDeadSnd), a		    ; Clear flag

		    ld	    a, 3Bh			    ; Beyond Big Boss (escape music)
		    ld	    (AreaMusic), a
		    call    SetSound			    ; Set escape music

UpdateSound2:
		    ld	    a, (PGS_MixerVal)
		    call    SetPsgMixer

		    exx
		    ld	    b, 4			    ; channel work areas (Music	3 + Sfx	1)
		    ld	    de,	20h			    ; Channel work area	size
		    exx

		    xor	    a
		    ld	    (flagSndDatRestored), a	    ; Reset flag

		    ld	    a, (RestoreSoundData)
		    or	    a
		    jr	    z, UpdateSound3		    ; Do not restore previous music data

		    ld	    a, c
		    ld	    hl,	SoundWorkArea2
		    ld	    de,	SoundWorkArea
		    call    CopySoundData

		    ld	    a, 0
		    ld	    (SoundDataSaved), a
		    ld	    a, 1
		    ld	    (flagSndDatRestored), a	    ; Music data was restored in this iteration

UpdateSound3:
		    ld	    a, (SoundDataSaved)
		    or	    a				    ; Is there music data waiting to be	restored?
		    jr	    nz,	ProcessChannels

		    ld	    a, (MusicToSet)		    ; New music	to play	(fade out current one)
		    or	    a				    ; Is there a new music waiting to be played?
		    call    nz,	MusicFadeOut		    ; Fade out current music and set the new one



ProcessChannels:
		    ld	    c, 1
		    ld	    ix,	SoundWorkArea
		    exx

UpdateSound5:
		    exx
		    ld	    a, (ix+SOUND.ID)		    ; Sound ID
		    or	    a				    ; Is something playing in this channel?

		    push    af
		    call    nz,	ProcessChannelData	    ; Process channel data
		    pop	    af

		    jr	    nz,	UpdateSound6		    ; Next channel

		    ld	    a, c
		    cp	    7				    ; Sfx?
		    call    nz,	CmdEndRetLogic		    ; SFX finished. Restore channel 3 frequency

UpdateSound6:
		    inc	    c
		    inc	    c				    ; Increment	PSG register

		    exx
		    add	    ix,	de			    ; Next channel work	area

		    djnz    UpdateSound5
		    ret



;(!?) Not used

		    ld	    h, 0
		    call    UpdateVolume
		    jr	    UpdateSound6



;----------------------------------------------------------------------------
;
; Process channel data
;
;
; #FF = END, RET
; 
; #FE xx address = LOOP xx times
; #FE #00
; #FE #FE address = GOTO address
; #FE #FF address = CALL address
; 
; (F0-FD)
; #Fx yz = ADSR
;   x = volume 00-0D
;   y = Decay
;   z = Release
; 
; #Dx     = Tempo
; 
; #EC #XY = Vibrato X=Speed Y = Intensity
; #E0-#E7 = Octave
; #E8     = Detune
; #E9     = Instrument
; #EF     = Note OFF
; 
; #0x-#bx = Note
; #Cx     = Silence
;
; Alt:
; #2x     = SOUND.CFG value
; 
; #1x     = Noise period
;----------------------------------------------------------------------------

ProcessChannelData:
		    ld	    a, (ix+SOUND.ID)
		    cp	    50h				    ; Sfx: radio noise
		    jr	    nz,	ProcessChannelData2

; Radio	noise frequency	logic

		    ld	    a, (RadioFreq)
		    and	    0F0h
		    srl	    a
		    srl	    a
		    srl	    a
		    srl	    a
		    inc	    a
		    ld	    b, a
		    ld	    a, (RadioFreq)
		    add	    a, 6

RadioNoiseLoop:
		    sub	    6
		    djnz    RadioNoiseLoop

		    ld	    (RadioFreqOffset), a	    ; Value used to modify the radio noise SFX depending on radio frequency

ProcessChannelData2:
		    ld	    a, (ix+SOUND.NOTE_MODE)	    ; 1	= Note mode, 0 = Sfx mode
		    or	    a				    ; Note mode	or SFX mode?
		    jp	    nz,	NoteLogic

		    ld	    (ix+SOUND.INSTRUMENT), a	    ; Do not use instruments

		    dec	    (ix+SOUND.NOTE_COUNTER)			    ; Note duration
		    jp	    nz,	UpdateFreqVol		    ; Update frequency and volume

ProcessChannelData3:
		    ld	    l, (ix+SOUND.POINTER_L)
		    ld	    h, (ix+SOUND.POINTER_H)	    ; HL = Pointer to music/sfx	data

		    ld	    a, (hl)
		    cp	    0FEh			    ; LOOP/GOTO	CMD?
		    jp	    z, CmdLoopLogic

		    jp	    nc,	CmdEndRetLogic		    ; RET / END	command?

ProcessChanneldData4:
		    ld	    a, (ix+SOUND.NOTE_MODE)	    ; 1	= Note mode, 0 = Sfx mode
		    or	    a
		    ld	    a, (hl)
		    jp	    nz,	ProcessCommand

ChkCmd_2x:
		    and	    0F0h
		    cp	    20h
		    jr	    nz,	ChkCmd_1x

		    ld	    a, (hl)
		    ld	    (ix+SOUND.CONFIG), a	    ; 3=Use Envelope, 2=Set Env. Freq. 1=Channel ON/OFF, 0=Noise ON/OFF

		    inc	    hl
		    ld	    a, (ix+SOUND.INSTRUMENT)
		    or	    a				    ; Playing an instrument?
		    ld	    a, (hl)
		    jr	    nz,	skipToneLenght

		    ld	    (ix+SOUND.NOTE_LENGHT), a

skipToneLenght:
		    ld	    (ix+SOUND.INSTRUMENT_LENGHT), a

		    inc	    hl
		    ld	    a, (ix+SOUND.CONFIG)	    ; 3=Use Envelope, 2=Set Env. Freq. 1=Channel ON/OFF, 0=Noise ON/OFF
		    cp	    20h
		    jr	    nz,	SfxLogic

		    dec	    hl
		    xor	    a
		    ld	    b, a			    ; Volume 0
		    jr	    SfxLogic4



;----------------------------------------------------------------------------
;
; SFX logic
;
;----------------------------------------------------------------------------

SfxLogic:
		    bit	    3, a			    ; Use envelope?
		    jr	    z, ChkCmd_1x

		    bit	    2, a			    ; Set envelope frequency?
		    jr	    nz,	ChkCmd_1x

		    ld	    a, (hl)
		    ld	    e, a
		    ld	    a, 0Ch			    ; Envelope cycle (high)
		    call    WRTPSG

		    inc	    hl
		    ld	    a, (hl)
		    ld	    e, a
		    ld	    a, 0Bh			    ; Envelope cycle (low)
		    call    WRTPSG

		    inc	    hl

; CMD #1x: Noise period

ChkCmd_1x:
		    ld	    a, (hl)
		    and	    0F0h
		    cp	    10h
		    jr	    nz,	SfxLogic3

		    ld	    a, (hl)
		    and	    0Fh
		    add	    a, a
		    ld	    e, a

		    ld	    a, c			    ; PSG register
		    cp	    5				    ; Channel 3? (Used for SFXs)
		    jr	    nz,	SetNoisePeriod

		    ld	    a, (SoundWorkAreaSfx+2)
		    or	    a				    ; Sfx playing?
		    jr	    nz,	SfxLogic2		    ; Do not modify noise when playing a SFX

SetNoisePeriod:
		    ld	    a, 6			    ; Noise div. rate
		    call    WRTPSG

SfxLogic2:
		    inc	    hl

SfxLogic3:
		    ld	    a, (hl)
		    and	    0F0h
		    ld	    b, a			    ; Volume

		    xor	    (hl)			    ; Discard volume
		    ld	    d, a
		    ld	    e, 0

		    ld	    a, (ix+SOUND.CONFIG)	    ; 3=Use Envelope, 2=Set Env. Freq. 1=Channel ON/OFF, 0=Noise ON/OFF
		    and	    3
		    cp	    1				    ; Noise only?
		    jr	    z, SfxLogic4		    ; Channel OFF, Noise ON

		    inc	    hl
		    ld	    e, (hl)

SfxLogic4:
		    ld	    a, (ix+SOUND.INSTRUMENT)
		    or	    a
		    jp	    nz,	SetInstrumentPointer

		    call    PointerNextCmd

SetRadioFreqTone:
		    ex	    de,	hl

		    ld	    a, (SoundWorkArea+2)
		    cp	    50h				    ; SFX radio	noise
		    jr	    nz,	SetSfxFreq

		    push    bc
		    ld	    a, (RadioFreqOffset)	    ; Value used to modify the radio noise SFX depending on radio frequency
		    ld	    b, a
		    ld	    a, l
		    sub	    b
		    ld	    l, a
		    pop	    bc

SetSfxFreq:
		    ld	    (ix+SOUND.FREQ_LOW), l
		    ld	    (ix+SOUND.FREQ_HIGH), h
		    call    UpdateChFreq

		    ld	    a, b			    ; High nibble = volume
		    rrca
		    rrca
		    rrca
		    rrca
		    ld	    (ix+SOUND.VOLUME), a	    ; Envelope wave shape

		    ld	    a, (ix+SOUND.INSTRUMENT)
		    or	    a				    ; Playing a	custom instrument?
		    jp	    z, SetNoteLenght		    ; No

		    ld	    a, (ix+SOUND.INSTRUMENT_LENGHT)
		    ld	    (ix+SOUND.INSTRUMENT_CNT), a
		    jp	    UpdateVolume



;----------------------------------------------------------------------------
;
; Set note lenght
;
;----------------------------------------------------------------------------

SetNoteLenght:
		    ld	    a, (ix+SOUND.NOTE_LENGHT)
		    ld	    (ix+SOUND.NOTE_COUNTER),	a
		    jp	    UpdateVolume



;----------------------------------------------------------------------------
;
; Note logic
; Decrement note duration
; Instrument
; Check	vibrato
; Check	decay and release
;
;----------------------------------------------------------------------------

NoteLogic:
		    dec	    (ix+SOUND.NOTE_COUNTER)			    ; Decrement	note lenght
		    jp	    z, ProcessChannelData3

		    ld	    a, (MuteSoundFlag)		    ; 1	= Mute
		    or	    a
		    ret	    nz

		    ld	    a, (ix+SOUND.INSTRUMENT)
		    or	    a
		    jp	    nz,	InstrumentTick

		    bit	    2, (ix+SOUND.FREQ_MOD)	    ; Vibrato effect?
		    call    nz,	ChkVibratoAttack

; ADSR

		    dec	    (ix+SOUND.DECAY_CNT)	    ; Remaining	steps (Note lengh + release steps)

		    ld	    a, (ix+SOUND.DECAY_CNT)	    ; Remaining	steps (Note lengh + release steps)
		    cp	    (ix+SOUND.NOTE_COUNTER)			    ; Remaining	note lenght
		    jr	    nz,	Decay			    ; Decay in progress

; Sustain
		    ld	    e, a
		    ld	    a, (ix+SOUND.RELEASE)
		    cp	    e
		    jr	    nc,	Decay2

		    jp	    UpdateFreqVol


Decay:
		    dec	    (ix+SOUND.DECAY_CNT)	    ; Remaining	steps (Note lengh + release steps)

Decay2:
		    ld	    a, (ix+SOUND.DECAY_VOL)
		    dec	    a				    ; Decrement	release	volume
		    jp	    m, UpdateFreqVol		    ; Negative value

		    ld	    (ix+SOUND.DECAY_VOL), a
		    ld	    (ix+SOUND.VOLUME), a	    ; Envelope wave shape
		    jp	    UpdateVolume


;----------------------------------------------------------------------------
;
; Vibrato logic
;
;----------------------------------------------------------------------------

ChkVibratoAttack:
		    bit	    0, (ix+SOUND.FREQ_MOD)	    ; 3	= Detune, 2 = On, 0 = Attack done
		    jr	    nz,	VibratoLogic		    ; Vibrato in progress

		    ld	    a, (ix+SOUND.VIBRATO_WAIT)
		    inc	    a
		    cp	    0Ah				    ; Continue waiting to start	the vibrato?
		    jr	    c, VibratoLogic4

		    inc	    (ix+SOUND.FREQ_MOD)		    ; Enable the vibrato

		    xor	    a
		    jp	    VibratoLogic4


VibratoLogic:
		    ld	    a, (ix+SOUND.VIBRATO_CFG)	    ; #xy: X = Speed/iterations	delay, Y = Freq. offset
		    and	    0F0h
		    rrca
		    rrca
		    rrca
		    rrca
		    ld	    e, a			    ; Vibrato speed

		    ld	    a, (ix+SOUND.VIBRATO_WAIT)
		    inc	    a
		    cp	    e
		    jr	    c, VibratoLogic4

		    ld	    e, (ix+SOUND.FREQ_LOW)
		    ld	    d, (ix+SOUND.FREQ_HIGH)

		    ld	    a, (ix+SOUND.VIBRATO_CFG)	    ; #xy: X = Speed/iterations	delay, Y = Freq. offset
		    and	    0Fh
		    ld	    b, a			    ; Frequency	offset (intensity)

		    ld	    a, (ix+SOUND.VIBRATO_CLK)
		    cpl
		    ld	    (ix+SOUND.VIBRATO_CLK), a
		    and	    a				    ; Increment	or decrement frequency?
		    ld	    a, e
		    jr	    nz,	VibratoLogic2		    ; Decrement

		    add	    a, b
		    ld	    e, a
		    jr	    nc,	VibratoLogic3

		    inc	    d				    ; Carry, increment high byte
		    jr	    VibratoLogic3


VibratoLogic2:
		    sub	    b
		    ld	    e, a
		    jr	    nc,	VibratoLogic3

		    dec	    d				    ; Carry, decrement high byte

VibratoLogic3:
		    ld	    (ix+SOUND.FREQ_LOW), e
		    ld	    (ix+SOUND.FREQ_HIGH), d

		    call    UpdateChFreq
		    xor	    a

VibratoLogic4:
		    ld	    (ix+SOUND.VIBRATO_WAIT), a
		    ret



;----------------------------------------------------------------------------
;
; Process command
;
;----------------------------------------------------------------------------

ProcessCommand:
		    ld	    a, (hl)
		    and	    0F0h
		    cp	    0D0h
		    ld	    a, (hl)
		    jr	    nz,	ProcessCommand_Fx

		    and	    0Fh				    ; Command #Dx = Tempo
		    ld	    (ix+SOUND.TEMPO), a

		    inc	    hl
		    ld	    a, (hl)			    ; Next command

; (F0-FD)
; #Fx yz = ADSR
;	x = volume 00-0D
;	y = Decay
;	z = Release

ProcessCommand_Fx:
		    cp	    0F0h
		    jr	    c, ProcessCommand_Ex

		    and	    0Fh
		    inc	    a
		    ld	    (ix+SOUND.ATTACK_VOL), a

		    inc	    hl
		    ld	    a, (hl)
		    and	    0F0h
		    rrca
		    rrca
		    rrca
		    rrca
		    ld	    (ix+SOUND.DECAY_STEPS), a

		    ld	    a, (hl)
		    and	    0Fh
		    ld	    (ix+SOUND.RELEASE),	a

		    inc	    hl
		    ld	    a, (hl)			    ; Next command

; #EC #XY = Vibrato X=Speed Y = Intensity
; #E0-#E7 = Octave
; #E8     = Detune
; #E9     = Instrument
; #EF     = Note OFF

ProcessCommand_Ex:
		    cp	    0E0h
		    jr	    c, SetNote

		    and	    0Fh
		    cp	    8
		    jr	    c, OctaveCmd
		    jr	    z, DetuneCmd

		    cp	    0Ch
		    jr	    z, VibratoCmd

		    cp	    0Fh
		    jr	    z, NoteOffCmd

		    inc	    hl
		    ld	    a, (hl)
		    ld	    (ix+SOUND.INSTRUMENT), a
		    jr	    GetNote


;----------------------------------------------------------------------------
;
; Note OFF command
;
;----------------------------------------------------------------------------

NoteOffCmd:
		    xor	    a
		    ld	    (ix+SOUND.FREQ_MOD), a	    ; Remove frequency modifiers
		    ld	    (ix+SOUND.INSTRUMENT), a
		    inc	    hl

		    ld	    a, (MuteSoundFlag)		    ; 1	= Mute
		    or	    a
		    jr	    z, ProcessCommand

		    xor	    a
		    ld	    (ix+SOUND.CONFIG), a	    ; 3=Use Envelope, 2=Set Env. Freq. 1=Channel ON/OFF, 0=Noise ON/OFF
		    ld	    (ix+SOUND.VOLUME), a	    ; Envelope wave shape

		    push    hl
		    call    UpdateVolume
		    pop	    hl

		    jr	    ProcessCommand



;----------------------------------------------------------------------------
;
; Vibrato command
;
;----------------------------------------------------------------------------

VibratoCmd:
		    set	    2, (ix+SOUND.FREQ_MOD)	    ; Enable vibrato
		    inc	    hl
		    ld	    a, (hl)
		    ld	    (ix+SOUND.VIBRATO_CFG), a	    ; #xy: X = Speed/iterations	delay, Y = Freq. offset
		    jp	    NextCmd


;----------------------------------------------------------------------------
;
; Detune command
;
;----------------------------------------------------------------------------

DetuneCmd:
		    set	    3, (ix+SOUND.FREQ_MOD)	    ; 3	= Detune, 2 = On, 0 = Attack done

NextCmd:
		    inc	    hl
		    jp	    ProcessCommand


;----------------------------------------------------------------------------
;
; Octave command
;
;----------------------------------------------------------------------------

OctaveCmd:
		    ld	    (ix+SOUND.OCTAVE), a

GetNote:
		    inc	    hl
		    ld	    a, (hl)

; #0x-#bx = Note
; #Cx     = Silence

SetNote:
		    and	    0Fh
		    ld	    b, a
		    ld	    a, (ix+SOUND.TEMPO)
		    jr	    z, SetNote2

CalcNoteLenght:
		    add	    a, (ix+SOUND.TEMPO)
		    djnz    CalcNoteLenght

SetNote2:
		    ld	    (ix+SOUND.NOTE_LENGHT), a

		    ld	    a, (hl)
		    call    PointerNextCmd

		    and	    0F0h
		    rrca
		    rrca
		    rrca
		    rrca
		    ld	    b, a			    ; Note (0-11) Do Do# Re Re#	Mi Fa Fa# Sol Sol# La La# Si
							    ; 12 = Note	OFF

		    ld	    a, (ix+SOUND.INSTRUMENT)
		    or	    a
		    jr	    nz,	SetInstrument

		    ld	    a, b
		    sub	    12				    ; Silence
		    jp	    z, MuteNote

		    ld	    a, (ix+SOUND.ATTACK_VOL)
		    ld	    (ix+SOUND.DECAY_VOL), a
		    ld	    (ix+SOUND.VOLUME), a	    ; Envelope wave shape
		    res	    0, (ix+SOUND.FREQ_MOD)	    ; Reset vibrato attack

		    xor	    a
		    ld	    (ix+SOUND.VIBRATO_WAIT), a
		    ld	    (ix+SOUND.VIBRATO_CLK), a

		    ld	    e, (ix+SOUND.NOTE_LENGHT)
		    ld	    (ix+SOUND.NOTE_COUNTER),	e

		    ld	    a, (MuteSoundFlag)		    ; 1	= Mute
		    or	    a
		    ret	    nz

		    ld	    a, (ix+SOUND.DECAY_STEPS)
		    add	    a, e			    ; E	= Note lenght
		    ld	    (ix+SOUND.DECAY_CNT), a	    ; Remaining	steps (Note lengh + release steps)

		    ld	    a, b			    ; Note

		    ld	    hl,	NoteFrequency		    ; Note frequencies
		    add	    a, l
		    ld	    l, a
		    jr	    nc,	CalcNoteFreq

		    inc	    h

CalcNoteFreq:
		    ld	    l, (hl)
		    ld	    h, 0			    ; HL = Note	frequency

; Check	octave

		    ld	    a, (ix+SOUND.OCTAVE)
		    or	    a
		    jr	    z, SetNoteFreq

		    ld	    b, a

CalcNoteFreq2:
		    add	    hl,	hl
		    djnz    CalcNoteFreq2		    ; Calculate	frequency depending on the octave

SetNoteFreq:
		    ld	    (ix+SOUND.FREQ_LOW), l
		    ld	    (ix+SOUND.FREQ_HIGH), h	    ; Set note frequency

		    call    UpdateChFreq
		    jp	    UpdateVolume


;----------------------------------------------------------------------------
;
; Set instrument
;
;----------------------------------------------------------------------------

SetInstrument:
		    add	    a, a
		    ld	    de,	Instruments-2
		    add	    a, e
		    ld	    e, a
		    jr	    nc,	SetInstrument2
		    inc	    d

SetInstrument2:
		    ld	    a, (de)
		    ld	    l, a
		    inc	    de
		    ld	    a, (de)
		    ld	    h, a			    ; HL = Pointer to instrument family

		    ld	    a, (ix+SOUND.NOTE_LENGHT)
		    ld	    (ix+SOUND.NOTE_COUNTER),	a

		    ld	    a, (MuteSoundFlag)		    ; 1	= Mute
		    or	    a
		    ret	    nz

		    ld	    a, b			    ; Note
		    add	    a, a
		    add	    a, l
		    ld	    l, a
		    jr	    nc,	SetInstrument3

		    inc	    h

SetInstrument3:
		    ld	    e, (hl)
		    ld	    (ix+SOUND.INSTRUMENT_L), e
		    inc	    hl
		    ld	    d, (hl)
		    ld	    (ix+SOUND.INSTRUMENT_H), d	    ; DE = Pointer to instrument data

		    ex	    de,	hl
		    ld	    a, (hl)
		    jp	    ChkCmd_2x


;----------------------------------------------------------------------------
;
; Instrument tick
;
;----------------------------------------------------------------------------

InstrumentTick:
		    dec	    (ix+SOUND.INSTRUMENT_CNT)	    ; Decrement	instrument note	duration
		    ret	    nz				    ; Note not finished

		    ld	    l, (ix+SOUND.INSTRUMENT_L)
		    ld	    h, (ix+SOUND.INSTRUMENT_H)	    ; HL = Pointer to instrument data

		    ld	    a, (hl)
		    cp	    0FFh			    ; Instrument finished?
		    jr	    z, MuteChannel

		    jp	    ChkCmd_2x



;----------------------------------------------------------------------------
;
; Set instrument pointer
;
;----------------------------------------------------------------------------

SetInstrumentPointer:
		    inc	    hl
		    ld	    (ix+SOUND.INSTRUMENT_L), l
		    ld	    (ix+SOUND.INSTRUMENT_H), h
		    jp	    SetRadioFreqTone



;----------------------------------------------------------------------------
;
; Mute channel
;
;----------------------------------------------------------------------------

MuteChannel:
		    xor	    a
		    ld	    (ix+SOUND.CONFIG), a	    ; 3=Use Envelope, 2=Set Env. Freq. 1=Channel ON/OFF, 0=Noise ON/OFF
		    ld	    (ix+SOUND.VOLUME), a	    ; Envelope wave shape
		    jp	    UpdateVolume


;----------------------------------------------------------------------------
;
; Mute note
;
;----------------------------------------------------------------------------

MuteNote:
		    xor	    a
		    ld	    (ix+SOUND.FREQ_LOW), a
		    ld	    (ix+SOUND.FREQ_HIGH), a
		    ld	    (ix+SOUND.VOLUME), a	    ; Envelope wave shape

		    ld	    a, (ix+SOUND.NOTE_LENGHT)
		    ld	    (ix+SOUND.NOTE_COUNTER),	a
		    call    UpdateChFreq

		    jp	    UpdateVolume


;----------------------------------------------------------------------------
;
; Command END /	RET (#FF)
;
;----------------------------------------------------------------------------

CmdEndRetLogic:
		    ld	    a, (ix+SOUND.RETURN_H)
		    or	    a				    ; Is there a return	address	stored?
		    jr	    z, CmdEndLogic		    ; No. This channel has finished. Reset and mute

		    ld	    (ix+SOUND.POINTER_H), a
		    ld	    a, (ix+SOUND.RETURN_L)
		    ld	    (ix+SOUND.POINTER_L), a	    ; Restore return address

		    ld	    (ix+SOUND.RETURN_H), 0	    ; Erase return address to avoid confusing END and RET commands
		    ld	    (ix+SOUND.NOTE_COUNTER),	1
		    jp	    ProcessChannelData


;----------------------------------------------------------------------------
;
; Reset	channel	data
;
;----------------------------------------------------------------------------

CmdEndLogic:
		    xor	    a
		    ld	    (ix+SOUND.ID), a
		    ld	    (ix+SOUND.CONFIG), a	    ; 3=Use Envelope, 2=Set Env. Freq. 1=Channel ON/OFF, 0=Noise ON/OFF
		    ld	    (ix+SOUND.LOOP_CNT), a
		    ld	    (ix+SOUND.INSTRUMENT), a
		    ld	    (ix+SOUND.FREQ_LOW), a
		    ld	    (ix+SOUND.FREQ_HIGH), a	    ; Reset frequency

		    ld	    (ix+SOUND.VOLUME), a	    ; Reset volumen

		    ld	    (ix+SOUND.VIBRATO_CLK), a

		    ld	    a, c
		    cp	    7				    ; SFX?
		    jp	    c, UpdateVolume		    ; No

; An SFX has finished. Restore channel 3 frequency

		    dec	    c
		    dec	    c				    ; Adjust PSG register to channel 3 frequency

		    ld	    ix,	SoundWorkAreaC
		    ld	    (ix+SOUND.VOLUME), 5	    ; Default volume
		    call    SetChnFreq			    ; Restore channel 3	frequency

		    jp	    UpdateChVol


;----------------------------------------------------------------------------
;
; Update frequency and volume
;
;----------------------------------------------------------------------------

UpdateFreqVol:
		    ld	    a, (flagSndDatRestored)
		    or	    a
		    ret	    z

		    call    UpdateChFreq
		    jp	    UpdateVolume


;----------------------------------------------------------------------------
;
; Update frequency
;
;----------------------------------------------------------------------------

UpdateChFreq:
		    ld	    a, (SoundWorkAreaSfx+2)
		    ld	    e, a
		    ld	    a, c
		    cp	    5				    ; Channel 3	freq. register?
		    jr	    c, SetChnFreq		    ; No

		    jr	    nz,	UpdateSfxFreq

		    ld	    a, e
		    or	    a				    ; Sfx playing?
		    ret	    nz				    ; Yes, there is a SFX active. Don't update music on PSG channel 3

		    jr	    SetChnFreq			    ; Update music channel 3 frequency


UpdateSfxFreq:
		    ld	    a, e
		    or	    a				    ; Sfx playing?
		    ret	    z				    ; No

		    dec	    c
		    dec	    c				    ; Adjust PSG register to channel 3 frequency
		    call    SetChnFreq

		    inc	    c
		    inc	    c				    ; Restore "channel 4/sfx" value
		    ret


;----------------------------------------------------------------------------
;
; Set channel frequency
; In:
;   IX = Sound work area pointer
;    C = PSG frequency register
;
;----------------------------------------------------------------------------

SetChnFreq:
		    ld	    l, (ix+SOUND.FREQ_LOW)
		    ld	    h, (ix+SOUND.FREQ_HIGH)

		    bit	    3, (ix+SOUND.FREQ_MOD)	    ; Detune?
		    jr	    z, WrtPsgChnFreq

		    inc	    hl

;----------------------------------------------------------------------------
;
; Set PSG channel frequency
; In:
;    C = PSG frequency register	(high)
;   HL = Frequency
;
;----------------------------------------------------------------------------

WrtPsgChnFreq:
		    ld	    a, c			    ; PSG ch. freq. reg. high
		    ld	    e, h
		    call    WRTPSG

		    ld	    a, c
		    dec	    a				    ; PSG ch. freq. reg. low
		    ld	    e, l
		    call    WRTPSG

		    ld	    a, (ix+SOUND.INSTRUMENT)
		    or	    a
		    ret	    nz

		    ld	    a, (ix+SOUND.NOTE_MODE)	    ; 1	= Note mode, 0 = Sfx mode
		    or	    a
		    ret	    z

		    ld	    (ix+SOUND.CONFIG), 2	    ; 3=Use Envelope, 2=Set Env. Freq. 1=Channel ON/OFF, 0=Noise ON/OFF
		    ret



;----------------------------------------------------------------------------
;
; Notes	base frequency
;
;----------------------------------------------------------------------------
NoteFrequency:	    db	6Bh, 65h, 5Fh, 5Ah, 55h, 50h, 4Ch, 47h,	43h, 40h, 3Ch, 39h


;----------------------------------------------------------------------------
;
; Fade out current music and set (MusicToSet)
;
;----------------------------------------------------------------------------

MusicFadeOut:
		    ld	    hl,	FadeStepCnt
		    inc	    (hl)

		    ld	    a, (SoundWorkArea+2)
		    cp	    41h				    ; Ending music? (Music: Return of Fox Hunder)
		    jr	    nz,	MusicFadeOut2

		    ld	    a, (hl)
		    cp	    0Eh
		    ret	    c				    ; Slower fade than normal fade

		    jr	    MusicFadeOut3


MusicFadeOut2:
		    ld	    a, (hl)
		    cp	    3				    ; Number of	steps to increment the fade value
		    ret	    c

MusicFadeOut3:
		    ld	    (hl), 0			    ; Reset FadeStepCnt

		    inc	    hl
		    inc	    (hl)			    ; Increment	fade value

		    ld	    a, (hl)
		    cp	    11
		    ret	    c				    ; The fade has not finished	yet

		    xor	    a
		    ld	    hl,	MusicToSet		    ; New music	to play	(fade out current one)
		    ld	    e, (hl)			    ; E	= Music	to play
		    ld	    (hl), a

		    inc	    l
		    ld	    (hl), a			    ; Reset FadeStepCnt

		    inc	    l
		    ld	    (hl), a			    ; Reset VolumeFadeVal

		    ld	    a, e
		    jp	    SetSound			    ; Play music


;----------------------------------------------------------------------------
;
; Update volume
;
;----------------------------------------------------------------------------

UpdateVolume:
		    ld	    a, (SoundWorkAreaSfx+2)
		    ld	    e, a			    ; E=Sfx ID

		    ld	    a, c
		    cp	    5				    ; Channel 3? (1=Ch.1, 3=Ch.2, 5=Ch.3, 7=Ch.3 sfx)
		    jr	    c, UpdateChVol		    ; Channel 1	or 2

		    jr	    nz,	UpdateSfxVol		    ; SFX in channel 3

		    ld	    a, e
		    or	    a				    ; SFX playing?
		    ret	    nz				    ; No

		    jr	    UpdateChVol


UpdateSfxVol:
		    ld	    a, e
		    or	    a				    ; Sfx playing?
		    ret	    z				    ; No

		    dec	    c
		    dec	    c				    ; Adjust PSG frequency register to channel 3

UpdateChVol:
		    call    UpdateMixer

		    ld	    a, c			    ; PSG freq reg high	(1, 3, 5)
		    rrca
		    add	    a, 88h			    ; Convert to volume	register (8, 9,	10)
		    ld	    d, a
		    ld	    h, (ix+SOUND.VOLUME)	    ; Envelope wave shape

		    ld	    a, (SoundDataSaved)
		    or	    a
		    jr	    nz,	UpdateChVol2

		    ld	    a, (ix+SOUND.NOTE_MODE)	    ; 1	= Note mode, 0 = Sfx mode
		    or	    a
		    jr	    z, UpdateChVol2

		    ld	    a, (VolumeFadeVal)
		    or	    a
		    jp	    z, UpdateChVol2

		    ld	    e, a			    ; Fade value
		    ld	    a, h			    ; Volume
		    sub	    e
		    ret	    m				    ; Negative volume value

		    bit	    3, (ix+SOUND.CONFIG)	    ; 3=Use Envelope, 2=Set Env. Freq. 1=Channel ON/OFF, 0=Noise ON/OFF
		    ret	    nz

		    ld	    h, a			    ; Volume

UpdateChVol2:
		    ld	    a, (ix+SOUND.CONFIG)	    ; 3=Use Envelope, 2=Set Env. Freq. 1=Channel ON/OFF, 0=Noise ON/OFF
		    bit	    3, a			    ; Volume controlled	by envelope?
		    jr	    z, SetChnVolume

		    bit	    2, a
		    ret	    nz

		    ld	    e, h			    ; Env. shape
		    ld	    a, 0Dh			    ; Envelope wave shape register
		    call    WRTPSG

		    ld	    a, 10h			    ; Enable envelope volume
		    ld	    h, a

SetChnVolume:
		    ld	    a, d			    ; D	= PSG channel volume register
		    ld	    e, h			    ; H	= Volume
		    jp	    WRTPSG



;----------------------------------------------------------------------------
;
; Copy channels	data
;
;----------------------------------------------------------------------------

CopySoundData:
		    ld	    bc,	60h
		    ldir
		    ld	    c, a

		    xor	    a
		    ld	    (RestoreSoundData),	a
		    ret


;----------------------------------------------------------------------------
;
; Loop,	call, goto command (#FE)
;
; #FE xx address (xx = Number of loops to address)
; #FE #FF address (CALL	address)
; #FE #FE address (GOTO	address)
; #FE #00
;----------------------------------------------------------------------------

CmdLoopLogic:
		    inc	    hl

		    ld	    a, (hl)			    ; Number of	loops to do
		    or	    a				    ; 0
		    jr	    z, ChangeMode

		    inc	    a
		    jr	    z, CmdCallLogic		    ; #FF = RET	/ END command

		    ld	    a, (ix+SOUND.LOOP_CNT)	    ; Number of	loops already done
		    inc	    a
		    cp	    (hl)			    ; All loops	done?
		    jr	    z, CmdLoopEnd		    ; Yes

		    jp	    m, CmdLoopLogic2		    ; #FE? This	number of loops	means GOTO

		    dec	    a				    ; Infinite loop (GOTO)

CmdLoopLogic2:
		    ld	    (ix+SOUND.LOOP_CNT), a

		    inc	    hl
		    ld	    a, (hl)
		    ld	    (ix+SOUND.POINTER_L), a

		    inc	    hl
		    ld	    a, (hl)
		    ld	    (ix+SOUND.POINTER_H), a	    ; Set loop address

		    jr	    DoNextCommand2


CmdLoopEnd:
		    inc	    hl
		    inc	    hl				    ; Skip pointer to address

		    xor	    a
		    ld	    (ix+SOUND.LOOP_CNT), a	    ; Reset loops counter

DoNextCommand:
		    call    PointerNextCmd

DoNextCommand2:
		    inc	    (ix+SOUND.NOTE_COUNTER)
		    jp	    ProcessChannelData


;----------------------------------------------------------------------------
;
; Swap mode: music / sfx
;
;----------------------------------------------------------------------------

ChangeMode:
		    ld	    a, (ix+SOUND.NOTE_MODE)	    ; 1	= Note mode, 0 = Sfx mode
		    or	    a
		    jr	    z, ChangeMode2

		    dec	    (ix+SOUND.NOTE_MODE)	    ; 1	= Note mode, 0 = Sfx mode
		    jr	    DoNextCommand_


ChangeMode2:
		    inc	    (ix+SOUND.NOTE_MODE)	    ; 1	= Note mode, 0 = Sfx mode

DoNextCommand_:
		    jr	    DoNextCommand



;----------------------------------------------------------------------------
;
; CALL command
;
;----------------------------------------------------------------------------

CmdCallLogic:
		    inc	    hl
		    ld	    e, (hl)
		    ld	    (ix+SOUND.POINTER_L), e

		    inc	    hl
		    ld	    d, (hl)
		    ld	    (ix+SOUND.POINTER_H), d

		    inc	    hl
		    ld	    (ix+SOUND.RETURN_L), l
		    ld	    (ix+SOUND.RETURN_H), h	    ; Return address
		    ex	    de,	hl
		    jp	    ProcessChanneldData4


;----------------------------------------------------------------------------
;
; Update pointer to next command
;
;----------------------------------------------------------------------------

PointerNextCmd:
		    inc	    hl
		    ld	    (ix+SOUND.POINTER_L), l
		    ld	    (ix+SOUND.POINTER_H), h
		    ret


;----------------------------------------------------------------------------
;
; Update mixer
; Enables/disables tone	and noise of a channel
; In:
;    C = Channel freq. PSG reg.	high (1,3,5)
;
;----------------------------------------------------------------------------

UpdateMixer:
		    ld	    a, (PGS_MixerVal)
		    ld	    e, a			    ; E	= Current mixer	configuration

		    ld	    a, (ix+SOUND.CONFIG)	    ; 3=Use Envelope, 2=Set Env. Freq. 1=Channel ON/OFF, 0=Noise ON/OFF
		    and	    3
		    ld	    d, a

		    ld	    a, c
		    cp	    1				    ; Channel 1	PSG freq reg?
		    jr	    z, UpdateMixer2

		    dec	    a				    ; Adjust to	mixer tone bits	(1,3,5 -> 1,2,4)

UpdateMixer2:
		    ld	    b, a
		    bit	    1, d
		    call    z, EnableMixerBit

		    bit	    1, d
		    call    nz,	DisableMixerBit

		    ld	    a, b
		    rlca
		    rlca
		    rlca				    ; Adjust to	noise register bits
		    bit	    0, d
		    call    z, EnableMixerBit

		    bit	    0, d
		    call    nz,	DisableMixerBit

SetPsgMixer:
		    ld	    (PGS_MixerVal), a
		    ld	    e, a
		    ld	    a, 7
		    jp	    WRTPSG


DisableMixerBit:
		    cpl
		    and	    e
		    ld	    e, a
		    ret


EnableMixerBit:
		    or	    e

DummyAddr4:
		    ld	    e, a
		    ret

