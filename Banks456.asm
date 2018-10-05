;----------------------------------------------------------------------------
;
;
; MegaROM banks 4, 5 and 6
;
;
;----------------------------------------------------------------------------

		    org	#6000


	include	"sound/sound.asm"
	

	include	"data/weapondamage.asm"

	include	"data/shapes.asm"


	include	"data/itemtaketextid.asm"
	
	include	"data/itemtakeamount.asm"


	include	"data/palettes.asm"

	include	"data/elevatorrooms.asm"

	include	"data/roomsconnections.asm"
	
	
	include	"data/actorsinrooms.asm"

	include	"data/actorspriteattr.asm"


	include	"data/paths.asm"

	include	"data/respawninfo.asm"
	
	include	"data/maths.asm"
	

	include	"gfx/targetspr.asm"


	include	"gfx/items.asm"

	include	"gfx/alerticon.asm"

	include	"gfx/radio.asm"
	
	include	"gfx/camera.asm"
	
	
	
	include	"data/menuweapontexts.asm"

	include	"data/menuequipmenttexts.asm"

	include	"data/menuradiotexts.asm"



	include	"data/weapongfxxy.asm"
	IF (JAPANESE)
	include	"data/weaponnamesjp.asm"
	ELSE
	include	"data/weaponnames.asm"
	ENDIF



	include	"data/weaponcursorxy.asm"



	include	"data/itemgfxxy.asm"

	IF (JAPANESE)
	include	"data/itemnamesjp.asm"
	ELSE
	include	"data/itemnames.asm"
	ENDIF
	
	include	"data/itemcursorxy.asm"



	include	"data/itemsinrooms.asm"

	include	"logic/spawnitem.asm"

	include	"logic/addroomitems.asm"

	include	"logic/drawitemsinroom.asm"



	include	"logic/gamedemo.asm"

	include	"logic/checkpoints.asm"

	include	"logic/passwords.asm"


		    ; Fill empty space
		    ds      (#C000-$),#ff
		    ASSERT  $=#C000
