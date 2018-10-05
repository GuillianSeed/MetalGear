
;----------------------------------------------------------------------------
;
; Check	if the player touches a	laser shot
;
; In:
;   DE = Player	XY
;----------------------------------------------------------------------------

ChkLaserShot:
		    ld	    a, (ix+ACTOR.X)
		    sub	    d				    ; Player X
		    jr	    nc,	ChkLaserShot2

		    neg

ChkLaserShot2:
		    cp	    8				    ; Detection	radius
		    ret	    nc				    ; The player is not	in the X range

		    ld	    a, (Room)
		    cp	    111				    ; Basement building	3 room with two	laser cameras
							    ; These lasers are shorter
		    jr	    nz,	ChkLaserShot3

		    ld	    a, (ix+ACTOR.ANIM_CNT)
		    cp	    8
		    jr	    c, ChkLaserShot4

		    ld	    a, 7			    ; Force the	length to 7 (short)
		    jr	    ChkLaserShot4


ChkLaserShot3:
		    ld	    a, (ix+ACTOR.ANIM_CNT)

ChkLaserShot4:
		    cp	    0Ch
		    ret	    z

		    and	    a
		    ret	    z

		    ld	    hl,	LaserLenghts
		    dec	    a
		    cp	    0Ch
		    ld	    d, 0Ch
		    jr	    nc,	ChkLaserShot5

		    call    ADD_HL_A
		    ld	    d, (hl)

ChkLaserShot5:
		    ld	    a, d
		    add	    a, a
		    add	    a, a
		    add	    a, a
		    ld	    d, a			    ; D	= Laser	lenght / 2

		    add	    a, (ix+ACTOR.Y)		    ; A	= Centre Y point of the	laser
		    sub	    e				    ; Player Y
		    jr	    nc,	ChkLaserShot6

		    neg

ChkLaserShot6:
		    cp	    d				    ; Laser lenght / 2
		    ret	    nc

		    jp	    TouchPlayer

LaserLenghts:	    db	  1
		    db	  1
		    db	  2
		    db	  3
		    db	  4
		    db	  5
		    db	  6
		    db	  7
		    db	  8
		    db	  9
		    db	0Ah
		    db	0Bh