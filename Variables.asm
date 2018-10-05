
;----------------------------------------------------------------------------
;
; Variables
;
;----------------------------------------------------------------------------

		    map	#c000
		    
GameStatus:	    # 1
GameSubstatus:	    # 1
ControlConfig:	    # 1
							    ; Bit6: 1=Enable music/Player control
TickCounter:	    # 1
WaitCounter:	    # 1
TickInProgress:	    # 1
ControlsTrigger:    # 1
							    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
ControlsHold:	    # 1
							    ; 5	= Fire2	/ M,  4	= Fire / Space,	3 = Right, 2 = Left, 1 = Down, 0 = Up
Pause_1_F5_2:	    # 1
TutorialStatus:	    # 1
DemolHoldTime:	    # 1
UnusedVar1:	    # 1
DemoPlayId:	    # 1
DemoDataPointer:    # 2
							    ; Pointer to presaved demo controls
SprShuffleOffset:   # 1

;
; Sound	work area
; 3 music channels + 1 sfx
;
SoundWorkArea:	    # 20h
SoundWorkAreaB:	    # 20h
SoundWorkAreaC:	    # 20h
SoundWorkAreaSfx:   # 20h

SoundWorkArea2:	    # 60h
							    ; Sound work area backup


PGS_MixerVal:	    # 1
RestoreSoundData:   # 1
SoundDataSaved:	    # 1
flagSndDatRestored: # 1
MusicToSet:	    # 1
							    ; New music	to play	(fade out current one)
FadeStepCnt:	    # 1
VolumeFadeVal:	    # 1
UnusedVar2:         # 1
MuteSoundFlag:	    # 1
							    ; 1	= Mute
RadioFreqOffset:    # 1
							    ; Value used to modify the radio noise SFX depending on radio frequency
UnusedVar3:         # 1
BigBossDeadSnd:	    # 1
UnusedVar4:         # 14h


ControlsTrig_:	    # 1
ControlsHold_:	    # 1
FKeysTrigger:	    # 1
							    ; 0	0 RET F5 F4 F3 F2 F1
FKeysHold:	    # 1
							    ; 0	0 RET F5 F4 F3 F2 F1
SprColAddress:	    # 2
SprAttAddress:	    # 2
MenuStatus:	    # 1
MenuCnt:	    # 1
UnusedVar5:         # 6
GameVars:	    # 3
PlayingFlag:	    # 1
LeavedOuterHeaven:  # 1
RestoreGameFlag:    # 1
UnusedVar6:         # 0Ah
Room:		    # 1
							    ; Also used	as LogoTimer
Life:		    # 1
							    ; LogoCnt
Class:		    # 1
							    ; Logo end flag
NextRoomDirect:	    # 1
							    ; 4=Right, 3=Left, 2=Down, 1=Up
SelectedWeapon:	    # 1
SelectedItem:	    # 1
PreviousRoom:	    # 1
MaxLife:	    # 1
RadioFreq:	    # 1
Poisoned:	    # 1
RescuedCnt:	    # 1
							    ; Rescued prisoners	count (0-4)
EquipRemoved:	    # 1
							    ; The equipment and	weapons	have been removed by the enemy (captured)
DestructionTimerOn: # 1
DestructTimer:	    # 1
DestructTimerH:	    # 1
PrisonWall1Life:    # 1
							    ; Snake prison wall	energy
PrisonWall2Life:    # 1
							    ; GreyFox prison wall energy
MaxAmmoRatioF:	    # 1
							    ; Bit 0=Max.Ammo, 1=Max.Rations
WeaponInUse:	    # 1
PlayerMovSpeed:	    # 2
UnusedVar7:         # 0Bh
byte_C150:	    # 1
							    ; Unused?
GameMode:	    # 1
							    ; 0=Playing,1=NextRoom,2=Weapons,3=Equipment,4=Radio,5=Lorry,6=Moving elevator,7=OpenDoor,8=Binoculars,9=Dead, A=Text window, B=Captured, C	= Madnar moved:It's too late
Dificulty:	    # 1
EquipRadioStatus:   # 1
							    ; Equip and	radio status
SelectIdx:	    # 1
MenuCursorXY:	    # 2
CurrentTileSet:	    # 1
IsolatedRoom:	    # 1
							    ; Can't use binoculars. Shooting does not trigger the alarm
AreaMusic:	    # 1
UnusedVar8:         # 1
HeightParachuteCnt: # 1
ControlHoldWait:    # 1
UnusedVar9:         # 1
isOnBridge:	    # 1
RadioCallFlag:	    # 1
							    ; 1=Start incoming call, 2=Stop incoming call
IncomingCallTimer:  # 1
MapZone:	    # 1
							    ; Values of	5 or more need the antenna
JumpRoomId:	    # 1
							    ; 1	= From room 45,	2 = From room 46, others = 117
RadioCallFlagCopy:  # 2
RestoreSavedGame:   # 1
							    ; ;Set after loading tape data
TailDataByte:	    # 1
DoNotAddEnemies:    # 1
TilesetBank:	    # 1
							    ; 0=First bank of 256 tiles, 1=Second bank
CowardDuckSpeech:   # 1
AlertModeCopy2:	    # 1
UnusedVar10:         # 15h
PlayerControlMod:   # 1
							    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
PlayerYdec:	    # 1
PlayerY:	    # 1
PlayerXdec:	    # 1
PlayerX:	    # 1
PlayerDirection:    # 1
							    ; 1=Up, 2 =	Down, 3=Left, 4=Right
PlayerSpeedY:	    # 2
PlayerSpeedX:	    # 2
SnakeSprId:	    # 1
PlayerAnimation:    # 1
							    ; 0=Normal,	1=Punch, 2=Water, 3=Parachute, 4=Deep water, 5=Ladder, 6=Dead, 7=Box
PlayerDirectionNew: # 1
							    ; 1=Up, 2=Down, 3=Left, 4=Right
PlayerAnimWaitCnt:  # 1
StopPlayerFlag:	    # 1
							    ; 1=The player is not moving
PlayerFrameNum:	    # 1
PunchCnt:	    # 1
DirectionMask:	    # 1
							    ; Bitmask of the last pressed direction control
DirectionMaskOld:   # 1
							    ; Bitmask of the previous pressed direction	control
ElevatorY:	    # 1
ElevatorX:	    # 1
ElevatorDir:	    # 1
							    ; 1=up, 2=down
ElevatorStatus:	    # 1
ElevatorLimitUp:    # 1
ElevatorLimitDown:  # 1
DamageDelayTimer:   # 1
BinoculStatus:	    # 1
BinocularDir:	    # 1
TimerBinocular:	    # 1
DeadTimer:	    # 1
SubMachGunTimer:    # 1
BurstCnt:	    # 1
InAirFlow:	    # 1
							    ; 1	= Snake	is being pushed	by the air floor in the	roof
UnusedVar11:        # 1Eh
BombOrderBuffer:    # 10h
CurrentPal:	    # 31h
							    ; Color number, color data1, color data 2... #FF end
PlayerShotsList:    # 1
PlayerShot1Stat:    # 3
PlayerShot1Y:	    # 2
PlayerShot1X:	    # 17Ah

MaxAmmoGun:	    # 2
MaxAmmoSMG:	    # 2
MaxAmmoGrenade:	    # 2
MaxAmmonRocket:	    # 2
MaxAmmoBomb:	    # 2
MaxAmmoMine:	    # 2
MaxAmmoMissile:	    # 2
UnusedVar12:        # 2Ch
MaxRations:	    # 2
UnusedVar13:        # 14h

DoorsList:	    # 80h
							    ; 0=ID, 1=Open, 2=LogicOpen, 3=Type, 4=Cnt,	5=DrawY, 6=DrawX, 7=OpenOffY, 8=OpenNY,	9=OpenOffX, 10=OpenNX, 11=EnterOffY, 12=EnterNY, 13=EnterOffsetX, 14=EnterNY, 15=Destination room

DoorOpenArray:	    # 0A0h
							    ; 0=Open/1=Closed status of	all doors
UnusedVar14:        # 0Ch
IdDoorEnter:	    # 1
OpenDoorStatus:	    # 1
idxDoorOpen:	    # 1
DoorsInRoom:	    # 1
							    ; Number of	doors in the room

Weapons:	    # 1Ch
InvSupressor:	    # 4

WeaponsTaken:	    # 1
SMG_Taken:	    # 1
GrenadeL_Taken:	    # 1
RocketL_Taken:	    # 1
PBomb_Taken:	    # 1
Mines_Taken:	    # 1
Missiles_Taken:	    # 1
SupressorTaken:	    # 1
TextBoxEff_Cnt:	    # 1
TextBoxEff_DY:	    # 1
TextBoxEff_DX:	    # 1
TextBoxStepY:	    # 1
TextBoxStepX:	    # 1
TextBoxEff_NY:	    # 1
TextBoxEff_NX:	    # 1
TextBoxEff_Col:	    # 1


Equipment:	    # 1
							    ; +0 Item ID, +1 tens/units, +2 hundreds, +3 unused
CigarsUnits:	    # 6Fh

ItemsTaken:	    # 1
BSuitTaken:	    # 1
FlashLightTaken:    # 1
GooglesTaken:	    # 1
GasMaskTaken:	    # 1
CigarsTaken:	    # 1
MineDetectTaken:    # 1
AntennaTaken:	    # 1
BinocularTaken:	    # 1
OxygenTaken:	    # 1
CompassTaken:	    # 1
ParachuTaken:	    # 1
AntidoteTaken:	    # 1
Card1Taken:	    # 1
Card2Taken:	    # 1
Card3Taken:	    # 1
Card4Taken:	    # 1
Card5Taken:	    # 1
Card6Taken:	    # 1
Card7Taken:	    # 1
Card8Taken:	    # 1
RationTaken:	    # 1
TransmiTaken:	    # 1
UniformTaken:	    # 1
CardBoardBoxTaken   # 1
EquipBagTaken:	    # 1
UnusedVar15:        # 6
SpawnedItems:	    # 1
SpawnItemData:	    # 0Fh
							    ; Item ID, Y, X  (#FF = End	list)
ItemsInTheRoom:	    # 30h
							    ; ID, size,	Y, X
GameDataArea:	    # 2
AlertMode:	    # 2
RoomAlert:	    # 1
							    ; The room where the alert started
AlertRespawnTimer:  # 1
NumRespawnGuards:   # 2
EventCnt:	    # 1
NumEnemies:	    # 1
LaserRoomTimer:	    # 1
							    ; Wait time	before moving lasers
LaserRoomCnt:	    # 1
							    ; Laser position counter
XY_AlertIcon:	    # 3
RoomAlertTrigged:   # 1
							    ; This is the room where the alert was triggered
OpenBigBossDoor:    # 1
							    ; Flag to open door	from Metal Gear	to Big Boss room, and door to escape ladders.
UnusedVar16:        # 3
RedAlertFlag:	    # 2
PowerSwitchOn:	    # 1
							    ; Power switch status 1=On,	0=Off/destroyed
UnusedVar17:        # 9
BossHindD_KO:	    # 1
BossTank_KO:	    # 1
Bulldozer_KO:	    # 1
MetalGear_KO:	    # 1
							    ; Metal Gear destroyed. Self destruction activated
UnusedVar18:        # 2
ArnoldsCnt:	    # 1
FireTrooper_KO:	    # 1
REMOVE_FLAMES:	    # 4					; Not used
DoorBuild2LockedF:  # 1
							    ; 0	= Entrance door	of building 2 is closed. 1 = Open
byte_C62D:	    # 1
NumBasementDogs:    # 1
NoEnemiesRoom:	    # 1
							    ; 1=No enemies in the room
MachGunStatus:	    # 1
							    ; Bit1= Machine Gun	Kid speech, 0=Dead
ShotGunnerStat:	    # 1
							    ; Bit1=Shot	Gunner speech, 0=Dead
AlertModeCopy:	    # 1
SleepyGuardFlag:    # 1
Guard1ExitedLorry:  # 1
Guard2ExitedLorry:  # 1
Guard3ExitedLorry:  # 1
BigBossStat:	    # 1
							    ; 0=Dead, 1=Confession dialog
GuardSilencerCnt:   # 1
							    ; Four soldiers (supressor room)
PowerSwitchOnCopy:  # 1
DesertGuardsTextF:  # 1
PowerSwitchY:	    # 1
PowerSwitchX:	    # 4
RescuedArray:	    # 17h
JennifBrotherDead:  # 9
MadnarMoved:	    # 1
JeniRocketF:	    # 1
SchneiderCaptured:  # 1
JeniOpenDoorF:	    # 1
							    ; Flag to open the door to the compass room
SwitchOffMSXF:	    # 4
							    ; 1	= Big Boss will	order to switch	off your MSX
AlertSignNotOnScreen: #	1
							    ; 1	= No need to erase the alert sign. The alert was triggered by a	camera
AlertIconTimer:	    # 37h
SaveLoadMode:	    # 1
							    ; 1=Load mode, 2=Save mode
SaveLoadStat:	    # 1
FilenameFound:	    # 6
Filename:	    # 6
FilenameSize:	    # 52h
CollisionTiles:	    # 100h
							    ; Collision	property of the	tiles (bit 0 = 1 collision)
RadioCmd:	    # 1
							    ; 1=Send
RadioLedCnt:	    # 1
RadioLedDelay:	    # 1
							    ; Delay before the first/next led turns on
ReplyRadioPerson:   # 2
AutoReplyDone:	    # 1
							    ; Flag to indicate that autoreply has been done.
ReplyRequested:	    # 79h
NumRadioPersons:    # 1
RadioPersonsDat:    # 80h
							    ; 0=Frequency, 1=dummy, 2=bit0:autoreply 1:autotune, 3=Text	id
CaptureStatus:	    # 1
CaptureTimer:	    # 1Fh
IntroSceneStatus:   # 1
IntroSceneCnt:	    # 1
EndingStatus:	    # 1
EndingCnt:	    # 5
TempImpactInfo:	    # 0D8h
							    ; Buffer used to store the shape/size of an	actor
GameProgressBuffer: # 220h
							    ; The last byte is the checksum
GfxPitfallBuffer:   # 2C0h
							    ; Buffer used to unpack the	pitfall	tiles
SkipTextMode:	    # 1
							    ; 0	= Text can be skipped. Need to press a key to read next	text box
							    ; 1	= Text can not be skipped. Need	to press a key to read next text box
							    ; 2	= Text can not be skipped. Need	to wait	to read	next text box
LorryMovTextF:	    # 2
SkipTextF:	    # 0Dh
TextId:		    # 1
PrevGameMode:	    # 1
TextWindowStatus:   # 1
TextPointer:	    # 2
TextBoxType:	    # 1
							    ; High nibble = Show prompt	icon, low nibble = Window type
							    ; Window types:
							    ; 0	- 1 x 7
							    ; 1	- 3 x 19
							    ; 2	- 5 x 16
							    ; 3	- 5 x 23
							    ; 4	- 2 x 17
TextY:		    # 1
TextX:		    # 1
TextNY:		    # 1
TextNX:		    # 1
PendingTextFlag:    # 1
WaitTextCnt:	    # 1
TextCharXY:	    # 2
pTexBuffer:	    # 2
PromptXY:	    # 2
flagTxtItem:	    # 0Eh	
TextBuffer:	    # 0F0h
EnemyList:	    # 80h				    ; Array of enemies in the room
EnemyListEntry1:    # 80h
EnemyListEntry2:    # 700h
EnemyListCopy:	    # 800h				    ; Used when	entering binoculars mode
RoomTileBuffer:	    # 500h
PasswordBuffer:	    # 0Ch
PassKeysTrigger:    # 1
KeyboardRow7:	    # 1
KeyboardRow6:	    # 1
KeyboardRow5:	    # 1
KeyboardRow4:	    # 1
KeyboardRow3:	    # 1
KeyboardRow2:	    # 1
KeyboardRow1:	    # 1
KeyboardRow0:	    # 1
PassKeysHold:	    # 0EBh
SavedTilesBuffer:   # 100h				    ; Buffer used to save the background tiles of a tileblock
BufferColor:	    # 8					    ; Buffer used to store the colors' indexes for decoding 2/3bpp graphics
BufferGfx:	    # 0F8h				    ; Buffer used to decode 2bpp and 3bpp graphics

; Sprites colors
SpritesColors:	    # 40h
BinocularSprCol:    # 50h
GrenadTargetCol:    # 0B0h
SprElevatorCol:	    # 0C0h

; Sprites attributes
; Y, X,	pattern, EarlyClock+color
SprAttRAM:	    # 10h
SprShootsAtt:	    # 14h
GrenaTargetAtt:	    # 4
EnemySprAttRAM:	    # 18h
SnakeAttrLow:	    # 10h
SprElevatorAttr:    # 1B0h


TempData:	    # 2
TempData2:	    # 2					    ; Enemy XY,	MetaTileSetAddr
TempData3:	    # 2					    ; MetaTiles, Enemy
MetatilesNX:	    # 3Ah
DecodeTileBuf:	    # 40h
ShotSpeed:	    # 1
ShotDirectionV:	    # 1
ShotDirectionH:	    # 1
TmpShootSpeedY:	    # 2
TmpShotCos:	    # 1
QuadranDegree:	    # 46Ah
Stack:		    # 1
BankIn60:	    # 1
							    ; Copy of bank selected in #6000-#7FFF
BankIn80:	    # 1
							    ; Copy of bank selected in #8000-#9FFF
BankInA0:	    # 1
							    ; Copy of bank selected in #A000-#BFFF
BankIn60Fixed:	    # 1
BankIn80Fixed:	    # 1
BankInA0Fixed:	    # 1

MusicInDemoMode:    # 1
							    ; Flag to enable or	disable	music in demo mode
FKeysTriggerMen:    # 1
FKeysHoldMenu:	    # 1					    ; 0	0 RET F5 F4 F3 F2 F1

