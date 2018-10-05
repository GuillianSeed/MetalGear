
;----------------------------------------------------------------------------
;
; Capture scene	logic
;
;----------------------------------------------------------------------------

CaptureSceneLogic:
		    ld	    a, (CaptureStatus)
		    call    JumpIndex

		    dw AddCaptureGuard			    ; Add the guard A that says	"DON'T MOVE"
		    dw DummyRet4			    ; Do nothing while the guards move and talk
		    dw CaptureSetup			    ; Set wait timer and mute music
		    dw CaptureWait			    ; Wait
		    dw CaptureFadeOut			    ; Fade out
		    dw PutInPrison			    ; Put Snake	in prison


;----------------------------------------------------------------------------
;
; Add a	"capture guard" in the same Y than the player
;
;----------------------------------------------------------------------------


AddCaptureGuard:
		    ld	    hl,	CaptureStatus
		    inc	    (hl)			    ; Next capture scene status

		    ld	    c, ID_CAPTURE_GUARD
		    ld	    a, (PlayerY)
		    ld	    e, a			    ; Guard Y
		    ld	    d, 0F0h			    ; Guard X
		    jp	    AddEnemy			    ; The logic	of this	guard will control part	of the scene


CaptureSetup:
		    ld	    hl,	CaptureStatus
		    inc	    (hl)			    ; Next capture scene status

		    ld	    hl,	CaptureTimer
		    ld	    (hl), 3Ch			    ; Wait timer

		    ld	    a, 5Ch			    ; Mute music
		    ld	    (MusicToSet), a		    ; New music	to play	(fade out current one)

DummyRet4:
		    ret


CaptureWait:
		    ld	    hl,	CaptureTimer
		    dec	    (hl)
		    ret	    nz				    ; Wait

		    dec	    hl
		    inc	    (hl)			    ; Next capture scene status
		    jp	    CopyPalToRAM



;----------------------------------------------------------------------------
;
; Fade out
;
;----------------------------------------------------------------------------

CaptureFadeOut:
		    call    FadeOutLogic
		    ret	    nc				    ; Fade still in progress

		    ld	    hl,	CaptureStatus
		    inc	    (hl)			    ; Next capture scene status

		    inc	    hl
		    ld	    (hl), 10h			    ; Capture timer
		    ret


;----------------------------------------------------------------------------
;
; Put Snake in the prison room and remove his equipment
;
;----------------------------------------------------------------------------

PutInPrison:
		    ld	    hl,	CaptureTimer
		    dec	    (hl)
		    ret	    nz				    ; Wait after the fade

		    ld	    hl,	EquipRemoved		    ; The equipment and	weapons	have been removed by the enemy (captured)
		    ld	    (hl), 1			    ; Remove the equipment flag

		    xor	    a
		    ld	    (SelectedWeapon), a		    ; Remove selected weapon
		    ld	    (SelectedItem), a		    ; Remove selected item
		    ld	    (AlertMode), a		    ; Disable the alert
		    ld	    (AlertRespawnTimer), a

		    ld	    hl,	Room
		    ld	    (hl), 165			    ; Prison room
		    ld	    hl,	PreviousRoom
		    ld	    (hl), 8			    ; Capture room

		    ld	    hl,	PlayerY
		    ld	    (hl), 50h
		    ld	    hl,	PlayerX
		    ld	    (hl), 80h			    ; Set player location

		    call    EraseSprAttRAM
		    call    DisableScreen
		    call    SetSnakePal

		    ld	    hl,	GameMode		    ; Set "playing" mode
		    ld	    (hl), 0
		    jp	    InitGame4


;----------------------------------------------------------------------------
;
; Init capture scene
;
;----------------------------------------------------------------------------

InitCaptureScene:
		    ld	    (ix+ACTOR.SpriteId), 0Ah	    ; Guard left
		    ld	    (ix+ACTOR.COLLISION_CFG), 0	    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
		    ld	    (ix+ACTOR.Wait), 2
		    ret




;----------------------------------------------------------------------------
;
; Capture guards logic
;
;----------------------------------------------------------------------------

CaptureGuardsLogic:
		    ld	    a, (ix+ACTOR.Status)
		    call    JumpIndex

		    dw CaptureDelay
		    dw AddCaptureGuardB			    ; Add guard	B
		    dw CaptureGuardBX			    ; Guard B moves to the left
		    dw CaptureGuardBY			    ; GuardB moves vertically towards the player
		    dw CaptureGuardBSpeak		    ; Guard B says: "YOU ARE CAPTURED"
		    dw CaptureWaitText			    ; Wait after showing the text and before the fade out
		    dw CaptureDummy			    ; Do nothing


CaptureDelay:
		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Wait

		    inc	    (ix+ACTOR.Status)		    ; Next status
		    ret


;----------------------------------------------------------------------------
;
; Guard	says: "DON'T MOVE"
; Add capture guard B. It is located above or under the	player depending on his	position
;
;----------------------------------------------------------------------------


AddCaptureGuardB:
		    ld	    (ix+ACTOR.Status), 6	    ; This guard will do nothing from now on

		    ld	    a, 6			    ;  TEXT: DON'T MOVE!
		    call    SetTextUnskippable

		    ld	    c, ID_CAPTURE_GUARD
		    ld	    a, (PlayerY)
		    cp	    98h
		    ld	    e, 0B0h			    ; Under the	player
		    jr	    c, AddCaptureGuardB2

		    ld	    e, 88h			    ; Above the	player

AddCaptureGuardB2:
		    ld	    d, 0F0h			    ; X
		    call    AddEnemy			    ; Add the second capture guard

		    push    ix

		    push    hl				    ; Pointer to new guard
		    pop	    ix

		    ld	    (ix+ACTOR.Status), 2	    ; Status to	move from right	to left
		    ld	    (ix+ACTOR.Moving), 1	    ; 0=Does not move
		    ld	    (ix+ACTOR.Direction), DIR_LEFT  ; 1=Up, 2=Down, 3=Left, 4=Right
		    ld	    (ix+ACTOR.SpriteId), 0Ah	    ; Guard left sprite	ID
		    call    SetWalkSpeedFast

		    pop	    ix
		    ret

;----------------------------------------------------------------------------
;
; The second guard moves to the	left and decide	to move	up or down depending on	the player location
;
;----------------------------------------------------------------------------

CaptureGuardBX:
		    call    AnimateGuard
		    ld	    a, (ix+ACTOR.X)
		    cp	    0B8h			    ; X	destination
		    ret	    nz				    ; Continue walking

		    inc	    (ix+ACTOR.Status)		    ; Next guard status

		    ld	    a, (ix+ACTOR.Y)
		    cp	    88h				    ; Above the	player?
		    ld	    a, DIR_DOWN
		    jp	    z, CaptureGuardBX2

		    dec	    a				    ; DIR_UP

CaptureGuardBX2:
		    ld	    (ix+ACTOR.Direction), a	    ; Set the direction	towards	Snake
		    jp	    SetWalkSpeedFast


;----------------------------------------------------------------------------
; The second guard moves vertically towards the	player
;----------------------------------------------------------------------------

CaptureGuardBY:
		    call    AnimateGuard

		    ld	    a, (PlayerY)
		    and	    0FEh			    ; Adjust to	even number
		    cp	    (ix+ACTOR.Y)
		    ret	    nz				    ; Not the same Y yet

		    inc	    (ix+ACTOR.Status)		    ; Next guard status
		    ld	    (ix+ACTOR.Moving), 0	    ; Stop moving
		    ld	    (ix+ACTOR.SpriteId), 0Bh	    ; Guard left sprite	id
		    ld	    (ix+ACTOR.Wait), 2
		    ret


;----------------------------------------------------------------------------
; The guard B says :"YOU ARE CAPTURED"
;----------------------------------------------------------------------------

CaptureGuardBSpeak:
		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Wait a bit

		    inc	    (ix+ACTOR.Status)		    ; Next guard status
		    ld	    (ix+ACTOR.Wait), 1Eh

		    ld	    a, 7			    ; TXT: YOU ARE CAPTURED
		    jp	    SetTextUnskippable


;----------------------------------------------------------------------------
; Wait a bit after the "YOU ARE CAPTURED" text
;----------------------------------------------------------------------------

CaptureWaitText:
		    dec	    (ix+ACTOR.Wait)
		    ret	    nz				    ; Wait

		    inc	    (ix+ACTOR.Status)		    ; Next guard status	-> do nothing from now on

		    ld	    hl,	CaptureStatus
		    inc	    (hl)			    ; Continue with the	capture	scene logic

;----------------------------------------------------------------------------
; Do nothing status
;----------------------------------------------------------------------------

CaptureDummy:
		    ret