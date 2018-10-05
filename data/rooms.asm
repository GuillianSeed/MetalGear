;----------------------------------------------------------------------------
;
; Rooms	index
;
;----------------------------------------------------------------------------

idxRooms:	    dw Room000
		    dw Room001
		    dw Room002
		    dw Room003
		    dw Room004
		    dw Room005
		    dw Room006
		    dw Room007
		    dw Room008
		    dw Room009
		    dw Room010
		    dw Room011
		    dw Room012
		    dw Room013
		    dw Room014
		    dw Room015
		    dw Room016
		    dw Room017
		    dw Room018
		    dw Room019
		    dw Room020
		    dw Room021
		    dw Room022
		    dw Room023
		    dw Room024
		    dw Room025
		    dw Room026
		    dw Room027
		    dw Room028
		    dw Room029
		    dw Room030
		    dw Room031
		    dw Room032
		    dw Room033
		    dw Room034
		    dw Room035
		    dw Room036
		    dw Room037
		    dw Room038
		    dw Room039
		    dw Room040
		    dw Room041
		    dw Room042
		    dw Room043
		    dw Room044
		    dw Room045
		    dw Room046
		    dw Room047
		    dw Room048
		    dw Room049
		    dw Room050
		    dw Room051
		    dw Room052
		    dw Room053
		    dw Room054
		    dw Room055
		    dw Room056
		    dw Room057
		    dw Room058
		    dw Room059
		    dw Room060
		    dw Room061
		    dw Room062
		    dw Room063
		    dw Room064
		    dw Room065
		    dw Room066
		    dw Room067
		    dw Room068
		    dw Room069
		    dw Room070
		    dw Room071
		    dw Room072
		    dw Room073
		    dw Room074
		    dw Room075
		    dw Room076
		    dw Room077
		    dw Room078
		    dw Room079
		    dw Room080
		    dw Room081
		    dw Room082
		    dw Room083
		    dw Room084
		    dw Room085
		    dw Room086
		    dw Room087
		    dw Room088
		    dw Room089
		    dw Room090
		    dw Room091
		    dw Room092
		    dw Room093
		    dw Room094
		    dw Room095
		    dw Room096
		    dw Room097
		    dw Room098
		    dw Room099
		    dw Room100
		    dw Room101
		    dw Room102
		    dw Room103
		    dw Room104
		    dw Room105
		    dw Room106
		    dw Room107
		    dw Room108
		    dw Room109
		    dw Room110
		    dw Room111
		    dw Room112
		    dw Room113
		    dw Room114
		    dw Room115
		    dw Room116
		    dw Room117
		    dw Room118
		    dw Room119
		    dw Room066
		    dw Room121
		    dw Room122
		    dw Room123
		    dw Room124
		    dw Room125
		    dw RoomLorry
		    dw RoomLorry
		    dw RoomLorry
		    dw RoomCell
		    dw RoomLorry
		    dw RoomLorry
		    dw RoomLorry
		    dw RoomCell
		    dw RoomCell2
		    dw RoomLorry
		    dw RoomCell2
		    dw Room137
		    dw Room138
		    dw RoomTableS
		    dw RoomTableE
		    dw Room141
		    dw Room142
		    dw RoomCell
		    dw RoomCell
		    dw RoomCell
		    dw RoomCell2
		    dw RoomTableE
		    dw Room148
		    dw Room149
		    dw Room150
		    dw Room151
		    dw Room137
		    dw Room153
		    dw Room154
		    dw RoomUndefined
		    dw RoomTableS
		    dw RoomTableS
		    dw RoomTableS
		    dw Room159
		    dw RoomTableS
		    dw Room161
		    dw Room137
		    dw RoomTableS
		    dw Room164
		    dw RoomCellW
		    dw Room166
		    dw RoomCellW
		    dw Room168
		    dw Room169
		    dw RoomTableE
		    dw Room168
		    dw Room172
		    dw RoomLorry
		    dw RoomLorry
		    dw RoomLorry
		    dw RoomTableS
		    dw RoomTableS
		    dw Room178
		    dw Room151
		    dw RoomCellS
		    dw RoomTableS
		    dw RoomCell
		    dw RoomTableS
		    dw RoomTableS
		    dw RoomTableS
		    dw Room186
		    dw RoomTableS
		    dw Room149
		    dw Room189
		    dw RoomCell
		    dw Room191
		    dw RoomTableS
		    dw Room193
		    dw RoomCellS
		    dw RoomCellS
		    dw RoomTableS
		    dw RoomTableS
		    dw Room186
		    dw RoomLorry
		    dw Room172
		    dw Room201
		    dw RoomCell
		    dw Room203
		    dw Room204
		    dw Room205
		    dw Room206
		    dw Room154
		    dw Room103
		    dw Room103
		    dw Room103
		    dw Room106
		    dw Room106
		    dw RoomLorry
		    dw RoomLorry
		    dw RoomLorry
		    dw RoomLorry
		    dw RoomLorry
		    dw RoomLorry
		    dw RoomLorry
		    dw Room220
		    dw Room221
		    dw RoomUndefined
		    dw RoomUndefined
		    dw Room224
		    dw Room225
		    dw Room226
		    dw RoomUndefined
		    dw RoomUndefined
		    dw RoomUndefined
		    dw RoomUndefined
		    dw RoomUndefined
		    dw RoomUndefined
		    dw RoomUndefined
		    dw RoomUndefined
		    dw RoomUndefined
		    dw RoomUndefined
		    dw RoomUndefined
		    dw RoomUndefined
		    dw RoomUndefined
		    dw Room240
		    dw Room241
		    dw Room242
		    dw Room243
		    dw Room244
		    dw Room243
		    dw Room244
		    dw Room247
		    dw Room248
		    dw Room248
		    dw Room250


RoomUndefined:

;----------------------------------------------------------------------------
;
; Metatile sets	used in	rooms
; Each nibble defines a	metatileset
;
;----------------------------------------------------------------------------
MetaTileSetIDs:	    db	11h, 11h, 11h, 11h, 11h, 11h, 11h, 11h,	11h, 11h, 11h, 11h, 11h, 11h, 11h, 11h
		    db	11h, 11h, 11h, 11h, 33h, 33h, 31h, 13h,	33h, 63h, 33h, 22h, 22h, 22h, 22h, 22h ;
		    db	22h, 22h, 22h, 11h, 11h, 11h, 11h, 11h,	11h, 11h, 11h, 11h, 33h, 33h, 32h, 22h ;
		    db	22h, 22h, 22h, 22h, 21h, 11h, 11h, 12h,	22h, 22h, 23h, 11h, 21h, 52h, 22h, 55h ;
		    db	55h, 55h, 55h, 55h, 55h, 55h, 55h, 55h,	55h, 55h, 55h, 55h, 55h, 55h, 55h, 55h ;
		    db	55h, 55h, 55h, 55h, 55h, 55h, 55h, 55h,	55h, 55h, 55h, 55h, 55h, 55h, 55h, 55h ;
		    db	55h, 55h, 55h, 55h, 55h, 55h, 45h, 55h,	22h, 21h, 15h, 55h, 55h, 55h, 22h, 20h ; Room 222 seems	was a dark room
		    db	44h, 40h,   0,	 0,   0,   0,	0,   0,	44h, 44h, 44h, 44h, 44h, 47h

;----------------------------------------------------------------------------
;
; Metatile sets	index
;
;----------------------------------------------------------------------------
idxMetatileSet:	    dw Metatiles1
		    dw Metatiles2
		    dw Metatiles3
		    dw Metatiles4
		    dw Metatiles5
		    dw Metatiles6


;----------------------------------------------------------------------------
;
; Rooms: 8x6 metatiles
;
;----------------------------------------------------------------------------
Room000:	    db	19h,   7,   7,	 7,   7,   7, 1Ch, 0Bh
		    db	19h, 78h, 79h, 75h, 80h, 75h, 75h, 88h
		    db	19h, 7Ch, 7Dh, 1Fh, 81h, 1Eh, 1Fh, 88h
		    db	19h, 78h, 79h, 78h, 79h, 80h,	7, 89h
		    db	19h, 7Ch, 7Dh, 7Ch,   6, 59h,	7, 1Ah
		    db	0Ch, 0Dh, 0Dh,	 7, 1Ah, 66h, 0Dh, 0Dh

Room001:	    db	21h, 19h,   7,	 7,   7,   7, 14h, 20h
		    db	25h, 19h, 75h, 75h, 75h, 75h, 8Ch, 24h
		    db	21h, 19h, 1Eh, 75h, 75h, 69h, 8Eh,   9
		    db	25h, 19h,   7, 1Eh, 1Fh, 81h, 1Ah, 1Fh
		    db	  8, 1Dh, 75h, 75h, 75h, 75h, 18h, 0Dh
		    db	17h, 1Bh, 1Eh, 1Fh, 1Fh, 1Fh, 2Ah, 20h

Room002:	    db	25h, 19h, 7Ch,	 6, 80h, 14h, 24h, 25h
		    db	  8, 1Dh,   7, 1Ah, 81h, 1Ch, 0Bh, 20h
		    db	17h, 1Bh,   7, 75h, 80h, 3Eh, 3Fh, 24h
		    db	19h, 75h, 80h, 1Eh, 81h, 10h, 24h, 25h
		    db	0Ch, 90h, 81h, 75h, 75h, 87h, 0Bh, 20h
		    db	21h, 11h,   7, 1Eh, 1Fh, 86h, 0Eh, 24h

Room003:	    db	  8,   9, 0Ah,	 1, 82h, 0Ah,	9, 0Ah
		    db	17h, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh
		    db	19h, 78h, 79h, 78h, 79h, 78h, 79h, 75h
		    db	19h, 7Ch, 7Dh, 7Ch, 7Dh, 7Ch, 7Dh, 75h
		    db	0Ch, 13h,   7,	 7,   7,   7,	7, 1Eh
		    db	21h, 11h, 78h, 79h, 80h,0C5h, 0Dh, 0Dh


Room004:	    db	25h,   8, 0Ah,	 9, 0Ah,   9,	9, 0Ah
		    db	21h, 17h, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh
		    db	25h, 19h, 78h, 79h, 80h, 78h, 79h, 80h
		    db	0Ah, 1Dh, 7Ch, 7Dh, 81h, 7Ch, 7Dh, 81h
		    db	1Fh, 1Bh,   7,	 7,   7,   7,	7,   7
		    db	0Dh, 8Ah, 8Ah, 8Ah, 8Ah, 8Ah, 8Ah, 8Bh


Room005:	    db	2Bh, 30h, 30h, 30h, 30h, 30h, 30h, 33h
		    db	2Bh, 7Bh, 38h, 30h, 30h, 7Bh, 38h, 33h
		    db	2Fh, 7Fh, 39h, 7Bh, 38h, 7Fh, 39h, 33h
		    db	36h, 83h, 84h, 7Fh, 39h, 83h, 84h, 33h
		    db	73h, 30h, 30h, 83h, 84h, 30h, 30h, 33h
		    db	72h, 2Ch, 2Ch, 2Ch, 2Ch, 2Ch, 2Ch, 3Ah


Room006:	    db	20h, 21h,   8,	 9, 0Ah,   9,	1, 0Ah
		    db	24h, 25h, 41h, 37h, 37h, 37h, 37h, 37h
		    db	  8,   1, 2Fh, 30h, 30h, 30h, 30h, 30h
		    db	41h, 37h, 36h, 30h, 30h, 30h, 30h, 30h
		    db	40h, 31h, 31h, 31h, 31h, 31h, 31h, 32h
		    db	41h, 37h, 37h, 37h, 37h, 37h, 37h, 34h


Room007:	    db	43h, 43h, 43h, 43h, 43h, 43h, 43h, 0Bh
		    db	1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 0Eh
		    db	75h, 80h, 7Ah, 7Ah, 80h, 75h, 80h, 14h
		    db	75h, 7Ah, 7Eh, 7Eh, 59h, 75h, 59h,   4
		    db	1Fh, 7Eh, 69h, 1Fh, 81h, 75h, 59h,   5
		    db	0Dh, 50h, 66h, 0Dh, 0Dh, 50h, 81h, 0Fh


Room008:	    db	  9, 0Bh, 20h, 21h,   8,   9, 0Ah,   9
		    db	1Fh, 0Eh, 24h, 25h, 17h, 1Fh, 1Fh, 75h
		    db	  7, 1Ch,   1, 0Bh, 19h, 78h, 79h, 75h
		    db	  7, 1Ah, 1Fh, 0Eh, 19h, 7Ch, 7Dh, 75h
		    db	  7,   7,   7, 14h, 19h,   7,	7, 1Eh
		    db	0Dh, 0Dh, 0Dh, 0Fh, 0Ch, 0Dh, 0Dh, 0Dh


Room009:	    db	3Dh, 30h, 30h, 30h, 30h, 30h, 30h, 26h
		    db	3Dh, 30h, 30h, 30h, 30h, 30h, 30h, 26h
		    db	3Dh, 7Bh, 38h, 30h, 30h, 7Bh, 38h, 26h
		    db	3Dh, 7Fh, 39h, 30h, 30h, 7Fh, 39h, 26h
		    db	3Dh, 83h, 84h, 30h, 30h, 83h, 84h, 26h
		    db	3Bh, 2Ch, 2Ch, 2Ch, 2Ch, 2Ch, 2Ch, 29h


Room010:	    db	  9, 0Ah, 0Bh, 24h,0B5h, 25h,	8, 0Bh
		    db	37h, 37h, 42h, 24h,0B5h, 25h, 41h, 42h
		    db	30h, 30h, 2Eh,	 9,   1, 0Ah, 2Fh, 26h
		    db	30h, 30h, 35h, 37h, 37h, 37h, 36h, 26h
		    db	3Ch, 30h, 30h, 30h, 30h, 30h, 30h, 26h
		    db	3Dh, 30h, 30h, 30h, 30h, 30h, 30h, 26h


Room011:	    db	  8,   9, 0Ah,	 1,   9, 0Ah,	9, 0Ah
		    db	17h, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh
		    db	19h, 75h, 80h,	 7,   7,   7, 75h, 80h
		    db	  2, 75h, 59h,	 7,   7,   7, 75h, 59h
		    db	  3, 75h, 59h,	 7,   7,   7, 75h, 59h
		    db	0Ch, 50h, 66h, 0Dh, 0Dh, 0Dh, 50h, 66h


Room012:	    db	0Ah,   9, 1Dh,	 7,   7,   7, 14h, 20h
		    db	75h, 69h, 78h, 79h, 78h, 79h, 8Ch, 24h
		    db	75h, 59h, 7Ch, 7Dh, 7Ch, 7Dh, 8Eh, 0Bh
		    db	75h, 59h,   7,	 7,   7,   7, 1Ah, 0Eh
		    db	1Fh, 81h, 75h, 80h, 75h, 75h, 75h, 8Ch
		    db	0Dh, 0Dh, 8Ah, 57h, 50h, 51h, 51h, 16h


Room013:	    db	20h, 21h, 19h, 75h, 87h, 0Bh, 24h, 25h
		    db	21h, 25h, 19h, 1Eh, 86h, 0Eh, 20h, 21h
		    db	25h,   8, 1Dh, 75h, 80h,   4, 24h, 25h
		    db	21h, 8Fh, 1Bh, 1Eh, 81h,   5, 24h, 25h
		    db	25h,   3,   7, 75h, 75h, 87h, 0Bh, 20h
		    db	20h, 21h, 11h, 1Eh, 1Fh, 86h, 0Eh, 24h


Room014:	    db	20h, 21h, 15h,	 7,   7, 14h, 20h, 21h
		    db	24h, 25h, 19h,	 7, 75h, 8Ch, 24h, 25h
		    db	20h, 21h,   2, 75h, 69h, 92h, 20h, 21h
		    db	24h, 25h,   3, 1Eh, 91h, 0Fh, 24h, 25h
		    db	20h, 21h, 19h,	 7, 10h, 20h, 21h, 20h
		    db	24h, 25h, 19h, 75h, 8Ch, 24h, 25h, 24h


Room015:	    db	  9, 0Ah,   9, 0Ah,   1, 82h, 0Ah, 0Bh
		    db	1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 0Eh
		    db	  7, 78h, 79h, 78h, 79h, 78h, 79h, 8Ch
		    db	  7, 7Ch, 7Dh, 7Ch, 7Dh, 7Ch,	6,0C2h
		    db	  7,   7,   7,	 7,   7, 12h, 77h, 16h
		    db	0Dh, 0Dh,0C7h,	 7,   7, 10h, 20h, 21h


Room121:	    db	  9, 43h, 43h,0B3h,0B3h, 43h, 43h,   9
		    db	79h, 78h, 79h, 69h, 1Fh, 78h, 79h, 78h
		    db	  6, 7Ch, 7Dh, 81h,   7, 7Ch, 7Dh, 7Ch
		    db	31h, 31h, 31h, 31h, 31h, 31h, 31h, 31h
		    db	75h, 75h, 52h, 52h, 52h, 52h, 52h, 75h
		    db	68h, 68h, 56h, 56h, 56h, 56h, 56h, 68h


Room058:	    db	19h, 1Ch, 1Dh, 14h, 19h, 1Ch, 0Ah,   9
		    db	19h, 20h, 21h, 18h, 0Ch, 1Ah, 16h, 16h
		    db	  2, 10h, 11h, 1Ch,   9,   9, 0Ah,   9
		    db	  3, 18h, 1Fh, 1Ah, 16h, 16h, 16h, 16h
		    db	19h, 1Ch,   9,	 9, 0Ah,   9, 0Ah,   9
		    db	0Ch, 1Ah, 16h, 16h, 16h, 25h, 16h, 16h


Room061:	    db	0Ah,   9, 1Dh, 14h, 19h, 14h, 19h, 14h
		    db	16h, 16h, 17h, 0Fh, 1Bh, 14h, 19h, 14h
		    db	  9, 0Ah,   9, 0Ah, 1Dh, 14h, 19h, 14h
		    db	16h, 16h, 16h, 16h, 17h, 0Fh, 1Bh, 14h
		    db	  9, 0Ah,   9, 0Ah,   9, 0Ah, 1Dh, 14h
		    db	16h, 16h, 16h, 25h, 16h, 16h, 17h, 0Fh


Room059:	    db	19h, 14h, 19h, 14h, 19h, 14h, 2Ch, 2Ch
		    db	1Dh, 14h, 19h, 14h, 19h, 14h, 2Ch, 2Ch
		    db	21h, 14h, 19h, 14h, 19h, 14h, 2Ch, 2Ch
		    db	11h, 14h, 19h, 14h, 19h, 14h, 28h, 28h
		    db	15h, 14h, 19h, 14h, 19h, 14h,	8,   9
		    db	19h, 14h, 19h, 14h, 19h, 18h, 31h, 16h


Room062:	    db	15h, 14h, 19h, 14h, 19h, 14h, 19h, 14h
		    db	19h, 14h, 19h, 14h, 19h, 14h, 19h, 14h
		    db	  2, 14h, 19h, 14h, 19h, 14h, 19h, 14h
		    db	  3, 14h, 19h, 14h, 19h, 14h, 19h, 14h
		    db	1Dh, 14h, 19h, 14h, 19h, 14h, 19h, 14h
		    db	17h, 0Fh, 1Bh, 14h, 19h, 14h, 19h, 14h


Room060:	    db	  8,   9, 0Ah,	 9, 0Ah,   9, 0Ah,   9
		    db	1Eh, 26h, 16h, 16h, 16h, 16h, 16h, 16h
		    db	19h, 10h,   8, 0Bh,   8,   9, 0Ah,   9
		    db	19h, 14h, 1Eh, 0Eh, 1Eh, 26h, 16h, 26h
		    db	19h, 14h, 19h, 14h, 19h, 10h,	8, 2Bh
		    db	19h, 14h, 19h, 14h, 19h, 14h, 31h, 2Ah


Room063:	    db	  9, 0Ah,   9, 0Ah,   1,   9, 0Ah, 0Bh
		    db	16h, 16h, 16h, 16h, 16h, 16h, 27h, 0Eh
		    db	  9, 0Bh,   8, 0Bh,   8, 0Bh, 11h, 14h
		    db	16h, 2Dh, 1Eh, 2Eh, 2Fh, 0Eh, 15h, 14h
		    db	  9, 0Bh, 19h, 20h, 21h, 14h, 19h, 14h
		    db	70h, 0Eh, 19h, 10h, 11h, 14h, 19h, 14h


Room057:	    db	  8,   9, 0Ah,	 9, 0Ah,   9, 0Ah, 0Bh
		    db	1Eh, 25h, 25h, 25h, 25h, 25h, 25h, 0Eh
		    db	1Bh,   7,   7,	 7,   7, 4Dh, 22h,   4
		    db	1Dh,   7,   7,	 7,   7, 4Dh, 23h,   5
		    db	21h,   7,   7,	 7,   7, 4Dh, 4Dh, 60h
		    db	0Dh,   7, 0Dh, 0Dh,   7, 61h, 16h, 2Dh


Room054:	    db	  8,   9,   1, 0Ah,   9,   9, 0Ah, 0Bh
		    db	1Eh, 26h, 16h, 16h, 16h, 16h, 27h, 0Eh
		    db	19h, 10h, 2Ch, 2Ch, 2Ch, 2Ch, 11h, 18h
		    db	19h, 14h, 28h, 28h, 28h, 28h, 15h, 1Ch
		    db	19h, 1Ch,   9,	 1,   9, 0Ah, 1Dh, 20h
		    db	0Ch, 1Ah, 16h, 16h, 16h, 16h, 17h, 0Dh


Room055:	    db	19h,   7, 14h, 2Ch, 2Ch, 2Ch, 2Ch, 2Ch
		    db	19h, 4Dh, 6Dh, 2Ch, 2Ch, 2Ch, 2Ch, 2Ch
		    db	19h, 4Dh, 6Ch, 28h, 28h, 28h, 28h, 28h
		    db	19h, 4Dh, 6Bh, 0Ah,   1,   9, 0Ah, 0Bh
		    db	19h, 4Dh, 6Ah, 25h, 25h, 25h, 25h, 0Eh
		    db	0Ch, 61h, 62h, 0Dh, 0Dh, 0Dh, 0Dh, 0Fh


Room056:	    db	  8,   9, 0Ah,	 9, 0Ah,   1, 0Ah, 0Bh
		    db	1Eh, 25h, 25h, 25h, 25h, 25h, 25h, 0Eh
		    db	19h, 4Dh, 22h, 4Dh, 22h, 4Dh, 22h, 14h
		    db	19h, 4Dh, 23h, 4Dh, 23h, 4Dh, 23h, 14h
		    db	19h, 4Dh, 6Fh, 61h, 35h, 61h, 35h, 0Fh
		    db	19h,   6, 6Eh, 2Ch, 2Ch, 2Ch, 2Ch, 2Ch


Room016:	    db	97h, 98h, 98h, 98h, 9Ah, 9Bh, 0Ah, 0Bh
		    db	20h, 21h, 20h, 21h, 11h, 1Ah, 1Fh, 0Eh
		    db	24h, 25h, 24h, 25h, 15h, 75h, 80h, 14h
		    db	  8, 94h,   1,	 9, 1Dh, 75h, 59h,   4
		    db	96h, 99h, 1Fh, 1Fh, 1Bh, 1Eh, 81h,   5
		    db	97h, 98h, 0Dh, 0Dh, 0Dh, 0Dh, 0Dh, 0Fh


Room017:	    db	20h, 21h, 19h, 75h, 75h, 87h, 0Bh, 24h
		    db	24h, 25h,   2, 1Eh, 1Fh, 86h, 0Eh, 20h
		    db	20h, 21h,   3,0D3h, 75h, 80h,	4, 24h
		    db	24h, 25h, 19h, 75h, 75h, 59h,	5, 20h
		    db	  8,   9, 1Dh, 75h, 69h, 91h, 0Fh, 24h
		    db	17h, 1Fh, 1Bh, 1Eh, 81h, 10h, 20h, 21h


Room018:	    db	19h, 12h, 0Dh, 0Dh, 13h, 12h, 0Dh, 0Fh
		    db	19h, 10h, 24h, 25h, 11h, 10h, 20h, 21h
		    db	19h, 88h,   8,	 9, 9Fh, 88h, 24h, 25h
		    db	19h,0C9h, 9Eh, 1Fh, 1Bh, 89h, 0Bh, 20h
		    db	0Ch, 50h, 9Dh,0D3h, 75h,0C8h, 3Fh, 24h
		    db	20h, 21h, 11h, 75h, 75h,0A0h, 20h, 21h


Room019:	    db	20h, 21h, 20h, 21h, 20h, 21h, 20h, 21h
		    db	24h, 25h, 24h, 25h, 24h, 25h, 24h, 25h
		    db	  8,   9, 0Ah,	 9,   1,   9, 0Ah, 0Bh
		    db	17h, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 0Eh
		    db	19h, 75h, 75h, 75h, 75h, 75h, 75h, 8Ch
		    db	19h, 1Eh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 92h


Room020:	    db	  8,   9,   1, 0Ah,   9, 0Ah,	9, 0Bh
		    db	17h,0A1h, 67h,0A1h, 67h,0A1h, 67h, 0Eh
		    db	19h, 10h, 11h, 10h, 11h, 10h, 11h, 14h
		    db	  2, 14h, 15h, 14h, 15h, 14h, 15h,   4
		    db	  3, 1Ch, 1Dh, 1Ch, 1Dh, 1Ch, 1Dh,   5
		    db	0Ch, 77h, 85h, 77h, 85h, 77h, 85h, 0Fh


Room021:	    db	25h, 24h, 25h, 24h, 25h, 24h, 25h, 24h
		    db	20h, 21h, 20h, 21h, 20h, 21h, 20h, 21h
		    db	24h, 25h, 24h, 25h, 24h, 25h, 24h, 25h
		    db	  8,   9,   1,	 9, 0Ah,   1, 0Ah, 0Bh
		    db	17h, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh,0A2h
		    db	0Ch, 0Dh, 0Dh, 0Dh, 0Dh, 0Dh, 0Dh, 77h


Room022:	    db	  8,   9, 0Ah,	 9, 0Ah,   9, 0Ah,   9
		    db	17h,0A1h, 51h, 51h, 51h, 51h, 67h, 1Fh
		    db	19h, 10h, 20h, 21h, 20h, 21h, 11h,   7
		    db	  2, 14h, 24h, 25h, 24h, 25h, 15h,   7
		    db	  3, 1Ch, 0Ah,	 1,   9, 0Ah, 1Dh,   7
		    db	0Ch, 77h, 51h, 51h, 51h, 51h, 85h, 0Dh


Room023:	    db	21h,   8,   9, 0Ah, 0Bh,0B5h,	8, 0Ah
		    db	25h, 17h, 1Fh, 1Fh, 0Eh,0B5h, 17h,0A1h
		    db	21h,   2, 75h, 80h, 1Ch, 0Ah, 1Dh, 10h
		    db	25h,   3, 75h, 59h, 3Eh, 67h, 1Bh, 1Ch
		    db	  9, 1Dh, 75h, 59h, 10h, 11h, 12h, 77h
		    db	51h, 85h, 50h, 66h, 0Fh,0A3h,0A4h, 20h


Room024:	    db	1Dh, 1Ch,   1, 0Ah, 1Dh, 76h, 80h, 14h
		    db	1Bh, 1Ah, 1Fh, 1Fh, 1Bh, 1Eh, 81h, 14h
		    db	  7, 76h, 80h, 76h, 80h, 76h, 80h, 14h
		    db	  7, 1Eh, 81h, 1Eh, 81h, 1Eh, 81h, 14h
		    db	  7, 76h, 76h, 76h, 80h, 76h, 80h, 14h
		    db	0Dh, 50h, 51h, 51h, 66h, 50h, 66h, 0Fh


Room025:	    db	19h,   7,   7,	 7,   7,   7,	7, 14h
		    db	19h,   7, 76h, 80h,   7,   7,	7, 14h
		    db	19h,   7, 1Eh, 81h, 76h, 76h, 76h, 8Ch
		    db	19h,   7, 76h, 80h, 76h, 69h, 1Fh, 92h
		    db	19h, 12h, 50h, 66h, 90h, 81h,	7, 14h
		    db	19h, 10h, 20h, 21h, 11h, 76h, 80h, 14h


Room026:	    db	19h, 12h, 0Fh, 0Ch, 0Dh, 0Dh, 13h, 14h
		    db	19h, 10h, 24h, 25h, 24h, 25h, 11h, 14h
		    db	19h, 1Ch,   9, 0Ah,   9, 0Ah, 9Fh, 14h
		    db	19h, 1Ah, 1Fh, 1Fh, 1Fh, 1Fh, 1Bh, 14h
		    db 0ABh, 75h, 75h, 80h, 75h, 75h, 75h, 88h
		    db	17h, 1Fh, 1Fh, 81h, 1Eh, 1Fh, 1Fh, 0Eh


Room027:	    db	  9, 0Ah,   9, 0Ah,   1, 0Ah,	9, 0Bh
		    db	51h, 51h, 51h, 67h, 1Fh, 1Fh, 1Fh, 0Eh
		    db	25h, 24h, 25h, 11h,   7,   7,	7, 14h
		    db	  9, 0Ah, 0Bh, 15h, 75h, 75h, 75h, 8Ch
		    db	67h, 1Fh, 0Eh, 19h, 1Eh, 1Fh, 1Fh, 92h
		    db	11h,   7, 14h, 19h,   7,   7,	7, 14h


Room028:	    db	21h,   8,   9, 0Ah,   9, 0Ah,	1, 0Bh
		    db	25h, 8Fh, 1Fh, 1Fh, 1Fh,0A1h, 51h, 3Fh
		    db	21h,   3,   7, 75h, 75h,0CBh, 24h, 25h
		    db	25h,   2,   7, 75h, 75h,0A5h,	9, 0Ah
		    db	21h,   3,   7, 75h, 75h,0D6h, 1Fh, 1Fh
		    db	25h, 0Ch, 0Dh, 50h, 51h, 66h, 0Dh, 0Dh


Room029:	    db	  8, 0Ah,   9, 0Ah, 0Ah,   9, 0Ah, 0Bh
		    db	17h, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 0Eh
		    db	19h,   7, 75h, 75h, 75h, 75h, 80h, 14h
		    db	  2,   7, 75h, 69h, 1Fh, 1Fh, 81h, 14h
		    db	  3,   7, 75h, 59h, 75h, 75h, 75h, 88h
		    db	0Ch, 0Dh, 8Ah, 57h, 50h, 51h, 1Fh, 3Fh


Room030:	    db	24h, 25h, 19h, 14h,0B5h, 15h, 14h, 20h
		    db	21h,   8, 1Dh, 14h,0B5h,0ABh, 8Ch, 24h
		    db	25h, 17h, 1Bh, 14h,0B5h,0ABh,0CCh, 20h
		    db	21h,   2, 75h, 8Ch,0B5h,0ABh,0CDh, 24h
		    db	25h,   3, 75h,0A5h, 0Ah,0CAh,0C2h, 20h
		    db	21h, 0Ch, 50h,0A6h, 51h, 51h, 16h, 24h


Room031:	    db	20h, 21h,   8,	 1, 82h, 0Ah,	9, 0Ah
		    db	24h, 25h, 17h, 1Fh,0A1h, 51h, 67h, 75h
		    db	20h, 21h, 19h,	 7, 10h,0B5h, 11h, 1Eh
		    db	24h, 25h, 19h,	 7, 1Ch, 0Ah, 9Fh,   7
		    db	20h, 21h, 19h,	 7, 1Ah, 1Fh, 1Bh,   7
		    db	24h, 25h, 19h,0C5h, 0Dh,0C6h,0C5h, 0Dh


Room032:	    db	24h, 25h, 24h,	 8,   9, 0Ah, 0Bh, 20h
		    db	21h, 20h, 21h, 8Fh,0A1h, 67h, 0Eh, 24h
		    db	25h, 24h, 25h,	 3, 10h, 11h, 1Ch, 0Ah
		    db	0Ah,   1, 0Bh, 19h, 14h, 15h, 1Ah, 1Fh
		    db	1Fh, 1Fh, 0Eh, 19h, 1Ch, 1Dh, 75h, 80h
		    db	0Dh, 0Dh, 0Fh, 0Ch, 77h, 85h, 50h, 66h


Room033:	    db	0Ah,   9, 0Ah,	 9, 0Ah,   9, 0Ah, 0Bh
		    db	75h,0C3h, 51h, 51h, 51h, 51h, 67h, 0Eh
		    db	1Eh, 2Ah, 20h, 21h, 20h, 21h, 11h, 14h
		    db	  7, 14h, 24h, 25h, 24h, 25h, 15h,   4
		    db	  7, 1Ch,   9,	 1,   9, 0Ah, 1Dh,   5
		    db	0Dh, 77h, 51h, 51h, 51h, 51h, 85h, 0Fh


Room034:	    db	21h, 20h, 21h,	 8, 0Bh,   8, 0Bh, 20h
		    db	25h, 24h, 25h, 17h, 88h,0ABh,0C1h, 24h
		    db	  9, 0Ah, 0Ah, 1Dh,0C9h,0CAh,0A5h, 0Ah
		    db	1Fh, 1Fh, 1Fh, 1Bh, 1Eh, 1Fh, 86h, 1Fh
		    db	  7, 75h, 75h, 75h, 80h, 75h, 75h, 80h
		    db	0Dh, 50h, 8Ah,0B1h, 66h, 8Ah,0B1h, 66h


Room035:	    db	  8,   9,   1, 0Ah,   9, 0Ah,	9, 0Ah
		    db	17h,0A1h, 67h,0A1h, 51h, 51h, 67h, 75h
		    db	19h, 10h, 11h, 10h, 20h, 21h, 11h, 1Eh
		    db	  2, 88h,0ABh, 8Ch, 24h, 25h, 15h,   7
		    db	  3,0C9h,0CAh,0A5h,   9, 0Ah, 1Dh,   7
		    db	0Ch, 50h, 51h,0A6h, 51h, 51h, 85h, 0Dh


Room036:	    db	21h, 20h, 21h, 15h, 12h, 0Dh, 0Dh, 0Fh
		    db	25h, 24h, 25h,0ABh,0CBh, 25h, 24h, 25h
		    db	  9,   1,   9,0CAh,0C2h, 20h, 21h, 20h
		    db	1Fh, 1Fh, 1Fh, 1Fh, 92h, 24h, 25h, 24h
		    db	  7, 75h, 75h, 75h, 87h, 0Ah,	1, 0Bh
		    db	0Dh, 50h, 51h, 51h,0A6h, 51h, 51h, 3Fh


Room037:	    db 0AAh,0A9h, 9Bh, 94h, 0Ah,   9, 0Ah, 0Bh
		    db	19h,   7, 1Ah, 1Fh, 1Fh, 1Fh, 1Fh, 0Eh
		    db 0ABh, 75h, 75h, 75h, 75h, 75h, 80h, 14h
		    db	17h, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 81h, 14h
		    db	19h,   7,   7,	 7, 75h, 75h, 75h, 88h
		    db	0Ch, 0Dh, 0Dh,0C4h,0A8h, 99h, 99h,0A7h


Room038:	    db	25h, 15h, 88h, 24h, 25h,0ABh, 9Ch, 0Fh
		    db	  8, 1Dh, 88h, 20h, 21h,0ABh,0A0h, 20h
		    db	63h, 9Dh, 88h, 24h, 25h,0ABh,0CCh, 24h
		    db	25h, 11h,0C9h,	 9, 0Ah,0CAh,0CDh, 20h
		    db	  8, 9Fh,0ACh, 51h, 51h, 51h, 16h, 24h
		    db	17h, 1Bh, 10h, 20h, 21h, 20h, 21h, 20h


Room039:	    db	  9, 0Ah,   9, 0Ah,   1,   9, 0Ah, 0Bh
		    db	75h, 69h, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 0Eh
		    db	1Eh, 91h, 0Dh, 0Dh, 0Dh, 0Dh, 13h, 14h
		    db	  7, 10h, 24h, 25h, 24h, 25h, 11h, 14h
		    db	  7, 1Ch,   9, 0Ah,   9, 0Ah, 9Fh, 14h
		    db	0Dh,0CEh,0D0h, 51h, 51h,0D1h, 1Bh, 14h


Room040:	    db	24h, 24h, 24h, 0Bh,   9,   9,	9, 21h
		    db	24h, 24h, 24h, 20h, 26h, 26h, 26h, 0Eh
		    db	24h, 24h, 24h, 1Bh,   7, 52h, 41h, 1Fh
		    db	  8,   1, 4Eh, 19h,   7, 52h, 42h, 4Fh
		    db	0Ah, 26h, 26h, 27h,   7, 52h, 42h, 4Fh
		    db	0Ch, 0Dh, 0Dh, 0Dh, 0Dh, 54h, 55h, 50h


Room041:	    db	2Ah,   7, 14h, 24h, 24h, 24h, 15h, 22h
		    db	61h, 52h, 60h, 24h, 24h, 24h, 1Bh, 22h
		    db	62h, 26h, 63h, 24h, 24h, 24h, 1Bh, 22h
		    db	2Ah,   7,   5, 24h, 24h, 24h, 1Bh, 22h
		    db	2Ah,   7, 18h,	 9,   9,   9, 19h, 22h
		    db	28h, 23h, 2Bh, 2Ch, 2Ch, 2Ch, 2Dh, 29h


Room042:	    db	2Ah, 3Eh, 3Fh, 5Fh, 14h, 24h, 24h, 24h
		    db	2Ah,   6, 26h, 40h,   4, 24h, 24h, 24h
		    db	2Ah, 3Ch, 3Dh,	 7,   5, 24h, 24h, 24h
		    db	2Ah, 3Eh, 3Fh, 5Fh, 18h,   9,	9, 21h
		    db	2Ah,   6, 26h, 40h, 25h, 26h, 26h, 0Eh
		    db	2Ah,   7, 67h, 23h, 23h, 23h, 68h, 22h


Room043:	    db	12h, 13h, 13h, 13h, 13h, 13h, 13h, 13h
		    db	16h, 17h, 17h, 17h, 17h, 17h, 17h, 17h
		    db	2Ah, 3Ch, 3Dh,	 7,   7, 3Ch, 3Dh,   7
		    db	2Ah, 3Eh, 3Fh, 5Fh,   7, 3Eh, 3Fh, 5Fh
		    db	2Ah,   6, 26h, 40h, 1Ch, 44h, 2Ch, 43h
		    db	2Ah, 3Ch, 3Dh,	 7, 10h, 24h, 24h, 24h


Room044:	    db	12h, 13h, 13h, 13h,   7, 13h, 13h, 13h
		    db	16h, 17h, 17h, 17h,   7, 17h, 17h, 17h
		    db	36h, 3Ch, 3Dh,	 7, 3Ch, 3Dh,	7, 3Ch
		    db	37h, 3Eh, 3Fh, 5Fh, 3Eh, 3Fh, 5Fh, 3Eh
		    db	  7,   6, 26h, 40h,   6, 26h, 40h,   6
		    db	0Dh, 0Dh, 0Dh, 0Dh, 0Dh, 0Dh, 0Dh, 0Dh


Room047:	    db	13h, 13h, 13h, 13h, 13h, 13h, 13h, 13h
		    db	17h, 17h, 17h, 17h, 17h, 17h, 17h, 17h
		    db	  7,   7, 53h, 41h, 52h, 41h, 52h, 41h
		    db	  7,   7,   6, 40h,   6, 40h,	6, 40h
		    db	23h, 1Dh,   7, 52h, 41h, 53h, 41h,   7
		    db	24h, 2Eh, 0Dh, 54h, 40h, 54h, 55h, 0Dh


Room048:	    db	13h, 13h, 13h, 13h, 13h, 13h, 13h, 13h
		    db	17h, 17h, 17h, 17h, 17h, 17h, 17h, 17h
		    db	3Dh,   7, 3Ch, 3Dh,   7, 3Ch, 3Dh,   7
		    db	3Fh, 5Fh, 3Eh, 3Fh, 5Fh, 3Eh, 3Fh, 5Fh
		    db	26h, 40h,   6, 26h, 40h,   6, 26h, 40h
		    db	0Dh, 0Dh, 0Dh, 0Dh, 0Dh, 0Dh, 0Dh, 0Dh


Room049:	    db	13h, 13h, 13h, 13h, 13h, 13h, 13h, 38h
		    db	17h, 33h, 34h, 17h, 17h, 33h, 34h, 0Fh
		    db	  7, 10h, 11h, 1Ch, 1Dh, 10h, 11h, 18h
		    db	  7, 14h, 15h, 10h, 11h, 14h, 15h, 25h
		    db	  7, 18h, 19h, 18h, 32h, 18h, 19h,   7
		    db	0Dh, 30h, 31h, 30h, 31h, 30h, 31h, 0Dh


Room051:	    db	2Ah, 3Eh, 3Fh, 5Fh, 14h, 24h, 24h, 24h
		    db	28h, 44h, 2Ch, 45h, 14h, 24h, 24h, 24h
		    db	  8,   9, 38h, 11h, 18h,   9,	1, 21h
		    db	39h, 26h, 0Fh, 3Ah, 2Bh, 2Ch, 2Ch, 3Bh
		    db	37h,   7, 18h,	 9,   9,   9,	9, 21h
		    db	57h, 23h, 25h, 26h, 26h, 26h, 26h, 0Eh


Room052:	    db	2Ah, 3Eh, 3Fh, 5Fh, 3Eh, 3Fh, 5Fh, 22h
		    db	2Ah,   6, 26h, 40h,   6, 26h, 40h, 22h
		    db	2Ah, 3Ch, 3Dh,	 7, 3Ch, 3Dh,	7, 22h
		    db	2Ah, 3Eh, 3Fh, 5Fh, 3Eh, 3Fh, 5Fh, 22h
		    db	2Ah,   6, 26h, 40h,   6, 26h, 40h, 22h
		    db	2Ah, 3Ch, 3Dh,	 7, 67h, 23h, 23h, 29h


Room053:	    db	24h, 24h, 24h, 0Bh,   1, 51h, 0Bh, 1Ah
		    db	24h, 24h, 24h, 20h, 26h, 0Fh, 20h, 1Eh
		    db	  9,   9,   9, 19h,   7, 18h, 19h, 22h
		    db	26h, 26h, 26h, 27h,   7, 25h, 27h, 22h
		    db	  7,   7,   7,	 7,   7,   7,	7, 22h
		    db	58h, 3Ch, 3Dh,	 7, 3Ch, 3Dh,	7, 22h


Room046:	    db 0B3h,0B3h,0B3h,0B3h,0B4h,0B3h,0B3h,0B3h
		    db 0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h
		    db 0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h
		    db 0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h
		    db 0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h
		    db 0B3h,0B3h,0B3h,0B4h,0B3h,0B3h,0B3h,0B3h


Room045:	    db 0B3h,0B3h,0B3h,0B4h,0B3h,0B3h,0B3h,0B3h
		    db 0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h
		    db 0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h
		    db 0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h
		    db 0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h,0B3h
		    db 0B3h,0B3h,0B3h,0B3h,0B4h,0B3h,0B3h,0B3h


Room117:	    db	6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 6Ah
		    db	6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 6Ah
		    db	6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 6Ah
		    db	6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 13h
		    db	6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 17h
		    db	6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 6Ah, 13h


Room240:	    db	  1,   1, 0Fh, 10h, 0Ah, 0Ah, 0Ah, 0Ah
		    db	  1,   1,   2,	 4,   9,   8,	8,   8
		    db	  1,   1,   2,	 4,   5,   1,	1,   1
		    db	  1,   1,   2,	 4, 0Ch,   1,	1,   1
		    db	  1,   1,   2,	 4, 0Ah, 0Ah, 0Bh, 0Bh
		    db	  1,   1,   6,	 7,   8,   8,	8,   8


Room241:	    db	  1,   1,   2,	 4, 0Ah, 0Ah, 0Ah, 0Ah
		    db	  1,   1,   2,	 4,   9,   8,	8,   8
		    db	  1,   1,   2,	 4, 0Ah, 0Bh, 0Bh, 0Bh
		    db	  1,   1,   2,	 4,   9,   8,	8,   8
		    db	  1,   1,   2,	 4, 0Ah, 0Bh, 0Bh, 0Bh
		    db	  1,   1, 0Dh,	 7,   8,   8,	8,   8


Room242:	    db	  1,   1,   1,	 1,   1,   1,	1,   1
		    db	  1,   1,   1,	 1,   1,   1,	1,   1
		    db	  1,   1, 0Fh, 10h, 0Ah, 0Ah, 0Ah, 0Ah
		    db	  1,   1, 0Eh,	 4,   9,   8,	8,   8
		    db	  1,   1,   2,	 4, 0Ah, 0Ah, 0Ah, 0Ah
		    db	  1,   1,   2,	 4,   9,   8,	8,   8


Room243:	    db	  1,   1,   2,	 4, 0Ah, 0Ah, 0Ah, 0Ah
		    db	  1,   1,   2,	 4,   9,   8,	8,   8
		    db	  1,   1,   2,	 4, 0Ah, 0Ah, 0Ah, 0Ah
		    db	  1,   1,   2,	 4,   9,   8,	8,   8
		    db	  1,   1,   2,	 4, 0Ah, 0Ah, 0Ah, 0Ah
		    db	  1,   1, 0Dh,	 7,   8,   8,	8,   8


Room244:	    db	  1,   1,   1,	 1,   1,   1,	1,   1
		    db	  1,   1,   1,	 1,   1,   1,	1,   1
		    db	  1,   1,   1,	 1,   1,   1,	1,   1
		    db	  1,   1,   1,	 1,   1,   1,	1,   1
		    db	  1,   1, 0Fh, 10h, 0Ah, 0Ah, 0Ah, 0Ah
		    db	  1,   1, 0Eh,	 4,   9,   8,	8,   8


Room247:	    db	  1,   1, 0Fh, 10h, 0Ah, 0Ah, 0Ah, 0Ah
		    db	  1,   1,   2,	 4,   9,   8,	8,   8
		    db	  1,   1,   2,	 4,   5,   1,	1,   1
		    db	  1,   1,   2,	 4, 0Ch,   1,	1,   1
		    db	  1,   1,   2,	 4, 0Ch,   1,	1,   1
		    db	  1,   1,   2,	 4, 0Ch,   1,	1,   1


Room248:	    db	  1,   1,   2,	 4, 0Ch,   1,	1,   1
		    db	  1,   1,   2,	 4, 0Ch,   1,	1,   1
		    db	  1,   1,   2,	 4, 0Ch,   1,	1,   1
		    db	  1,   1,   2,	 4, 0Ch,   1,	1,   1
		    db	  1,   1,   2,	 4, 0Ch,   1,	1,   1
		    db	  1,   1,   2,	 4, 0Ch,   1,	1,   1


Room250:	    db	  1,   1,   2,	 4, 0Ch,   1,	1,   1
		    db	  1,   1,   2,	 4, 0Ch,   1,	1,   1
		    db	  1,   1,   2,	 4, 0Ch,   1,	1,   1
		    db	  1,   1,   2,	 4, 0Ch,   1,	1,   1
		    db	  1,   1,   2,	 4, 0Ah, 0Ah, 0Ah, 0Ah
		    db	  1,   1, 0Dh,	 7,   8,   8,	8,   8


Room204:	    db	  1,   1,   1,	 1,   1,   1,	1,   1
		    db	  1,   1,   1,	 1,   1,   1,	1,   1
		    db	  1,   1,   1,	 1,   1,   1,	1,   1
		    db	  1,   1,   1,	 1,   1,   1,	1,   1
		    db	  1,   1,   1,	 1,   1,   1,	1,   1
		    db	  1,   1,   1,	 1,   1,   1,	1,   1


Room226:	    db	  2, 11h,   3,	 3,   3,   3,	3, 0Ch
		    db	  2, 11h,   3,	 3,   3,   3,	3, 0Ch
		    db	  2, 11h,   3,	 3,   3,   3,	3, 0Ch
		    db	  2, 11h,   3,	 3,   3,   3,	3, 0Ch
		    db	  2, 11h,   3,	 3,   3,   3,	3, 0Ch
		    db	  2, 11h,   3,	 3,   3, 12h,	3, 0Ch


Room225:	    db	  2, 11h,   3,	 3,   3, 11h,	3, 0Ch
		    db	  2, 11h,   3,	 3,   3, 11h,	3, 0Ch
		    db	  2, 11h,   3,	 3,   3, 11h,	3, 0Ch
		    db	  2, 11h,   3,	 3,   3, 11h,	3, 0Ch
		    db	  2, 11h,   3, 12h,   3, 11h,	3, 0Ch
		    db	  2, 11h,   3, 11h,   3, 11h,	3, 0Ch


Room224:	    db	  2, 11h,   3, 11h,   3, 11h,	3, 0Ch
		    db	  2, 11h,   3, 11h,   3, 11h,	3, 0Ch
		    db	  2, 11h,   3, 11h,   3, 11h,	3, 0Ch
		    db	  2, 11h,   3, 11h,   3, 11h,	3, 0Ch
		    db	  2, 11h,   3, 11h,   3, 11h,	3,   3
		    db	  1,   1,   1,	 1,   1,   1,	1,   1


Room070:	    db	  8,   1,   9,	 1, 0Ah,   1,	9, 0Ah
		    db	17h, 1Fh, 4Ah, 55h, 48h, 1Fh, 1Fh, 1Fh
		    db	19h, 45h, 47h, 54h, 5Bh, 44h, 44h, 44h
		    db	19h, 4Ch, 52h, 53h, 52h, 52h, 52h, 52h
		    db	19h, 5Ch, 5Ah, 5Ah, 5Ah, 5Ah, 5Ah, 5Ah
		    db	0Ch, 50h, 51h, 51h, 51h, 51h, 51h, 51h


Room071:	    db	20h, 21h,   8,	 1, 0Bh, 20h, 21h, 20h
		    db	24h, 25h, 17h, 1Fh, 0Eh, 24h, 25h, 24h
		    db	20h, 21h, 19h,	 7, 14h, 20h, 21h, 20h
		    db	24h, 25h, 19h,	 7, 14h, 24h, 25h, 24h
		    db	20h, 21h, 19h,	 7, 14h, 20h, 21h, 20h
		    db	24h, 25h, 0Ch,	 7, 0Fh, 24h, 25h, 24h


Room072:	    db	  8,   9, 0Ah,	 1, 82h, 0Ah,	9, 0Ah
		    db	17h, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh
		    db	19h, 76h, 80h,	 7,   7, 76h, 80h,   7
		    db	19h, 1Eh, 81h, 76h, 80h, 1Eh, 81h, 12h
		    db	19h, 76h, 80h, 1Eh, 81h, 76h, 80h, 10h
		    db	0Ch, 50h, 66h,	 7, 0Dh, 50h, 66h, 0Fh


Room073:	    db	  9, 0Ah,   9, 0Ah, 1Dh, 1Ch, 0Ah, 0Bh
		    db	1Fh, 1Fh, 1Fh, 1Fh, 1Bh, 1Ah, 1Fh, 0Eh
		    db	44h, 44h, 44h, 44h, 44h, 46h,	7, 14h
		    db	52h, 52h, 52h, 52h, 52h, 4Eh, 58h,   4
		    db	5Ah, 5Ah, 5Ah, 56h, 5Ah, 5Dh, 59h,   5
		    db	51h, 51h, 51h, 0Dh, 1Eh, 5Eh, 57h, 0Fh


Room074:	    db	19h,   7,   7,	 7, 49h, 1Ch, 0Ah,   9
		    db	5Fh, 44h, 44h,	 7, 5Bh, 60h, 61h, 61h
		    db	17h, 1Fh, 4Ch, 52h, 52h, 52h, 52h, 52h
		    db	  2,   7, 4Dh, 6Bh, 6Bh, 6Bh, 6Bh, 6Bh
		    db	  3,   7, 5Ch, 5Ah, 5Ah, 5Ah, 56h, 5Ah
		    db	0Ch, 0Dh, 50h, 51h, 64h, 65h, 0Dh, 50h


Room075:	    db	  9, 0Ah, 0Bh,	 8,   1, 0Ah,	9, 0Ah
		    db	1Fh, 1Fh, 0Eh, 63h, 51h, 51h, 51h, 51h
		    db	  7,   7, 1Ch,	 9, 0Ah, 0Bh, 20h, 21h
		    db	13h,   7, 1Ah, 1Fh, 48h, 0Eh, 24h, 25h
		    db	11h,   7,   7,	 7, 49h,   4, 20h, 21h
		    db	15h,   7,   7,	 7, 49h,   5, 24h, 25h


Room076:	    db	24h, 25h, 24h, 25h, 24h, 25h, 24h, 25h
		    db	  8,   9, 0Ah,	 9,   1,   9, 0Ah, 0Bh
		    db 0ABh,0BCh, 1Fh, 1Fh, 1Fh, 1Fh, 75h, 88h
		    db	8Fh, 1Bh,   7, 75h, 80h,   7, 75h, 88h
		    db	  3,   7,   7, 75h, 59h,   7, 75h, 88h
		    db 0BDh,0BEh, 0Dh, 50h, 66h, 0Dh, 8Ah,0BFh


Room077:	    db	1Dh, 4Bh, 54h, 6Bh, 6Bh, 4Fh, 59h, 14h
		    db	62h, 47h, 54h, 6Bh, 6Bh, 4Fh, 59h, 14h
		    db	52h, 52h, 53h, 6Bh, 56h, 4Fh, 59h, 14h
		    db	6Bh, 6Bh, 6Bh, 6Bh, 56h, 4Fh, 59h, 14h
		    db	5Ah, 5Ah, 5Ah, 5Ah, 5Ah, 5Dh, 59h, 14h
		    db	51h, 51h, 51h, 51h, 51h, 51h, 66h, 0Fh


Room078:	    db	  9, 0Ah, 0Ah,0B6h,0B7h,   9,	9, 0Bh
		    db	67h, 4Ah, 70h,0B8h,0B9h, 6Fh, 69h, 0Eh
		    db	11h, 4Bh, 6Ch, 6Bh, 6Bh, 6Eh, 59h,   4
		    db	15h, 47h, 6Ch, 6Bh, 6Bh, 6Eh, 59h,   5
		    db	19h, 1Eh, 54h, 6Bh, 6Bh, 6Eh, 59h, 14h
		    db	19h, 4Bh, 54h, 6Bh, 6Bh, 4Fh, 59h, 14h


Room093:	    db	2Ch, 2Ch, 2Ch,	 8,   9, 0Ah,	9, 0Bh
		    db	2Ch, 2Ch, 2Ch, 1Eh, 25h, 25h, 25h, 0Eh
		    db	28h, 28h, 28h, 19h, 4Dh, 22h,	7, 1Ch
		    db	  8,   1,   9, 1Dh, 4Dh, 23h,	7, 20h
		    db	1Eh, 25h, 25h, 21h, 4Dh, 4Dh, 4Dh, 69h
		    db	0Ch, 0Dh, 0Dh,	 7, 61h, 16h, 16h, 2Dh


Room094:	    db	  8,   9, 0Ah,	 9, 0Ah,   9, 0Ah,   9
		    db	1Eh, 26h, 16h, 16h, 16h, 16h, 16h, 16h
		    db	19h, 10h, 2Ch, 2Ch,   8,   9, 0Ah,   9
		    db	19h, 18h, 28h, 28h, 31h, 16h, 16h, 16h
		    db	19h, 1Ch,   1,	 9,   9,   9,	9,   9
		    db	0Ch, 1Ah, 16h, 16h, 16h, 16h, 16h, 16h


Room095:	    db	2Ch, 28h,   8,	 1, 0Bh, 28h, 28h, 28h
		    db	2Ch,   8, 2Fh, 25h, 2Eh,   9, 0Ah, 0Bh
		    db	2Ch, 1Eh, 21h,	 7, 20h, 25h, 25h, 0Eh
		    db	2Ch, 19h,   7,	 7,   7,   7,	7,   4
		    db	2Ch, 19h,   7,	 7,   7,   7,	7,   5
		    db	28h, 66h, 67h, 67h, 67h, 67h, 67h, 68h


Room096:	    db	15h, 14h, 19h, 18h, 28h, 19h, 14h, 28h
		    db	19h, 14h, 19h, 1Ch, 0Bh, 19h, 1Ch, 0Bh
		    db	1Dh, 14h, 0Ch, 33h, 0Eh, 19h, 20h, 0Eh
		    db	21h, 18h, 28h, 11h, 14h, 19h,	7,   4
		    db	11h, 1Ch,   9, 32h, 14h, 19h,	7,   5
		    db	1Fh, 1Ah, 16h, 17h, 0Fh, 0Ch, 0Dh, 0Fh


Room097:	    db	  9, 0Ah,   9, 0Ah, 1Dh, 14h,	8,   9
		    db	16h, 16h, 16h, 16h, 17h, 0Fh, 1Eh, 25h
		    db	0Ah,   9, 0Ah, 0Bh,   8,   9, 1Dh,   7
		    db	16h, 16h, 27h, 0Eh, 1Eh, 25h, 5Ah, 0Dh
		    db	0Ah, 0Bh, 11h, 14h, 19h,   7, 10h, 2Ch
		    db	70h, 0Eh, 15h, 14h, 0Ch, 71h, 14h, 2Ch


Room098:	    db	  8,   9, 0Ah,	 9, 0Ah,   9, 0Ah,   9
		    db	1Eh, 26h, 16h, 16h, 16h, 16h, 16h, 16h
		    db	19h, 10h, 2Ch, 2Ch, 28h, 28h, 28h, 28h
		    db	  2, 18h, 28h, 28h,   8,   9,	1, 0Ah
		    db	  3, 1Ch,   1, 0Bh, 1Eh, 26h, 16h, 16h
		    db	0Ch, 1Ah, 16h, 2Dh, 19h, 10h, 2Ch, 2Ch


Room099:	    db	28h, 28h, 28h, 2Ch, 2Ch,   8,	1, 0Bh
		    db	  8,   1, 0Bh, 2Ch, 2Ch, 31h, 27h, 0Eh
		    db	1Eh, 25h, 0Eh, 28h, 28h, 28h, 11h, 14h
		    db	  2,   7, 1Ch,	 9,   1, 0Ah, 32h, 14h
		    db	  3,   7, 20h, 25h, 25h, 25h, 21h, 14h
		    db	0Ch, 0Dh, 0Dh, 0Dh, 0Dh, 0Dh, 0Dh, 0Fh


Room100:	    db	0Ah,   9, 1Dh, 14h, 19h, 14h, 19h, 14h
		    db	25h, 26h, 17h, 0Fh, 1Bh, 14h, 19h, 14h
		    db	  7, 10h,   8, 0Ah, 1Dh, 14h, 19h, 14h
		    db	0Dh, 0Fh, 31h, 16h, 17h, 0Fh, 1Bh, 14h
		    db	2Ch, 2Ch, 2Ch, 2Ch, 2Ch,   8, 1Dh, 14h
		    db	2Ch, 2Ch, 2Ch, 2Ch, 2Ch, 31h, 21h, 0Fh


Room101:	    db	  9, 0Ah,   9, 0Ah,   9, 0Bh, 2Ch, 2Ch
		    db	16h, 16h, 16h, 16h, 27h, 0Eh, 28h, 28h
		    db	  8, 0Bh, 28h, 28h, 11h, 1Ch,	1, 0Bh
		    db	2Fh, 2Eh,   1, 0Bh, 15h, 20h, 25h, 0Eh
		    db	17h, 1Ah, 27h, 0Eh, 19h, 30h, 34h, 14h
		    db	2Ch, 2Ch, 11h, 14h, 19h, 10h, 11h, 14h


Room079:	    db	  8,   1, 0Bh,0ABh, 59h, 1Ch, 1Dh, 14h
		    db	17h, 1Fh, 0Eh,0ABh, 59h, 3Eh, 9Dh, 14h
		    db	19h,   7, 14h,0ABh, 59h, 10h, 11h, 14h
		    db	19h,   7, 14h,0ABh, 9Ch, 0Fh, 15h, 14h
		    db	19h,   7, 1Ch,0CAh,0A0h,   8, 1Dh, 1Ch
		    db	0Ch, 0Dh, 77h, 51h, 16h, 63h, 85h, 77h


Room080:	    db	19h, 14h,0B5h, 19h,   7, 88h, 19h, 14h
		    db	0Ch, 0Fh,0B5h, 19h,   7, 88h, 19h, 14h
		    db	  8,   9, 0Ah, 1Dh,   7, 88h, 19h, 1Ch
		    db	63h, 51h, 51h, 9Dh,   7, 88h, 0Ch, 77h
		    db	21h, 20h, 21h, 11h,   7, 88h,	8, 0Bh
		    db	25h, 24h, 25h,0ABh, 80h,0D8h, 17h, 0Eh


Room081:	    db	  8,   9, 0Ah,	 1, 0Ah,   9, 0Ah, 0Bh
		    db	17h,0A1h, 51h, 51h, 51h, 51h, 67h, 0Eh
		    db	19h, 10h, 20h, 21h, 20h, 21h, 11h, 1Ch
		    db	19h, 14h, 24h, 25h, 24h, 25h, 15h, 3Eh
		    db	19h, 14h,0B5h,	 8,   1, 0Bh, 19h, 10h
		    db	19h, 14h,0B5h, 17h, 1Fh, 88h, 19h, 14h


Room082:	    db	  8,   1, 0Bh, 20h, 21h,   8,	1, 0Bh
		    db	17h, 1Fh, 0Eh, 24h, 25h, 17h, 1Fh, 0Eh
		    db	19h,   7, 14h, 20h, 21h, 19h,	7, 1Ch
		    db	19h,   7, 14h, 24h, 25h, 19h,	7, 3Eh
		    db	1Dh,   7, 14h,	 8,   1, 1Dh,	7, 10h
		    db	85h, 0Dh, 0Fh, 63h, 51h, 85h, 0Dh, 0Fh


Room083:	    db	  8,   1,   9, 0Ah,   1,   9, 0Ah, 0Bh
		    db	17h, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 0Eh
		    db	1Dh, 75h, 75h, 75h, 75h, 75h, 75h, 8Ch
		    db	9Dh, 1Eh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh,0C0h
		    db	11h, 75h, 75h, 75h, 75h, 75h, 75h,0ADh
		    db 0A3h, 1Eh, 51h, 51h, 51h, 51h, 1Fh, 16h


Room084:	    db	  8,   9, 0Ah,	 9, 0Ah,   9, 0Ah,   9
		    db	17h, 1Fh,0A1h, 51h, 51h, 51h, 51h, 51h
		    db	1Dh,   7, 10h,	 8, 0Ah,   9, 0Ah,   9
		    db	9Dh,   7, 14h,0ABh, 69h,0A1h, 51h, 51h
		    db	11h,   7, 14h,0ABh, 59h, 10h, 20h, 21h
		    db 0A3h,   7, 0Fh, 63h, 81h,0BFh, 24h, 25h


Room085:	    db	20h, 21h, 20h, 21h, 20h, 21h, 20h, 21h
		    db	24h, 25h, 24h, 25h, 24h, 25h, 24h, 25h
		    db	  9, 0Ah,   9, 0Ah,   1,   9, 0Ah, 0Bh
		    db	51h, 67h,0BCh,0B2h, 69h, 1Fh, 1Fh, 0Eh
		    db	21h, 11h,0D2h,0D3h, 59h,   7,	7, 14h
		    db	25h,0A3h,0D7h, 77h, 66h, 0Dh, 0Dh, 0Fh


Room086:	    db	  8,   1, 0Bh, 19h, 14h, 24h, 25h, 24h
		    db 0ABh, 69h, 88h, 19h, 14h,   8,	1, 0Bh
		    db 0ABh, 59h, 88h, 19h, 14h,0ABh, 69h, 88h
		    db	8Fh, 81h, 88h, 0Ch, 0Fh,0ABh, 59h, 88h
		    db	  3,   7, 89h,	 9, 0Ah,0CAh, 59h, 88h
		    db	0Ch, 0Dh, 77h, 51h, 51h, 51h, 66h,0BFh


Room087:	    db	  9,   1, 0Bh,	 8, 0Bh,   8,	1, 0Bh
		    db	51h, 51h, 3Fh, 17h, 0Eh, 17h, 1Fh, 0Eh
		    db	  9, 0Ah,   9, 1Dh, 1Ch, 1Dh,	7, 14h
		    db	51h, 51h, 51h, 9Dh, 3Eh, 9Dh,	7, 14h
		    db	21h, 20h, 21h, 11h, 10h, 11h,	7, 14h
		    db	25h, 24h, 25h, 15h, 14h,0A3h, 0Dh, 0Fh


Room088:	    db	  8,   9,   9,	 1, 69h,   9,	9, 38h
		    db	0Ah, 46h, 2Ch, 47h, 46h, 2Ch, 47h, 0Fh
		    db	2Ah, 10h, 24h, 11h, 10h, 24h, 11h, 14h
		    db	61h, 60h, 24h, 15h, 14h, 24h, 15h, 18h
		    db	62h, 56h,   1, 19h, 18h,   9, 19h, 25h
		    db	0Ch, 30h, 48h, 31h, 30h, 48h, 31h, 0Dh


Room089:	    db	2Ah,   7, 18h,	 9,   9,   9,	9,   9
		    db	2Ah,   7, 25h, 46h, 2Ch, 2Ch, 47h, 26h
		    db	2Ah,   7,   7, 10h, 24h, 24h, 11h,   7
		    db	2Ah,   7,   7, 14h, 24h, 24h, 15h,   7
		    db	2Ah,   7,   7, 18h,   9,   1, 19h,   7
		    db	0Ch, 0Dh, 0Dh, 30h, 48h, 48h, 31h, 0Dh


Room090:	    db	  8,   9,   9,	 9,   9,   9, 19h, 22h
		    db	0Ah, 46h, 47h, 46h, 47h, 46h, 35h, 22h
		    db	2Ah, 10h, 11h, 10h, 11h, 10h, 11h, 65h
		    db	2Ah, 18h, 32h, 18h, 32h, 18h, 32h, 66h
		    db	61h, 64h, 49h, 2Bh, 2Dh, 2Bh, 2Dh, 29h
		    db	62h, 40h, 10h, 24h, 24h, 24h, 24h, 24h


Room091:	    db	0Bh,   9, 13h, 13h, 13h, 13h, 13h, 1Ah
		    db	20h, 26h, 17h, 17h, 17h, 33h, 4Ch, 4Bh
		    db	1Bh,   7, 52h, 52h, 41h, 10h, 24h, 24h
		    db	19h,   7,   6, 26h, 40h, 18h,	9, 21h
		    db	27h,   7, 52h, 53h, 4Dh, 2Bh, 47h, 0Eh
		    db	0Dh, 0Dh, 44h, 2Ch, 4Ah, 24h, 11h, 22h


Room092:	    db	  9, 59h, 59h, 59h,   1, 59h,	9, 21h
		    db	26h, 5Ah, 5Ah, 5Ah, 5Eh, 5Ah, 5Eh, 0Eh
		    db	  7, 5Bh, 5Ch, 5Ch, 5Dh, 5Bh, 5Dh, 22h
		    db	  7,   7,   7,	 7,   7,   7,	7, 22h
		    db	  7,   7,   7,	 7,   7,   7,	7, 22h
		    db	0Dh, 0Dh, 0Dh, 0Dh, 0Dh, 0Dh, 0Dh, 2Fh


Room108:	    db	0Ch, 0Dh, 0Dh, 8Ah, 57h, 13h, 12h, 0Fh
		    db	25h, 24h, 25h, 24h, 25h, 11h, 10h, 24h
		    db	  8,   9, 0Ah,	 9, 0Ah, 9Fh, 1Ch, 0Bh
		    db	8Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Bh, 1Ah, 0Eh
		    db	  3,   7,   7,	 7,   7,   7,	7, 14h
		    db	0Ch, 0Dh, 0Dh,	 7, 0Dh, 0Dh, 0Dh, 0Fh


Room109:	    db	  8,   9, 0Ah,	 1, 82h,   9, 0Ah, 0Bh
		    db	17h, 1Fh, 1Fh, 1Fh, 1Fh, 75h, 75h,0C1h
		    db	19h,   7,   7,	 7,   7, 75h, 75h, 88h
		    db	19h,   7,   7,	 7,   7, 1Eh, 75h, 88h
		    db	19h,   7,   7, 75h, 80h,   7, 1Eh, 0Eh
		    db	19h,   7,   7, 75h, 59h,   7,	7, 14h


Room110:	    db	  8,   1, 94h, 0Ah, 0Bh,   8,	1, 0Bh
		    db 0D4h,0D5h, 51h, 67h, 0Eh, 17h, 99h, 0Eh
		    db	25h, 24h, 25h, 11h, 14h, 19h,	7, 14h
		    db	  8,   9, 0Ah, 9Fh, 14h, 19h,	7, 14h
		    db	17h, 1Fh, 1Fh, 1Bh, 1Ch, 1Dh,	7, 14h
		    db	19h,   7,0A9h,0A9h, 1Ah, 1Bh,0A9h, 14h


RoomLorry:	    db	20h, 49h, 4Ah, 4Ah, 4Ah, 4Ah, 4Bh, 20h
		    db	20h, 4Dh, 4Eh, 4Eh, 54h, 55h, 4Fh, 20h
		    db	20h, 53h, 4Ch, 4Ch, 4Ch, 50h, 57h, 20h
		    db	20h, 52h, 56h, 4Ch, 4Ch, 51h, 5Bh, 20h
		    db	20h, 58h, 59h, 59h, 59h, 59h, 5Ah, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


RoomCell:	    db	20h,   8,   7,	 7,   7,   7, 0Ah, 20h
		    db	20h, 0Bh, 22h, 2Bh, 1Ch, 1Ch, 0Fh, 20h
		    db	20h, 19h, 1Ah, 24h,   6, 29h, 41h, 20h
		    db	20h, 19h,   6,	 6,   6, 29h, 32h, 20h
		    db	20h, 0Ch, 0Dh,	 6, 0Dh, 30h, 40h, 20h
		    db	20h, 20h, 1Eh, 2Ah, 1Fh, 20h, 20h, 20h


RoomCell2:	    db	20h,   8,   7,	 7,   7,   7, 0Ah, 20h
		    db	20h, 0Bh, 22h, 2Bh, 1Ch, 1Ch, 0Fh, 20h
		    db	20h, 19h, 1Ah, 24h,   6,   6,	4, 20h
		    db	20h, 19h,   6,	 6,   6,   6,	5, 20h
		    db	20h, 0Ch, 0Dh, 0Dh, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


Room148:	    db	20h,   8,   9,	 1,   9,   9, 0Ah, 20h
		    db	20h, 0Bh, 1Bh, 1Bh, 1Bh, 1Bh, 0Fh, 20h
		    db	20h, 19h,   6,	 6,   6,   6,	4, 20h
		    db	20h, 19h,   6,	 6,   6,   6,	5, 20h
		    db	20h, 0Ch, 0Dh, 0Dh, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


Room161:	    db	20h,   8,   7,	 7,   7,   7, 0Ah, 20h
		    db	20h, 0Bh, 1Ch, 1Ch, 1Ch, 1Ch, 0Fh, 20h
		    db	20h,   2,   6,	 6,   6, 29h, 41h, 20h
		    db	20h,   3,   6,	 6,   6, 29h, 32h, 20h
		    db	20h, 0Ch, 0Dh, 0Dh, 0Dh, 30h, 40h, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


Room166:	    db	20h,   8,   7,	 7,   7,   7, 0Ah, 20h
		    db	20h, 0Bh, 22h, 2Bh, 1Ch, 1Ch, 18h, 20h
		    db	20h, 19h, 1Ah, 24h,   6,   6, 12h, 20h
		    db	20h, 19h,   6,	 6,   6,   6, 10h, 20h
		    db	20h, 0Ch, 0Dh,	 6, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 1Eh, 2Ah, 1Fh, 20h, 20h, 20h


RoomCellW:	    db	20h,   8,   7,	 7,   7,   7, 0Ah, 20h
		    db	20h, 1Dh, 1Ch, 1Ch, 1Ch, 1Ch, 0Fh, 20h
		    db	20h, 13h,   6,	 6,   6, 29h, 41h, 20h
		    db	20h, 11h,   6,	 6,   6, 29h, 32h, 20h
		    db	20h, 2Ch, 0Dh, 0Dh, 0Dh, 30h, 40h, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


RoomCellS:	    db	20h,   8,   7,	 7,   7,   7, 0Ah, 20h
		    db	20h, 0Bh, 22h, 2Bh, 1Ch, 1Ch, 0Fh, 20h
		    db	20h,   2, 1Ah, 24h,   6, 29h, 41h, 20h
		    db	20h,   3,   6,	 6,   6, 29h, 32h, 20h
		    db	20h, 0Ch, 0Dh, 0Dh, 0Dh, 30h, 40h, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


Room186:	    db	20h,   8,   7,	 7,   7,   7, 0Ah, 20h
		    db	20h, 0Bh, 22h, 2Bh, 1Ch, 1Ch, 0Fh, 20h
		    db	20h, 19h, 1Ah, 24h,   6,   6, 14h, 20h
		    db	20h, 19h,   6,	 6,   6,   6, 14h, 20h
		    db	20h, 0Ch, 0Dh,	 6, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 1Eh, 2Ah, 1Fh, 20h, 20h, 20h


Room189:	    db	20h,   8,   7,	 7,   7,   7, 0Ah, 20h
		    db	20h, 0Bh, 29h, 29h, 29h, 29h, 31h, 20h
		    db	20h,   2, 29h, 2Eh, 1Bh, 29h, 32h, 20h
		    db	20h,   3, 29h, 2Fh,   6, 29h, 32h, 20h
		    db	20h, 0Ch, 30h, 24h, 2Dh, 2Dh, 33h, 20h
		    db	20h, 20h, 1Eh, 2Ah, 1Fh, 20h, 20h, 20h


Room203:	    db	20h,   8,   7,	 7,   7,   7, 0Ah, 20h
		    db	20h, 0Bh, 1Ch, 1Ch, 1Ch, 1Ch, 0Fh, 20h
		    db	20h, 19h,   6,	 6,   6,   6, 14h, 20h
		    db	20h, 19h,   6,	 6,   6,   6, 14h, 20h
		    db	20h, 0Ch, 0Dh,	 6, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 1Eh, 2Ah, 1Fh, 20h, 20h, 20h


RoomTableE:	    db	20h,   8,   9,	 9,   9,   9, 0Ah, 20h
		    db	20h, 0Bh, 21h, 34h, 1Bh, 1Bh, 0Fh, 20h
		    db	20h, 19h, 1Ah, 24h,   6,   6,	4, 20h
		    db	20h, 19h,   6,	 6,   6,   6,	5, 20h
		    db	20h, 0Ch, 0Dh, 0Dh, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


Room137:	    db	20h,   8,   9,	 9,   9,   9, 0Ah, 20h
		    db	20h, 0Bh, 21h, 34h, 1Bh, 1Bh, 0Fh, 20h
		    db	20h,   2, 1Ah, 24h,   6, 29h, 41h, 20h
		    db	20h,   3,   6,	 6,   6, 29h, 32h, 20h
		    db	20h, 0Ch, 0Dh, 0Dh, 0Dh, 30h, 40h, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


RoomTableS:	    db	20h,   8,   9,	 9,   9,   9, 0Ah, 20h
		    db	20h, 0Bh, 21h, 34h, 1Bh, 1Bh, 0Fh, 20h
		    db	20h, 19h, 1Ah, 24h,   6,   6, 14h, 20h
		    db	20h, 19h,   6,	 6,   6,   6, 14h, 20h
		    db	20h, 0Ch, 0Dh,	 6, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 1Eh, 2Ah, 1Fh, 20h, 20h, 20h


Room141:	    db	20h,   8,   9,	 9,   9,   9, 0Ah, 20h
		    db	20h, 0Bh, 1Bh, 1Bh, 1Bh, 1Bh, 36h, 20h
		    db	20h, 19h,   6,	 6,   6,   6,	5, 20h
		    db	20h, 19h,   6,	 6,   6,   6, 14h, 20h
		    db	20h, 0Ch, 0Dh,	 6, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 1Eh, 2Ah, 1Fh, 20h, 20h, 20h


Room142:	    db	20h,   8,   9,	 9,   9,   9, 0Ah, 20h
		    db	20h, 35h, 1Bh, 1Bh, 1Bh, 1Bh, 36h, 20h
		    db	20h,   3,   6,	 6,   6,   6,	5, 20h
		    db	20h, 38h, 37h, 3Ch, 39h, 37h, 3Ah, 20h
		    db	20h, 0Ch,   6, 3Dh, 3Bh,   6, 0Eh, 20h
		    db	20h, 1Eh, 2Ah, 1Fh, 1Eh, 2Ah, 1Fh, 20h


Room149:	    db	20h,   8,   9,	 9,   9,   9, 0Ah, 20h
		    db	20h, 0Bh, 21h, 34h, 1Bh, 1Bh, 0Fh, 20h
		    db	20h, 19h, 1Ah, 24h,   6,   6,	4, 20h
		    db	20h, 19h,   6,	 6,   6,   6,	5, 20h
		    db	20h, 0Ch, 0Dh,	 6, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 1Eh, 2Ah, 1Fh, 20h, 20h, 20h


Room150:	    db	  8,   9,   9,	 9,   9,   9,	9, 0Ah
		    db	0Bh, 1Bh, 1Bh, 1Bh, 1Bh, 1Bh, 1Bh, 0Fh
		    db	19h,   6, 29h, 25h, 29h, 25h,	6,   4
		    db	19h,   6, 1Ah, 24h, 1Ah, 24h,	6,   5
		    db	19h, 29h, 29h, 25h, 29h, 29h, 25h, 14h
		    db	0Ch, 30h, 3Eh, 24h, 30h, 3Eh, 42h, 0Eh


Room153:	    db	26h,   8,   9,	 9,   9,   9, 0Ah, 20h
		    db	  8, 1Dh, 1Bh, 1Bh, 1Bh, 1Bh, 0Fh, 20h
		    db	0Bh, 13h,   6,	 6,   6,   6,	4, 20h
		    db	0Ch, 17h,   6,	 6,   6,   6,	5, 20h
		    db	20h, 3Fh, 0Dh,	 6, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 1Eh, 2Ah, 1Fh, 20h, 20h, 20h


Room138:	    db	20h,   8,   9,	 9,   9,   9, 0Ah, 20h
		    db	20h, 0Bh, 21h, 34h, 1Bh, 1Bh, 0Fh, 20h
		    db	20h, 19h, 1Ah, 24h,   6,   6, 14h, 20h
		    db	20h, 19h, 29h, 29h, 29h, 29h, 41h, 20h
		    db	20h, 0Ch, 30h, 1Bh, 3Eh, 3Eh, 40h, 20h
		    db	20h, 20h, 1Eh, 2Ah, 1Fh, 20h, 20h, 20h


Room159:	    db	20h,   8,   9,	 9,   9,   9, 0Ah, 20h
		    db	20h, 0Bh, 1Bh, 1Bh, 21h, 34h, 0Fh, 20h
		    db	20h,   2, 29h, 25h, 1Ah, 29h, 41h, 20h
		    db	20h,   3, 29h, 2Fh,   6, 29h, 32h, 20h
		    db	20h, 0Ch, 30h, 42h, 0Dh, 30h, 40h, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


Room168:	    db	20h,   8,   9,	 1,   9,   9, 0Ah, 20h
		    db	20h, 0Bh, 1Bh, 1Bh, 21h, 34h, 0Fh, 20h
		    db	20h, 19h, 29h, 25h, 1Ah, 24h, 14h, 20h
		    db	20h, 19h, 29h, 2Fh,   6,   6, 14h, 20h
		    db	20h, 0Ch, 30h, 42h, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


Room169:	    db	20h,   8,   9,	 9,   9,   9, 0Ah, 20h
		    db	20h, 0Bh, 21h, 34h, 1Bh, 1Bh, 0Fh, 20h
		    db	20h, 19h, 1Ah, 24h,   6,   6, 5Ch, 20h
		    db	20h, 19h,   6,	 6,   6,   6, 12h, 20h
		    db	20h, 0Ch, 0Dh, 0Dh, 0Dh, 0Dh, 45h, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


Room172:	    db	20h,   8, 44h, 2Fh, 43h,   9, 0Ah, 20h
		    db	20h, 0Bh, 1Bh, 24h, 21h, 34h, 0Fh, 20h
		    db	20h, 19h, 29h, 25h, 1Ah, 24h, 14h, 20h
		    db	20h, 19h, 29h, 2Fh,   6,   6, 14h, 20h
		    db	20h, 0Ch, 30h, 42h, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


Room164:	    db	20h,   8,   7,	 7,   7,   7, 0Ah, 20h
		    db	20h, 0Bh, 22h, 2Bh, 1Ch, 1Ch, 18h, 20h
		    db	20h, 19h, 1Ah, 24h,   6,   6, 12h, 20h
		    db	20h, 19h,   6,	 6,   6,   6, 10h, 20h
		    db	20h, 0Ch, 0Dh,	 6, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


Room151:	    db	20h,   8,   9,	 9,   9,   9, 0Ah, 20h
		    db	20h, 0Bh, 1Bh, 1Bh, 21h, 34h, 0Fh, 20h
		    db	20h,   2,   6,	 6, 1Ah, 29h, 41h, 20h
		    db	20h,   3,   6,	 6,   6, 29h, 32h, 20h
		    db	20h, 0Ch, 0Dh, 0Dh, 0Dh, 30h, 40h, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


Room191:	    db	26h,   8,   9,	 9,   9,   9, 0Ah, 26h
		    db	  8, 1Dh, 1Bh, 1Bh, 1Bh, 1Bh, 18h, 0Ah
		    db	0Bh, 13h,   6,	 6,   6,   6, 12h, 0Fh
		    db	0Ch, 17h,   6,	 6,   6,   6, 16h, 0Eh
		    db	20h, 3Fh, 0Dh,	 6, 0Dh, 0Dh, 45h, 20h
		    db	20h, 20h, 1Eh, 2Ah, 1Fh, 20h, 20h, 20h


Room193:	    db	20h,   8,   9,	 9,   9,   9, 0Ah, 20h
		    db	20h, 47h, 5Fh, 1Bh, 1Bh, 5Dh, 46h, 20h
		    db	20h, 47h, 60h,	 6,   6, 5Eh, 46h, 20h
		    db	20h, 0Bh, 13h,	 6,   6, 12h, 0Fh, 20h
		    db	20h, 0Ch, 17h,	 6,   6, 16h, 0Eh, 20h
		    db	20h, 20h, 3Fh,	 6, 0Dh, 45h, 20h, 20h


Room201:	    db	20h,   8,   9,	 9,   9,   9, 0Ah, 20h
		    db	20h, 0Bh, 1Bh, 29h, 29h, 29h, 46h, 20h
		    db	20h, 19h,   6, 29h, 2Eh, 1Bh, 36h, 20h
		    db	20h, 19h,   6, 29h, 2Fh,   6,	5, 20h
		    db	20h, 0Ch, 0Dh, 2Dh, 2Dh, 2Dh, 48h, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


Room205:	    db	26h,   8,   9,	 9,   1,   9, 0Ah, 20h
		    db	  8, 1Dh, 1Bh, 1Bh, 1Bh, 1Bh, 0Fh, 20h
		    db	0Bh, 13h,   6,	 6,   6,   6, 14h, 20h
		    db	0Ch, 17h,   6,	 6,   6,   6, 14h, 20h
		    db	20h, 3Fh, 0Dh,	 6, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 1Eh, 2Ah, 1Fh, 20h, 20h, 20h


Room206:	    db	20h,   8,   9,	 9,   1,   9, 0Ah, 20h
		    db	20h, 0Bh, 1Bh, 1Bh, 1Bh, 1Bh, 0Fh, 20h
		    db	20h, 19h, 29h, 25h,   6, 29h, 41h, 20h
		    db	20h, 19h, 29h, 2Fh,   6, 29h, 32h, 20h
		    db	20h, 0Ch, 30h, 24h, 0Dh, 30h, 40h, 20h
		    db	20h, 20h, 1Eh, 2Ah, 1Fh, 20h, 20h, 20h


Room154:	    db	20h,   8,   9,	 9,   1,   9, 0Ah, 20h
		    db	20h, 0Bh, 1Bh, 1Bh, 1Bh, 1Bh, 0Fh, 20h
		    db	20h, 19h,   6,	 6,   6,   6, 14h, 20h
		    db	20h, 19h,   6,	 6,   6,   6, 14h, 20h
		    db	20h, 0Ch, 0Dh,	 6, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 1Eh, 2Ah, 1Fh, 20h, 20h, 20h


Room122:	    db	20h,   8,   9,	 1,   9,   9, 0Ah, 20h
		    db	20h, 0Bh, 1Bh, 1Bh, 1Bh, 1Bh, 0Fh, 20h
		    db	20h, 19h,   6,	 6,   6,   6, 14h, 20h
		    db	20h, 19h,   6,	 6,   6,   6, 14h, 20h
		    db	20h, 0Ch, 0Dh, 0Dh, 0Dh, 0Dh, 0Eh, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


Room178:	    db	20h,   8,   9,	 9,   9,   9, 0Ah, 20h
		    db	20h, 0Bh, 21h, 34h, 1Bh, 1Bh, 0Fh, 20h
		    db	20h, 19h, 1Ah, 24h,   6, 29h, 23h, 20h
		    db	20h, 19h,   6,	 6,   6, 29h, 27h, 20h
		    db	20h, 0Ch, 0Dh, 0Dh, 0Dh, 30h, 40h, 20h
		    db	20h, 20h, 20h, 20h, 20h, 20h, 20h, 20h


Room111:	    db	28h, 28h, 28h, 28h, 28h,   8,	1, 0Bh
		    db	  8, 0Ah,   9, 0Ah,   9, 2Fh, 25h, 0Eh
		    db	1Eh, 26h, 16h, 16h, 16h, 17h, 0Dh, 0Fh
		    db	19h, 10h, 28h, 28h, 28h, 28h, 28h, 28h
		    db	19h, 1Ch, 0Ah,	 9, 0Ah,   9, 0Ah,   9
		    db	0Ch, 1Ah, 16h, 16h, 16h, 16h, 16h, 16h


Room112:	    db	  8, 1Dh, 1Ch, 0Ah,   9,   1,	9, 0Bh
		    db	1Eh, 21h, 20h, 25h, 4Dh, 24h, 25h, 0Eh
		    db	19h, 4Dh, 4Dh, 4Dh, 4Dh, 23h, 4Dh, 64h
		    db	19h,   6, 25h, 25h, 25h, 62h,	6, 63h
		    db	5Bh, 4Dh, 4Dh, 4Dh, 4Dh, 4Dh, 4Dh, 64h
		    db	31h, 16h, 16h, 16h, 16h, 16h, 25h, 65h


Room113:	    db	  8,   9, 0Ah,	 9, 0Ah,   9,	1, 0Bh
		    db	1Eh, 25h, 25h, 26h, 27h, 25h, 25h, 0Eh
		    db	19h,   7,   7, 10h, 12h, 4Dh, 4Dh, 60h
		    db	19h,   7,   7, 14h, 5Bh, 24h, 25h, 60h
		    db	0Ch, 34h, 30h, 0Fh, 5Bh, 23h,	7, 60h
		    db	2Ch, 11h, 10h, 2Ch, 31h, 62h, 0Dh, 13h


Room114:	    db	  8,   1,   9, 0Ah,   9, 0Bh, 2Ch, 2Ch
		    db	31h, 16h, 27h, 25h, 25h, 0Eh, 2Ch, 2Ch
		    db	2Ch, 2Ch, 11h,	 7,   7, 14h, 2Ch, 2Ch
		    db	28h, 28h, 15h,	 7,   7, 18h, 28h, 28h
		    db	  8,   9, 1Dh,	 7,   7, 1Ch, 0Ah, 0Bh
		    db	31h, 16h, 17h, 0Dh, 0Dh, 1Ah, 25h, 2Dh


Room115:	    db	28h, 28h, 28h,	 8,   1, 0Bh, 28h, 28h
		    db	  8,   9, 0Ah, 2Fh, 25h, 2Eh, 0Ah, 0Bh
		    db	1Eh, 25h, 25h, 5Ah, 0Dh, 33h, 25h, 0Eh
		    db	1Bh,   7,   7, 10h, 28h, 11h,	7,   4
		    db	1Dh,   7,   7, 1Ch,   9, 32h,	7,   5
		    db	17h, 0Dh, 0Dh, 1Ah, 25h, 17h, 0Dh, 0Fh


Room116:	    db	  8,   9, 0Ah,	 1, 0Ah,   9, 0Ah, 0Bh
		    db	1Eh, 25h, 25h, 25h, 25h, 25h, 25h, 0Eh
		    db	5Bh, 4Dh, 4Dh, 4Dh, 4Dh, 4Dh, 22h, 14h
		    db	1Eh, 25h, 25h, 26h, 16h, 16h, 35h, 0Fh
		    db	19h,   7,   7, 10h, 2Ch, 2Ch, 2Ch, 2Ch
		    db	5Ch, 5Dh, 5Eh, 5Fh, 2Ch, 2Ch, 2Ch, 2Ch


Room118:	    db	25h, 24h,0B5h,0B5h,0B5h,0B5h, 25h, 24h
		    db	  8, 0Bh,   8,	 9, 0Ah, 0Bh,	8, 0Bh
		    db	8Fh,0A2h, 9Eh, 1Fh, 1Fh,0A2h, 9Eh, 0Eh
		    db	  3, 1Ah, 1Bh,	 7,   7, 1Ah, 1Bh, 14h
		    db	19h, 76h, 80h,	 7,   7,   7, 76h, 8Ch
		    db	0Ch,0AFh, 57h,	 7, 0Dh, 0Dh,0AFh,0B0h


Room119:	    db	  8,   1, 0Ah,	 9, 0Ah,   9, 0Ah, 0Bh
		    db	17h, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 1Fh, 0Eh
		    db	19h, 75h, 80h, 75h, 80h, 75h, 80h,   4
		    db	19h, 1Eh, 81h, 1Eh, 81h, 1Eh, 81h,   5
		    db	19h, 75h, 80h, 75h, 80h, 75h, 80h, 14h
		    db	0Ch, 50h, 66h, 50h, 66h, 50h, 66h, 0Fh


Room105:	    db	19h,   7, 71h, 6Bh, 6Bh, 6Eh, 59h, 14h
		    db	19h,   7, 71h, 6Bh, 6Bh, 6Eh, 59h, 14h
		    db	19h,   7, 71h, 6Bh, 6Bh, 6Eh, 59h, 14h
		    db	19h,   7, 71h, 6Bh, 6Bh, 6Eh, 59h, 14h
		    db	19h,   7, 71h, 6Bh, 6Bh, 6Eh, 59h, 14h
		    db	0Ch, 0Dh, 5Ch,0BAh,0BBh, 5Dh, 57h, 0Fh


Room106:	    db	19h,   7, 71h, 6Bh, 6Bh, 6Eh, 59h, 14h
		    db	19h,   7, 71h, 6Bh, 6Bh, 6Eh, 59h, 14h
		    db	19h,   7, 71h, 6Bh, 6Bh, 6Eh, 59h, 14h
		    db	19h,   7, 71h, 6Bh, 6Bh, 6Eh, 59h, 14h
		    db	19h,   7, 71h, 6Bh, 6Bh, 6Eh, 59h, 14h
		    db	19h,   7, 71h, 6Bh, 6Bh, 6Eh, 59h, 14h


Room107:	    db	19h,   7,   7,	 7,   7,   7,	7, 14h
		    db	19h,   7, 44h, 44h, 44h, 46h,	7, 14h
		    db	19h,   7, 1Eh, 74h, 52h, 4Eh, 58h, 14h
		    db	19h,   7, 45h, 54h, 56h, 4Fh, 59h, 14h
		    db	19h,   7, 4Ch, 53h, 6Bh, 6Eh, 59h, 14h
		    db	19h,   7, 71h, 6Bh, 6Bh, 6Eh, 59h, 14h


Room064:	    db	40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h
		    db	40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h
		    db	40h, 50h, 50h, 4Eh, 40h, 40h, 40h, 40h
		    db	40h, 54h, 54h, 56h, 40h, 40h, 40h, 40h
		    db	40h, 58h, 42h, 4Fh, 40h, 40h, 40h, 40h
		    db	44h, 44h, 44h, 40h, 44h, 44h, 44h, 44h


Room066:	    db	40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h
		    db	40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h
		    db	40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h
		    db	40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h
		    db	40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h
		    db	40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h


Room065:	    db	40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h
		    db	40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h
		    db	40h, 40h, 40h, 40h, 40h, 40h, 50h, 4Eh
		    db	40h, 40h, 40h, 40h, 40h, 40h, 54h, 56h
		    db	40h, 40h, 40h, 40h, 40h, 40h, 58h, 4Fh
		    db	40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h


Room067:	    db	36h, 4Bh, 2Ch, 3Bh, 40h, 3Ch, 2Ch, 3Bh
		    db	38h, 2Ch, 28h, 3Bh, 40h, 3Ah, 28h, 3Bh
		    db	4Bh, 2Ch,   8, 3Fh, 40h, 3Eh, 0Bh, 4Ah
		    db	28h, 28h, 78h, 79h, 40h, 41h, 77h, 28h
		    db	  9, 0Ah, 7Ah, 4Fh, 40h, 40h, 7Bh, 0Ah
		    db	42h, 42h, 43h, 40h, 40h, 40h, 41h, 42h


Room068:	    db	40h, 40h, 40h, 40h, 40h, 40h, 40h, 40h
		    db	44h, 44h, 44h, 37h, 40h, 40h, 40h, 36h
		    db	28h, 28h, 2Ch, 39h, 40h, 40h, 40h, 38h
		    db	0Ah, 0Bh, 2Ch, 3Dh, 40h, 36h, 44h, 4Bh
		    db	42h, 48h, 2Ch, 3Bh, 40h, 38h, 2Ch, 28h
		    db	40h, 3Ch, 2Ch, 3Bh, 40h, 3Ch, 2Ch,   8


Room069:	    db	  9, 0Ah,   9, 0Ah,   1, 0Ah,	9, 0Ah
		    db	42h, 42h, 42h, 42h, 42h, 42h, 42h, 42h
		    db	4Dh, 4Dh, 4Eh, 40h, 40h, 40h, 4Dh, 4Dh
		    db	42h, 42h, 4Fh, 40h, 40h, 40h, 58h, 42h
		    db	40h, 40h, 4Dh, 4Dh, 4Dh, 4Dh, 4Eh, 40h
		    db	40h, 40h, 58h, 42h, 42h, 42h, 4Fh, 40h


Room102:	    db	46h, 46h, 46h, 46h, 46h, 46h, 46h, 46h
		    db	46h, 46h, 46h, 46h, 46h, 46h, 46h, 46h
		    db	46h, 46h, 46h, 46h, 46h, 46h, 46h, 46h
		    db	46h, 46h, 46h, 46h, 46h, 46h, 46h, 46h
		    db	46h, 46h, 46h, 46h, 46h, 46h, 46h, 46h
		    db	45h, 45h, 45h, 45h, 46h, 45h, 45h, 45h

Room103:	    db	46h, 46h, 46h, 46h, 46h, 46h, 46h, 46h
		    db	46h, 46h, 46h, 46h, 46h, 46h, 46h, 46h
		    db	46h, 46h, 46h, 46h, 46h, 46h, 46h, 46h
		    db	46h, 46h, 46h, 46h, 46h, 46h, 46h, 46h
		    db	46h, 46h, 46h, 46h, 46h, 46h, 46h, 46h
		    db	46h, 46h, 46h, 46h, 46h, 46h, 46h, 46h


Room104:	    db	51h, 51h, 51h,	 1, 51h, 51h, 51h, 51h
		    db	55h, 55h, 55h, 29h, 55h, 55h, 55h, 55h
		    db	59h, 59h, 59h, 53h, 59h, 59h, 59h, 59h
		    db	46h, 46h, 46h, 46h, 46h, 46h, 46h, 46h
		    db	46h, 46h, 46h, 46h, 46h, 46h, 46h, 46h
		    db	46h, 46h, 46h, 46h, 46h, 46h, 46h, 46h


Room123:	    db	19h,   7,   7,	 7,   7,   7,	7, 14h
		    db	19h,   7, 4Dh, 75h, 74h, 4Dh, 22h, 14h
		    db	19h,   7, 4Dh, 76h, 74h, 4Dh, 23h, 14h
		    db	19h,   7,   6, 21h, 20h, 25h, 62h, 14h
		    db	19h,   7,   7,	 7,   7,   7,	7, 14h
		    db	66h, 67h, 67h, 67h, 67h, 22h, 67h, 68h


Room221:	    db	19h,   7,   7,	 7,   7,   7,	7, 14h
		    db	19h,   7, 74h, 4Dh, 4Dh, 75h,	7, 14h
		    db	19h,   7, 20h, 25h, 25h, 21h,	7, 14h
		    db	19h,   7,   7,	 7,   7, 74h, 4Dh, 60h
		    db	5Bh, 4Dh, 4Dh, 22h,   7, 20h, 25h, 0Eh
		    db	1Eh, 25h, 25h, 62h,   7,   7,	7, 14h


Room220:	    db	19h,   7,   7,	 7,   7,   7,	7, 14h
		    db	5Bh, 22h,   7,	 7,   7,   7,	7, 14h
		    db	5Bh, 23h,   7,	 7,   7,   7, 4Dh, 60h
		    db	5Bh, 23h,   7, 4Dh, 22h,   7,	6, 60h
		    db	5Bh, 23h,   7, 4Dh, 23h,   7,	7, 60h
		    db	1Eh, 62h,   7,	 6, 62h,   7,	7, 73h


Room124:	    db	19h, 4Dh, 4Dh, 4Dh, 22h,   7,	7, 14h
		    db	19h,   6, 25h, 25h, 4Dh, 4Dh, 22h, 14h
		    db	19h,   7,   7,	 7,   6, 4Dh, 4Dh, 60h
		    db	19h,   7,   7,	 7,   7,   6, 25h, 60h
		    db	5Bh, 4Dh, 4Dh, 4Dh, 4Dh, 22h,	7, 60h
		    db	1Eh, 25h, 25h, 25h, 25h, 62h,	7, 73h


Room125:	    db	  8,   9, 0Ah,	 1, 0Ah,   9, 0Ah, 0Bh
		    db	1Eh, 25h, 4Dh, 24h, 25h, 25h, 25h, 0Eh
		    db	19h,   7, 4Dh, 4Dh, 4Dh, 22h, 4Dh, 60h
		    db	19h,   7,   6, 25h, 25h, 62h, 4Dh, 72h
		    db	19h, 4Dh, 22h,	 7,   7, 4Dh, 4Dh, 6Ch
		    db	19h, 4Dh, 4Dh, 4Dh, 22h,   6, 25h, 63h

; Hind D room
Room050:	    db	  5, 0Eh, 15h,	 1,   1,   1,	1,   2
		    db	10h, 0Eh, 0Eh, 15h,   1, 0Eh, 15h,   2
		    db	  1, 14h, 11h, 0Fh,   1, 0Eh, 0Eh, 12h
		    db	  1,   1,   1,	 1,   1, 14h, 11h, 13h
		    db	  1,   1,   1,	 1,   1,   1,	1,   2
		    db	  3,   3,   3,	 3,   3,   3,	3,   4