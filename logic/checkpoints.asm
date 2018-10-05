;---------------------------------------------------------------------------
;
; Checkpoints
;
; The game progress is saved when moving from room A to	B
; So it	is possible to continue	from that points after a game over
;
;---------------------------------------------------------------------------

ChkSaveGameStatus:
		    ld	    a, (MetalGear_KO)		    ; Metal Gear destroyed. Self destruction activated
		    and	    a
		    ret	    nz				    ; The game status is not saved after destroying Metal Gear

		    ld	    hl,	SaveStatRooms		    ; List of rooms that work as checkpoints
		    ld	    a, (Room)
		    ld	    d, a
		    ld	    a, (PreviousRoom)
		    ld	    e, a
		    ld	    b, 31			    ; Number of	available checkpoints

ChkSaveGameStatus2:
		    ld	    a, (hl)
		    inc	    hl
		    cp	    d
		    jr	    nz,	ChkSaveGameStatus3

		    ld	    a, (hl)
		    cp	    e
		    jr	    z, StoreGameStat

ChkSaveGameStatus3:
		    inc	    hl
		    djnz    ChkSaveGameStatus2
		    ret


;---------------------------------------------------------------------------
;
; Restore checkpoint
;
;---------------------------------------------------------------------------

RestoreGameStat:
		    xor	    a
		    call    SaveGameStaus2

		    xor	    a
		    ld	    (DamageDelayTimer),	a
		    ret


;---------------------------------------------------------------------------
;
; Create checkpoint (savestate)
;
;---------------------------------------------------------------------------

StoreGameStat:
		    ld	    a, 1			    ; Save mode

SaveGameStaus2:
		    ld	    ix,	TempData
		    ld	    (ix+0), a

		    ld	    de,	GameProgressBuffer
		    ld	    hl,	GameDataAreas

SaveGameStaus3:
		    ld	    c, (hl)
		    inc	    c
		    ret	    z				    ; FF = End list

		    dec	    c
		    inc	    hl
		    ld	    b, (hl)			    ; BC = Address
		    inc	    hl
		    ld	    a, (hl)			    ; A	= Number of bytes
		    inc	    hl
		    push    hl

		    ld	    l, c
		    ld	    h, b
		    ld	    c, a
		    ld	    b, 0

		    bit	    0, (ix+0)			    ; Store or restore game status?
		    jr	    nz,	SaveGameStaus4

		    ex	    de,	hl			    ; Swap source and destination addresses

SaveGameStaus4:
		    ldir				    ; Transfer data

		    bit	    0, (ix+0)
		    jr	    nz,	SaveGameStaus5

		    ex	    de,	hl

SaveGameStaus5:
		    pop	    hl
		    jr	    SaveGameStaus3



;---------------------------------------------------------------------------
;
; Game memory blocks used to save/restore checkpoints
; DW address
; DB Number of bytes

; FF = End
;---------------------------------------------------------------------------
GameDataAreas:	    dw Room
		    db 20h
		    dw PlayerControlMod			    ; 8=Intro scene, 7=Ladders climb, 6=ladders	walk, 5=Air flow, 4=Parachute, 3=Dead, 2=Elevator, 1=Punch, 0=Walk
		    db 20h
		    dw MaxAmmoGun
		    db 50h
		    dw DoorOpenArray			    ; 0=Open/1=Closed status of	all doors
		    db 0D8h
		    dw Equipment			    ; +0 Item ID, +1 tens/units, +2 hundreds, +3 unused
		    db 90h
		    dw GameDataArea
		    db 0A0h
		    db 0FFh

;---------------------------------------------------------------------------
;
; Rooms	where the game progress	is stored to continue from there.
; When passing from first room to second room
;
;---------------------------------------------------------------------------
SaveStatRooms:	    db	121, 121
		    db	121,   0			    ; Begining
		    db	240,   3			    ; Elevator West 1st	floor building 1
		    db	240,  31			    ; Elevator West 2nd	floor building 1
		    db	242,  39			    ; Elevator East 3rd	floor building 1
		    db	241,  15			    ; Elevator East 1st	floor building 1
		    db	241,  27			    ; Elevator East 2nd	floor building 1
		    db	242,  53			    ; Elevator 1st floor building 1
		    db	241,  63			    ; Elevator roof building 1
		    db	243,  72			    ; Elevator West 1st	floor building 2
		    db	245, 206			    ; Elevator East 1st	floor building 2
		    db	243,  95			    ; Elevator West basement building 2	(firetrooper)
		    db	245, 207			    ; Elevator East basement building 2
		    db	244,  88			    ; Elevator West roof building 2
		    db	246, 154			    ; Elevator East roof building 2
		    db	243,  81			    ; Elevator West 2nd	floor building 2
		    db	245, 205			    ; Elevator East 2nd	floor building 2
		    db	247, 109			    ; Elevator 1st floor building 3
		    db	250, 115			    ; Elevator basement	building 3
		    db	165,   8			    ; Arrested room to prison
		    db	 10, 204			    ; Landing on yard
		    db	 64,  11			    ; Exit to desert from building 1
		    db	 73,  69			    ; Entering from desert to building 2 from 1
		    db	125,  93			    ; Entering dark room in basement building 2
		    db	 56, 123			    ; Exit dark	room in	basement building 2
		    db	102,  75			    ; Entering from desert from	building 3 to 2
		    db	108, 104			    ; Entering from desert to building 3
		    db	105,  78			    ; Water channel building 2 south
		    db	110, 107			    ; Water channel building 2 north
		    db	118, 116			    ; Enter Metal Gear room
		    db	123,  56			    ; Enter dark rooms from south