; ---------------------------------------------------------------------------

	STRUCT	PITFALL		    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
MOVING:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
RENDER_DY:	    BYTE				    ; Also used	as number of path points, or shooter guard X
RENDER_DX:	    BYTE				    ; Used in shooter guard as left or right direction
HOLE_SIZE:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
DestinationX:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
RENDER_SY:	    BYTE				    ; In Jetpack = Y
RENDER_SX:	    BYTE				    ; In Jetpack = Xdec
Visible:	    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
FACING_TO:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE
field_42:	    BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
field_45:	    BYTE
field_46:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
field_50:	    BYTE
field_51:	    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
field_58:	    BYTE
field_59:	    BYTE
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
field_5D:	    BYTE
field_5E:	    BYTE
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
field_70:	    BYTE
field_71:	    BYTE
field_72:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
SPAWN_DELAY:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	BOOMERANG	    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
MOVING:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
TIMER:		    BYTE				    ; Also used	as number of path points, or shooter guard X
SPIN_CNT:	    BYTE				    ; Used in shooter guard as left or right direction
START_Y:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
START_X:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
ANGLE_Y:	    BYTE				    ; In Jetpack = Y
ANGLE_X:	    BYTE				    ; In Jetpack = Xdec
ANGLE_DELTA_Y:	    BYTE				    ; In Jetpack = X, Next Pathpoint offset
ANGLE_DELTA_X:	    BYTE
COUNTER:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
SHORT_RANGE:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE
field_42:	    BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
field_45:	    BYTE
field_46:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
field_50:	    BYTE
field_51:	    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
LASER_CNT:	    BYTE
field_59:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
field_5D:	    BYTE
field_5E:	    BYTE
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
field_70:	    BYTE
field_71:	    BYTE
field_72:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
SPAWN_DELAY:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	PRISONER	    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
MOVING:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
FALL_TIME:	    BYTE				    ; Also used	as number of path points, or shooter guard X
TIMER:		    BYTE				    ; Used in shooter guard as left or right direction
P_RESCUED_L:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
P_RESCUED_H:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
StatusOld:	    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
FACING_TO:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE
field_42:	    BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
field_45:	    BYTE
field_46:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
field_50:	    BYTE
field_51:	    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
LASER_CNT:	    BYTE
field_59:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
field_5D:	    BYTE
field_5E:	    BYTE
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
field_70:	    BYTE
field_71:	    BYTE
field_72:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
SPAWN_DELAY:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	ACTOR2		    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
MOVING:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
Timer:		    BYTE				    ; Also used	as number of path points, or shooter guard X
TIMER:		    BYTE				    ; Used in shooter guard as left or right direction
DestinationY:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
DOOR_STATUS:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
StatusOld:	    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
FACING_TO:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE
field_42:	    BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
field_45:	    BYTE
field_46:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
field_50:	    BYTE
field_51:	    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
LASER_CNT:	    BYTE
field_59:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
field_5D:	    BYTE
field_5E:	    BYTE
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
field_70:	    BYTE
field_71:	    BYTE
field_72:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
SPAWN_DELAY:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	GAS		    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
MOVING:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
TIMER:		    BYTE				    ; Also used	as number of path points, or shooter guard X
idxPathPoint:	    BYTE				    ; Used in shooter guard as left or right direction
DestinationY:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
DestinationX:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
StatusOld:	    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
FACING_TO:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE
field_42:	    BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
field_45:	    BYTE
field_46:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
field_50:	    BYTE
field_51:	    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
LASER_CNT:	    BYTE
field_59:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
field_5D:	    BYTE
field_5E:	    BYTE
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
field_70:	    BYTE
field_71:	    BYTE
field_72:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
SPAWN_DELAY:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	ROLLING_BARREL	    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
MOVING:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
START_X:	    BYTE				    ; Also used	as number of path points, or shooter guard X
idxPathPoint:	    BYTE				    ; Used in shooter guard as left or right direction
DestinationY:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
DestinationX:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
StatusOld:	    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
FACING_TO:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE
field_42:	    BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
field_45:	    BYTE
field_46:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
field_50:	    BYTE
field_51:	    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
LASER_CNT:	    BYTE
field_59:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
field_5D:	    BYTE
field_5E:	    BYTE
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
field_70:	    BYTE
field_71:	    BYTE
field_72:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
SPAWN_DELAY:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	COWARD_D	    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
MOVING:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
TIMER:		    BYTE				    ; Also used	as number of path points, or shooter guard X
idxPathPoint:	    BYTE				    ; Used in shooter guard as left or right direction
DestinationY:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
DestinationX:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
StatusOld:	    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
FACING_TO:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE
field_42:	    BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
field_45:	    BYTE
field_46:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
field_50:	    BYTE
field_51:	    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
LASER_CNT:	    BYTE
field_59:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
field_5D:	    BYTE
field_5E:	    BYTE
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
field_70:	    BYTE
field_71:	    BYTE
field_72:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
SPAWN_DELAY:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	ALERT_GUARD	    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Counter:	    BYTE
WalkAwayDir:	    BYTE				    ; Also used	as number of path points, or shooter guard X
P_NextBridge_H:	    BYTE				    ; Used in shooter guard as left or right direction
MOVEMENT_CNT:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
DestinationX:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
START_Y:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
START_X:	    BYTE				    ; In Jetpack = X, Next Pathpoint offset
DELTA_:		    BYTE
BaseSpriteId:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
NumberOfBridges:    BYTE
PointersToBridges:  BYTE
field_32:	    BYTE
field_33:	    BYTE
field_34:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
field_3F:	    BYTE
field_40:	    BYTE				    ; Pointer to flames	actors
field_41:	    BYTE
field_42:	    BYTE
field_43:	    BYTE
field_44:	    BYTE
field_45:	    BYTE
field_46:	    BYTE
field_47:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
field_50:	    BYTE
field_51:	    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
field_58:	    BYTE
field_59:	    BYTE
field_5A:	    BYTE
field_5B:	    BYTE
field_5C:	    BYTE
field_5D:	    BYTE
field_5E:	    BYTE
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
field_70:	    BYTE
field_71:	    BYTE
field_72:	    BYTE
DUMMY_CNT:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
SPAWN_DELAY:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	BRIDGE		    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
MOVING:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
P_NextBridge_L:	    BYTE				    ; Also used	as number of path points, or shooter guard X
P_NextBridge_H:	    BYTE				    ; Used in shooter guard as left or right direction
MOVEMENT_CNT:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
DestinationX:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
START_Y:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
START_X:	    BYTE				    ; In Jetpack = X, Next Pathpoint offset
DELTA_:		    BYTE
FACING_TO:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
NumberOfBridges:    BYTE
PointersToBridges:  BYTE
field_32:	    BYTE
field_33:	    BYTE
field_34:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
field_3F:	    BYTE
field_40:	    BYTE				    ; Pointer to flames	actors
field_41:	    BYTE
field_42:	    BYTE
field_43:	    BYTE
field_44:	    BYTE
field_45:	    BYTE
field_46:	    BYTE
field_47:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
field_50:	    BYTE
field_51:	    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
field_58:	    BYTE
field_59:	    BYTE
field_5A:	    BYTE
field_5B:	    BYTE
field_5C:	    BYTE
field_5D:	    BYTE
field_5E:	    BYTE
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
field_70:	    BYTE
field_71:	    BYTE
field_72:	    BYTE
DUMMY_CNT:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
SPAWN_DELAY:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	FIRE_TROPPER	    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
MOVING:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
FLAME_JET_CNT:	    BYTE				    ; Also used	as number of path points, or shooter guard X
ANGLE:		    BYTE				    ; Used in shooter guard as left or right direction
FLAME_MOV_ID:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
DestinationX:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
START_Y:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
START_X:	    BYTE				    ; In Jetpack = X, Next Pathpoint offset
DELTA_:		    BYTE
FACING_TO:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
POINTERS:	    BYTE				    ; Pointer to flames	actors
field_41:	    BYTE
field_42:	    BYTE
field_43:	    BYTE
field_44:	    BYTE
field_45:	    BYTE
field_46:	    BYTE
field_47:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
FLAME1_GAP_Y:	    BYTE
FLAME1_GAP_X:	    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
field_58:	    BYTE
field_59:	    BYTE
field_5A:	    BYTE
field_5B:	    BYTE
field_5C:	    BYTE
field_5D:	    BYTE
field_5E:	    BYTE
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
field_70:	    BYTE
field_71:	    BYTE
field_72:	    BYTE
DUMMY_CNT:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
SPAWN_DELAY:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	POWER_SWITCH	    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
MOVING:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
BRIGHT:		    BYTE				    ; Also used	as number of path points, or shooter guard X
BRIGHT_DELTA:	    BYTE				    ; Used in shooter guard as left or right direction
DestinationY:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
DestinationX:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
NextPointOffset:    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
FACING_TO:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
field_50:	    BYTE
field_51:	    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
field_70:	    BYTE
field_71:	    BYTE
field_72:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
SPAWN_DELAY:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	M_GUN_KID_SHOT	    
ID:		    BYTE				    ; Bit 7 = Killed
Configured:	    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
BurstDir:	    BYTE
Timer:		    BYTE				    ; Also used	as number of path points, or shooter guard X
IntroDelay:	    BYTE				    ; Intro delay to allow sprites refresh
SpawnY:		    BYTE
SpawnX:		    BYTE
NextDirection:	    BYTE
Xdec_:		    BYTE
X_:		    BYTE
field_1A:	    BYTE
KO_POINTER_L:	    BYTE
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	SHOT_GUNNER	    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
Timer:		    BYTE				    ; Also used	as number of path points, or shooter guard X
IntroDelay:	    BYTE				    ; Intro delay to allow sprites refresh
SpawnY:		    BYTE
SpawnX:		    BYTE
NextDirection:	    BYTE
Xdec_:		    BYTE
X_:		    BYTE
field_1A:	    BYTE
KO_POINTER_L:	    BYTE
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	DOG		    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 0=Up, 1=Down, 2=Left, 3=Right
Wait:		    BYTE
Timer:		    BYTE				    ; Also used	as number of path points, or shooter guard X
field_14:	    BYTE
SpawnY:		    BYTE
SpawnX:		    BYTE
NextDirection:	    BYTE
Xdec_:		    BYTE
X_:		    BYTE
field_1A:	    BYTE
KO_POINTER_L:	    BYTE
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	BULLDOZER	    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
Timer:		    BYTE				    ; Also used	as number of path points, or shooter guard X
NextDirection:	    BYTE				    ; Used in shooter guard as left or right direction
TakeoffSpeed:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
Ydec_:		    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
Y_:		    BYTE				    ; In Jetpack = Y
Xdec_:		    BYTE				    ; In Jetpack = Xdec
X_:		    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
KO_POINTER_L:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	JETPACK		    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
StartX:		    BYTE				    ; Also used	as number of path points, or shooter guard X
NextDirection:	    BYTE				    ; Used in shooter guard as left or right direction
TakeoffSpeed:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
Ydec_:		    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
Y_:		    BYTE				    ; In Jetpack = Y
Xdec_:		    BYTE				    ; In Jetpack = Xdec
X_:		    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
BASE_SPR_ID:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	GUARD_SILENCER	    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
StartX:		    BYTE				    ; Also used	as number of path points, or shooter guard X
NextDirection:	    BYTE				    ; Used in shooter guard as left or right direction
DirMovement:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
ChasingPlayer:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
NextPointOffset:    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
BASE_SPR_ID:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	SHOOTER		    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
StartX:		    BYTE				    ; Also used	as number of path points, or shooter guard X
NextDirection:	    BYTE				    ; Used in shooter guard as left or right direction
TransformTimer:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
field_16:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
NextPointOffset:    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
BASE_SPR_ID:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	ELEVATOR_GUARD	    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
DestinationX:	    BYTE				    ; Also used	as number of path points, or shooter guard X
AlertDelay:	    BYTE				    ; Used in shooter guard as left or right direction
LookDirTimer:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
field_16:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
NextPointOffset:    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
BASE_SPR_ID:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	ELEV_GUARD_SPAWNER  
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
WaitLoops:	    BYTE				    ; Also used	as number of path points, or shooter guard X
SpeedXCopy:	    BYTE				    ; Used in shooter guard as left or right direction
PushBackCnt:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
Timer3:		    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
NextPointOffset:    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
KO_POINTER_L:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	BIG_BOSS	    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
Dummy:		    BYTE				    ; Also used	as number of path points, or shooter guard X
SpeedXCopy:	    BYTE				    ; Used in shooter guard as left or right direction
PushBackCnt:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
Timer3:		    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
NextPointOffset:    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
KO_POINTER_L:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	ARNOLD		    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
OldStatus:	    BYTE				    ; Also used	as number of path points, or shooter guard X
SpeedXCopy:	    BYTE				    ; Used in shooter guard as left or right direction
PushBackCnt:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
Timer3:		    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
NextPointOffset:    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
KO_POINTER_L:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	TANK_SHOT	    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
SpeedXUnsigned:	    BYTE
Timer2:		    BYTE				    ; Also used	as number of path points, or shooter guard X
ShootDelay:	    BYTE				    ; Used in shooter guard as left or right direction
NumberShots:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
Timer3:		    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
NextPointOffset:    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
KO_POINTER_L:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	TANK		    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
MachineGunTimer:    BYTE
MachineGunOn:	    BYTE				    ; Also used	as number of path points, or shooter guard X
MachineGunLeftRight:BYTE				    ; Used in shooter guard as left or right direction
NumberShots:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
CannonlDelay:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
MovingTime:	    BYTE				    ; In Jetpack = Y
StopTime:	    BYTE				    ; In Jetpack = Xdec
StatusCopy:	    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
KO_POINTER_L:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	SHELL_DESERT	    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Timer:		    BYTE
LeftRight:	    BYTE				    ; Also used	as number of path points, or shooter guard X
ShootDelay:	    BYTE				    ; Used in shooter guard as left or right direction
NumberShots:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
AnimationCnt:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
NextPointOffset:    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
KO_POINTER_L:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	HIND_D		    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
Cnt_NumPathPoints:  BYTE				    ; Also used	as number of path points, or shooter guard X
ShootDelay:	    BYTE				    ; Used in shooter guard as left or right direction
NumberShots:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
AnimationCnt:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
NextPointOffset:    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
KO_POINTER_L:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	ACTOR		    
ID:		    BYTE				    ; Bit 7 = Killed
Status:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
Moving:		    BYTE				    ; 0=Does not move
speedYdec:	    BYTE
SpeedY:		    BYTE
SpeedXdec:	    BYTE
SpeedX:		    BYTE
SpriteId:	    BYTE
ANIM_CNT:	    BYTE
LIFE:		    BYTE				    ; 0=Kill the actor
COLLISION_CFG:	    BYTE				    ; Bit0 = Check collision with player, Bit1 = Check player shots, bit2 = Pitfall is closed
IDX_SAME_ID:	    BYTE
field_10:	    BYTE
Direction:	    BYTE				    ; 1=Up, 2=Down, 3=Left, 4=Right
Wait:		    BYTE
Cnt_NumPathPoints:  BYTE				    ; Also used	as number of path points, or shooter guard X
idxPathPoint:	    BYTE				    ; Used in shooter guard as left or right direction
DestinationY:	    BYTE				    ; Also used	as spawnY dog2,	and as shooter iteraction counter. In silencer guard is	used as	movement direction up/down or left/right, Pitfall NY
DestinationX:	    BYTE				    ; In Jetpack = Ydec, spawnX	dog2, Tank boss	shell shot delay, prisoner pointer to rescued array, Laser bean=bit0 vertical
PointerL:	    BYTE				    ; In Jetpack = Y
PointerH:	    BYTE				    ; In Jetpack = Xdec
NextPointOffset:    BYTE				    ; In Jetpack = X, Next Pathpoint offset
field_1A:	    BYTE
BASE_SPR_ID:	    BYTE				    ; This and next field are used also	to store a pointer to a	flag to	indicate that the actor/boss was destroyed
KO_POINTER_H:	    BYTE
field_1D:	    BYTE
TOUCH_INFO:	    BYTE				    ; Bit7=Touch player, bit6=Punched, 4-0: player shot	ID
StunnedCnt:	    BYTE
NumSprites:	    BYTE
Spr1Layer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
Spr2Layer:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
Spr3Layer:	    BYTE
Spr3Y:		    BYTE
Spr3X:		    BYTE
Spr3Pattern:	    BYTE
Spr3Color:	    BYTE
Spr4Layer:	    BYTE
Spr4Y:		    BYTE
Spr4X:		    BYTE
Spr4Pattern:	    BYTE
Spr4Color:	    BYTE
field_35:	    BYTE
field_36:	    BYTE
field_37:	    BYTE
field_38:	    BYTE
field_39:	    BYTE
field_3A:	    BYTE
field_3B:	    BYTE
field_3C:	    BYTE
field_3D:	    BYTE
field_3E:	    BYTE
NUM_FLAMES:	    BYTE
GuardStatus:	    BYTE
SEE_PLAYER_F:	    BYTE				    ; This camera has seen/detected the	player
PreviousDirection:  BYTE
IdxGuardSpeed:	    BYTE
AwakeTime:	    BYTE
REMOVE_GUARD:	    BYTE				    ; This flag	is set when a guard is removed to prevent the player to	come to	an enemy when entering a room
SleepingTime:	    BYTE
GuardStatusOld:	    BYTE
field_48:	    BYTE
field_49:	    BYTE
field_4A:	    BYTE
field_4B:	    BYTE
field_4C:	    BYTE
field_4D:	    BYTE
field_4E:	    BYTE
field_4F:	    BYTE
GAP_Y:		    BYTE
GAP_X:		    BYTE
field_52:	    BYTE
field_53:	    BYTE
field_54:	    BYTE
field_55:	    BYTE
field_56:	    BYTE
field_57:	    BYTE
COUNTER:	    BYTE
LASER_WAIT:	    BYTE				    ; bit1:0=Red laser,1=White laser
field_5A:	    BYTE
LookDirPointerLow:  BYTE				    ; Pointer to look directions. Used by ID_SENTINEL
LookDirPointerHigh: BYTE
SENTINEL_WAIT:	    BYTE
DESERT_GUARD:	    BYTE				    ; 0	= Player from desert, 1	= From building	2
field_5F:	    BYTE
field_60:	    BYTE
field_61:	    BYTE
field_62:	    BYTE
field_63:	    BYTE
field_64:	    BYTE
field_65:	    BYTE
field_66:	    BYTE
field_67:	    BYTE
field_68:	    BYTE
field_69:	    BYTE
field_6A:	    BYTE
field_6B:	    BYTE
field_6C:	    BYTE
field_6D:	    BYTE
field_6E:	    BYTE
field_6F:	    BYTE
NegativeGap:	    BYTE
field_71:	    BYTE
HiddenFlame:	    BYTE
field_73:	    BYTE
field_74:	    BYTE
field_75:	    BYTE
field_76:	    BYTE
field_77:	    BYTE
field_78:	    BYTE
field_79:	    BYTE
PunchesCnt:	    BYTE
idxPathPoint2:	    BYTE
PathPointsCnt:	    BYTE
NUM_GUARDS:	    BYTE
LORRY_TIMER:	    BYTE
ZzzSignSprIdx:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	SOUND		    ; (sizeof=0x20)		    ; ...
NOTE_COUNTER:	    BYTE
NOTE_LENGHT:	    BYTE
ID:		    BYTE
POINTER_L:	    BYTE
POINTER_H:	    BYTE
CONFIG:		    BYTE				    ; 3=Use Envelope, 2=Set Env. Freq. 1=Channel ON/OFF, 0=Noise ON/OFF
TEMPO:		    BYTE
ATTACK_VOL:	    BYTE
DECAY_VOL:	    BYTE
OCTAVE:		    BYTE
DECAY_CNT:	    BYTE				    ; Remaining	steps (Note lengh + release steps)
LOOP_CNT:	    BYTE
DECAY_STEPS:	    BYTE
RELEASE:	    BYTE
NOTE_MODE:	    BYTE				    ; 1	= Note mode, 0 = Sfx mode
FREQ_MOD:	    BYTE				    ; 3	= Detune, 2 = On, 0 = Attack done
INSTRUMENT:	    BYTE
INSTRUMENT_L:	    BYTE
INSTRUMENT_H:	    BYTE
INSTRUMENT_CNT:	    BYTE
INSTRUMENT_LENGHT:  BYTE
FREQ_LOW:	    BYTE
FREQ_HIGH:	    BYTE
VOLUME:		    BYTE				    ; Envelope wave shape
RETURN_L:	    BYTE
RETURN_H:	    BYTE
VIBRATO_WAIT:	    BYTE				    ; Timer for	vibrato	iteration
VIBRATO_CLK:	    BYTE				    ; Add or substract frequency offset
VIBRATO_CFG:	    BYTE				    ; #xy: X = Speed/iterations	delay, Y = Freq. offset
field_1D:	    BYTE
field_1E:	    BYTE
field_1F:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	DOOR		    ; (sizeof=0x10)
ID:		    BYTE
CLOSED:		    BYTE				    ; 0=Open, 1=Closed
OPEN_LOGIC_ID:	    BYTE				    ; (Card x, event, bomb...)
RENDER_TYPE:	    BYTE				    ; Door, wall...
OPEN_CNT:	    BYTE				    ; Counter used in opening
DRAW_Y:		    BYTE
DRAW_X:		    BYTE
Y:		    BYTE
NY:		    BYTE
X:		    BYTE
NX:		    BYTE
field_B:	    BYTE
field_C:	    BYTE
field_D:	    BYTE
field_E:	    BYTE
DEST_ROOM:	    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	ITEM		    ; (sizeof=0x4)		    ; ...
ID:		    BYTE
status:		    BYTE				    ; bit0=size	32x16/16x16
Y:		    BYTE
X:		    BYTE
	ENDS

; ---------------------------------------------------------------------------

	STRUCT	PLAYER_SHOT	    ; (sizeof=0x2B)		    ; ...
ID:		    BYTE				    ; FF = Remove actor	and release sprites
status:		    BYTE
Timer:		    BYTE
Ydec:		    BYTE
Y:		    BYTE
Xdec:		    BYTE
X:		    BYTE
speedYdec:	    BYTE
speedY:		    BYTE
speedXdec:	    BYTE
speedX:		    BYTE
SpriteID:	    BYTE				    ; Bullet, grenade...
Direction:	    BYTE
Ydec_Alt:	    BYTE
Y_Alt:		    BYTE				    ; Same Y used by the player
KILL_BY_CONTACT:    BYTE
field_10:	    BYTE
Direction_:	    BYTE
field_12:	    BYTE
Counter:	    BYTE
field_14:	    BYTE
field_15:	    BYTE
field_16:	    BYTE
field_17:	    BYTE
field_18:	    BYTE
field_19:	    BYTE
field_1A:	    BYTE
field_1B:	    BYTE
field_1C:	    BYTE
field_1D:	    BYTE
field_1E:	    BYTE
field_1F:	    BYTE
NumSprites:	    BYTE
SprLayer:	    BYTE
Spr1Y:		    BYTE
Spr1X:		    BYTE
Spr1Pattern:	    BYTE
Spr1Color:	    BYTE
SprLayer2:	    BYTE
Spr2Y:		    BYTE
Spr2X:		    BYTE
Spr2Pattern:	    BYTE
Spr2Color:	    BYTE
	ENDS
