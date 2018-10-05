;----------------------------------------------------------------------------
;
;
; MegaROM banks A, B and C
;
;
;----------------------------------------------------------------------------

		    org	#6000


	include	"data/playersprite.asm"

	include	"data/spritesets.asm"

	include	"data/weaponspratt.asm"
		    
	include	"gfx/sprites.asm"

	include	"data/laserconfig.asm"

	include	"data/musicradioconfig.asm"

	IF (JAPANESE)
	include	"data/textsjp.asm"
	ELSE
	include	"data/texts.asm"
	ENDIF

;----------------------------------------------------------------------------
;
; Initialize Metal Gear	logic
;
;----------------------------------------------------------------------------

InitMetalGear_:
		    ld	    a, (MetalGear_KO)		    ; Metal Gear destroyed. Self destruction activated
		    or	    a
		    jp	    nz,	DismissActor2_

		    ld	    hl,	MetalGear_KO		    ; Metal Gear destroyed. Self destruction activated
		    ld	    (ix+ACTOR.BASE_SPR_ID), l
		    ld	    (ix+ACTOR.KO_POINTER_H), h
		    ld	    (ix+ACTOR.COLLISION_CFG), 3	    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed

ChkDrawMetalGear:
		    ld	    a, (EnemyList)		    ; Array of enemies in the room
		    cp	    ID_METAL_GEAR
		    ret	    nz				    ; There is no Metal	Gear

		    ld	    (ix+ACTOR.Status), 0
		    ld	    de,	6020h
		    jp	    DrawMetalGear_


RemoveMetalGear:
		    ld	    de,	6020h
		    jp	    EraseMetalGear_



		    ; Fill empty space
		    ds      (#C000-$),#ff
		    ASSERT  $=#C000

