;----------------------------------------------------------------------------
;
; Init prisoner
;
;----------------------------------------------------------------------------

InitPrisoner:
		    ld	    (ix+PRISONER.SpriteId), 3Eh	    ; Prisoner sprite ID

		    ld	    a, (ix+PRISONER.ID)		    ; Actor ID
		    call    CountEnemyType		    ; Count the	number of actors with the same ID
		    ld	    (ix+PRISONER.IDX_SAME_ID), a    ; Index of this actor of his kind

		    ld	    a, r
		    ld	    (ix+PRISONER.ANIM_CNT), a
		    ld	    (ix+PRISONER.FALL_TIME), 20h
		    ld	    (ix+PRISONER.TIMER), 2

		    ld	    a, (Room)
		    ld	    hl,	RoomsPrisoner
		    ld	    bc,	23
		    cpir				    ; Get the prisoner ID / index

		    ld	    e, c
		    ld	    d, 0
		    ld	    hl,	RescuedArray
		    add	    hl,	de			    ; Pointer to rescued status	of the prisoner

		    ld	    a, (hl)
		    or	    a				    ; Was the prisoner rescued?
		    jp	    nz,	DismissActor0		    ; Yes, remove actor

		    ld	    (ix+PRISONER.P_RESCUED_L), l
		    ld	    (ix+PRISONER.P_RESCUED_H), h    ; Store the	pointer	to rescued status
		    ret


;----------------------------------------------------------------------------
; Rooms	with prisoners
; The first 6 prisoners	are not	restored after killing one of them
; 189=Fake Madnar, 182=Madnar, 167=Ellen, 164=GreyFox, 203=Prisoner, 202=Prisoner "You must have a compass to cross the desert"
;----------------------------------------------------------------------------
RoomsPrisoner:	    db	189, 182, 167, 164, 203, 202
		    db	198, 195, 194, 193, 190, 186
		    db	180, 161, 159, 152, 148, 146
		    db	145, 144, 136, 134, 129


;----------------------------------------------------------------------------
;
; Prisoner logic
;
;----------------------------------------------------------------------------

PrisonerLogic:
		    ld	    a, (ix+ACTOR2.Status)
		    call    JumpIndex

		    dw PrisonerIdle
		    dw PrisonerWait
		    dw PrisonerRescued
		    dw PrisonerDummy


;----------------------------------------------------------------------------
;
; Animate prisoner
; Wait until Snake touch him/her
; In Coward Duck room, the prisoners can not be	rescued	until CARD 8 is	taken (after defeating him)
; If the prisoner is ELLEN, show the "HELP ME" text in intervals
;
;----------------------------------------------------------------------------

PrisonerIdle:
		    ld	    a, (ix+PRISONER.ID)		    ; Bit 7 = Killed
		    cp	    ID_ELLEN
		    call    z, ChkSayHelpMe		    ; Ellen says "Help me!"

		    ld	    b, 0Fh
		    call    Anim2FramesActor		    ; Animathe the prisoner each 8 iterations

		    ld	    a, (Room)
		    cp	    193				    ; Coward Duck room
		    jr	    nz,	PrisonerIdle2

		    ld	    a, (Card8Taken)
		    or	    a
		    ret	    z				    ; You can't rescue the prisoners until defeating Coward Duck and taking card 8

PrisonerIdle2:
		    bit	    7, (ix+ACTOR2.TOUCH_INFO)	    ; Is Snake touching	the prisoner?
		    ret	    z				    ; Not rescued yet

		    ld	    (ix+ACTOR2.TIMER), 2
		    ld	    (ix+ACTOR2.SpriteId), 40h	    ; Prisoner free sprite ID
		    jr	    PrisonerNextStat		    ; Next status


;----------------------------------------------------------------------------
;
; Help me text logic
;
;----------------------------------------------------------------------------

ChkSayHelpMe:
		    dec	    (ix+ACTOR2.TIMER)
		    ret	    nz				    ; Wait

		    ld	    (ix+ACTOR2.TIMER), 0C0h	    ; Delay for	the next request

		    ld	    a, 128			    ; TEXT: Help me
		    jp	    SetTextUnskippable


;----------------------------------------------------------------------------
;
; Set the prisoner as rescued
; Increment number of rescued prisoners
; Print	his/her	text
;
; In:
;   IX = Pointer to actor
;    B = Text ID
;
;----------------------------------------------------------------------------

RescuePrisoner:
		    ld	    a, b

		    push    af

		    call    SetAsRescued		    ; Set as rescued
		    call    PrisonerNextStat		    ; Next status -> Do	nothing

		    push    ix
		    call    IncRescued			    ; Increment	number of rescued prisoners and	check rank upgrade
		    pop	    ix

		    pop	    af
		    jp	    SetText			    ; Print his/her text


;----------------------------------------------------------------------------
;
; Dr. Prettrovich Madnar logic
; He will not give us information unless we rescue his daughter
; (!?) It is possible to increment the number to rescued prisoners several times
;
;----------------------------------------------------------------------------

MadnarLogic:
		    ld	    a, (RescuedArray+14h)
		    or	    a				    ; Is Ellen rescued?
		    ld	    a, 124			    ; TEXT: I'M DR. PETTROVICH.*MY DAUGHTER ELLEN WAS TAKEN AS HOSTAGE.*SAVE ELLEN OR,I WON'T DISCUSS METAL GEAR.
		    jr	    z, RescueAndShowTxt		    ; (!?) You can rescue him several times and	upgrade	your rank!

		    inc	    a				    ; TEXT: I'm Dr. Pettrovich...

		    call    SetAsRescued		    ; Set the prisoner as rescued

RescueAndShowTxt:
		    push    ix
		    push    af
		    call    IncRescued			    ; Increment	the number of rescued prisoners.
		    pop	    af
		    pop	    ix

		    call    SetText			    ; Show the text

PrisonerNextStat:
		    inc	    (ix+ACTOR.Status)		    ; Next prisoner status
		    ret

;----------------------------------------------------------------------------
;
; Rescue Coward	Duck prisoners
; Jennifer's brother
;
;----------------------------------------------------------------------------

ChkRescJenBro:
		    ld	    a, (ix+ACTOR.Y)
		    cp	    54h				    ; Jeniffer's brother Y coordinate
		    ld	    a, 131			    ; TEXT: RESCUED
		    jr	    nz,	RescueAndShowTxt

		    call    SetAsRescued		    ; Set the prisoner as rescued

		    ld	    a, 140			    ; TEXT: RESCUED!*I'M A BROTHER OF*JENNIFER.*CLIMB THE LEFT*LADDER*WHEN ESCAPING.
		    jr	    RescueAndShowTxt


;----------------------------------------------------------------------------
;
; Prisoner delay before	next status
;
;----------------------------------------------------------------------------

PrisonerWait:
		    dec	    (ix+PRISONER.TIMER)
		    ret	    nz

		    jr	    PrisonerNextStat


;----------------------------------------------------------------------------
;
; Prisoner rescued logic
;
;----------------------------------------------------------------------------

PrisonerRescued:
		    ld	    a, (ix+ACTOR.ID)		    ; Actor ID
		    cp	    ID_MADNAR
		    jr	    z, MadnarLogic

		    ld	    a, (Room)
		    ld	    b, 81h			    ; TEXT: THANK YOU. I'M THE DAUGHTER OF DR. PETTROVICH, ELLEN.
		    cp	    167				    ; Ellen's room
		    jr	    z, RescuePrisoner

		    cp	    193				    ; Coward Duck room
		    jr	    z, ChkRescJenBro

		    ld	    hl,	PrisonerTexts		    ; Array of rooms and texts of the prisoners
		    ld	    b, 19

RescuedLogic2:
		    cp	    (hl)			    ; Same room?
		    jr	    z, RescuedLogic3		    ; Yes

		    inc	    hl
		    inc	    hl
		    djnz    RescuedLogic2
		    ret


;----------------------------------------------------------------------------
;
; Set the prisoner as rescued, print his text, increment number	of rescued prisoners
;
;----------------------------------------------------------------------------

RescuedLogic3:
		    inc	    hl
		    ld	    b, (hl)			    ; Text ID
		    call    SetAsRescued		    ; Set the prisoner as rescued

		    ld	    a, b
		    call    SetText

		    push    ix
		    call    IncRescued			    ; Increment	rescued	prisoners and check rank upgrade
		    pop	    ix

		    jr	    PrisonerNextStat		    ; Next status -> Do	nothing



;----------------------------------------------------------------------------
;
; Prisoners texts
; Room,	text ID
;
;----------------------------------------------------------------------------
				       ; I'm saved! Dr. Pettrovich was moved to building 2. Building 2 is 10km north of here.
PrisonerTexts:	    db	129,  90
		    db	134,  52			    ; I'm saved! The FOX HOUNDer called Grey Fox or something... is confined in an isolated cell.
		    db	136,  54			    ; I'm Saved! The best way to the isolated cell is to be caught by the enemy...
		    db	144,  78			    ; I'm Saved! Dr. Pettrovich's in a cell in the courtyard.
		    db	145, 131			    ; Rescued
		    db	146,  32			    ; I'm Saved! The FOX HOUNDer who infiltrated a few days ago is safe. They're holding him.
		    db	148,  28			    ; I'm saved!
		    db	152,  28			    ; I'm saved!
		    db	159,  27			    ; I'm saved! Diane of the Resistance supports you on frequency 12033...
		    db	161,  84			    ; I'm saved! Use a Parachute to dive between the fences.
		    db	164,  59			    ; Glad you arrived,	rookie... I'm Grey Fox...
		    db	180, 123			    ; I'm saved! The water channel goes to building 3.
		    db	186, 101			    ; I'm saved! Dr. Pettrovich's in an underground cell.
		    db	190, 107			    ; I'm Saved! Only way off this floor is to use the north elevator!
		    db	194, 144			    ; I'm Saved!* The Boss of Outer Heaven is the commander-in-chief of FOX HOUND, Big Boss!...
		    db	195,  77			    ; I'm saved! The only way to the courtyard is a Parachute dive from the rooftop.
		    db	198, 116			    ; I'm saved! Call Jennifer of the Resistance on frequency 12048...
		    db	202, 115			    ; I'm saved! Use a Compass to cross the desert.
		    db	203, 131			    ; Rescued!

;---------------------------------------------------------------------------
;
; Init Ellen voice
; You can hear Ellen saying "HELP ME" from the adjacent room
;
;---------------------------------------------------------------------------


InitEllenVoice:
		    ld	    a, (RescuedArray+14h)
		    or	    a				    ; Was Ellen	rescued?
		    jp	    nz,	DismissActor0		    ; Yes, remove the actor

		    ld	    (ix+PRISONER.COLLISION_CFG), 0  ; Do not detect collisions with the	player or his shots
		    ld	    (ix+PRISONER.TIMER), 20h
		    ret


;---------------------------------------------------------------------------
;
; Set the prisoner as rescued
;
;---------------------------------------------------------------------------

SetAsRescued:
		    ld	    l, (ix+PRISONER.P_RESCUED_L)
		    ld	    h, (ix+PRISONER.P_RESCUED_H)    ; HL = Pointer to the prisoner rescued status in the rescued array
		    ld	    (hl), 1			    ; Set as rescued

PrisonerDummy:
		    ret