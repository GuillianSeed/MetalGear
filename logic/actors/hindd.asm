;---------------------------------------------------------------------------
;
; Init Hind D
;
;---------------------------------------------------------------------------


InitHindD:
		    ld	    a, (BossHindD_KO)
		    or	    a
		    jp	    nz,	DismissActor		    ; Hind D is	destroyed

		    ld	    (ix+HIND_D.ShootDelay), 5
		    ld	    (ix+HIND_D.NumberShots), 5

		    ld	    hl,	BossHindD_KO
		    ld	    (ix+HIND_D.KO_POINTER_L), l
		    ld	    (ix+HIND_D.KO_POINTER_H), h	    ; Store pointer to defeated	flag

		    ld	    (ix+HIND_D.SpriteId), 86h	    ; Propeller	sprite ID

		    call    SetBossMusic		    ; Mercenary	theme

ChkDrawHindD:
		    ld	    a, (EnemyList)		    ; Array of enemies in the room
		    cp	    ID_HIND_D
		    ret	    nz				    ; There is no Hind D

		    ld	    de,	4000h
		    ld	    hl,	HindDTileMap
		    jp	    DrawTileBlkTimp		    ; Draw Hind	D

;---------------------------------------------------------------------------
;
; Hind D logic
; Animate propeller
; Fire a burst of bullets
; Wait before firing again
;
;---------------------------------------------------------------------------


HindDLogic:
		    inc	    (ix+HIND_D.AnimationCnt)	    ; Increment	propeller sprite animation counter

		    ld	    a, (ix+HIND_D.AnimationCnt)
		    cp	    3
		    jr	    c, HindDLogic2

		    xor	    a
		    ld	    (ix+HIND_D.AnimationCnt), a	    ; Reset animation counter

HindDLogic2:
		    add	    a, 86h			    ; Sprite ID	propeller
		    ld	    (ix+HIND_D.SpriteId), a	    ; Update propeller animation

		    ld	    a, (ix+HIND_D.ANIM_CNT)
		    and	    3
		    ld	    a, 2			    ; Propeller	sfx
		    call    z, SetSoundEntry

		    bit	    0, (ix+HIND_D.Status)
		    jr	    nz,	HindDBurstWait		    ; Not firing status

		    dec	    (ix+HIND_D.ShootDelay)
		    ret	    nz				    ; Do not shoot another bullet now

		    ld	    (ix+HIND_D.ShootDelay), 5	    ; Delay before next	bullet
		    dec	    (ix+HIND_D.NumberShots)
		    jr	    z, HindDLogic3		    ; Burst finished.

		    ld	    c, ID_BULLET
		    ld	    e, (ix+HIND_D.Y)
		    ld	    d, (ix+HIND_D.X)
		    jp	    AddEnemy


HindDLogic3:
		    ld	    (ix+HIND_D.Status),	1	    ; Stop burst and wait before next one
		    ld	    (ix+HIND_D.ShootDelay), 11h
		    ret


;----------------------------------------------------------------------------
;
; Hind D burst delay
; Wait before firing another burst
;
;----------------------------------------------------------------------------

HindDBurstWait:
		    dec	    (ix+HIND_D.ShootDelay)
		    ret	    nz				    ; Do not fire yet

		    ld	    (ix+HIND_D.ShootDelay), 5
		    ld	    (ix+HIND_D.NumberShots), 5
		    ld	    (ix+HIND_D.Status),	0	    ; Firing status

DummyLogic2:
		    ret




;----------------------------------------------------------------------------
;
; Remove Hind D
;
;----------------------------------------------------------------------------


RemoveHindD:
		    ld	    de,	4000h
		    ld	    hl,	HindDTileMap2
		    call    DrawTileBlkTimp
		    jp	    DismissActor


