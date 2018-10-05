;----------------------------------------------------------------------------
;
;
; MegaROM banks 7, 8 and 9
;
;
;----------------------------------------------------------------------------

		    org	#6000
		    
	include	"data/roomtileset.asm"

	include	"gfx/doors.asm"
	
	include	"gfx/building.asm"

	include	"gfx/basementdesert.asm"

	include	"gfx/roof.asm"
	
	include	"gfx/elevator.asm"
	
	include	"gfx/lorry.asm"
	
	include	"gfx/crate.asm"

	include	"gfx/building2.asm"

	include	"gfx/basementdesert2.asm"

	include	"gfx/hindd.asm"
	
	include	"gfx/metalgear.asm"

	include	"gfx/pitfall.asm"
	
	include	"gfx/ending.asm"
	
	include	"gfx/snakeportrait.asm"
	

	include	"logic/elevatorroom.asm"

	include	"logic/introscene.asm"


	; Konami logo and main menu
	
	include	"logic/loadfont.asm"

	include	"gfx/font.asm"

	include	"logic/mainmenu.asm"

	include	"logic/konamilogo.asm"
	
	include	"gfx/konamilogo.asm"
	
	include	"gfx/metalgearlogo.asm"
	

	include	"logic/lorry.asm"

	include	"logic/madnarbigbossevent.asm"

		    ; Fill empty space
		    ds      (#C000-$),#ff
		    ASSERT  $=#C000
