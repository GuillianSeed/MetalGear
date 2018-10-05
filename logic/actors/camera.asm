;---------------------------------------------------------------------------
;
; Init laser camera
;
;---------------------------------------------------------------------------

InitCameraLaser:
		    ld	    a, (Room)
		    cp	    118				    ; Metal Gear
		    jr	    nz,	InitCameraLaser2

		    ld	    a, (MetalGear_KO)		    ; Metal Gear destroyed. Self destruction activated
		    or	    a
		    jp	    nz,	DismissActor0		    ; After destroying Metal Gear, the cameras are not active anymore

InitCameraLaser2:
		    ld	    (ix+ACTOR.COLLISION_CFG), 0	    ; Do not check collision with the player or	his shots
		    ld	    a, ID_CAMERA_LASER
		    jr	    InitCamera2


;---------------------------------------------------------------------------
;
; Init camera
;
;---------------------------------------------------------------------------

InitCamera:
		    ld	    a, ID_CAMERA

InitCamera2:
		    call    CountEnemyType		    ; Count how	many cameras are in the	room
		    ld	    (ix+ACTOR.IDX_SAME_ID), a	    ; Index of current camera

		    ld	    a, r
		    ld	    (ix+ACTOR.Wait), a		    ; Random wait time

		    ld	    a, (Room)
		    ld	    hl,	RoomsWithCamera
		    ld	    bc,	0Bh
		    cpir				    ; Get the room index

		    ld	    a, c			    ; Index of the room	where the camera is
		    ld	    hl,	RoomCamTypes
		    call    ADD_HL_2A

		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)
		    ex	    de,	hl			    ; HL = Pointer to camera movement type

		    ld	    a, (ix+ACTOR.IDX_SAME_ID)
		    dec	    a
		    call    ADD_HL_A			    ; Each camera in the room can have a different movement

		    ld	    a, (hl)			    ; Direction	the camera points to
		    ld	    (ix+ACTOR.BASE_SPR_ID), a

		    add	    a, 1Ch			    ; Camera up	sprite ID
		    ld	    (ix+ACTOR.SpriteId), a

		    inc	    (ix+ACTOR.Moving)		    ; Enable movement

InitCamera3:
		    ld	    b, (ix+ACTOR.IDX_SAME_ID)	    ; Index of the predefined paths in this room
		    jp	    GetPathPoints		    ; Get camera path



;----------------------------------------------------------------------------
;
; List of rooms	with cameras
;
;----------------------------------------------------------------------------

RoomsWithCamera:    db	149
		    db	118
		    db	115
		    db	111
		    db	110
		    db	 36
		    db	 31
		    db	 28
		    db	 27
		    db	 21
		    db	 14

;----------------------------------------------------------------------------
;
; Types	of camera in the rooms
;
;----------------------------------------------------------------------------
RoomCamTypes:	    dw CamDirs7
		    dw CamDirs6				    ; 21
		    dw CamDirs4				    ; 27
		    dw CamDirs5				    ; 28
		    dw CamDirs3				    ; 31
		    dw CamDirs2				    ; 36
		    dw CamDirs2				    ; 110
		    dw CamDirs1				    ; 111
		    dw CamDirs1				    ; 115
		    dw CamDirs1				    ; 118
		    dw CamDirs1				    ; 149
;
; Direction the	camera is facing
; 0=Up,	1=Down,	2=Left,	3=Right
;
CamDirs1:	    db 1
		    db 1
CamDirs2:	    db 1
		    db 1
CamDirs3:	    db 3
		    db 0
CamDirs4:	    db 0
		    db 3
CamDirs5:	    db 3
CamDirs6:	    db 1
CamDirs7:	    db 3
		    db 2
		    db 2


;----------------------------------------------------------------------------
;
; Camera logic
;
;----------------------------------------------------------------------------

CameraLogic:
		    ld	    a, (ix+ACTOR.Status)
		    call    JumpIndex

		    dw CamameraMove
		    dw CamAlertAnim
		    dw DummyCamLogic



;----------------------------------------------------------------------------
;
; Move the camera and check if it detects the player
;
;----------------------------------------------------------------------------

CamameraMove:
		    ld	    a, (AlertMode)
		    or	    a
		    jp	    nz,	RenderCamera		    ; The cameras does not move	in alert mode and are drawn as bitmap

		    ld	    a, (ix+ACTOR.BASE_SPR_ID)	    ; Direction	facing to
		    ld	    b, a
		    ld	    hl,	CameraDrawOffsets
		    call    ADD_HL_2A			    ; Pointer to draw offsets

		    ld	    a, (ix+ACTOR.Y)
		    add	    a, (hl)			    ; Y	offset
		    inc	    hl
		    ld	    e, a			    ; E	= New camera Y

		    ld	    a, (ix+ACTOR.X)
		    add	    a, (hl)			    ; X	offset
		    ld	    d, a			    ; D	= New camera X

		    ld	    a, b			    ; A	= Camera pointing direction
		    ex	    de,	hl

		    call    ChkSeePlayer		    ; Checks if	the camera detects the player

		    ld	    a, (ix+ACTOR.SEE_PLAYER_F)	    ; This camera has seen/detected the	player
		    or	    a
		    jr	    z, CamMoveWait		    ; The camera has not detected the player, continue moving/waiting

		    ld	    (ix+ACTOR.Moving), 0	    ; Disable movement
		    ld	    (ix+ACTOR.Wait), 20h	    ; Number of	iterations changing the	color of the camera
		    jp	    NextActorStatus		    ; Start camera color animation


CamMoveWait:
		    ld	    a, (ix+ACTOR.Moving)	    ; Get moving flag
		    or	    a				    ; Is the camera moving?
		    jp	    nz,	ChkReachPoint		    ; Yes, check if the	camera has reached its destination point and decide to wait or not

		    dec	    (ix+ACTOR.Wait)		    ; No, decrement the	time it	is stopped
		    ret	    nz				    ; Continue waiting

		    ld	    (ix+ACTOR.Moving), 1	    ; Enable movement

		    ld	    a, r
		    ld	    (ix+ACTOR.Wait), a
		    jp	    SetDirToPoint		    ; Set the direction	towards	the next point



;----------------------------------------------------------------------------
;
; Camera change	color animation
; Alternate normal color and red. Then draw the	camera as bitmap and remove its	sprites
;
;----------------------------------------------------------------------------

CamAlertAnim:
		    dec	    (ix+ACTOR.Wait)
		    jp	    z, RenderCamera		    ; Stop changing the	color and render the cameras as	bitmap

		    ld	    a, (ix+ACTOR.Wait)
		    ld	    bc,	24Dh			    ; Normal color
		    bit	    2, a
		    jr	    z, CamAlertAnim2

		    ld	    bc,	44Bh			    ; Red color

CamAlertAnim2:
		    ld	    a, b
		    jp	    SetSprColor			    ; Change camera color



;----------------------------------------------------------------------------
;
; Do nothing
;
;----------------------------------------------------------------------------

DummyCamLogic:
		    ret



;----------------------------------------------------------------------------
;
; Offset to draw the camera depending on the direction the camera is pointing to
;
;----------------------------------------------------------------------------
CameraDrawOffsets:  db -0Ch,   0
		    db	2Bh,   0
		    db	  0,-11h
		    db	  0, 10h



;----------------------------------------------------------------------------
;
; Laser	camera logic
; This camera moves only in the	X axis,	and it is pointing down
;
;----------------------------------------------------------------------------

LaserCameraLogic:
		    ld	    a, (ix+ACTOR.Status)
		    call    JumpIndex

		    dw LaserCameraMove
		    dw LaserCameraShot
		    dw LaserCamDummy



;----------------------------------------------------------------------------
;
; Move the camera from point to	point (left <->	right) and check if it detects the player
; If the player	is detected, fire a laser and stop the camera
;
;----------------------------------------------------------------------------

LaserCameraMove:
		    call    ChkReachPoint		    ; Check if the camera has reached a	destination point

LaserCamChkShot:
		    ld	    a, (PlayerY)
		    cp	    (ix+ACTOR.Y)
		    ret	    c				    ; The player is behind the camera

		    ld	    a, (PlayerX)
		    sub	    4				    ; Detection	range /	2
		    ld	    d, (ix+ACTOR.X)
		    cp	    d
		    ret	    nc				    ; Not in the detection range

		    add	    a, 8
		    cp	    d
		    ret	    c				    ; Not in the detection range

; The player has been detected by the camera: shot a laser

		    ld	    a, (ix+ACTOR.Status)
		    or	    a				    ; Is the camera already firing a laser?
		    call    z, NextActorStatus		    ; No, change its status to "firing"

		    ld	    (ix+ACTOR.LASER_WAIT), 20h	    ; Wait time	before firing again
		    ld	    de,	0
		    call    SetActorSpeedX		    ; Stop camera

		    ld	    d, (ix+ACTOR.X)
		    ld	    e, (ix+ACTOR.Y)
		    ld	    c, ID_LASER_SHOT
		    push    ix
		    call    AddEnemy			    ; Fire! Add	a laser	shot
		    pop	    ix

		    ld	    a, 0FFh			    ; Firing!
		    ret



;----------------------------------------------------------------------------
;
; Decrement the	laser timer
;
;----------------------------------------------------------------------------

LaserCameraShot:
		    call    ChkReachPoint

		    ld	    a, (ix+ACTOR.LASER_WAIT)	    ; bit1:0=Red laser,1=White laser
		    or	    a
		    jr	    z, LaserCameraShot2		    ; Wait timer finished

		    dec	    (ix+ACTOR.LASER_WAIT)	    ; bit1:0=Red laser,1=White laser
		    ret	    nz				    ; Wait while firing	the laser

LaserCameraShot2:
		    call    LaserCamChkShot		    ; Check if the camera fires	again
		    inc	    a
		    ret	    z				    ; Yes! It is firing

; Check	if the player is "near"
; From this point on, the logic	is weird.

		    ld	    a, (PlayerX)
		    sub	    (ix+ACTOR.X)
		    jr	    nc,	LaserCameraShot3

		    neg

LaserCameraShot3:
		    cp	    60h				    ; He can't move further (!?)
		    jr	    c, LaserCameraShot4

		    ld	    l, (ix+ACTOR.PointerL)
		    ld	    h, (ix+ACTOR.PointerH)	    ; (!?) HL not used
		    call    InitCamera3
		    jp	    ResetActorStatus		    ; The camera continues moving

LaserCameraShot4:
		    ld	    a, (ix+ACTOR.KO_POINTER_H)
		    or	    a
		    jr	    nz,	CameraChkContinue

		    ld	    a, (ix+ACTOR.IDX_SAME_ID)	    ; Index of the camera in the room
		    ld	    hl,	 LaserCameraShot9+1	    ; List of X	postions to check
		    call    ADD_HL_2A

		    ld	    a, (ix+ACTOR.X)
		    cp	    (hl)
		    ld	    c, 1
		    jr	    z, LaserCameraShot5		    ; The camera is at checkpoint 1

		    inc	    hl
		    cp	    (hl)
		    ld	    c, -1
		    jr	    z, LaserCameraShot5		    ; The camera is at checkpoint 2

		    jr	    CameraChkContinue


LaserCameraShot5:
		    ld	    (ix+ACTOR.KO_POINTER_H), c	    ; C	value does not seems to	be used. It just check if it is	0 or not

StopLaserCamera:
		    ld	    de,	0
		    jp	    SetActorSpeedX


;
; Check	the location of	the player
; If it	is the same, the camera	stops. Otherwise, it continues moving toward its destination
;

CameraChkContinue:
		    ld	    a, (PlayerX)
		    ld	    c, (ix+ACTOR.X)
		    cp	    c				    ; Same X?
		    jr	    z, StopLaserCamera		    ; Yes, stop	the camera

		    ld	    a, (ix+ACTOR.DestinationX)
		    cp	    c
		    ld	    de,	-100h			    ; Speed to the left
		    jr	    c, LaserCameraShot8
		    ld	    de,	100h			    ; Speed to the right

LaserCameraShot8:
		    ld	    (ix+ACTOR.KO_POINTER_H), 0

LaserCameraShot9:
		    jp	    SetActorSpeedX


; Room 115 X coordinates?

		    db 10h				    ; Left cam left limit?
		    db 58h				    ; Left cam right limit?
		    db 0C0h				    ; Right cam	left limit?
		    db 0F0h				    ; Right cam	right limit?


LaserCamDummy:
		    ret
