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
; 3 = Diane
; 4 = Schneider	building 2
; 5 = Diane building 2
; 6 = Jeniffer
; 7 = Big boss building	2
;
;----------------------------------------------------------------------------
RadioRoom_000:	    db RADIO_BIGBOSS | RADIO_AUTOREPLY | RADIO_END
		    db 3				    ; THIS IS BIG BOSS... MISION! GAIN ACCESS TO THE ENEMY'S FORTRESS, OUTER HEAVEN.* TAKE ACTION NOT TO BE DISCOVERED BY THE ENEMY. ...OVER

RadioRoom_004:	    db RADIO_BIGBOSS | RADIO_WAITCALL |	RADIO_END
		    db 3				    ; THIS IS BIG BOSS... MISION! GAIN ACCESS TO THE ENEMY'S FORTRESS, OUTER HEAVEN.* TAKE ACTION NOT TO BE DISCOVERED BY THE ENEMY. ...OVER

RadioRoom_001:	    db RADIO_BIGBOSS | RADIO_WAITCALL
		    db 3				    ; THIS IS BIG BOSS... MISION! GAIN ACCESS TO THE ENEMY'S FORTRESS, OUTER HEAVEN.* TAKE ACTION NOT TO BE DISCOVERED BY THE ENEMY. ...OVER

		    db RADIO_SCHNEIDER | RADIO_END	    ; Schneider
		    db 23				    ; ;THIS IS THE RESISTANCE LEADER,MR. SCHNEIDER...* I WILL BRIEF YOU	ON THE FORTRESS	DETAILS.PLEASE CONTACT ON WAVEBAND 12079. ...OVER

RadioRoom_005:	    db RADIO_BIGBOSS | RADIO_WAITCALL |	RADIO_END
		    db 4				    ; THIS IS BIG BOSS... TAKE THE WEAPONS AND EQUIPMENTS FROM THE ENEMY'S LORRY!!* YOU SHOULD HAVE AN I.D.CARD TO OPEN THE DOOR. ...OVER

RadioRoom_020:	    db RADIO_DIANE | RADIO_WAITCALL | RADIO_END
		    db 80				    ; HELLO THIS IS DIANE... MACHINEGUN	KID MUST BE KILLED BY REMOTE-CONTROL MISSILE. ...OVER

RadioRoom_028:	    db RADIO_BIGBOSS | RADIO_WAITCALL |	RADIO_END
		    db 20				    ; THIS IS BIG BOSS... THERE	MUST BE	SOME RESISTANCE.* TRY TO CONTACT WITH THE TRANSCEIVER! ...OVER

RadioRoom_029:	    db RADIO_BIGBOSS | RADIO_AUTOREPLY
		    db 25				    ; THIS IS BIG BOSS... PUT ON A GAS MASK IN THE GAS ROOM. ...OVER

		    db RADIO_SCHNEIDER | RADIO_WAITCALL	| RADIO_END
		    db 26				    ; THIS IS THE RESISTANCE LEADER,MR.	SCHNEIDER...* GO TO THE	SOUTH PART OF THE 1ST FLOOR TO GET YOUR	MASK. ...OVER

RadioRoom_030:	    db RADIO_BIGBOSS | RADIO_WAITCALL
		    db 20				    ; THIS IS BIG BOSS... THERE	MUST BE	SOME RESISTANCE.* TRY TO CONTACT WITH THE TRANSCEIVER! ...OVER

		    db RADIO_SCHNEIDER | RADIO_END
		    db 23				    ; THIS IS THE RESISTANCE LEADER,MR.	SCHNEIDER...* I	WILL BRIEF YOU ON THE FORTRESS DETAILS.PLEASE CONTACT ON WAVEBAND 12079. ...OVER

RadioRoom_031:	    db RADIO_SCHNEIDER | RADIO_END
		    db 23				    ; THIS IS THE RESISTANCE LEADER,MR.	SCHNEIDER...* I	WILL BRIEF YOU ON THE FORTRESS DETAILS.PLEASE CONTACT ON WAVEBAND 12079. ...OVER

RadioRoom_033:	    db RADIO_SCHNEIDER | RADIO_END
		    db 23				    ; THIS IS THE RESISTANCE LEADER,MR.	SCHNEIDER...* I	WILL BRIEF YOU ON THE FORTRESS DETAILS.PLEASE CONTACT ON WAVEBAND 12079. ...OVER

RadioRoom_037:	    db RADIO_BIGBOSS | RADIO_AUTOREPLY
		    db 38				    ; THIS IS BIG BOSS...* BREAK DOWN THE POWER	SUPPLY BOX WITH	THE REMOTE-CONTROL MISSILE TO GET RID OF THE HIGH-VOLTAGE.*...OVER

		    db RADIO_SCHNEIDER | RADIO_WAITCALL	| RADIO_END
		    db 39				    ; THIS IS MR. SCHNEIDER... THE REMOTE-CONTROL MISSILE IS AVAILABLE IN THE SOUTHEASTERN AREA. ...OVER

RadioRoom_045:	    db RADIO_SCHNEIDER | RADIO_WAITCALL	| RADIO_END
		    db 83				    ; This is Schneider... The Parachute is on floor 2.	...Over

RadioRoom_050:	    db RADIO_DIANE | RADIO_WAITCALL | RADIO_END
		    db 88				    ; Hi. This is Diane... Beat	Hind-D with a Grenade Launcher.	...Bye

RadioRoom_053:	    db RADIO_BIGBOSS | RADIO_AUTOREPLY
		    db 42				    ; THIS IS BIG BOSS... WIND BARRIER IS EXTENDED ON THE ROOFTOP.* LOOK FOR THE BOMBBLASTSUIT TO BE INTO THE BARRIER. ...OVER

		    db RADIO_SCHNEIDER | RADIO_WAITCALL	| RADIO_END
		    db 51				    ; THIS IS MR. SCHNEIDER... THE BOMBBLASTSUIT CAN BE	FOUND IN THE BASEMENT. ..OVER

RadioRoom_054:	    db RADIO_BIGBOSS | RADIO_WAITCALL |	RADIO_END
		    db 60				    ; This is Big Boss... Take back your gear and escape!* It's hidden in one of the rooms. Punch around to find it! ...Over

RadioRoom_058:	    db RADIO_SCHNEIDER | RADIO_WAITCALL	| RADIO_END
		    db 64				    ; This is Schneider... Punch the walls and bomb areas that sound hollow. ...Over

RadioRoom_067:	    db RADIO_DIANE | RADIO_WAITCALL | RADIO_END
		    db 92				    ; Hi. This is Diane... Beat	the tank with mines. ...Bye

RadioRoom_069:	    db RADIO_BIGBOSS | RADIO_AUTOREPLY
		    db 93				    ; THIS IS BIG BOSS... CHECK	POINT!*	PUT ON AN ENEMY'S UNIFORM AND GAIN ACCESS.* WILL USE WAVEBAND 12013 FOR FUTURE CONTACT. ...OVER

		    db RADIO_SCHNEIDER | RADIO_WAITCALL
		    db 94				    ; THIS IS MR. SCHNEIDER...*	ENEMY'S UNIFORM IS AVAILABLE IN THE BASEMENT OF BUILDING NO.1.* WILL CONTACT IN THE BAND OF 12026 FROM NOW ON. ...OVER

		    db RADIO_DIANE | RADIO_WAITCALL | RADIO_END
		    db 95				    ; HELLO THIS IS DIANE... WILL CONTACT ON WAVEBAND 12091 FROM NOW ON.* ...BYE

RadioRoom_082:	    db RADIO_SCHNEIDER2	| RADIO_WAITCALL | RADIO_END
		    db 122				    ; This is Schneider... The Compass is on floor 2. ...Over

RadioRoom_083:	    db RADIO_DIANE2 | RADIO_WAITCALL | RADIO_END
		    db 114				    ; Hi. This is Diane... The Arnold's guarding the doors can't be destroyed. LEAVE!! ...Bye

RadioRoom_086:	    db RADIO_JENIFFER |	RADIO_WAITCALL | RADIO_END
		    db 117				    ; This is Jennifer... I'm preparing a Rocket Launcher. Take it. ...Over

RadioRoom_087:	    db RADIO_JENIFFER |	RADIO_WAITCALL | RADIO_END
		    db 118				    ; This is Jennifer... I'm opening the door. ...Over

RadioRoom_093:	    db RADIO_SCHNEIDER2	| RADIO_WAITCALL | RADIO_END
		    db 112				    ; This is Schneider... The Flashlight is on	Floor 1. ...Over

RadioRoom_094:	    db RADIO_SCHNEIDER2	| RADIO_WAITCALL | RADIO_END
		    db 64				    ; This is Schneider... Punch the walls and bomb areas that sound hollow. ...Over

RadioRoom_099:	    db RADIO_SCHNEIDER2	| RADIO_AUTOREPLY | RADIO_END ;	...
		    db 106				    ; This is Schneider... There's a gassy area in there. ...Over

RadioRoom_102:	    db RADIO_SCHNEIDER2	| RADIO_WAITCALL
		    db 122				    ; This is Schneider... The Compass is on floor 2. ...Over

		    db RADIO_DIANE2 | RADIO_WAITCALL | RADIO_END
		    db 130				    ; Hi. This is Diane... Use antidote	for scorpion venom. ...Bye

RadioRoom_103:	    db RADIO_SCHNEIDER2	| RADIO_WAITCALL | RADIO_END
		    db 122				    ; This is Schneider... The Compass is on floor 2. ...Over

RadioRoom_104:	    db RADIO_BIGBOSS2 |	RADIO_AUTOREPLY	| RADIO_END
		    db 133				    ; THIS IS BIG BOSS... CREEP	INTO THE LORRY ON THE RIGHT SIDE. ...OVER

RadioRoom_108:	    db RADIO_BIGBOSS2 |	RADIO_AUTOREPLY
		    db 132				    ; This is Big Boss... Go into the left door! ...Over

		    db RADIO_JENIFFER |	RADIO_END
		    db 134				    ; This is Jennifer... Destroy the wall!! ...Over

RadioRoom_111:	    db RADIO_BIGBOSS2 |	RADIO_AUTOREPLY
		    db 136				    ; This is Big Boss... Solid	Snake! Mission over, return now.* THAT'S AN ORDER!! TURN OFF THE MSX!! ...Over

		    db RADIO_JENIFFER |	RADIO_END
		    db 137				    ; This is Jennifer!	The card that opens the	door ahead is in the east of building 3.* That area goes to building 2 through the water channel. ...Bye

RadioRoom_115:	    db RADIO_JENIFFER |	RADIO_AUTOREPLY	| RADIO_END
		    db 135				    ; This is Jennifer... An Oxygen Tank is behind the wall. ...Over

RadioRoom_116:	    db RADIO_JENIFFER |	RADIO_AUTOREPLY	| RADIO_END
		    db 146				    ; This is Jennifer!	Just run over there! It'll be OK with Rations. ...Over

RadioRoom_119:	    db RADIO_DIANE2 | RADIO_AUTOREPLY
		    db 149				    ; This is Diane! I don't know how to destroy Big Boss... It's up to you!* Solid Snake! ...the way I... feel about you... No, it's nothing... Good luck...

		    db RADIO_JENIFFER |	RADIO_END
		    db 148				    ; This is Jennifer!	Use a cigarette	to extend the timer. Return alive! Solid Snake...

RadioRoom_123:	    db RADIO_DIANE2 | RADIO_AUTOREPLY
		    db 113				    ; Hi. This is Diane. How are you? Be careful of pitfalls! ...Bye

		    db RADIO_SCHNEIDER2	| RADIO_WAITCALL | RADIO_END
		    db 112				    ; This is Schneider... The Flashlight is on	Floor 1.

RadioRoom_150:	    db RADIO_DIANE | RADIO_WAITCALL | RADIO_END
		    db 156				    ; Diane: HELLO THIS	IS DIANE... I SUPPOSE THEY HAVE	A SILENCER. ...BYE


RadioRoom_165:	    db RADIO_BIGBOSS | RADIO_AUTOREPLY | RADIO_END
		    db 58				    ; This is Big Boss... Infiltration successful. Find	Grey Fox's cell. CHECK THE WALL!! ...Over

RadioRoom_178:	    db RADIO_BIGBOSS2 |	RADIO_AUTOREPLY	| RADIO_END
		    db 99				    ; This is Big Boss... We had a jamming attack but it's solved. ...Over

RadioRoom_182:	    db RADIO_SCHNEIDER2	| RADIO_WAITCALL | RADIO_END
		    db 126				    ; This is Schneider...* A secret passage leads from	the southwest of the basement to building 1. ...Over

RadioRoom_192:	    db RADIO_SCHNEIDER2	| RADIO_AUTOREPLY | RADIO_END ;	...
		    db 138				    ; This is Schneider... The Boss of Outer Heaven was	revealed! Surprise... The Boss of Outer	Heaven is...* ...AH! ...

RadioRoom_193:	    db RADIO_JENIFFER |	RADIO_AUTOREPLY
		    db 142				    ; This is Jennifer... Coward Duck has Card8.* My big brother is a hostage! Don't kill him... If anything happens to him I won't help you!

		    db RADIO_DIANE2 | RADIO_WAITCALL | RADIO_END
		    db 141				    ; Hi. This is Diane! A Handgun can beat Coward Duck	without	killing	our friends. ...Bye

RadioRoom_202:	    db RADIO_SCHNEIDER2	| RADIO_WAITCALL | RADIO_END
		    db 122				    ; This is Schneider... The Compass is on floor 2. ...Over


NoRadio:	    db 0

;----------------------------------------------------------------------------
;
; Index	of Radio characters available in rooms
;
;----------------------------------------------------------------------------
idxRoomRadio:	    dw RadioRoom_000
		    dw RadioRoom_001
		    dw NoRadio
		    dw NoRadio
		    dw RadioRoom_004
		    dw RadioRoom_005
		    dw NoRadio
		    dw RadioRoom_005
		    dw RadioRoom_005
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
		    dw RadioRoom_020
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw RadioRoom_028
		    dw RadioRoom_029
		    dw RadioRoom_030
		    dw RadioRoom_031
		    dw NoRadio
		    dw RadioRoom_033
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw RadioRoom_037
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw RadioRoom_045
		    dw RadioRoom_045
		    dw NoRadio
		    dw RadioRoom_045
		    dw NoRadio
		    dw RadioRoom_050
		    dw RadioRoom_045
		    dw NoRadio
		    dw RadioRoom_053
		    dw RadioRoom_054
		    dw NoRadio
		    dw NoRadio
		    dw RadioRoom_054
		    dw RadioRoom_058
		    dw RadioRoom_058
		    dw RadioRoom_058
		    dw RadioRoom_058
		    dw RadioRoom_058
		    dw RadioRoom_058
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw RadioRoom_067
		    dw NoRadio
		    dw RadioRoom_069
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
		    dw RadioRoom_082
		    dw RadioRoom_083
		    dw NoRadio
		    dw NoRadio
		    dw RadioRoom_086
		    dw RadioRoom_087
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw RadioRoom_093
		    dw RadioRoom_094
		    dw NoRadio
		    dw RadioRoom_094
		    dw RadioRoom_094
		    dw NoRadio
		    dw RadioRoom_099
		    dw RadioRoom_094
		    dw NoRadio
		    dw RadioRoom_102
		    dw RadioRoom_103
		    dw RadioRoom_104
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw RadioRoom_108
		    dw NoRadio
		    dw NoRadio
		    dw RadioRoom_111
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw RadioRoom_115
		    dw RadioRoom_116
		    dw RadioRoom_045
		    dw NoRadio
		    dw RadioRoom_119
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw RadioRoom_123
		    dw RadioRoom_123
		    dw RadioRoom_123
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
		    dw RadioRoom_150
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
		    dw RadioRoom_165
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
		    dw RadioRoom_178
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw RadioRoom_182
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw RadioRoom_192
		    dw RadioRoom_193
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw NoRadio
		    dw RadioRoom_202
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
		    dw RadioRoom_123
		    dw RadioRoom_123
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

