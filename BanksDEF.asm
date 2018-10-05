;----------------------------------------------------------------------------
;
;
; MegaROM banks D, E and F
;
;
;----------------------------------------------------------------------------

		    org	#6000

	include	"data/rooms.asm"

	include	"data/metatiles.asm"

	include	"data/doors.asm"

	include	"gfx/powerswitch.asm"

	include	"data/tileblocks.asm"

	IF (JAPANESE)
	include	"data/radiocallsjp.asm"
	ELSE
	include	"data/radiocalls.asm"
	ENDIF
	
	include	"logic/updatesprites.asm"
	
	include "logic/saveload.asm"

	include	"logic/ending.asm"

	include	"logic/drawlaserbeams.asm"

		    ; Fill empty space
		    ds      (#C000-$),#ff
		    ASSERT  $=#C000
