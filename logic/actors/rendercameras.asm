;----------------------------------------------------------------------------
;
; Render the camera as bitmap and remove its sprites
;
;----------------------------------------------------------------------------


RenderCamera:
		    ld	    (ix+ACTOR.Status), 2	    ; Do nothing status
		    ld	    (ix+ACTOR.Moving), 0	    ; Not moving
		    ld	    (ix+ACTOR.COLLISION_CFG), 0	    ; Do not check collision with the player or	his shots

		    call    HideSprColor		    ; Hide its sprites

DrawCamera:
		    ld	    a, (ix+ACTOR.BASE_SPR_ID)
		    sla	    a
		    sla	    a
		    sla	    a
		    sla	    a				    ; Direction	x 16
		    add	    a, 20h			    ; X	of first camera	frame (up, down, left right)
		    ld	    h, a
		    ld	    l, 80h			    ; Camera frames Y coordinate

		    ld	    a, (ix+ACTOR.Y)
		    sub	    8				    ; Camera height / 2
		    ld	    e, a			    ; DY

		    ld	    a, (ix+ACTOR.X)
		    sub	    8				    ; Camera width / 2
		    ld	    d, a			    ; DX

		    ld	    bc,	1010h			    ; NX, NY (16x16)
		    ld	    a, 48h			    ; From page	1 to 0 (transparency)
		    jp	    VDP_Copy_Dot

;----------------------------------------------------------------------------
;
; In alert mode	the cameras are	drawn as bitmap
;
;----------------------------------------------------------------------------

DrawCameras:
		    ld	    a, (AlertModeCopy)
		    or	    a
		    ret	    z				    ; Not in alert mode

		    ld	    hl,	EnemyList		    ; Array of enemies in the room
		    ld	    b, 10h

DrawCameras2:
		    ld	    a, ID_CAMERA
		    cp	    (hl)			    ; Is this actor a camera?
		    call    z, DrawCamera_		    ; Draw it as bitmap	and release its	sprites

		    ld	    de,	80h			    ; Actor structure size
		    add	    hl,	de			    ; Pointer to next actor

		    djnz    DrawCameras2
		    ret


DrawCamera_:
		    push    hl
		    push    bc

		    push    hl
		    pop	    ix				    ; IX = Pointer to actor structure

		    call    DrawCamera

		    pop	    bc
		    pop	    hl
		    ret

