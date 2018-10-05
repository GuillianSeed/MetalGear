;----------------------------------------------------------------------------
;
; Radio	calls
;
; Byte 0
;   bits7-4: ID	person
;   bit	3  : 1 = Wait call (The person does not reply until Snake calls)
;          : 0 = Auto reply (The person replies as soon as the right freq. is selected)
;   bit	2  : Auto tune (automatically sets the right freq. in the radio)
;   bit	0  : 0 = another person	dat (1 = End of data)
;
; Byte 1: Text ID
;
; IDs:
; 1 = Big Boss building	1
; 2 = Schneider
; 3 = Diane / Steve
; 4 = Schneider	building 2
; 5 = Diane building 2
; 6 = Jeniffer
; 7 = Big boss building	2
;
;----------------------------------------------------------------------------
		
RadioRoom_000:	
		db RADIO_BIGBOSS | RADIO_AUTOREPLY | RADIO_END
		db 3			; This is Big Boss... This is an infiltration mission. Avoid detection by the enemy. ...Over

RadioRoom_004:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 3			; This is Big Boss... This is an infiltration mission. Avoid detection by the enemy. ...Over

RadioRoom_001:	
		db RADIO_BIGBOSS | RADIO_WAITCALL
		db 3			; This is Big Boss... This is an infiltration mission. Avoid detection by the enemy. ...Over

		db RADIO_SCHNEIDER | RADIO_END
		db 23			; This is Resistance Leader Schneider...* I'll guide you through the fortress. Please call on frequency 12079. ...Over

RadioRoom_002_3_39:
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END		
		db 5			; This is Big Boss... Elevators	move between floors. Remember their location. ...Over

RadioRoom_005_7_8:
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END		
		db 4			; This is Big Boss... Take weapons and equipment from enemy trucks and caches. TAKE AMMO FROM GUARDS!!*	Use cards to open doors. Find them! ...Over

RadioRoom_009:	
		db RADIO_SCHNEIDER | RADIO_WAITCALL | RADIO_END
		db 87			; This is Resistance Leader Schneider...* The Mine Detector is on the rooftop. ...Over

RadioRoom_011:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 49			; This is Big Boss... Use camouflage in	locations with good visibility.* Hide in something... ...Over

RadioRoom_014:	
		db RADIO_BIGBOSS | RADIO_WAITCALL
		db 49			; This is Big Boss... Use camouflage in	locations with good visibility.* Hide in something... ...Over

RadioRoom_012_13_134:
		db	RADIO_SCHNEIDER | RADIO_WAITCALL | RADIO_END	
		db 53			; This is Schneider... An isolated cell? I don't know... ...Over

RadioRoom_020:	
		db RADIO_DIANE | RADIO_WAITCALL | RADIO_END
		db 80			; Hi. This is Diane... Beat Machinegun Kid with	Remote-Controlled Missiles. ...Bye

RadioRoom_021_23:
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 49			; This is Big Boss... Use camouflage in	locations with good visibility.* Hide in something... ...Over

RadioRoom_024_25:
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 48			; This is Big Boss... I	forgot to tell you,* Be	careful	of the infrared	beams. Use IR Goggles. ...Over

RadioRoom_028:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 20			; This is Big Boss... There's a resistance force. Try to contact on the transceiver. ...Over

RadioRoom_029:	
		db RADIO_BIGBOSS | RADIO_AUTOREPLY
		db 25			; This is Big Boss... I	forgot to tell you, Use	a Gas Mask in gassy areas.*Resistance Leader Schneider knows its location. ...Over

		db RADIO_SCHNEIDER | RADIO_WAITCALL | RADIO_END
		db 26			; This is Resistance Leader Schneider... The Gas Mask is south on floor	1. ...Over

RadioRoom_030:	
		db RADIO_BIGBOSS | RADIO_WAITCALL
		db 20			; This is Big Boss... There's a resistance force. Try to contact on the transceiver. ...Over

		db RADIO_SCHNEIDER | RADIO_END
		db 23			; This is Resistance Leader Schneider...* I'll guide you through the fortress. Please call on frequency 12079. ...Over

RadioRoom_031:	
		db RADIO_BIGBOSS | RADIO_AUTOREPLY
		db 24			; This is Big Boss... Be careful of cameras. ...Over

		db RADIO_SCHNEIDER | RADIO_END
		db 23			; This is Resistance Leader Schneider...* I'll guide you through the fortress. Please call on frequency 12079. ...Over

RadioRoom_033:	
		db RADIO_SCHNEIDER | RADIO_END
		db 23			; This is Resistance Leader Schneider...* I'll guide you through the fortress. Please call on frequency 12079. ...Over

RadioRoom_037:	
		db RADIO_BIGBOSS | RADIO_AUTOREPLY
		db 38			; This is Big Boss... I	forgot to tell you,* destroy the power panel of	the high voltage current.* Use a Remote-Controlled Missile. Schneider, the Resistance Leader knows its location. ...Over

		db RADIO_SCHNEIDER | RADIO_WAITCALL | RADIO_END
		db 39			; This is Resistance Leader Schneider...* Remote-Controlled Missiles are in the	southwest. ...Over

RadioRoom_45_46_48_51_117:
		db RADIO_SCHNEIDER | RADIO_WAITCALL | RADIO_END	
		db 83			; This is Schneider... The Parachute is	on floor 2. ...Over

RadioRoom_050:	
		db RADIO_DIANE | RADIO_WAITCALL | RADIO_END
		db 88			; Hi. This is Diane... Beat Hind-D with	a Grenade Launcher. ...Bye

RadioRoom_053:	
		db RADIO_BIGBOSS | RADIO_AUTOREPLY
		db 42			; This is Big Boss... I	forgot to tell you,* The rooftop is sealed by a	wind barrier. Find the Bomb Blast Suit!	...Over

		db RADIO_SCHNEIDER | RADIO_WAITCALL | RADIO_END
		db 51			; This is Schneider... The Bomb	Blast Suit is in the basement. ...Over

RadioRoom_054_57:
		db RADIO_BIGBOSS | RADIO_WAITCALL
		db 60			; This is Big Boss... Take back	your gear and escape!* It's hidden in one of the rooms. Punch around to find it! ...Over

		db RADIO_DIANE | RADIO_WAITCALL | RADIO_END
		db 158			; (!?) This is Steve...	Diane? Diane is	taking a shower	now...

RadioRoom_058to63:
		db RADIO_SCHNEIDER | RADIO_WAITCALL | RADIO_END		
		db 64			; This is Schneider... Punch the walls and bomb	areas that sound hollow. ...Over

RadioRoom_064:	
		db RADIO_SCHNEIDER | RADIO_WAITCALL
		db 87			; This is Resistance Leader Schneider...* The Mine Detector is on the rooftop. ...Over

		db RADIO_DIANE | RADIO_WAITCALL | RADIO_END
		db 158			; (!?) This is Steve...	Diane? Diane is	taking a shower	now...

RadioRoom_067:	
		db RADIO_DIANE | RADIO_WAITCALL | RADIO_END
		db 92			; Hi. This is Diane... Beat the	tank with mines. ...Bye

RadioRoom_069:	
		db RADIO_BIGBOSS | RADIO_AUTOREPLY
		db 93			; This is Big Boss... That's a checkpoint. Wear an Enemy Uniform and infiltrate!* Call on frequency 12013 from now on. ...Over

		db RADIO_SCHNEIDER | RADIO_WAITCALL
		db 94			; This is Resistance Leader Schneider... The Enemy Uniform is in building 1's Basement.* Call on frequency 12026 from now on. ...Over

		db RADIO_DIANE | RADIO_WAITCALL | RADIO_END			; Hi. This is Diane... Call on frequency 12091 from now	on. Call me later. ...Bye
		db 95

RadioRoom_072:	
		db RADIO_BIGBOSS2 | RADIO_WAITCALL	; (!?) Does not have RADIO_END
		db 48			; This is Big Boss... I	forgot to tell you,* Be	careful	of the infrared	beams. Use IR Goggles. ...Over

RadioRoom_081:	
		db RADIO_SCHNEIDER2 | RADIO_WAITCALL | RADIO_END
		db 100			; This is Schneider... The north elevator only goes up.	...Over

RadioRoom_082:	
		db RADIO_SCHNEIDER2 | RADIO_WAITCALL | RADIO_END
		db 122			; This is Schneider... The Compass is on floor 2. ...Over

RadioRoom_083:	
		db RADIO_DIANE2 | RADIO_WAITCALL | RADIO_END
		db 114			; Hi. This is Diane... The Arnold's guarding the doors can't be destroyed. LEAVE!! ...Bye

RadioRoom_086:	
		db RADIO_JENIFFER | RADIO_WAITCALL | RADIO_END
		db 117			; This is Jennifer... I'm preparing a Rocket Launcher. Take it. ...Over

RadioRoom_087:	
		db RADIO_JENIFFER | RADIO_WAITCALL | RADIO_END
		db 118			; This is Jennifer... I'm opening the door. ...Over

RadioRoom_088:	
		db RADIO_SCHNEIDER2 | RADIO_WAITCALL
		db 100			; This is Schneider... The north elevator only goes up.	...Over

		db RADIO_DIANE2 | RADIO_WAITCALL | RADIO_END
		db 159			; (!?) This is Steve...	Diane? You again! Stop coming on to Diane!

RadioRoom_091_92_95:
		db RADIO_DIANE2 | RADIO_WAITCALL | RADIO_END		
		db 159			; (!?) This is Steve...	Diane? You again! Stop coming on to Diane!

RadioRoom_093:	
		db RADIO_SCHNEIDER2 | RADIO_WAITCALL | RADIO_END
		db 112			; This is Schneider... The Flashlight is on Floor 1. ...Over

RadioRoom_094_98:
		db RADIO_SCHNEIDER2 | RADIO_WAITCALL | RADIO_END
		db 111			; This is Schneider... The north elevator is ahead. ...Over

RadioRoom_096_97_100:
		db RADIO_SCHNEIDER2 | RADIO_WAITCALL | RADIO_END	
		db 64			; This is Schneider... Punch the walls and bomb	areas that sound hollow. ...Over

RadioRoom_099:	
		db RADIO_SCHNEIDER2 | RADIO_AUTOREPLY | RADIO_END
		db 106			; This is Schneider... There's a gassy area in there. ...Over

RadioRoom_102:	
		db RADIO_SCHNEIDER2 | RADIO_WAITCALL
		db 122			; This is Schneider... The Compass is on floor 2. ...Over

		db RADIO_DIANE2 | RADIO_WAITCALL | RADIO_END
		db 130			; Hi. This is Diane... Use antidote for	scorpion venom.	...Bye

RadioRoom_103:	
		db RADIO_SCHNEIDER2 | RADIO_WAITCALL | RADIO_END
		db 122			; This is Schneider... The Compass is on floor 2. ...Over

RadioRoom_104:	
		db RADIO_BIGBOSS2 | RADIO_AUTOREPLY | RADIO_END
		db 133			; This is Big Boss... Get into the rightmost truck! ...Over

RadioRoom_108:	
		db RADIO_BIGBOSS2 | RADIO_AUTOREPLY
		db 132			; This is Big Boss... Go into the left door! ...Over

		db RADIO_JENIFFER | RADIO_END
		db 134			; This is Jennifer... Destroy the wall!! ...Over

RadioRoom_111:	
		db RADIO_BIGBOSS2 | RADIO_AUTOREPLY
		db 136			; This is Big Boss... Solid Snake! Mission over, return	now.* THAT'S AN ORDER!! TURN OFF THE MSX!! ...Over

		db RADIO_JENIFFER | RADIO_END
		db 137			; This is Jennifer! The	card that opens	the door ahead is in the east  of building 3.* That area goes to building 2 through the	water channel. ...Bye

RadioRoom_112:	
		db RADIO_JENIFFER | RADIO_WAITCALL | RADIO_END
		db 145			; I'm Saved!* The Boss of Outer Heaven is the commander-in- hief* of FOX HOUND,  Big Boss!* He schemed it all! Don't be fooled!

RadioRoom_115:	
		db RADIO_JENIFFER | RADIO_AUTOREPLY | RADIO_END
		db 135			; This is Jennifer... An Oxygen	Tank is	behind the wall. ...Over

RadioRoom_116:	
		db RADIO_JENIFFER | RADIO_AUTOREPLY | RADIO_END
		db 146			; This is Jennifer! Just run over there! It'll be OK with Rations. ...Over

RadioRoom_119:	
		db RADIO_DIANE2 | RADIO_AUTOREPLY
		db 149			; This is Diane! I don't know how to destroy Big Boss... It's up to you!* Solid Snake! ...the way I... feel about you... No, it's nothing... Good luck...

		db RADIO_JENIFFER | RADIO_END
		db 148			; This is Jennifer! Use	a cigarette to extend the timer. Return	alive! Solid Snake...

;Dark rooms

RadioRoom_123to125_220_221:
		db RADIO_DIANE2 | RADIO_AUTOREPLY	
		db 113			; Hi. This is Diane. How are you? Be careful of	pitfalls! ...Bye

		db RADIO_SCHNEIDER2 | RADIO_WAITCALL | RADIO_END
		db 112			; This is Schneider... The Flashlight is on Floor 1. ...Over

RadioRoom_126_158_218:
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END		
		db 9			; This is Big Boss... Ration? It's emergency food. Save it. ...Over

RadioRoom_127_157:
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END		
		db 12			; This is Big Boss... Card? It opens doors.* The card level determines what doors it opens. Be careful.	...Over

RadioRoom_128:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 14			; This is Big Boss... Binoculars? Use them to see distant terrain and enemy locations.*	Use them often.	...Over

RadioRoom_130:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 17			; This is Big Boss... Handgun? Beretta M92F...*	You know how to	use it.	Find ammo and don't waste it. ...Over

RadioRoom_132_140:
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END		
		db 19			; This is Big Boss... Mine? You	know how to use	it. ...Over

RadioRoom_0137:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 57			; This is Big Boss... SubMachinegun? Ingram MAC-11... You know how to use it. ...Over

RadioRoom_0138:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 154			; This is Big Boss... Gas Mask?	Use it in a gassy area.	...Over

RadioRoom_0139:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 76			; This is Big Boss... IR Goggles? It shows you infrared	beams. ...Over

RadioRoom_0143:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 82			; This is Big Boss... Parachute? Wear it before	you dive. ...Over

RadioRoom_197:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 30			; This is Big Boss... Remote-Controlled	Missile?* It's guided from a distance. Use it in locations with obstacles. ...Over

RadioRoom_0149:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 22			; This is Big Boss... You can carry limited ammo. Be careful. ...Over

RadioRoom_0150:	
		db RADIO_BIGBOSS | RADIO_WAITCALL
		db 44			; This is Big Boss... Silencer?	Use it to stifle shot noise.

		db RADIO_DIANE | RADIO_WAITCALL | RADIO_END
		db 156			; Hi. This is Diane... They have a silencer. ...Over

RadioRoom_0151:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 47			; This is Big Boss... M79 Grenade Launcher? You	know how to use	it. ...Over

RadioRoom_153_179:
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END		
		db 70			; This is Big Boss... Plastic Bomb? It can be set anywhere. ...Over

RadioRoom_0156:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 41			; This is Big Boss... Cardboard	Box? Are they moving? ...Over

RadioRoom_159:	
		db RADIO_DIANE | RADIO_WAITCALL | RADIO_END
		db 157			; (!?) This is Steve...	Diane? Diane went shopping and hasn't returned yet...

RadioRoom_160:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 86			; This is Big Boss... Mine Detector? It	shows you mine locations. ...Over

RadioRoom_165:	
		db RADIO_BIGBOSS | RADIO_AUTOREPLY | RADIO_END
		db 58			; This is Big Boss... Infiltration successful. Find Grey Fox's cell. CHECK THE WALL!! ...Over

RadioRoom_169:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 72			; This is Big Boss... Enemy Uniform? Is	it a sailor suit? ...Over

RadioRoom_170:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 68			; This is Big Boss... Bomb Blast Suit? Protects	against	blasts and winds. ...Over

RadioRoom_171:	
		db RADIO_BIGBOSS | RADIO_WAITCALL | RADIO_END
		db 66			; This is Big Boss... Body Armor? Don't use it. Be a man! ...Over

RadioRoom_176:	
		db RADIO_BIGBOSS2 | RADIO_WAITCALL | RADIO_END
		db 97			; This is Big Boss... Flashlight? You know how to use it. ...Over

RadioRoom_177:	
		db RADIO_BIGBOSS2 | RADIO_WAITCALL | RADIO_END
		db 19			; This is Big Boss... Mine? You	know how to use	it. ...Over

RadioRoom_178:	
		db RADIO_BIGBOSS2 | RADIO_AUTOREPLY | RADIO_END
		db 99			; This is Big Boss... We had a jamming attack but it's solved. ...Over

RadioRoom_182:	
		db RADIO_SCHNEIDER2 | RADIO_WAITCALL | RADIO_END
		db 126			; This is Schneider...*	A secret passage leads from the	southwest of the basement to building 1. ...Over

RadioRoom_192:	
		db RADIO_SCHNEIDER2 | RADIO_AUTOREPLY | RADIO_END
		db 138			; This is Schneider... The Boss	of Outer Heaven	was revealed! Surprise... The Boss of Outer Heaven is...* ...AH! ...

RadioRoom_193:	
		db RADIO_JENIFFER | RADIO_AUTOREPLY
		db 142			; This is Jennifer... Coward Duck has Card8.* My big brother is	a hostage! Don't kill him... If anything happens to him I won't help you!

		db RADIO_DIANE2 | RADIO_WAITCALL | RADIO_END
		db 141			; Hi. This is Diane! A Handgun can beat	Coward Duck without killing our	friends. ...Bye

RadioRoom_202:	
		db RADIO_SCHNEIDER2 | RADIO_WAITCALL | RADIO_END
		db 122			; This is Schneider... The Compass is on floor 2. ...Over

RadioRoom_205to207:
		db RADIO_SCHNEIDER2 | RADIO_WAITCALL | RADIO_END		
		db 105			; This is Schneider... The south elevator only goes down. ...Over

NoRadio:	db 0


;----------------------------------------------------------------------------
;
; Index	of Radio characters available in rooms
;
;----------------------------------------------------------------------------
idxRoomRadio:   dw RadioRoom_000
		dw RadioRoom_001
		dw RadioRoom_002_3_39
		dw RadioRoom_002_3_39
		dw RadioRoom_004
		dw RadioRoom_005_7_8
		dw NoRadio
		dw RadioRoom_005_7_8
		dw RadioRoom_005_7_8
		dw RadioRoom_009
		dw NoRadio		; 10
		dw RadioRoom_011
		dw RadioRoom_012_13_134
		dw RadioRoom_012_13_134
		dw RadioRoom_014
		dw NoRadio		; 15
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw RadioRoom_020	; 20
		dw RadioRoom_021_23
		dw NoRadio
		dw RadioRoom_021_23
		dw RadioRoom_024_25
		dw RadioRoom_024_25	; 25
		dw NoRadio
		dw NoRadio
		dw RadioRoom_028
		dw RadioRoom_029
		dw RadioRoom_030	; 30
		dw RadioRoom_031
		dw NoRadio
		dw RadioRoom_033
		dw NoRadio
		dw NoRadio		; 35
		dw NoRadio
		dw RadioRoom_037
		dw NoRadio
		dw RadioRoom_002_3_39
		dw NoRadio		; 40
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw RadioRoom_45_46_48_51_117 ; 45
		dw RadioRoom_45_46_48_51_117
		dw NoRadio
		dw RadioRoom_45_46_48_51_117
		dw NoRadio
		dw RadioRoom_050	; 50
		dw RadioRoom_45_46_48_51_117
		dw NoRadio
		dw RadioRoom_053
		dw RadioRoom_054_57
		dw NoRadio		; 55
		dw NoRadio
		dw RadioRoom_054_57
		dw RadioRoom_058to63
		dw RadioRoom_058to63
		dw RadioRoom_058to63	; 60
		dw RadioRoom_058to63
		dw RadioRoom_058to63
		dw RadioRoom_058to63
		dw RadioRoom_064
		dw NoRadio		; 65
		dw NoRadio
		dw RadioRoom_067
		dw NoRadio
		dw RadioRoom_069
		dw NoRadio		; 70
		dw NoRadio
		dw RadioRoom_072
		dw NoRadio
		dw NoRadio
		dw NoRadio		; 75
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio		; 80
		dw RadioRoom_081
		dw RadioRoom_082
		dw RadioRoom_083
		dw NoRadio
		dw NoRadio		; 85
		dw RadioRoom_086
		dw RadioRoom_087
		dw RadioRoom_088
		dw NoRadio
		dw NoRadio		; 90
		dw RadioRoom_091_92_95
		dw RadioRoom_091_92_95
		dw RadioRoom_093
		dw RadioRoom_094_98
		dw RadioRoom_091_92_95	; 95
		dw RadioRoom_096_97_100
		dw RadioRoom_096_97_100
		dw RadioRoom_094_98
		dw RadioRoom_099
		dw RadioRoom_096_97_100	; 100
		dw NoRadio
		dw RadioRoom_102
		dw RadioRoom_103
		dw RadioRoom_104
		dw NoRadio		; 105
		dw NoRadio
		dw NoRadio
		dw RadioRoom_108
		dw NoRadio
		dw NoRadio		; 110
		dw RadioRoom_111
		dw RadioRoom_112
		dw NoRadio
		dw NoRadio
		dw RadioRoom_115	; 115
		dw RadioRoom_116
		dw RadioRoom_45_46_48_51_117
		dw NoRadio
		dw RadioRoom_119
		dw NoRadio		; 120
		dw NoRadio
		dw NoRadio
		dw RadioRoom_123to125_220_221
		dw RadioRoom_123to125_220_221
		dw RadioRoom_123to125_220_221 ;	125
		dw RadioRoom_126_158_218
		dw RadioRoom_127_157
		dw RadioRoom_128
		dw NoRadio
		dw RadioRoom_130	; 130
		dw NoRadio
		dw RadioRoom_132_140
		dw NoRadio
		dw RadioRoom_012_13_134
		dw NoRadio		; 135
		dw NoRadio
		dw RadioRoom_0137
		dw RadioRoom_0138
		dw RadioRoom_0139
		dw RadioRoom_132_140	; 140
		dw NoRadio
		dw NoRadio
		dw RadioRoom_0143
		dw NoRadio
		dw NoRadio		; 145
		dw NoRadio
		dw RadioRoom_197
		dw NoRadio
		dw RadioRoom_0149
		dw RadioRoom_0150	; 150
		dw RadioRoom_0151
		dw NoRadio
		dw RadioRoom_153_179
		dw NoRadio
		dw NoRadio		; 155
		dw RadioRoom_0156
		dw RadioRoom_127_157
		dw RadioRoom_126_158_218
		dw RadioRoom_159
		dw RadioRoom_160	; 160
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw RadioRoom_165	; 165
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw RadioRoom_169
		dw RadioRoom_170	; 170
		dw RadioRoom_171
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio		; 175
		dw RadioRoom_176
		dw RadioRoom_177
		dw RadioRoom_178
		dw RadioRoom_153_179
		dw NoRadio		; 180
		dw NoRadio
		dw RadioRoom_182
		dw NoRadio
		dw NoRadio
		dw NoRadio		; 185
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio		; 190
		dw NoRadio
		dw RadioRoom_192
		dw RadioRoom_193
		dw NoRadio
		dw NoRadio		; 195
		dw NoRadio
		dw RadioRoom_197
		dw NoRadio
		dw NoRadio
		dw NoRadio		; 200
		dw NoRadio
		dw RadioRoom_202
		dw NoRadio
		dw NoRadio
		dw RadioRoom_205to207	; 205
		dw RadioRoom_205to207
		dw RadioRoom_205to207
		dw NoRadio
		dw NoRadio
		dw NoRadio		; 210
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio		; 215
		dw NoRadio
		dw NoRadio
		dw RadioRoom_126_158_218
		dw NoRadio
		dw RadioRoom_123to125_220_221 ;	220
		dw RadioRoom_123to125_220_221
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio
		dw NoRadio