;----------------------------------------------------------------------------
;
; Tape LOAD and	SAVE logic
;
;----------------------------------------------------------------------------

LoadSaveLogic:
		    ld	    hl,	SaveLoadMode		    ; 1=Load mode, 2=Save mode
		    ld	    a, (hl)
		    inc	    hl
		    dec	    a
		    jp	    z, LoadMode

		    ld	    a, (hl)			    ; Save/load	status
		    ld	    b, a
		    inc	    b
		    djnz    EnterSaveName

		    call    InitSaveLoad

		    ld	    hl,	txtSaveMode
		    call    PrintTextXY_

		    call    ResetFilename
		    jr	    NextSaveLoadStat_


;----------------------------------------------------------------------------
; Enter	filename for saving (status 1)
;----------------------------------------------------------------------------

EnterSaveName:
		    djnz    SaveFilename

		    call    GetKeyTyped
		    jp	    c, ExitSaveLoad

		    cp	    0Dh				    ; Return key
		    ret	    nz

		    ld	    hl,	txtSaveError
		    call    EraseTextXY_		    ; Erase SAVE ERROR text

InitSave:
		    call    CalcDataChecksum
		    ld	    (hl), a			    ; Store checksum at	the end	of the data

		    ld	    hl,	txtSaving
		    call    PrintTextXY_

NextSaveLoadStat_:
		    jr	    NextSaveLoadStat


;----------------------------------------------------------------------------
; Save on tape the file	name (status 2)
;----------------------------------------------------------------------------

SaveFilename:
		    djnz    SaveGameData

		    ld	    a, 1			    ; Long header
		    call    TAPOON			    ; Turns on the cassette motor and writes the header

		    ld	    b, 0Ah

SaveFilename2:
		    push    bc
		    ld	    a, 0EAh
		    call    TAPOUT			    ; Writes data on the tape (A = value)
		    pop	    bc

		    jr	    c, SaveError

		    djnz    SaveFilename2

		    ld	    b, 6
		    ld	    hl,	Filename

SaveFilename3:
		    push    hl
		    push    bc
		    ld	    a, (hl)
		    call    TAPOUT			    ; Save filename
		    jr	    c, SaveError

		    pop	    bc
		    pop	    hl
		    inc	    hl
		    djnz    SaveFilename3

		    jr	    NextSaveLoadStat


SaveError:
		    call    TAPOOF			    ; Stops writing to the tape

		    ld	    hl,	txtSaving
		    call    EraseTextXY_		    ; Erase saving text

SaveError2:
		    call    ResetFilename
		    ld	    b, 6
		    ld	    hl,	txtSaveError
		    jp	    PrintError


;----------------------------------------------------------------------------
; Save on tape the game	data (status 3)
;----------------------------------------------------------------------------

SaveGameData:
		    djnz    SaveChkVerify

		    xor	    a
		    call    TAPOON			    ; Turns on the cassette motor and writes the header
		    jr	    c, SaveError

		    ld	    de,	GameProgressBuffer
		    ld	    bc,	300h			    ; (!?) #220	should be enough

SaveGameData2:
		    push    de
		    push    bc
		    ld	    a, (de)
		    call    TAPOUT			    ; Save game	data byte
		    pop	    bc
		    pop	    de
		    jr	    c, SaveError

		    inc	    de
		    dec	    bc
		    ld	    a, b
		    or	    c				    ; All bytes	saved?
		    jr	    nz,	SaveGameData2

		    ld	    a, (TailDataByte)
		    call    TAPOUT			    ; Writes data on the tape
		    jr	    c, SaveError

		    call    TAPOOF			    ; Stops writing on the tape

		    ld	    hl,	txtVerify
		    call    PrintTextXY_		    ; Print "VERIFY?"

NextSaveLoadStat:
		    ld	    hl,	SaveLoadStat
		    inc	    (hl)
		    ret



;----------------------------------------------------------------------------
; Waits	user input to verify saved data	(status	4)
;----------------------------------------------------------------------------

SaveChkVerify:
		    djnz    SaveNotVerify

		    ld	    hl,	KeyboardRow5
		    bit	    6, (hl)			    ; Y	key pressed?
		    jr	    nz,	SaveVerify		    ; Yes

		    inc	    hl				    ; Pointer to keyboard row 4	buffer
		    bit	    3, (hl)			    ; N	key pressed
		    ret	    z				    ; Not pressed

		    ld	    hl,	txtVerify
		    call    EraseTextXY_		    ; Erase "VERIFY?" text

		    ld	    hl,	txtRetry
		    call    PrintTextXY_

		    ld	    hl,	txtYesNo
		    call    PrintTextXY_

		    ld	    a, 5
		    ld	    (SaveLoadStat), a
		    ret


SaveVerify:
		    ld	    hl,	txtYesNo
		    call    EraseTextXY_		    ; Erase YES	NO

		    ld	    hl,	txtIng
		    call    PrintTextXY_		    ; Print ING	(VERIFYING)

		    ld	    hl,	txtYesNo
		    call    EraseTextXY_		    ; (!?) Twice?

		    ld	    hl,	txtIng
		    call    PrintTextXY_		    ; (!?) Twice?

		    call    SearchFile

		    ld	    hl,	GameProgressBuffer
		    ld	    bc,	300h			    ; (!?) #220	is the size of the buffer

SaveVerify2:
		    push    hl
		    push    bc
		    call    TAPIN			    ; Read data	from the tape
		    pop	    bc
		    pop	    hl

		    jr	    c, SaveVerify3

		    cp	    (hl)
		    jr	    nz,	SaveVerify4		    ; Verify error

		    inc	    hl
		    dec	    bc
		    ld	    a, b
		    or	    c				    ; All bytes	compared?
		    jr	    nz,	SaveVerify2

		    call    TAPIN			    ; Read data	from the tape

SaveVerify3:
		    jr	    c, VerifyError

		    ld	    b, a
		    ld	    a, (TailDataByte)
		    cp	    b

SaveVerify4:
		    jr	    nz,	VerifyError

		    call    TAPIOF			    ; Stops reading from the tape

		    call    CalcDataChecksum
		    cp	    (hl)			    ; Compare checksums
		    jr	    nz,	VerifyError

		    ld	    hl,	txtVerifyOk
		    call    PrintTextXY_		    ; Print VERIFY SUCCESS. RETRY?

		    ld	    hl,	txtYesNo
		    call    PrintTextXY_		    ; Print YES	NO
							    ; (!?) Why does it ask to verify again? Doing it shows always a error.

		    jp	    NextSaveLoadStat



;----------------------------------------------------------------------------
; This part has	no sense. After	selecting not to verify	it ask to try again.
; Trying to retry always shows an error	(status	5)
;----------------------------------------------------------------------------

SaveNotVerify:
		    djnz    SaveRetry

		    ld	    hl,	KeyboardRow5
		    bit	    6, (hl)			    ; Y	key pressed?
		    jr	    z, SaveNotVerify2

		    ld	    hl,	txtVerifyOk
		    call    EraseTextXY_		    ; Erase VERIFY SUCCESS

		    ld	    hl,	txtYesNo
		    call    EraseTextXY_		    ; Erase YES	NO

		    jp	    SaveError2


SaveNotVerify2:
		    inc	    hl
		    bit	    3, (hl)			    ; N	key pressed?
		    ret	    z				    ; No

ExitSaveLoad:
		    ld	    de,	 SoundWorkArea+1
		    ld	    hl,	SoundWorkArea
		    ld	    bc,	0DFh
		    ld	    (hl), 0
		    ldir

		    ld	    hl,	RestoreSavedGame	    ; ;Set after loading tape data
		    ld	    (hl), 0

		    ld	    a, (SaveLoadMode)		    ; 1=Load mode, 2=Save mode
		    dec	    a
		    jp	    nz,	InitGameArea

		    ld	    a, (DoNotAddEnemies)
		    or	    a
		    jp	    nz,	InitGameArea

		    inc	    (hl)			    ; Set "RestoreSavedGame"
		    ret



;----------------------------------------------------------------------------
; Waits	user input to retry to save (status 6)
;----------------------------------------------------------------------------

SaveRetry:
		    ld	    hl,	KeyboardRow5
		    bit	    6, (hl)			    ; Y	key pressed?
		    jr	    z, SaveRetry2		    ; No

		    ld	    hl,	txtRetry
		    call    EraseTextXY_		    ; Erase RETRY?

		    ld	    hl,	txtYesNo
		    call    EraseTextXY_		    ; Erase YES	NO

		    ld	    hl,	txtVerifyError
		    call    EraseTextXY_		    ; Erase VERIFY ERROR

		    ld	    a, 1
		    ld	    (SaveLoadStat), a		    ; Enter filename mode
		    jp	    InitSave


VerifyError:
		    jr	    TapeError


SaveRetry2:
		    inc	    hl
		    bit	    3, (hl)			    ; N	key pressed?
		    ret	    z

		    ld	    a, 1
		    ld	    (DoNotAddEnemies), a
		    jr	    ExitSaveLoad



;----------------------------------------------------------------------------
;
; Load mode
;
;----------------------------------------------------------------------------

LoadMode:
		    ld	    a, (hl)
		    ld	    b, a
		    inc	    b
		    djnz    EnterLoadName

		    call    InitSaveLoad

		    ld	    hl,	txtLoadMode
		    call    PrintTextXY_

		    call    ResetFilename
		    jp	    NextSaveLoadStat



;----------------------------------------------------------------------------
; Input	filename for loading (status 1)
;----------------------------------------------------------------------------

EnterLoadName:
		    djnz    LoadData

		    call    GetKeyTyped
		    jr	    nc,	loc_11FAFB

		    ld	    a, 1
		    ld	    (DoNotAddEnemies), a
		    jr	    ExitSaveLoad


loc_11FAFB:
		    push    af
		    ld	    hl,	txtLoadError
		    call    EraseTextXY_
		    pop	    af

		    cp	    0Dh				    ; Return key pressed?
		    ret	    nz

		    jp	    NextSaveLoadStat



;----------------------------------------------------------------------------
; Load data from tape (status 2)
;----------------------------------------------------------------------------

LoadData:
		    djnz    ChkLoadRetry

		    call    SearchFile

		    ld	    de,	EnemyListCopy		    ; Used when	entering binoculars mode
		    ld	    bc,	300h

LoadData2:
		    push    de
		    push    bc
		    call    TAPIN			    ; Read data	from the tape
		    pop	    bc
		    pop	    de
		    jr	    c, TapeError

		    ld	    (de), a			    ; Copy byte

		    inc	    de
		    dec	    bc

		    ld	    a, b
		    or	    c				    ; All bytes	read?
		    jr	    nz,	LoadData2		    ; Read next	byte

		    call    TAPIN			    ; Read data	from the tape
		    jr	    c, TapeError

		    ld	    (TailDataByte), a
		    call    TAPIOF			    ; Stops reading from the tape

		    call    CalcDataChecksum
		    cp	    (hl)			    ; Right checksum?
		    jr	    nz,	TapeError

		    ld	    de,	GameProgressBuffer
		    ld	    hl,	EnemyListCopy		    ; Used when	entering binoculars mode
		    ld	    bc,	300h
		    ldir

		    xor	    a
		    ld	    (DoNotAddEnemies), a
		    jp	    ExitSaveLoad


TapeError:
		    call    TAPIOF			    ; Stops reading from the tape

		    ld	    a, 1
		    ld	    (DoNotAddEnemies), a

		    ld	    hl,	txtLoadError
		    ld	    b, 3
		    ld	    a, (SaveLoadMode)		    ; 1=Load mode, 2=Save mode
		    dec	    a
		    jr	    z, PrintError

		    ld	    hl,	txtVerifyError
		    ld	    b, 6

PrintError:
		    ld	    a, b
		    ld	    (SaveLoadStat), a
		    call    PrintTextXY_

		    ld	    hl,	txtRetry
		    call    PrintTextXY_		    ; Print RETRY?

		    ld	    hl,	txtYesNo
		    call    PrintTextXY_		    ; Print YES	NO

		    jp	    ResetFilename



;----------------------------------------------------------------------------
; Waits	user input to retry to load (status 3)
;----------------------------------------------------------------------------

ChkLoadRetry:
		    ld	    hl,	KeyboardRow5
		    bit	    6, (hl)			    ; Y	key pressed?
		    jr	    z, ChkLoadRetry2

		    ld	    a, 2			    ; load data	from tape status
		    ld	    (SaveLoadStat), a

		    ld	    hl,	txtVerifyError
		    call    EraseTextXY_		    ; Erase VERIFY ERROR

		    ld	    hl,	txtRetry
		    call    EraseTextXY_		    ; Erase RETRY?

		    ld	    hl,	txtVerify		    ; Erase VERIFY? YES	NO
		    jp	    EraseTextXY_


ChkLoadRetry2:
		    inc	    hl
		    bit	    3, (hl)			    ; N	key pressed?
		    ret	    z

		    jp	    ExitSaveLoad



;----------------------------------------------------------------------------
; Search the file that matches the filename
;----------------------------------------------------------------------------

SearchFile:
		    call    TAPION			    ; Reads the	header block after turning the cassette	motor on
		    jr	    c, TapeError

		    ld	    b, 0Ah

SearchFile2:
		    push    bc
		    call    TAPIN			    ; Read data	from the tape
		    pop	    bc

TapeError_:
		    jr	    c, TapeError

		    cp	    0EAh
		    jr	    nz,	SearchFile

		    djnz    SearchFile2

		    ld	    b, 6
		    ld	    hl,	FilenameFound

SearchFile3:
		    push    bc
		    push    hl
		    call    TAPIN			    ; Read data	from the tape
		    pop	    hl
		    pop	    bc

		    ld	    (hl), a
		    inc	    hl

		    djnz    SearchFile3

; Compare filenames
		    ld	    hl,	FilenameFound
		    ld	    de,	Filename
		    ld	    b, 6

SearchFile4:
		    ld	    a, (de)
		    cp	    (hl)
		    jr	    nz,	PrintSkipName

		    inc	    hl
		    inc	    de
		    djnz    SearchFile4

		    ld	    hl,	txtFound
		    call    PrintTextXY_		    ; Print FOUND

		    call    PrintFileFound		    ; Print filename

		    call    TAPION			    ; Reads the	header block after turning the cassette	motor on
		    jr	    c, TapeError_

		    ret



;----------------------------------------------------------------------------
; Print	SKIP and the filename found
;----------------------------------------------------------------------------

PrintSkipName:
		    pop	    hl
		    call    TAPION			    ; Reads the	header block after turning the cassette	motor on

		    ld	    hl,	txtSkip
		    call    PrintTextXY_

PrintFileFound:
		    ld	    de,	5860h
		    ld	    hl,	FilenameFound
		    jr	    PrintFilename2



;----------------------------------------------------------------------------
;
; Character input
;
;----------------------------------------------------------------------------

GetKeyTyped:
		    xor	    a
		    ld	    (KANAST), a			    ; russian key status (Dead Keys)
							    ;	     0 = No Dead Keys
							    ;	     1 = Dead Key > Accent Grave
							    ;	     2 = SHIFT + Dead Key > Accent Egu
							    ;	     3 = CODE +	Dead Key > Accent Circumflex
							    ;	     4 = SHIFT + CODE +	Dead Key > Trema
		    call    CHGET			    ; One character input

		    ld	    c, a
		    ld	    hl,	FilenameSize
		    ld	    de,	Filename
		    ld	    a, (hl)
		    call    ADD_DE_A__

		    ld	    a, c
		    cp	    1Bh				    ; ESC key
		    jr	    z, GetKeyTyped3

		    cp	    0Dh				    ; RETURN key
		    jr	    z, PrintFilename_

		    cp	    8				    ; BS key
		    jr	    z, EraseCharacter

		    sub	    '0'
		    cp	    10
		    jr	    c, GetKeyTyped2		    ; It is a number

		    sub	    11h				    ; 'A'
		    cp	    26
		    jr	    c, GetKeyTyped2		    ; It is a letter

		    sub	    20h				    ; 'a'
		    cp	    26
		    ret	    nc				    ; Not a lowercase letter

		    ld	    a, c
		    sub	    20h				    ; Lowercase	case to	upper case
		    ld	    c, a

GetKeyTyped2:
		    ld	    a, c
		    ld	    (de), a			    ; Store the	pressed	character

		    ld	    a, (hl)
		    inc	    a
		    cp	    6				    ; Filename max. lenght
		    jr	    nc,	PrintFilename

		    ld	    (hl), a			    ; Increment	filename lenght
		    jr	    PrintFilename


GetKeyTyped3:
		    scf
		    ret


PrintFilename_:
		    call    PrintFilename
		    ld	    a, 0Dh			    ; Return key code
		    ret


;----------------------------------------------------------------------------
; Erase	a character from the filename
;----------------------------------------------------------------------------

EraseCharacter:
		    ex	    de,	hl

		    ld	    c, (hl)
		    ld	    (hl), 0			    ; Erase the	next/last character.

		    ld	    a, (de)			    ; Filename character offset
		    dec	    a
		    jp	    m, PrintFilename		    ; The filaname is empty

		    ld	    (de), a			    ; Update character offset

		    ld	    a, c
		    and	    a				    ; Is the erased character an empty space?
		    jr	    nz,	EraseCharacter2

		    dec	    hl
		    ld	    (hl), a			    ; Erase the	previous character
		    jr	    PrintFilename


EraseCharacter2:
		    ex	    de,	hl
		    inc	    (hl)			    ; Increment	filename character offset

PrintFilename:
		    ld	    de,	3050h			    ; DE = DX,DY
		    ld	    hl,	Filename

PrintFilename2:
		    ld	    c, 1			    ; Print flag (0=Erase)
		    ld	    b, 6			    ; Number of	characters

PrintFilename3:
		    ld	    a, (hl)
		    inc	    hl
		    call    DrawChar_
		    ld	    a, d
		    add	    a, 8
		    ld	    d, a
		    djnz    PrintFilename3

		    xor	    a
		    ret


;----------------------------------------------------------------------------
;
; Initialize SAVE/LOAD mode
;
;----------------------------------------------------------------------------

InitSaveLoad:
		    ld	    hl,	808h			    ; HL = XY
		    ld	    bc,	0A0A0h			    ; BC = NX,NY
		    xor	    a
		    ld	    (RestoreSavedGame),	a	    ; ;Set after loading tape data
		    ld	    (DoNotAddEnemies), a
		    ld	    d, a			    ; Page 0
		    call    FillRect_			    ; Draw black rectangle

		    ld	    hl,	KEYBUF
		    ld	    b, 28h
		    call    ClearBuffer			    ; Clear keyboard buffer

		    ld	    hl,	Filename
		    ld	    b, 6
		    jr	    ClearBuffer


ResetFilename:
		    ld	    hl,	FilenameSize
		    ld	    b, 0Eh

ClearBuffer:
		    ld	    (hl), 0
		    inc	    hl
		    djnz    ClearBuffer
		    ret


;----------------------------------------------------------------------------
;
; Calculate the	checksum of the	game data
;
;----------------------------------------------------------------------------

CalcDataChecksum:
		    ld	    hl,	GameProgressBuffer
		    ld	    bc,	2FFh
		    ld	    a, (hl)
		    inc	    hl

CalcDataChecksum2:
		    add	    a, (hl)
		    inc	    hl
		    dec	    bc
		    ld	    a, c
		    or	    b
		    jr	    nz,	CalcDataChecksum2
		    ld	    hl,	TailDataByte
		    ret




;----------------------------------------------------------------------------
;
; SAVE / LOAD texts
;
;----------------------------------------------------------------------------
txtSaveMode:	    dw 3010h
		    db	"SAVE",   0, "MODE"
		    db 0FEh
		    dw 4018h
		    db	"INPUT",   0, "FILE",   0, "NAME"
		    db 0FFh

txtLoadMode:	    dw 3010h
		    db	"LOAD",   0, "MODE"
		    db 0FEh
		    dw 4018h
		    db	"INPUT",   0, "FILE",   0, "NAME"
		    db 0FFh

txtSaving:	    dw 6028h
		    db	"SAVING"
		    db 0FFh

txtSaveError:	    dw 6028h
		    db	"SAVE",   0, "ERROR"
		    db 0FFh

txtVerifyError:	    dw 6028h
		    db	"VERIFY",   0, "ERROR"
		    db 0FFh

txtVerifyOk:	    dw 6020h
		    db	"VERIFY",   0, "SUCCESS"
		    db 0FEh
txtRetry:	    dw 7020h
		    db	"RETRY["
		    db 0FFh

txtVerify:	    dw 6028h
		    db	"VERIFY[",   0
		    db 0FEh
txtYesNo:	    dw 8020h
		    db	"YES",   0,   0,   0,   0, "Y"
		    db 0FEh
		    dw 8820h
		    db	"NO",   0,   0,   0,   0,   0, "N"
		    db 0FFh

txtIng:		    dw 6058h
		    db	"ING"
		    db 0FFh

txtSkip:	    dw 6028h
		    db	"SKIP"
		    db 0FFh

txtFound:	    dw 6028h
		    db	"FOUND",   0,   0
		    db 0FFh

txtLoadError:	    dw 6028h
		    db	"LOAD",   0, "ERROR",   0,   0,   0
		    db 0FFh

