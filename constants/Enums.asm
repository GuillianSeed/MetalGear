; ---------------------------------------------------------------------------

; enum Weapon
HAND_GUN:	     equ 1
SUB_MACHINE_GUN:     equ 2
GRENADE_LAUNCHER:    equ 3
ROCKET_LAUNCHER:     equ 4
PLASTIC_BOMB:	     equ 5
LAND_MINE:	     equ 6
MISSILE:	     equ 7

; ---------------------------------------------------------------------------

; enum FREQUENCIES
FREQ_BIGBOSS_BUILDING2:	equ 13h
FREQ_SCHNEIDER_BUILDING2: equ 26h
FREQ_DIANE:	     equ 33h
FREQ_JENIFFER:	     equ 48h
FREQ_NEWS:	     equ 77h
FREQ_SCHNEIDER:	     equ 79h
FREQ_BIGBOSS:	     equ 85h
FREQ_DIANE_BUILDING2: equ 91h

; ---------------------------------------------------------------------------

; enum RADIO
RADIO_END:	     equ 1
RADIO_WAITCALL:	     equ 4
RADIO_AUTOREPLY:     equ 8
RADIO_BIGBOSS:	     equ 10h
RADIO_SCHNEIDER:     equ 20h
RADIO_DIANE:	     equ 30h
RADIO_SCHNEIDER2:    equ 40h
RADIO_DIANE2:	     equ 50h
RADIO_JENIFFER:	     equ 60h
RADIO_BIGBOSS2:	     equ 70h

; ---------------------------------------------------------------------------

; enum BOMB_ORDER
B_LEFT:		     equ 1
B_RIGHT:	     equ 2

; ---------------------------------------------------------------------------

; enum GAME_MODE
GAME_MODE_PLAYING:   equ 0
GAME_MODE_NEXT_ROOM: equ 1
GAME_MODE_WEAPONS:   equ 2
GAME_MODE_EQUIPMENT: equ 3
GAME_MODE_RADIO:     equ 4
GAME_MODE_LORRY:     equ 5
GAME_MODE_ELEVATOR:  equ 6
GAME_MODE_OPEN_DOOR: equ 7
GAME_MODE_BINOCULARS: equ 8
GAME_MODE_DEAD:	     equ 9
GAME_MODE_TEXT_BOX:  equ 0Ah
GAME_MODE_CAPTURED:  equ 0Bh

; ---------------------------------------------------------------------------

; enum Directions
DIR_UP:		     equ 1
DIR_DOWN:	     equ 2
DIR_LEFT:	     equ 3
DIR_RIGHT:	     equ 4

; ---------------------------------------------------------------------------

; enum CONTROL_MODE
CONTROL_NORMAL:	     equ 0
CONTROL_PUNCH:	     equ 1
CONTROL_ELEVATOR:    equ 2
CONTROL_DEAD:	     equ 3
CONTROL_PARACHUTE:   equ 4
CONTROL_AIR_FLOW:    equ 5
CONTROL_LADDER_WALK: equ 6
CONTROL_LADDER_CLIMB: equ 7
CONTROL_INTRO:	     equ 8

; ---------------------------------------------------------------------------

; enum SELECTED_ITEM
SELECTED_ARMOR:	     equ 1
SELECTED_BOMB_SUIT:  equ 2
SELECTED_FLASHLIGHT: equ 3
SELECTED_GOGGLES:    equ 4
SELECTED_GAS_MASK:   equ 5
SELECTED_CIGARETTES: equ 6
SELECTED_MINE_DETECTOR:	equ 7
SELECTED_ANTENNA:    equ 8
SELECTED_BINOCULARS: equ 9
SELECTED_OXYGEN:     equ 0Ah
SELECTED_COMPASS:    equ 0Bh
SELECTED_PARACHUTE:  equ 0Ch
SELECTED_ANTIDOTE:   equ 0Dh
SELECTED_CARD1:	     equ 0Eh
SELECTED_CARD2:	     equ 0Fh
SELECTED_CARD3:	     equ 10h
SELECTED_CARD4:	     equ 11h
SELECTED_CARD5:	     equ 12h
SELECTED_CARD6:	     equ 13h
SELECTED_CARD7:	     equ 14h
SELECTED_CARD8:	     equ 15h
SELECTED_RATION:     equ 16h
SELECTED_TRANSMITTER: equ 17h
SELECTED_UNIFORM:    equ 18h
SELECTED_BOX:	     equ 19h

; ---------------------------------------------------------------------------

; enum DOORS
DOOR_ELEVATOR:	     equ 1
DOOR_CARD1:	     equ 2
DOOR_CARD2:	     equ 3
DOOR_CARD3:	     equ 4
DOOR_CARD4:	     equ 5
DOOR_CARD5:	     equ 6
DOOR_CARD6:	     equ 7
DOOR_CARD7:	     equ 8
DOOR_CARD8:	     equ 9
DOOR_PUNCH:	     equ 0Ah

; ---------------------------------------------------------------------------

; enum ITEMS
NONE:		     equ 0
SUPRESSOR:	     equ 8
ARMOR:		     equ 9
BOMB_SUIT:	     equ 0Ah
FLASH_LIGHT:	     equ 0Bh
GOGGLES:	     equ 0Ch
GAS_MASK:	     equ 0Dh
CIGARS:		     equ 0Eh
MINE_DETECTOR:	     equ 0Fh
ANTENNA:	     equ 10h
BINOCULARS:	     equ 11h
OXYGEN:		     equ 12h
COMPASS:	     equ 13h
PARACHUTE:	     equ 14h
ANTIDOTE:	     equ 15h
CARD1:		     equ 16h
CARD2:		     equ 17h
CARD3:		     equ 18h
CARD4:		     equ 19h
CARD5:		     equ 1Ah
CARD6:		     equ 1Bh
CARD7:		     equ 1Ch
CARD8:		     equ 1Dh
RATION:		     equ 1Eh
TRANSMITTER:	     equ 1Fh
UNIFORM:	     equ 20h
CARDBOARD_BOX:	     equ 21h
BAG:		     equ 22h
AMMO_CRATE:	     equ 23h

; ---------------------------------------------------------------------------

; enum SPAWN
SPAWN_RATIO:	     equ 0
SPAWN_AMMO:	     equ 1
SPAWN_CARD7:	     equ 2
SPAWN_CARD8:	     equ 3
SPAWN_SUPRESSOR:     equ 4

; ---------------------------------------------------------------------------

; enum ACTORS
ID_NONE:	     equ 0
ID_BRIDGE_CTRL:	     equ 1
ID_BRIDGE:	     equ 2
ID_HELPME_VOICE:     equ 3
ID_GUARD_SLOW:	     equ 4
ID_GUARD_MEDIUM:     equ 5
ID_CAMERA:	     equ 6
ID_LAND_MINE:	     equ 7
ID_GAS:		     equ 8
ID_TANK:	     equ 9
ID_GUARD_ALERT:	     equ 0Ah
ID_GUARD_REDALERT:   equ 0Bh
ID_TANK_SHELL_AIR:   equ 0Ch				    ; Tank shell falling from the sky
ID_SHOOTER:	     equ 0Dh
ID_GUARD_ELEVATOR:   equ 0Eh
ID_ROLLING_BARREL:   equ 0Fh
ID_PITFALL:	     equ 10h
ID_METAL_GEAR:	     equ 11h
ID_BULLDOZER:	     equ 12h
ID_GUARD_EXIT_LORRY: equ 13h
ID_JETPACK_TAKEOFF:  equ 14h
ID_JETPACK_SWITCH:   equ 15h
ID_JETPACK:	     equ 16h
ID_TANK_SHELL_BOSS:  equ 17h				    ; Tank shell boss
ID_GUARD_SWITCH:     equ 18h
ID_DOG:		     equ 19h
ID_ARNOLD:	     equ 1Ah
ID_DOG_BASEMENT:     equ 1Bh
ID_LORRY_SHOOTER:    equ 1Ch				    ; Used in the lorries in the desert	before building	3
ID_SPAWN_DOG:	     equ 1Dh
ID_GUARD_FAST:	     equ 1Eh
ID_SCORPION:	     equ 1Fh
ID_BIG_BOSS:	     equ 20h
ID_SHOT_GUNNER:	     equ 21h
ID_MACH_GUN_KID:     equ 22h
ID_LASER:	     equ 23h
ID_FIRE_TROOPER:     equ 24h
ID_FLAME:	     equ 25h
ID_HIND_D:	     equ 26h
ID_SPAWN_TANK_SHELL: equ 27h
ID_SPAWN_GUARD_ELEV: equ 28h
ID_COWARD_DUCK:	     equ 29h
ACTORS_2A:	     equ 2Ah
ID_SGUNNER_SHOT:     equ 2Bh
ID_POWER_SWITCH:     equ 2Ch
ID_CAPTURE_GUARD:    equ 2Dh
ID_DESERT_SECURITY:  equ 2Eh
ID_GUARD_BULLET:     equ 2Fh
ID_SENTINEL:	     equ 30h
ID_PRISONER1:	     equ 31h
ID_ELLEN:	     equ 32h
ID_GREY_FOX:	     equ 33h
ID_MADNAR:	     equ 34h
ID_CAMERA_LASER:     equ 35h
ID_LASER_SHOT:	     equ 36h
ID_FAKE_MADNAR:	     equ 37h
ID_PRISONER6:	     equ 38h				    ; (!?) Not used?
ID_GUARD_SILENCER:   equ 39h
ID_BULLET_HORIZ:     equ 3Ah
ID_BULLET_VERT:	     equ 3Bh				    ; Bullet from guard	shooter
ID_SHOT_M_GUN_KID:   equ 3Ch
ID_BULLET:	     equ 3Dh
ID_TANK_BULLET:	     equ 3Eh
ID_BOOMERANG:	     equ 3Fh
ID_SLEEPING_SIGN:    equ 40h
ID_BIG_EXPLOSION:    equ 41h
