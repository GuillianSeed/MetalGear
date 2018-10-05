;----------------------------------------------------------------------------
;
; Intro	demo
;
;----------------------------------------------------------------------------

IntroSceneLogic:
		    ld	    a, (IntroSceneStatus)
		    ld	    hl,	idxIntroScene
		    jp	    JumpIndex2

idxIntroScene:	    dw IntroScene1
		    dw IntroScene2
		    dw IntroScene3
		    dw IntroScene4
		    dw IntroScene5
		    dw IntroScene6
		    dw IntroScene7
		    dw IntroScene8
		    dw IntroScene9
		    dw IntroScene10
		    dw IntroScene11
		    dw IntroScene12
		    dw IntroScene13

;----------------------------------------------------------------------------
;
; Diving left
;
;----------------------------------------------------------------------------

IntroScene1:
		    ld	    hl,	IntroSceneCnt
		    dec	    (hl)
		    jr	    z, IntroScene1b

		    xor	    a
		    ld	    (ControlsTrigger), a	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    ld	    a, 3			    ; Left
		    ld	    (PlayerDirection), a	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    ld	    a, 4			    ; Left
		    ld	    (ControlsHold), a		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    jp	    IntroSceneControls

;----------------------------------------------------------------------------
;
; Emerge
;
;----------------------------------------------------------------------------

IntroScene1b:
		    ld	    a, 2			    ; Water
		    ld	    (PlayerAnimation), a	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    dec	    a
		    ld	    (PlayerDirection), a	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    ld	    a, 30h
		    ld	    (IntroSceneCnt), a
		    jp	    NextIntroScene

;----------------------------------------------------------------------------
;
; Wait staring the entrance
;
;----------------------------------------------------------------------------

IntroScene2:
		    ld	    hl,	IntroSceneCnt
		    dec	    (hl)
		    jr	    z, IntroScene2b

		    xor	    a
		    ld	    (ControlsTrigger), a	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    ld	    (ControlsHold), a		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    jp	    IntroSceneControls

;----------------------------------------------------------------------------
;
; Submerge
;
;----------------------------------------------------------------------------

IntroScene2b:
		    ld	    a, 50h
		    ld	    (IntroSceneCnt), a
		    ld	    a, 4			    ; Underwater
		    ld	    (PlayerAnimation), a	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    dec	    a				    ; Left
		    ld	    (PlayerDirection), a	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    jp	    NextIntroScene

;----------------------------------------------------------------------------
;
; Dive left
;
;----------------------------------------------------------------------------

IntroScene3:
		    ld	    hl,	IntroSceneCnt
		    dec	    (hl)
		    jr	    z, IntroScene3b

		    xor	    a
		    ld	    (ControlsTrigger), a	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    ld	    a, 4
		    ld	    (ControlsHold), a		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    jp	    IntroSceneControls


IntroScene3b:
		    ld	    a, 20h
		    ld	    (IntroSceneCnt), a
		    jr	    NextIntroScene

;----------------------------------------------------------------------------
;
; Dive north
;
;----------------------------------------------------------------------------

IntroScene4:
		    ld	    hl,	IntroSceneCnt
		    dec	    (hl)
		    jr	    z, IntroScene4b

		    xor	    a
		    ld	    (ControlsTrigger), a	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    ld	    a, 1
		    ld	    (PlayerDirection), a	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    ld	    a, 1
		    ld	    (ControlsHold), a		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    jr	    IntroSceneControls

;----------------------------------------------------------------------------
;
; Emerge and face right
;
;----------------------------------------------------------------------------

IntroScene4b:
		    ld	    a, 2
		    ld	    (PlayerAnimation), a	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    ld	    a, 4
		    ld	    (PlayerDirection), a	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    ld	    a, 40h
		    ld	    (IntroSceneCnt), a
		    jr	    NextIntroScene

;----------------------------------------------------------------------------
;
; Wait
;
;----------------------------------------------------------------------------

IntroScene5:
		    ld	    hl,	IntroSceneCnt
		    dec	    (hl)
		    jr	    z, IntroScene5b

		    ld	    a, (hl)
		    sub	    20h
		    ret	    nz

		    inc	    a
		    ld	    (RadioCallFlag), a		    ; 1=Start incoming call, 2=Stop incoming call
		    ld	    a, 22h			    ; sfx: Incoming call
		    jp	    SetSoundEntry__

;----------------------------------------------------------------------------
;
; Draw radio screen
;
;----------------------------------------------------------------------------

IntroScene5b:
		    ld	    a, 1
		    ld	    (RestoreSoundData),	a
		    ld	    a, 59h
		    call    SetSoundEntry__

		    call    DrawRadio_

		    ld	    a, 10h
		    ld	    (RadioLedDelay), a		    ; Delay before the first/next led turns on

		    xor	    a
		    ld	    (RadioLedCnt), a
		    ld	    (EquipRadioStatus),	a	    ; Equip and	radio status
		    jr	    NextIntroScene

;----------------------------------------------------------------------------
;
; Signal up
;
;----------------------------------------------------------------------------

IntroScene6:
		    call    RadioSignalUp_
		    ld	    a, (EquipRadioStatus)	    ; Equip and	radio status
		    dec	    a
		    ret	    nz

		    jr	    NextIntroScene

;----------------------------------------------------------------------------
;
; Show radio text: Operation Intrude N313
;
;----------------------------------------------------------------------------

IntroScene7:
		    call    NextIntroScene
		    ld	    a, 5Ch
		    call    SetSoundEntry__

		    ld	    a, 2
		    jp	    SetText_

;----------------------------------------------------------------------------
;
; Exit radio
;
;----------------------------------------------------------------------------

IntroScene8:
		    call    ExitRadio_

		    ld	    a, 28h
		    ld	    (IntroSceneCnt), a
		    ld	    hl,	200h
		    ld	    (PlayerMovSpeed), hl

NextIntroScene:
		    ld	    hl,	IntroSceneStatus
		    inc	    (hl)
		    jp	    SetPlayerSpr_

;----------------------------------------------------------------------------
;
; Move right
;
;----------------------------------------------------------------------------

IntroScene9:
		    ld	    hl,	IntroSceneCnt
		    dec	    (hl)
		    jr	    z, IntroScene9b

		    xor	    a
		    ld	    (ControlsTrigger), a	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    ld	    a, DIR_RIGHT
		    ld	    (PlayerDirection), a	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    rlca
		    ld	    (ControlsHold), a		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up

IntroSceneControls:
		    call    ChkControlPlayer_
		    call    ChkPlayerColl_

IntroChkExitScreen:
		    call    ChkExitScreen_
		    jp	    SetPlayerSpr_


IntroScene9b:
		    ld	    a, 30h
		    ld	    (IntroSceneCnt), a
		    jr	    NextIntroScene

;----------------------------------------------------------------------------
;
; Move up
;
;----------------------------------------------------------------------------

IntroScene10:
		    ld	    hl,	IntroSceneCnt
		    dec	    (hl)
		    jr	    z, IntroScene10b

		    xor	    a
		    ld	    (ControlsTrigger), a	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    inc	    a
		    ld	    (PlayerDirection), a	    ; Up
		    ld	    (ControlsHold), a		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    jr	    IntroSceneControls


IntroScene10b:
		    ld	    hl,	8800h
		    ld	    (PlayerYdec), hl
		    ld	    h, 1
		    ld	    (PlayerMovSpeed), hl
		    ld	    a, h
		    ld	    (PlayerDirection), a	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    ld	    a, 5
		    ld	    (PlayerAnimation), a	    ; Climb animation
		    ld	    a, 1Ch
		    ld	    (IntroSceneCnt), a
		    jr	    NextIntroScene

;----------------------------------------------------------------------------
;
; Climb
;
;----------------------------------------------------------------------------

IntroScene11:
		    ld	    hl,	IntroSceneCnt
		    dec	    (hl)
		    jr	    z, IntroScene11b

		    xor	    a
		    ld	    (ControlsTrigger), a	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    inc	    a				    ; Up
		    ld	    (PlayerDirection), a	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    ld	    (ControlsHold), a		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    call    ControlPlayerV_
		    jr	    IntroChkExitScreen


IntroScene11b:
		    ld	    hl,	6600h
		    ld	    (PlayerYdec), hl

		    xor	    a
		    ld	    (PlayerAnimation), a	    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
		    inc	    a
		    ld	    (PlayerDirection), a	    ; 1=Up, 2 =	Down, 3=Left, 4=Right
		    ld	    (StopPlayerFlag), a		    ; 1=The player is not moving

		    ld	    a, 0Ch
		    ld	    (IntroSceneCnt), a
		    jp	    NextIntroScene

;----------------------------------------------------------------------------
;
; Climb	end: bounce
;
;----------------------------------------------------------------------------

IntroScene12:
		    ld	    hl,	IntroSceneCnt
		    dec	    (hl)
		    jp	    z, NextIntroScene

		    xor	    a
		    ld	    (ControlsHold), a		    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    ld	    (ControlsTrigger), a	    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
		    inc	    a
		    ld	    (PlayerDirection), a	    ; 1=Up, 2 =	Down, 3=Left, 4=Right

		    ld	    a, (hl)
		    bit	    0, a
		    jp	    z, SetPlayerSpr_

		    ld	    hl,	BounceOffsets
		    call    ADD_HL_A_

		    ld	    d, (hl)
		    ld	    e, 0
		    ld	    hl,	(PlayerYdec)
		    add	    hl,	de
		    ld	    (PlayerYdec), hl
		    jp	    SetPlayerSpr_

;----------------------------------------------------------------------------
;
; Intro	scene end
;
;----------------------------------------------------------------------------

IntroScene13:
		    xor	    a
		    ld	    (PlayerControlMod),	a	    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk

		    ld	    hl,	200h
		    ld	    (PlayerMovSpeed), hl
		    jp	    SetPlayerSpr_

BounceOffsets:	    db 2
		    db 1
		    db 0
		    db -2
		    db -2
		    db -2
		    db -3
		    db -5
		    db -7
		    db -5
		    db -3
		    db -2
