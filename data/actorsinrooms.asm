;---------------------------------------------------------------------------
;
; Room enemies / actors
;
;---------------------------------------------------------------------------
ActorsRoom001:	    db 3
		    db ID_GUARD_MEDIUM
		    dw 40B0h
		    db ID_GUARD_SLOW
		    dw 5050h
		    db ID_GUARD_MEDIUM
		    dw 0C018h

ActorsRoom002:	    db 2
		    db ID_GUARD_SLOW
		    dw 4030h
		    db ID_GUARD_MEDIUM
		    dw 0A870h

ActorsRoom003:	    db 3
		    db ID_SPAWN_GUARD_ELEV
		    dw 8080h
		    db ID_GUARD_ELEVATOR
		    dw 5030h
		    db ID_GUARD_ELEVATOR
		    dw 9030h

ActorsRoom004:	    db 2
		    db ID_GUARD_MEDIUM
		    dw 8888h
		    db ID_GUARD_FAST
		    dw 9888h

ActorsRoom005:	    db 1
		    db ID_GUARD_EXIT_LORRY
		    dw 7078h

ActorsRoom006:	    db 2
		    db ID_DOG
		    dw 0A040h
		    db ID_DOG
		    dw 7030h

ActorsRoom007:	    db 2
		    db ID_GUARD_EXIT_LORRY
		    dw 5078h
		    db ID_GUARD_EXIT_LORRY
		    dw 7078h

ActorsRoom009:	    db 0Ch
		    db ID_LAND_MINE
		    dw 6848h
		    db ID_LAND_MINE
		    dw 8848h
		    db ID_LAND_MINE
		    dw 0E848h
		    db ID_LAND_MINE
		    dw 8868h
		    db ID_LAND_MINE
		    dw 0D868h
		    db ID_LAND_MINE
		    dw 6878h
		    db ID_LAND_MINE
		    dw 9888h
		    db ID_LAND_MINE
		    dw 0C888h
		    db ID_LAND_MINE
		    dw 7898h
		    db ID_LAND_MINE
		    dw 98A8h
		    db ID_LAND_MINE
		    dw 0B8A8h
		    db ID_LAND_MINE
		    dw 0C8B8h

ActorsRoom010:	    db 3
		    db ID_DOG
		    dw 0B090h
		    db ID_DOG
		    dw 5080h
		    db ID_DOG
		    dw 6090h

ActorsRoom011:	    db 4
		    db ID_SENTINEL
		    dw 5050h
		    db ID_SENTINEL
		    dw 0A050h
		    db ID_SENTINEL
		    dw 5880h
		    db ID_SENTINEL
		    dw 0A080h

ActorsRoom012:	    db 2
		    db ID_GUARD_SLOW
		    dw 8860h
		    db ID_GUARD_SLOW
		    dw 0E878h

ActorsRoom013:	    db 2
		    db ID_GUARD_SLOW
		    dw 5870h
		    db ID_GUARD_SLOW
		    dw 8860h

ActorsRoom014:	    db 3
		    db ID_CAMERA
		    dw 4098h
		    db ID_CAMERA
		    dw 0C050h
		    db ID_CAMERA
		    dw 0A0B8h

ActorsRoom015:	    db 2
		    db ID_GUARD_SLOW
		    dw 10A8h
		    db ID_GUARD_SLOW
		    dw 0E830h

ActorsRoom016:	    db 1
		    db ID_GUARD_SWITCH
		    dw 6086h

ActorsRoom017:	    db 4
		    db ID_GUARD_SLOW
		    dw 5830h
		    db ID_GUARD_SLOW
		    dw 0C030h
		    db ID_GUARD_SLOW
		    dw 0A090h
		    db ID_GUARD_SLOW
		    dw 60B0h

ActorsRoom018:	    db 5
		    db ID_GUARD_SLOW
		    dw 6070h
		    db ID_GUARD_SLOW
		    dw 2013h
		    db ID_GUARD_SLOW
		    dw 0E013h
		    db ID_GUARD_SLOW
		    dw 1888h
		    db ID_GUARD_SLOW
		    dw 0C890h

ActorsRoom019:	    db 2
		    db ID_GUARD_FAST
		    dw 0C878h
		    db ID_GUARD_FAST
		    dw 38A8h

ActorsRoom020:	    db 1
		    db ID_MACH_GUN_KID
		    dw 0E034h

ActorsRoom021:	    db 1
		    db ID_CAMERA
		    dw 8058h

ActorsRoom022:	    db 2
		    db ID_GUARD_FAST
		    dw 20A8h
		    db ID_GUARD_FAST
		    dw 0F0A8h

ActorsRoom023:	    db 3
		    db ID_GUARD_SLOW
		    dw 8028h
		    db ID_GUARD_SLOW
		    dw 6850h
		    db ID_GUARD_SLOW
		    dw 6890h

ActorLaserRooms:    db 1
		    db ID_LASER
		    dw 0

ActorsRoom026:	    db 1
		    db ID_GUARD_SLOW
		    dw 8070h

ActorsRoom027:	    db 2
		    db ID_CAMERA
		    dw 5840h
		    db ID_CAMERA
		    dw 6068h

ActorsRoom028:	    db 2
		    db ID_CAMERA
		    dw 2068h
		    db ID_GUARD_SLOW
		    dw 0A868h

ActorsRoom029:	    db 4
		    db ID_GAS
		    dw 8070h
		    db ID_GAS
		    dw 2850h
		    db ID_GAS
		    dw 0C030h
		    db ID_GAS
		    dw 0A0B0h

ActorsRoom030:	    db 2
		    db ID_GUARD_FAST
		    dw 0C890h
		    db ID_GUARD_FAST
		    dw 38B0h

ActorsRoom031:	    db 2
		    db ID_CAMERA
		    dw 4070h
		    db ID_CAMERA
		    dw 0C040h

ActorsRoom032:	    db 1
		    db ID_GUARD_SLOW
		    dw 0B858h

ActorsRoom033:	    db 2
		    db ID_GUARD_MEDIUM
		    dw 7830h
		    db ID_GUARD_MEDIUM
		    dw 8830h

ActorsRoom034:	    db 2
		    db ID_GUARD_FAST
		    dw 7828h
		    db ID_GUARD_MEDIUM
		    dw 0C828h

ActorsRoom035:	    db 3
		    db ID_GUARD_SLOW
		    dw 6828h
		    db ID_GUARD_FAST
		    dw 1860h
		    db ID_GUARD_SLOW
		    dw 88B0h

ActorsRoom036:	    db 3
		    db ID_CAMERA
		    dw 6038h
		    db ID_CAMERA
		    dw 0F078h
		    db ID_GUARD_SLOW
		    dw 8870h

ActorsRoom037:	    db 1
		    db ID_POWER_SWITCH
		    db	10h, 64h

ActorsRoom038:	    db 2
		    db ID_GUARD_SLOW
		    dw 3850h
		    db ID_GUARD_FAST
		    dw 4088h

ActorsRoom039:	    db 4
		    db ID_SENTINEL
		    dw 4048h
		    db ID_SENTINEL
		    dw 0C048h
		    db ID_SENTINEL
		    dw 50B0h
		    db ID_SENTINEL
		    dw 0B8B0h

ActorsRoom040:	    db 1
		    db ID_JETPACK_SWITCH
		    dw 4460h

ActorsRoom043:	    db 2
		    db ID_GUARD_MEDIUM
		    dw 1890h
		    db ID_GUARD_SLOW
		    dw 0E828h

ActorsRoom044:	    db 1
		    db ID_JETPACK_TAKEOFF
		    dw 8880h

ActorsRoom045:	    db 9
		    db ID_BRIDGE_CTRL
		    dw 7030h
		    db ID_BRIDGE
		    dw 7327h
		    db ID_BRIDGE
		    dw 7B37h
		    db ID_BRIDGE
		    dw 7E47h
		    db ID_BRIDGE
		    dw 8257h
		    db ID_BRIDGE
		    dw 8567h
		    db ID_BRIDGE
		    dw 8977h
		    db ID_BRIDGE
		    dw 8C87h
		    db ID_BRIDGE
		    dw 9097h

ActorsRoom046:	    db 9
		    db ID_BRIDGE_CTRL
		    dw 9030h
		    db ID_BRIDGE
		    dw 8C27h
		    db ID_BRIDGE
		    dw 8937h
		    db ID_BRIDGE
		    dw 8547h
		    db ID_BRIDGE
		    dw 8257h
		    db ID_BRIDGE
		    dw 7E67h
		    db ID_BRIDGE
		    dw 7B77h
		    db ID_BRIDGE
		    dw 7387h
		    db ID_BRIDGE
		    dw 7097h

ActorsRoom047:	    db 2
		    db ID_GUARD_MEDIUM
		    dw 3878h
		    db ID_GUARD_MEDIUM
		    dw 88A8h

ActorsRoom048:	    db 1
		    db ID_JETPACK_TAKEOFF
		    dw 9286h

ActorsRoom049:	    db 3
		    db ID_GUARD_MEDIUM
		    dw 4028h
		    db ID_GUARD_MEDIUM
		    dw 8050h
		    db ID_GUARD_MEDIUM
		    dw 0C028h

ActorsRoom050:	    db 1
		    db ID_HIND_D
		    dw 8058h

ActorsRoom051:	    db 1
		    db ID_GUARD_SLOW
		    dw 8030h

ActorsRoom052:	    db 2
		    db ID_GUARD_FAST
		    dw 0E030h
		    db ID_GUARD_FAST
		    dw 1890h

ActorsRoom055:	    db 2
		    db ID_DOG
		    dw 4858h
		    db ID_DOG
		    dw 187Eh

ActorsRoom056:	    db 4
		    db ID_DOG
		    dw 5268h
		    db ID_DOG
		    dw 9062h
		    db ID_DOG
		    dw 7036h
		    db ID_DOG
		    dw 0DA64h

ActorsRoom057:	    db 1
		    db ID_SHOT_GUNNER
		    dw 9038h

ActorsRoom058:	    db 2
		    db ID_DOG_BASEMENT
		    dw 2090h
		    db ID_SPAWN_DOG
		    dw 8060h

ActorsRoom060:	    db 2
		    db ID_DOG_BASEMENT
		    dw 2040h
		    db ID_SPAWN_DOG
		    dw 8060h

ActorsRoom61_63:    db 2
		    db ID_DOG_BASEMENT
		    dw 0E060h
		    db ID_SPAWN_DOG
		    dw 8060h

ActorsRoom59_62:    db 1
		    db ID_SPAWN_DOG
		    dw 8060h

ActorsRoom064:	    db 9
		    db ID_LAND_MINE
		    dw 1838h
		    db ID_LAND_MINE
		    dw 6848h
		    db ID_LAND_MINE
		    dw 9848h
		    db ID_LAND_MINE
		    dw 0D858h
		    db ID_LAND_MINE
		    dw 7868h
		    db ID_LAND_MINE
		    dw 0A868h
		    db ID_LAND_MINE
		    dw 8878h
		    db ID_LAND_MINE
		    dw 0B888h
		    db ID_LAND_MINE
		    dw 4898h

ActorsRoom65_66:    db 1
		    db ID_SPAWN_TANK_SHELL
		    dw 8010h

ActorsRoom067:	    db 1
		    db ID_TANK
		    dw 9010h

ActorsRoom069:	    db 4
		    db ID_SENTINEL
		    dw 6048h
		    db ID_SENTINEL
		    dw 7070h
		    db ID_SENTINEL
		    dw 9870h
		    db ID_DESERT_SECURITY
		    dw 8078h

ActorsRoom070:	    db 2
		    db ID_GUARD_SLOW
		    dw 5045h
		    db ID_GUARD_SLOW
		    dw 0A02Bh

ActorsRoom071:	    db 1
		    db ID_BULLDOZER
		    db	20h, 70h

ActorsRoom074:	    db 3
		    db ID_GUARD_SLOW
		    dw 0C028h
		    db ID_GUARD_SLOW
		    dw 3060h
		    db ID_GUARD_SLOW
		    dw 90ABh

ActorsRoom076:	    db 1
		    db ID_PITFALL
		    dw 0A080h

ActorsRoom077:	    db 3
		    db ID_SENTINEL
		    dw 2828h
		    db ID_GUARD_SLOW
		    dw 0D888h
		    db ID_GUARD_SLOW
		    dw 0C0ABh

ActorsRoom079:	    db 4
		    db ID_GUARD_FAST
		    dw 4030h
		    db ID_GUARD_FAST
		    dw 20ABh
		    db ID_GUARD_FAST
		    dw 9048h
		    db ID_GUARD_SLOW
		    dw 0E070h

ActorsRoom080:	    db 3
		    db ID_SENTINEL
		    dw 3070h
		    db ID_SENTINEL
		    dw 8830h
		    db ID_SENTINEL
		    dw 9858h

ActorsRoom081:	    db 4
		    db ID_GUARD_SLOW
		    dw 1C80h
		    db ID_GUARD_SLOW
		    dw 2030h
		    db ID_GUARD_SLOW
		    dw 0E02Bh
		    db ID_GUARD_SLOW
		    dw 0E0B0h

ActorsRoom082:	    db 4
		    db ID_SENTINEL
		    dw 3060h
		    db ID_SENTINEL
		    dw 0D050h
		    db ID_SENTINEL
		    dw 80B0h
		    db ID_SENTINEL
		    dw 0E0B0h

ActorsRoom083:	    db 2
		    db ID_ARNOLD
		    dw 802Ch
		    db ID_ARNOLD
		    dw 80B2h

ActorsRoom084:	    db 4
		    db ID_GUARD_FAST
		    dw 402Ah
		    db ID_GUARD_FAST
		    dw 3070h
		    db ID_GUARD_MEDIUM
		    dw 0E030h
		    db ID_GUARD_MEDIUM
		    dw 0A070h

ActorsRoom085:	    db 1
		    db ID_GUARD_SLOW
		    dw 6070h

ActorsRoom086:	    db 3
		    db ID_SENTINEL
		    dw 0D068h
		    db ID_GUARD_SLOW
		    dw 3040h
		    db ID_GUARD_SLOW
		    dw 58ABh

ActorsRoom087:	    db	  3
		    db ID_SENTINEL
		    dw 686Ah
		    db ID_SENTINEL
		    dw 0D038h
		    db ID_SENTINEL
		    dw 0D0A0h

ActorsRoom088:	    db 3
		    db ID_SHOOTER
		    dw 6030h
		    db ID_SHOOTER
		    dw 9830h
		    db ID_SHOOTER
		    dw 0C030h

ActorsRoom089:	    db 1
		    db ID_JETPACK_TAKEOFF
		    dw 7CA0h

ActorsRoom090:	    db 3
		    db ID_SHOOTER
		    dw 4030h
		    db ID_SHOOTER
		    dw 8030h
		    db ID_SHOOTER
		    dw 0C030h

ActorsRoom091:	    db 4
		    db ID_SHOOTER
		    dw 4830h
		    db ID_SHOOTER
		    dw 487Ah
		    db ID_SHOOTER
		    dw 7830h
		    db ID_SHOOTER
		    dw 0C030h

ActorsRoom092:	    db 1
		    db ID_JETPACK_TAKEOFF
		    dw 0B050h

ActorsRoom093:	    db 1
		    db ID_PITFALL
		    dw 0C850h

ActorsRoom094:	    db 4
		    db ID_GAS
		    dw 6030h
		    db ID_GAS
		    dw 0C030h
		    db ID_GAS
		    dw 3080h
		    db ID_GAS
		    dw 80B0h

ActorsRoom095:	    db 9
		    db ID_FIRE_TROOPER
		    dw 7020h
		    db ID_FLAME
		    dw 7020h
		    db ID_FLAME
		    dw 7020h
		    db ID_FLAME
		    dw 7020h
		    db ID_FLAME
		    dw 7020h
		    db ID_FLAME
		    dw 7020h
		    db ID_FLAME
		    dw 7020h
		    db ID_FLAME
		    dw 7020h
		    db ID_FLAME
		    dw 7020h

ActorsRoom096:	    db 4
		    db ID_GAS
		    dw 3040h
		    db ID_GAS
		    dw 0C020h
		    db ID_GAS
		    dw 50B0h
		    db ID_GAS
		    dw 0D080h

ActorsRoom097:	    db 4
		    db ID_GAS
		    dw 4030h
		    db ID_GAS
		    dw 2070h
		    db ID_GAS
		    dw 0E840h
		    db ID_GAS
		    dw 0B098h

ActorsRoom098:	    db 4
		    db ID_GAS
		    dw 6028h
		    db ID_GAS
		    dw 0C028h
		    db ID_GAS
		    dw 40A8h
		    db ID_GAS
		    dw 0C088h

ActorsRoom100:	    db 4
		    db ID_GAS
		    dw 1850h
		    db ID_GAS
		    dw 6020h
		    db ID_GAS
		    dw 8070h
		    db ID_GAS
		    dw 0D0A0h

ActorsRoom101:	    db 4
		    db ID_GAS
		    dw 3028h
		    db ID_GAS
		    dw 6090h
		    db ID_GAS
		    dw 0A058h
		    db ID_GAS
		    dw 0E8B0h

ActorsRoom102:	    db 6
		    db ID_SCORPION
		    db	82h,0D1h
		    db ID_SCORPION
		    db	33h, 86h
		    db ID_SCORPION
		    db	74h, 95h
		    db ID_SCORPION
		    db	55h, 54h
		    db ID_SCORPION
		    db	46h, 73h
		    db ID_SCORPION
		    db	61h, 22h

ActorsRoom103:	    db 6
		    db ID_SCORPION
		    dw 8661h
		    db ID_SCORPION
		    dw 9592h
		    db ID_SCORPION
		    dw 5433h
		    db ID_SCORPION
		    dw 7374h
		    db ID_SCORPION
		    dw 2285h
		    db ID_SCORPION
		    dw 0D146h

ActorsRoom104:	    db 4
		    db ID_LORRY_SHOOTER			    ; Used in the lorries in the desert	before building	3
		    dw 1050h
		    db ID_LORRY_SHOOTER			    ; Used in the lorries in the desert	before building	3
		    dw 5050h
		    db ID_LORRY_SHOOTER			    ; Used in the lorries in the desert	before building	3
		    dw 9050h
		    db ID_LORRY_SHOOTER			    ; Used in the lorries in the desert	before building	3
		    dw 0D050h

ActorsRoom107:	    db 4
		    db ID_GUARD_SLOW
		    dw 3040h
		    db ID_GUARD_SLOW
		    dw 0D050h
		    db ID_GUARD_SLOW
		    dw 30B0h
		    db ID_GUARD_SLOW
		    dw 0D0B0h

ActorsRoom108:	    db 3
		    db ID_GUARD_REDALERT
		    dw 427Ch
		    db ID_GUARD_REDALERT
		    dw 9A6Eh
		    db ID_GUARD_REDALERT
		    dw 0DCAEh

ActorsRoom109:	    db 3
		    db ID_PITFALL
		    dw 8050h
		    db ID_PITFALL
		    dw 40A0h
		    db ID_PITFALL
		    dw 0A0A0h

ActorsRoom110:	    db 1
		    db ID_POWER_SWITCH
		    db	10h, 44h

ActorsRoom111:	    db 2
		    db ID_CAMERA_LASER
		    dw 6818h
		    db ID_CAMERA_LASER
		    dw 0A878h

ActorsRoom112:	    db 3
		    db ID_GAS
		    dw 5030h
		    db ID_GAS
		    dw 9070h
		    db ID_GAS
		    dw 40ACh

ActorsRoom113:	    db 2
		    db ID_PITFALL
		    dw 4070h
		    db ID_PITFALL
		    dw 0C088h

ActorsRoom114:	    db 0Bh
		    db ID_LAND_MINE
		    dw 7828h
		    db ID_LAND_MINE
		    dw 5838h
		    db ID_LAND_MINE
		    dw 7848h
		    db ID_LAND_MINE
		    dw 9848h
		    db ID_LAND_MINE
		    dw 0A858h
		    db ID_LAND_MINE
		    dw 6868h
		    db ID_LAND_MINE
		    dw 7888h
		    db ID_LAND_MINE
		    dw 9898h
		    db ID_GAS
		    dw 7868h
		    db ID_GAS
		    dw 9030h
		    db ID_GAS
		    dw 68A8h

ActorsRoom115:	    db 2
		    db ID_CAMERA_LASER
		    dw 5810h
		    db ID_CAMERA_LASER
		    dw 0C010h

ActorsRoom116:	    db 1
		    db ID_POWER_SWITCH			    ; (!?) It is hidden!
		    db	10h, 20h

ActorsRoom118:	    db 3
		    db ID_METAL_GEAR
		    dw 8080h
		    db ID_CAMERA_LASER
		    dw 5818h
		    db ID_CAMERA_LASER
		    dw 0A818h

ActorsRoom119:	    db 1
		    db ID_BIG_BOSS
		    dw 3038h

ActorsRoom120:	    db 9
		    db ID_LAND_MINE
		    dw 3828h
		    db ID_LAND_MINE
		    dw 8828h
		    db ID_LAND_MINE
		    dw 0D838h
		    db ID_LAND_MINE
		    dw 0A848h
		    db ID_LAND_MINE
		    dw 6858h
		    db ID_LAND_MINE
		    dw 2868h
		    db ID_LAND_MINE
		    dw 8868h
		    db ID_LAND_MINE
		    dw 0E868h
		    db ID_LAND_MINE
		    dw 3888h

ActorsRoom123:	    db 3
		    db ID_PITFALL
		    dw 3080h
		    db ID_PITFALL
		    dw 8080h
		    db ID_PITFALL
		    dw 0D080h

ActorsRoom124:	    db 2
		    db ID_PITFALL
		    dw 4060h
		    db ID_PITFALL
		    dw 0C080h

ActorsRoom127:	    db 1
		    db ID_GUARD_ALERT
		    dw 4870h

ActorsRoom131:	    db 4
		    db ID_GUARD_ALERT
		    dw 4636h
		    db ID_GUARD_ALERT
		    dw 6836h
		    db ID_GUARD_ALERT
		    dw 385Ah
		    db ID_GUARD_ALERT
		    dw 6682h

ActorsRoom132:	    db 1
		    db ID_GUARD_ALERT
		    dw 4870h

ActorsRoom138:	    db 1
		    db ID_GUARD_SLOW
		    dw 0B858h

ActorsRoom140:	    db 6
		    db ID_SENTINEL
		    dw 3850h
		    db ID_SLEEPING_SIGN
		    dw 382Dh
		    db ID_SENTINEL
		    dw 6850h
		    db ID_SLEEPING_SIGN
		    dw 682Dh
		    db ID_SENTINEL
		    dw 5888h
		    db ID_SLEEPING_SIGN
		    dw 5865h

ActorsRoom141:	    db 1
		    db ID_ROLLING_BARREL
		    dw 8008h

ActorsRoom205:	    db 2
		    db ID_ROLLING_BARREL
		    dw 8008h
		    db ID_PITFALL
		    dw 0A060h

ActorsRoom150:	    db 4
		    db ID_GUARD_SILENCER
		    dw 1896h
		    db ID_GUARD_SILENCER
		    dw 503Ah
		    db ID_GUARD_SILENCER
		    dw 903Ah
		    db ID_GUARD_SILENCER
		    dw 0C896h

ActorsRoom154:	    db 1
		    db ID_GUARD_ALERT
		    dw 5060h

ActorsRoom164:	    db 1
		    db ID_GREY_FOX
		    dw 8060h

ActorsRoom166:	    db 2
		    db ID_HELPME_VOICE
		    dw 8060h
		    db ID_PITFALL
		    dw 0A060h

ActorsRoom167:	    db 1
		    db ID_ELLEN
		    dw 8060h

ActorsRoom178:	    db 1
		    db ID_GUARD_SLOW
		    dw 9860h

ActorsRoom181:	    db 2
		    db ID_GUARD_ALERT
		    dw 8866h
		    db ID_GUARD_ALERT
		    dw 0BC32h

ActorsRoom182:	    db 1
		    db ID_MADNAR
		    dw 8060h

ActorsRoom183:	    db 2
		    db ID_GUARD_REDALERT
		    dw 5072h
		    db ID_GUARD_REDALERT
		    dw 0A154h

ActorsRoom187:	    db 2
		    db ID_GUARD_ALERT
		    dw 507Ah
		    db ID_GUARD_ALERT
		    dw 0BE62h

ActorsRoom189:	    db 1
		    db ID_FAKE_MADNAR
		    dw 8060h

ActorsRoom193:	    db 5
		    db ID_COWARD_DUCK
		    db	38h, 80h
		    db ID_PRISONER1
		    db	30h, 68h
		    db ID_PRISONER1
		    db	30h, 98h
		    db ID_PRISONER1
		    db	54h, 80h
		    db ID_PITFALL
		    db	78h, 80h

ActorsRoom207:	    db 2
		    db ID_DOG
		    dw 4F3Eh
		    db ID_DOG
		    dw 8876h

ActorsRoom198:	    db 1
		    db ID_PRISONER1
		    dw 8060h

ActorsRoom201:	    db 1
		    db ID_PITFALL
		    dw 0A060h

ActorsRoom206:	    db 2
		    db ID_SHOOTER
		    dw 5090h
		    db ID_SHOOTER
		    dw 0B090h

ActorsRoom208:	    db 6
		    db ID_SCORPION
		    dw 0B028h
		    db ID_SCORPION
		    dw 9870h
		    db ID_SCORPION
		    dw 6030h
		    db ID_SCORPION
		    dw 6385h
		    db ID_SCORPION
		    dw 9060h
		    db ID_SCORPION
		    dw 3174h

ActorsRoom209:	    db 6
		    db ID_SCORPION
		    dw 309Eh
		    db ID_SCORPION
		    dw 0CC5Ch
		    db ID_SCORPION
		    dw 3A56h
		    db ID_SCORPION
		    dw 9880h
		    db ID_SCORPION
		    dw 9C3Ah
		    db ID_SCORPION
		    dw 6240h

ActorsRoom216:	    db 3
		    db ID_GUARD_REDALERT
		    dw 724Ch
		    db ID_GUARD_REDALERT
		    dw 567Ah
		    db ID_GUARD_REDALERT
		    dw 0C84Ah

ActorsRoom220:	    db 3
		    db ID_PITFALL
		    dw 4080h
		    db ID_PITFALL
		    dw 8040h
		    db ID_PITFALL
		    dw 0C080h

ActorsRoom221:	    db 3
		    db ID_PITFALL
		    dw 3060h
		    db ID_PITFALL
		    dw 8080h
		    db ID_PITFALL
		    dw 0D040h

ActorPrisoner:	    db 1
		    db ID_PRISONER1
		    dw 8060h

NoActorsInRoom:	    db	  0
;3Ah


;----------------------------------------------------------------------------
;
; Index	of the actors in each room
;
;----------------------------------------------------------------------------

idxActorsRooms:	    dw NoActorsInRoom
		    dw ActorsRoom001
		    dw ActorsRoom002
		    dw ActorsRoom003
		    dw ActorsRoom004
		    dw ActorsRoom005
		    dw ActorsRoom006
		    dw ActorsRoom007
		    dw NoActorsInRoom
		    dw ActorsRoom009
		    dw ActorsRoom010
		    dw ActorsRoom011
		    dw ActorsRoom012
		    dw ActorsRoom013
		    dw ActorsRoom014
		    dw ActorsRoom015
		    dw ActorsRoom016
		    dw ActorsRoom017
		    dw ActorsRoom018
		    dw ActorsRoom019
		    dw ActorsRoom020
		    dw ActorsRoom021
		    dw ActorsRoom022
		    dw ActorsRoom023
		    dw ActorLaserRooms
		    dw ActorLaserRooms
		    dw ActorsRoom026
		    dw ActorsRoom027
		    dw ActorsRoom028
		    dw ActorsRoom029
		    dw ActorsRoom030
		    dw ActorsRoom031
		    dw ActorsRoom032
		    dw ActorsRoom033
		    dw ActorsRoom034
		    dw ActorsRoom035
		    dw ActorsRoom036
		    dw ActorsRoom037
		    dw ActorsRoom038
		    dw ActorsRoom039
		    dw ActorsRoom040
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw ActorsRoom043
		    dw ActorsRoom044
		    dw ActorsRoom045
		    dw ActorsRoom046
		    dw ActorsRoom047
		    dw ActorsRoom048
		    dw ActorsRoom049
		    dw ActorsRoom050
		    dw ActorsRoom051
		    dw ActorsRoom052
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw ActorsRoom055
		    dw ActorsRoom056
		    dw ActorsRoom057
		    dw ActorsRoom058
		    dw ActorsRoom59_62
		    dw ActorsRoom060
		    dw ActorsRoom61_63			    ; Dog in basement
		    dw ActorsRoom59_62
		    dw ActorsRoom61_63
		    dw ActorsRoom064
		    dw ActorsRoom65_66			    ; Cannon shells
		    dw ActorsRoom65_66
		    dw ActorsRoom067
		    dw NoActorsInRoom
		    dw ActorsRoom069
		    dw ActorsRoom070
		    dw ActorsRoom071
		    dw ActorLaserRooms
		    dw NoActorsInRoom
		    dw ActorsRoom074
		    dw NoActorsInRoom
		    dw ActorsRoom076
		    dw ActorsRoom077
		    dw NoActorsInRoom
		    dw ActorsRoom079
		    dw ActorsRoom080
		    dw ActorsRoom081
		    dw ActorsRoom082
		    dw ActorsRoom083
		    dw ActorsRoom084
		    dw ActorsRoom085
		    dw ActorsRoom086
		    dw ActorsRoom087
		    dw ActorsRoom088
		    dw ActorsRoom089
		    dw ActorsRoom090
		    dw ActorsRoom091
		    dw ActorsRoom092
		    dw ActorsRoom093
		    dw ActorsRoom094
		    dw ActorsRoom095
		    dw ActorsRoom096
		    dw ActorsRoom097
		    dw ActorsRoom098
		    dw NoActorsInRoom
		    dw ActorsRoom100
		    dw ActorsRoom101
		    dw ActorsRoom102
		    dw ActorsRoom103
		    dw ActorsRoom104
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw ActorsRoom107
		    dw ActorsRoom108
		    dw ActorsRoom109
		    dw ActorsRoom110
		    dw ActorsRoom111
		    dw ActorsRoom112
		    dw ActorsRoom113
		    dw ActorsRoom114
		    dw ActorsRoom115
		    dw ActorsRoom116
		    dw NoActorsInRoom
		    dw ActorsRoom118
		    dw ActorsRoom119
		    dw ActorsRoom120
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw ActorsRoom123
		    dw ActorsRoom124
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw ActorsRoom127
		    dw NoActorsInRoom
		    dw ActorPrisoner
		    dw NoActorsInRoom
		    dw ActorsRoom131
		    dw ActorsRoom132
		    dw NoActorsInRoom
		    dw ActorPrisoner
		    dw NoActorsInRoom
		    dw ActorPrisoner
		    dw NoActorsInRoom
		    dw ActorsRoom138
		    dw NoActorsInRoom
		    dw ActorsRoom140
		    dw ActorsRoom141
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw ActorPrisoner
		    dw ActorPrisoner
		    dw ActorPrisoner
		    dw NoActorsInRoom
		    dw ActorPrisoner
		    dw NoActorsInRoom
		    dw ActorsRoom150
		    dw NoActorsInRoom
		    dw ActorPrisoner
		    dw ActorsRoom141
		    dw ActorsRoom154
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw ActorPrisoner
		    dw NoActorsInRoom
		    dw ActorPrisoner
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw ActorsRoom164
		    dw NoActorsInRoom
		    dw ActorsRoom166
		    dw ActorsRoom167
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw ActorsRoom178
		    dw NoActorsInRoom
		    dw ActorPrisoner
		    dw ActorsRoom181
		    dw ActorsRoom182
		    dw ActorsRoom183
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw ActorPrisoner
		    dw ActorsRoom187
		    dw NoActorsInRoom
		    dw ActorsRoom189
		    dw ActorPrisoner
		    dw ActorsRoom141
		    dw NoActorsInRoom
		    dw ActorsRoom193
		    dw ActorPrisoner
		    dw ActorPrisoner
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw ActorsRoom198
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw ActorsRoom201
		    dw ActorPrisoner
		    dw ActorPrisoner
		    dw NoActorsInRoom
		    dw ActorsRoom205
		    dw ActorsRoom206
		    dw ActorsRoom207
		    dw ActorsRoom208
		    dw ActorsRoom209
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw ActorsRoom216
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw NoActorsInRoom
		    dw ActorsRoom220
		    dw ActorsRoom221
