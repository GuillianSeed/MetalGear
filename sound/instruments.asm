;----------------------------------------------------------------------------
;
; Index	of instruments
;
;----------------------------------------------------------------------------
Instruments:	    dw Drumkit
		    dw DummyInstrument1
		    dw DummyInstrument2
		    dw SlapBass
		    dw Bass


;----------------------------------------------------------------------------
;
; Drum kit
;
;----------------------------------------------------------------------------
Drumkit:	    dw HitHat
		    dw Cymbal
		    dw SnareDrum
		    dw SnareDrum2
		    dw DummyDrum
		    dw DummyDrum
		    dw DummyDrum
		    dw Tom1
		    dw Tom2
		    dw Tom3
		    dw Tom4
		    dw BassDrum


HitHat:		    db	21h,   1, 10h,0B0h,0FFh

Cymbal:		    db	23h,   1, 10h,0BAh,   0, 21h,	4, 10h,	90h, 80h, 70h, 60h,0FFh

SnareDrum:	    db	2Ah,   1,   0,0B8h,0A1h, 80h, 21h,   1,	14h,0B0h, 90h, 80h, 70h, 60h, 50h,0FFh

SnareDrum2:	    db	2Ah,   1,   0,0B8h,0A1h, 80h, 21h,   1,	14h, 90h, 80h, 70h, 60h,0FFh

DummyDrum:	    db 0FFh

Tom1:		    db	22h,   1,0B1h,0A0h,0A1h,0AAh,0A1h,0B5h,	91h,0C0h, 91h,0CAh, 91h,0D5h, 81h,0E0h
		    db	81h,0EAh, 81h,0F5h, 82h,   0, 72h, 0Ah,	72h, 15h, 72h, 20h, 72h, 2Ah, 62h, 35h
		    db	52h, 40h,0FFh

Tom2:		    db	22h,   1,0C2h,	 0,0B2h, 0Ah,0B2h, 15h,0A2h, 20h,0A2h, 2Ah,0A2h, 35h, 92h, 40h
		    db	92h, 4Ah, 92h, 55h, 92h, 60h, 82h, 6Ah,	82h, 75h, 82h, 80h, 82h, 8Ah, 82h, 95h
		    db	72h,0A0h, 72h,0AAh, 72h,0B5h, 62h,0C0h,0FFh

Tom3:		    db	22h,   1,0D3h,	 0,0C3h, 0Ah,0C3h, 15h,0B3h, 20h,0B3h, 2Ah,0B3h, 35h,0A3h, 40h
		    db 0A3h, 4Ah,0A3h, 55h,0A3h, 60h, 93h, 6Ah,	93h, 75h, 93h, 80h, 93h, 8Ah, 93h, 95h
		    db	83h,0A0h, 83h,0AAh, 83h,0B5h, 73h,0C0h,0FFh

Tom4:		    db	22h,   1,0E4h,	 0,0D4h, 15h,0C4h, 30h,0C4h, 45h,0B4h, 60h,0B4h, 75h,0B4h, 90h
		    db 0A4h,0B0h,0A4h,0D0h,0A4h,0F0h,0A5h, 10h,	95h, 30h, 95h, 50h, 84h, 70h, 84h, 90h
		    db	84h,0B0h, 74h,0D0h, 74h,0F0h,0FFh

BassDrum:	    db	2Ah,   1,   3,	 0, 93h,0D0h, 2Eh,   1,	96h,   0, 97h,	 0, 98h,   0,0FFh


;----------------------------------------------------------------------------
;
; Dummy	instrument
;
;----------------------------------------------------------------------------
DummyInstrument1:   dw DummyInstrumentDat
		    dw DummyInstrumentDat
		    dw DummyInstrumentDat
		    dw DummyInstrumentDat
		    dw DummyInstrumentDat
		    dw DummyInstrumentDat
		    dw DummyInstrumentDat
		    dw DummyInstrumentDat
		    dw DummyInstrumentDat
		    dw DummyInstrumentDat
		    dw DummyInstrumentDat
		    dw DummyInstrumentDat
		    
DummyInstrumentDat: db 0FFh

;----------------------------------------------------------------------------
;
; Dummy	instrument
;
;----------------------------------------------------------------------------
DummyInstrument2:   dw DummyInstrumentDat2
		    dw DummyInstrumentDat2
		    dw DummyInstrumentDat2
		    dw DummyInstrumentDat2
		    dw DummyInstrumentDat2
		    dw DummyInstrumentDat2
		    dw DummyInstrumentDat2
		    dw DummyInstrumentDat2
		    dw DummyInstrumentDat2
		    dw DummyInstrumentDat2
		    dw DummyInstrumentDat2
		    dw DummyInstrumentDat2
		    
DummyInstrumentDat2:db 0FFh


;----------------------------------------------------------------------------
;
; Slap bass
;
;----------------------------------------------------------------------------
SlapBass:	    dw DummySlapBass
		    dw DummySlapBass
		    dw DummySlapBass
		    dw DummySlapBass
		    dw SlapBass1
		    dw DummySlapBass2
		    dw DummySlapBass2
		    dw SlapBass2
		    dw DummySlapBass3
		    dw SlapBass3
		    dw DummySlapBass4
		    dw SlapBass4

DummySlapBass:	    db 0FFh

SlapBass1:	    db	22h,   1,0CAh, 9Ah,0C5h, 4Dh, 22h,   4,0CAh, 9Ah,0BAh, 9Ch,0AAh, 9Eh, 9Ah,0A0h
		    db	8Ah,0A2h, 8Ah,0A4h, 7Ah,0A6h, 7Ah,0A8h,	6Ah,0AAh, 6Ah,0ACh
DummySlapBass2:	    db 0FFh

SlapBass2:	    db	22h,   1,0C8h,0EAh,0C4h, 75h, 22h,   4,0C8h,0EEh,0B8h,0F0h,0A8h,0F2h, 98h,0F4h
		    db	88h,0F6h, 88h, 78h
DummySlapBass3:	    db 0FFh

SlapBass3:	    db	22h,   1,0C7h,0F2h,0C3h,0F9h, 22h,   4,0C7h,0F2h,0B7h,0F4h,0A7h,0F6h, 97h,0F8h
		    db	87h,0FAh, 87h,0FCh, 77h,0FDh, 78h,   0,	68h,   2, 68h,	 4
DummySlapBass4:	    db 0FFh

SlapBass4:	    db	22h,   1,0C7h, 14h,0C3h, 8Ah, 22h,   4,0C7h, 14h,0B7h, 16h,0A7h, 18h, 97h, 1Ah
		    db	87h, 1Ch, 87h, 1Eh, 77h, 20h, 77h, 22h,	67h, 24h, 67h, 26h,0FFh


;----------------------------------------------------------------------------
;
; Bass
;
;----------------------------------------------------------------------------
Bass:		    dw Bass1
		    dw Bass2
		    dw Bass3
		    dw BassDummy1
		    dw Bass4
		    dw Bass5
		    dw Bass6
		    dw Bass7
		    dw BassDummy2
		    dw Bass8
		    dw BassDummy3
		    dw Bass9

Bass1:		    db	22h,   1,0C6h,0AEh,0C3h, 57h, 22h,   4,0C6h,0AEh,0B6h,0B0h,0A6h,0B2h, 96h,0B4h
		    db	86h,0B6h, 86h,0B8h, 76h,0BAh, 76h,0BCh,	66h,0BEh, 66h,0C0h,0FFh

Bass2:		    db	22h,   1,0C6h, 4Eh,0C3h, 27h, 22h,   4,0C6h, 4Eh,0B6h, 50h,0A6h, 52h, 96h, 54h
		    db	86h, 56h, 86h, 58h, 76h, 5Ah, 76h, 5Ch,	66h, 5Eh, 66h, 60h,0FFh

Bass3:		    db	22h,   1,0C5h,0F4h,0C2h,0FAh, 22h,   3,0C5h,0F4h,0B5h,0F6h,0A5h,0F8h, 95h,0FAh
		    db	85h,0FCh, 85h,0FDh, 76h,   0, 76h,   2,	66h,   4, 66h,	 6

BassDummy1:	    db 0FFh

Bass4:		    db	22h,   1,0C5h, 4Dh,0C2h,0A6h, 22h,   4,0C5h, 4Dh,0B5h, 4Fh,0A5h, 51h, 95h, 53h
		    db	85h, 55h, 85h, 57h, 75h, 59h, 75h, 5Bh,	65h, 5Dh, 65h, 60h,0FFh

Bass5:		    db	22h,   1,0C5h,	 1,0C2h, 80h, 22h,   4,0C5h,   1,0B5h,	 3,0A5h,   5, 95h,   7
		    db	85h,   9, 85h, 0Bh, 75h, 0Dh, 75h, 11h,	65h, 13h, 65h, 15h,0FFh

Bass6:		    db	22h,   1,0C4h,0B9h,0C2h, 5Ch, 22h,   4,0C4h,0B9h,0B4h,0BBh,0A4h,0BDh, 94h,0BFh
		    db	84h,0C1h, 84h,0C3h, 74h,0C5h, 74h,0C7h,	64h,0C9h, 64h,0CBh,0FFh

Bass7:		    db	22h,   1,0C4h, 75h,0C2h, 3Ah, 22h,   4,0C4h, 75h,0B4h, 77h,0A4h, 79h, 94h, 7Bh
		    db	84h, 7Dh, 84h, 7Fh, 74h, 81h, 74h, 83h,	64h, 85h, 64h, 87h

BassDummy2:	    db 0FFh

Bass8:		    db	22h,   1,0C3h,0F9h,0C1h,0FCh, 22h,   4,0C3h,0F9h,0B3h,0FAh,0A3h,0FBh, 93h,0FCh
		    db	83h,0FDh, 84h,	 0, 74h,   1, 74h,   2,	64h,   3, 64h,	 4
BassDummy3:	    db 0FFh

Bass9:		    db	22h,   1,0C3h, 8Ah,0C1h,0C5h, 22h,   4,0C3h, 8Ah,0B3h, 8Bh,0A3h, 8Ch, 93h, 8Dh
		    db	83h, 8Eh, 83h, 8Fh, 73h, 90h, 73h, 91h,	63h, 92h, 53h, 93h,0FFh

