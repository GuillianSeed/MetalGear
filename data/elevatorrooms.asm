;----------------------------------------------------------------------------
;
; Index	of elevators
;
;----------------------------------------------------------------------------
idxElevatorRoom:    dw ElevatorRoom1
		    dw ElevatorRoom2
		    dw ElevatorRoom3
		    dw ElevatorRoom4
		    dw ElevatorRoom5
		    dw ElevatorRoom6
		    dw ElevatorRoom7
		    dw ElevatorRoom8
		    dw ElevatorRoom9_10
		    dw ElevatorRoom9_10
		    dw ElevatorRoom11
;----------------------------------------------------------------------------
;
; Elevators
;
; db Elevator Limit up,	limit down
;
; db previous room (room used to enter the elevator)
; db Y player, Y elevator
; (...)
;----------------------------------------------------------------------------
ElevatorRoom1:	    dw 0B838h
		    db 31
		    dw 3834h
		    db 3
		    dw 0B8B4h

ElevatorRoom2:	    dw 0B828h
		    db 27
		    dw 3834h
		    db 15
		    dw 7874h
		    db 63
		    dw 0B8B4h

ElevatorRoom3:	    dw 0C878h
		    db 53
		    dw 7874h
		    db 39
		    dw 0B8B4h


ElevatorRoom4:	    dw 0B828h
		    db 51h
		    dw 3834h
		    db 48h
		    dw 7874h
		    db 5Fh
		    dw 0B8B4h


ElevatorRoom5:	    dw 0C8B8h
		    db 58h
		    dw 0B8B4h


ElevatorRoom6:	    dw 0B828h
		    db 0CDh
		    dw 3834h
		    db 0CEh
		    dw 7874h
		    db 0CFh
		    dw 0B8B4h


ElevatorRoom7:	    dw 0C8B8h
		    db 9Ah
		    dw 0B8B4h


ElevatorRoom8:	    dw 0C838h
		    db 6Dh
		    dw 3834h


ElevatorRoom9_10:   dw 0C828h
		    db 0
		    dw 0
		    db 0
		    dw 0
		    db 0
		    dw 0


ElevatorRoom11:	    dw 0B828h
		    db 73h
		    dw 0B8B4h
