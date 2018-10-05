;----------------------------------------------------------------------------
;
; Index	of indexes of items in the rooms
;
;----------------------------------------------------------------------------
idxRoomItemsIdx:    db	12h,   0,   0,	 0,   1,   2,	3,   0,	28h,   0,   4,	 0,   0,   7,	0,   6
		    db	  5,   9,   8,	 0, 0Bh, 0Ah,	0,   0,	  0, 0Dh,   0, 0Ch,   0, 0Eh,	0, 29h
		    db	  0,   0, 11h, 10h, 23h,   0, 13h,   0,	2Ah, 2Eh,   0,	 0,   0,   0, 14h, 19h
		    db	17h, 16h, 2Bh,	 0, 18h, 15h, 1Ch, 1Bh,	1Ah, 0Fh,   0, 1Dh,   0, 1Eh, 1Fh, 20h
		    db	  0, 21h, 24h,	 0,   0, 25h, 26h,   0,	  0,   0, 2Fh, 23h,   0,   0, 27h,   0
		    db	  0,   0,   0,	 0,   0,   0,	0,   0,	  0,   0,   0,	 0, 2Ah,   0, 2Fh,   0
		    db	2Dh

;----------------------------------------------------------------------------
;
; Index	of Items sets
;
;----------------------------------------------------------------------------
idxRoomItems:	    dw ItemRation
		    dw ItemCard1
		    dw ItemBinoculars
		    dw ItemMines
		    dw ItemGasMask
		    dw ItemSMG
		    dw ItemCard4
		    dw ItemMines2
		    dw ItemGoggles
		    dw ItemParachute			    ; 10
		    dw ItemPBombAmmo
		    dw ItemAmmo
		    dw ItemMissile
		    dw ItemGrenade
		    dw ItemPBomb
		    dw ItemCard2
		    dw ItemBox
		    dw ItemCard3
		    dw ItemMineDetect
		    dw ItemBag				    ; 20
		    dw ItemRation2
		    dw ItemArmor
		    dw ItemBombSuit
		    dw ItemPBomb2
		    dw ItemUniform
		    dw ItemAntenna
		    dw ItemUniMineAmm
		    dw ItemFlashLight
		    dw ItemAmmox3
		    dw ItemAntidote			    ; 30
		    dw ItemCompass
		    dw ItemRocket
		    dw ItemCard5Ammo
		    dw ItemRation3
		    dw ItemRation4
		    dw ItemCard6
		    dw ItemBombAmmRat
		    dw ItemAmmox2
		    dw ItemOxygen
		    dw ItemGun
		    dw ItemPBomb3
		    dw ItemAmmo2
		    dw ItemPBombAmmo2
		    dw ItemAmmo3
		    dw ItemRation5
		    dw ItemMissile2
		    dw ItemAmmox2_
		    
		    
;----------------------------------------------------------------------------
; Items
;
; Item ID, Y, X
; FF = End
;
;----------------------------------------------------------------------------
ItemRation:         db RATION
                    dw 5050h
                    db 0FFh

ItemCard1:          db CARD1
                    dw 7050h
                    db 0FFh

ItemBinoculars:     db BINOCULARS
                    dw 7040h
                    db 0FFh

ItemMines:          db LAND_MINE
                    dw 6040h
                    db 0FFh

ItemGasMask:        db GAS_MASK
                    dw 4820h
                    db 0FFh

ItemSMG:            db SUB_MACHINE_GUN
                    dw 4020h
                    db 0FFh

ItemCard4:          db CARD4
                    dw 8060h
                    db 0FFh

ItemMines2:         db LAND_MINE
                    dw 4820h
                    db 0FFh

ItemGoggles:        db GOGGLES
                    dw 4820h
                    db 0FFh

ItemParachute:      db PARACHUTE
                    dw 4820h
                    db 0FFh

ItemPBombAmmo:      db PLASTIC_BOMB
                    dw 5080h
                    db AMMO_CRATE
                    dw 0B080h
                    db 0FFh

ItemAmmo:           db AMMO_CRATE
                    dw 0A020h
                    db 0FFh

ItemMissile:        db MISSILE
                    dw 4820h
                    db 0FFh

ItemGrenade:        db GRENADE_LAUNCHER
                    dw 8020h
                    db 0FFh

ItemPBomb:          db PLASTIC_BOMB
                    dw 8820h
                    db 0FFh

ItemCard2:          db CARD2
                    dw 4820h
                    db 0FFh

ItemBox:            db CARDBOARD_BOX
                    dw 4860h
                    db 0FFh

ItemCard3:          db CARD3
                    dw 4270h
                    db AMMO_CRATE
                    dw 0A040h
                    db 0FFh

ItemMineDetect:     db MINE_DETECTOR
                    dw 4820h
                    db 0FFh

ItemBag:            db BAG
                    dw 8820h
                    db 0FFh

ItemRation2:        db RATION
                    dw 6040h
                    db 0FFh

ItemArmor:          db ARMOR
                    dw 8820h
                    db 0FFh

ItemBombSuit:       db BOMB_SUIT
                    dw 4820h
                    db 0FFh

ItemPBomb2:         db PLASTIC_BOMB
                    db 60h
                    db 60h
                    db 0FFh

ItemUniform:        db UNIFORM
                    db  20h, 48h
                    db 0FFh

ItemAntenna:        db ANTENNA
                    db 20h
                    db 48h
                    db 0FFh

ItemUniMineAmm:     db LAND_MINE
                    dw 8070h
                    db AMMO_CRATE
                    dw 4040h
                    db UNIFORM
                    dw 4820h
                    db 0FFh

ItemFlashLight:     db FLASH_LIGHT
                    dw 4820h
                    db 0FFh

ItemAmmox3:         db AMMO_CRATE
                    dw 7030h
                    db AMMO_CRATE
                    dw 3840h
                    db AMMO_CRATE
                    dw 0B880h
                    db 0FFh

ItemAntidote:       db ANTIDOTE
                    dw 4820h
                    db 0FFh

ItemCompass:        db COMPASS
                    dw 4820h
                    db 0FFh

ItemRocket:         db ROCKET_LAUNCHER
                    dw 4020h
                    db 0FFh

ItemCard5Ammo:      db CARD5
                    dw 4820h
                    db AMMO_CRATE
                    dw 0A880h
                    db 0FFh

ItemRation3:        db RATION
                    dw 4820h
                    db 0FFh

ItemRation4:        db RATION
                    dw 4820h
                    db 0FFh

ItemCard6:          db CARD6
                    dw 4820h
                    db 0FFh

ItemBombAmmRat:     db PLASTIC_BOMB
                    dw 2848h
                    db AMMO_CRATE
                    dw 0C048h
                    db RATION
                    dw 0C060h
                    db 0FFh

ItemAmmox2:         db AMMO_CRATE
                    dw 6818h
                    db AMMO_CRATE
                    dw 4050h
                    db 0FFh

ItemOxygen:         db OXYGEN
                    dw 8820h
                    db 0FFh

ItemGun:            db HAND_GUN
                    dw 4060h
                    db 0FFh

ItemPBomb3:         db PLASTIC_BOMB
                    dw 3038h
                    db 0FFh

ItemAmmo2:          db AMMO_CRATE
                    dw 6830h
                    db 0FFh

ItemPBombAmmo2:     db AMMO_CRATE
                    dw 402Ah
                    db PLASTIC_BOMB
                    dw 0A870h
                    db 0FFh

ItemAmmo3:          db AMMO_CRATE
                    dw 1850h
                    db 0FFh

ItemRation5:        db RATION
                    dw 4840h
                    db 0FFh

ItemMissile2:       db MISSILE
                    dw 4820h
                    db 0FFh

ItemAmmox2_:        db AMMO_CRATE
                    dw 6050h
                    db AMMO_CRATE
                    dw 0A870h
                    db 0FFh
