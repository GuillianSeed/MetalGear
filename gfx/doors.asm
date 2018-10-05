
;----------------------------------------------------------------------------
;
; Doors	graphics
;
;----------------------------------------------------------------------------
GfxDoorFront:	    db	11h, 3Fh,0FFh,0FFh,0FFh,0FFh,0CCh,0CCh,0FCh, 1Fh,0C5h, 55h,0F1h,0FFh,0C5h, 55h
		    db 0F1h, 3Fh,0C5h, 55h,0F3h,0FFh,0C5h, 55h,0F1h, 3Fh,0C5h, 55h,0FFh,0FFh,0C5h, 55h
		    db 0FFh,0FFh,0FFh,0FFh,0CCh,0CCh,0CCh,0CCh,	55h, 55h, 55h, 55h, 55h, 55h, 55h, 55h
		    db	55h,0FFh, 3Fh,0F3h, 55h,0FFh, 3Fh,0F3h,	55h,0FFh,0CFh,0FCh, 59h,0FFh,0CFh,0FCh
		    db 0FFh,0FFh,0FFh,0FFh,0CCh,0CCh,0CCh,0CCh,	55h, 55h, 55h, 55h, 55h, 55h, 55h, 55h
		    db 0FFh, 3Fh,0F3h, 95h,0FFh, 3Fh,0F3h, 55h,0FFh,0CFh,0F3h, 55h,0FFh,0CFh,0F3h, 55h
		    db 0FFh,0FFh,0F3h, 11h,0CCh,0CCh,0FFh,0FFh,	55h, 53h,0FCh, 1Fh, 55h, 53h,0FFh, 3Fh
		    db	55h, 53h,0F1h, 3Fh, 55h, 53h,0FFh, 3Fh,	55h, 53h,0F1h, 3Fh, 55h, 53h,0FFh,0FFh
		    db	33h, 3Fh,0C5h, 55h,0FFh,0FFh,0C5h, 59h,0FCh, 3Fh,0C5h, 55h,0F1h,0FFh,0C5h, 55h
		    db 0F1h, 3Fh,0C5h, 55h,0F3h,0FFh,0C5h, 55h,0F1h, 3Fh,0C5h, 55h,0FFh,0FFh,0C5h, 55h
		    db	59h,0FFh,0CFh,0FCh, 59h,0FFh,0CFh,0FCh,	59h, 33h, 33h, 33h, 55h, 55h, 99h, 99h
		    db	55h, 55h, 59h, 55h, 55h, 55h, 55h, 55h,	55h, 5Fh,0FFh,0FFh, 55h, 5Fh,0CCh,0CCh
		    db 0FFh,0CFh,0F3h, 55h,0FFh,0CFh,0F3h, 95h,	33h, 33h, 33h, 95h, 99h, 99h, 99h, 95h
		    db	99h, 95h, 99h, 55h, 55h, 55h, 59h, 55h,0FFh,0FFh,0F5h, 55h,0CCh,0CCh,0F5h, 55h
		    db	55h, 53h,0F3h, 33h, 55h, 53h,0FFh,0FFh,	55h, 53h,0FCh, 1Fh, 55h, 53h,0FFh, 3Fh
		    db	55h, 53h,0F1h, 3Fh, 55h, 53h,0FFh, 3Fh,	95h, 53h,0F1h, 3Fh, 55h, 53h,0FFh,0FFh
		    db	33h, 3Fh,0C5h, 55h,0FFh,0FFh,0C5h, 55h,0FCh, 3Fh,0C5h, 55h,0F1h,0FFh,0C5h, 59h
		    db 0F1h, 3Fh,0C5h, 59h,0F3h,0FFh,0C5h, 59h,0F1h, 3Fh,0C5h, 99h,0FFh,0FFh,0C5h, 95h
		    db	55h, 5Fh,0CCh,0CCh, 55h, 5Fh, 55h, 55h,	55h, 5Fh, 55h, 88h, 55h, 5Fh, 55h, 55h
		    db	55h, 5Fh,0FFh,0FFh, 55h, 5Fh,0FFh,0FFh,	55h, 59h, 55h, 55h, 55h, 99h, 59h, 55h
		    db 0CCh,0CCh,0F5h, 55h, 55h, 55h,0F5h, 55h,	88h, 55h,0F5h, 55h, 55h, 55h,0F5h, 55h
		    db 0FFh,0FFh,0F5h, 55h,0FFh,0FFh,0F5h, 55h,	55h, 59h, 55h, 55h, 55h, 99h, 59h, 55h
		    db	55h, 53h,0F3h, 33h, 55h, 53h,0FFh,0FFh,	55h, 53h,0FCh, 1Fh, 55h, 53h,0FFh, 3Fh
		    db	55h, 53h,0F1h, 3Fh, 55h, 53h,0FFh, 3Fh,	95h, 53h,0F1h, 3Fh, 55h, 53h,0FFh,0FFh
		    db	33h, 3Fh,0C5h, 95h,0FFh,0FFh,0C5h, 99h,0FCh, 3Fh,0C5h, 95h,0F1h,0FFh,0C5h, 99h
		    db 0F1h, 3Fh,0C5h, 99h,0F3h,0FFh,0C5h, 99h,0F1h, 3Fh, 33h, 33h,0FFh,0FFh,0FFh,0FFh
		    db	95h, 55h, 99h, 95h, 95h, 95h, 59h, 99h,	99h, 99h, 55h, 59h, 95h, 59h, 55h, 99h
		    db	95h, 59h, 99h, 99h, 99h, 99h, 95h, 95h,0F3h,0FFh, 33h, 33h,0FFh,0FFh,0FFh,0FFh
		    db	55h, 99h, 55h, 59h, 55h, 99h, 55h, 59h,	95h, 95h, 55h, 59h, 99h, 99h, 55h, 99h
		    db	59h, 99h, 99h, 99h, 59h, 99h, 95h, 55h,	3Fh,0FFh, 3Fh, 33h,0FFh,0FFh,0FFh,0FFh
		    db	59h, 53h,0F3h, 33h, 99h, 53h,0FFh,0FFh,	99h, 53h,0FCh, 1Fh, 59h, 53h,0FFh, 3Fh
		    db	99h, 53h,0F1h, 3Fh, 55h, 53h,0FFh, 3Fh,	33h, 33h,0F1h, 3Fh,0FFh,0FFh,0FFh,0FFh


GfxDoorElevator:    db	11h, 3Fh,0FFh,0FFh,0FFh,0FFh,0CCh,0C5h,0FCh, 1Fh,0C5h, 55h,0F1h,0FFh,0C5h, 55h
		    db 0F1h, 3Fh,0C5h, 55h,0F3h,0FFh,0C5h, 55h,0F1h, 3Fh,0C5h, 55h,0FFh,0FFh,0C5h, 55h
		    db 0FFh,0FFh,0FFh,0FFh,0FCh,0CCh,0CCh,0CFh,	5Fh,0C5h, 55h, 5Fh, 55h,0FCh, 55h, 5Fh
		    db	55h, 5Fh,0C5h, 5Fh, 55h, 55h,0FFh,0FFh,	55h, 55h, 55h, 5Fh, 55h, 55h, 55h, 5Fh
		    db 0FFh,0FFh,0FFh,0FFh,0CCh,0CCh,0CCh,0FFh,0C5h, 55h, 5Fh,0F5h,0C5h, 55h,0FFh, 55h
		    db 0C5h, 5Fh,0F5h, 55h,0FFh,0FFh, 55h, 55h,0C5h, 55h, 55h, 55h,0C5h, 55h, 55h, 55h
		    db 0FFh,0FFh,0F3h, 11h, 5Ch,0CCh,0FFh,0FFh,	55h, 53h,0FCh, 1Fh, 55h, 53h,0FFh, 3Fh
		    db	55h, 53h,0F1h, 3Fh, 55h, 53h,0FFh, 3Fh,	55h, 53h,0F1h, 3Fh, 55h, 53h,0FFh,0FFh
		    db	33h, 3Fh,0CFh, 55h,0FFh,0FFh,0CCh,0F5h,0FCh, 3Fh,0C5h,0CFh,0F1h,0FFh,0C5h, 5Ch
		    db 0F1h, 3Fh,0C5h, 55h,0F3h,0FFh,0C5h, 55h,0F1h, 3Fh,0C5h, 55h,0FFh,0FFh,0C5h, 55h
		    db	55h, 55h, 55h, 5Fh, 55h, 55h, 55h, 5Fh,	55h, 55h, 55h, 5Fh,0F5h, 55h, 55h, 5Fh
		    db 0CFh, 55h, 55h, 5Fh, 5Ch,0F5h, 55h, 5Fh,	55h,0F5h, 55h, 5Fh, 95h,0F5h, 55h, 5Fh
		    db 0C5h, 55h, 55h, 55h,0C5h, 55h, 55h, 55h,0C5h, 55h, 55h, 55h,0C5h, 55h, 55h, 5Fh
		    db 0C5h, 55h, 55h,0FCh,0C5h, 55h, 5Fh,0C5h,0C5h, 55h, 5Fh,0C5h,0C5h, 55h, 5Fh,0C5h
		    db	55h,0F3h,0F3h, 33h, 5Fh,0C3h,0FFh,0FFh,0FCh, 53h,0FCh, 1Fh,0C5h, 53h,0FFh, 3Fh
		    db	55h, 53h,0F1h, 3Fh, 55h, 53h,0FFh, 3Fh,	55h, 53h,0F1h, 3Fh, 55h, 53h,0FFh,0FFh
		    db	33h, 3Fh,0C5h, 55h,0FFh,0FFh,0C5h, 59h,0FCh, 3Fh,0C5h, 95h,0F1h,0FFh,0C5h, 55h
		    db 0F1h, 3Fh,0C5h, 5Fh,0F3h,0FFh,0C5h,0FFh,0F1h, 3Fh,0CFh,0F5h,0FFh,0FFh,0CFh, 59h
		    db	95h,0F5h, 55h, 5Fh, 95h,0F5h, 55h, 5Fh,	5Fh,0F5h, 55h, 5Fh,0FFh, 55h, 55h, 5Fh
		    db 0F5h, 55h, 55h, 5Fh, 59h, 59h, 55h, 5Fh,	55h, 55h, 55h, 5Fh, 95h, 55h, 95h, 5Fh
		    db 0C5h, 95h, 5Fh,0C5h,0C5h, 55h, 5Fh,0C5h,0C5h, 55h, 5Fh,0C5h,0C5h, 55h, 55h,0F5h
		    db 0C5h, 95h, 55h, 5Fh,0C5h, 95h, 55h, 55h,0C5h, 95h, 59h, 55h,0C5h, 99h, 55h, 55h
		    db	95h, 53h,0F3h, 33h, 55h, 53h,0FFh,0FFh,	59h, 53h,0FCh, 1Fh, 59h, 93h,0FFh, 3Fh
		    db	59h, 93h,0F1h, 3Fh,0F5h, 53h,0FFh, 3Fh,	5Fh, 53h,0F1h, 3Fh, 55h,0F3h,0FFh,0FFh
		    db	33h, 3Fh,0C5h, 99h,0FFh,0FFh,0C5h, 95h,0FCh, 3Fh,0C5h, 99h,0F1h,0FFh,0C5h, 99h
		    db 0F1h, 3Fh,0C5h, 99h,0F3h,0FFh,0C5h, 55h,0F1h, 3Fh, 33h, 33h,0FFh,0FFh,0FFh,0FFh
		    db	99h, 99h, 99h, 5Fh, 99h, 95h, 55h, 5Fh,	99h, 5Fh,0FFh,0FFh, 95h,0FCh,0CCh,0CFh
		    db	5Fh,0C5h, 55h, 5Fh,0FCh, 55h, 55h, 5Fh,0F5h,0FFh, 33h, 3Fh,0FFh,0FFh,0FFh,0FFh
		    db 0C5h, 99h, 55h, 55h,0C5h, 55h, 95h, 95h,0FFh,0FFh, 99h, 99h,0CCh,0CFh,0F5h, 95h
		    db 0C5h, 55h,0FFh, 95h,0C5h, 55h, 5Fh,0F5h,	3Fh,0FFh, 3Fh,0FFh,0FFh,0FFh,0FFh,0FFh
		    db	59h, 53h,0F3h, 33h, 55h, 53h,0FFh,0FFh,	59h, 53h,0FCh, 1Fh, 59h, 53h,0FFh, 3Fh
		    db	99h, 53h,0F1h, 3Fh, 55h, 53h,0FFh, 3Fh,	33h, 33h,0F1h, 3Fh,0FFh,0FFh,0FFh,0FFh


GfxDoorLeft:	    db 0FFh, 33h, 33h, 3Fh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
		    db	1Fh,0FFh,0FFh,0F9h, 15h, 55h, 5Fh, 59h,	15h, 55h, 55h, 59h, 15h, 55h,0F5h, 59h
		    db	15h, 55h, 15h, 59h, 15h, 55h, 18h, 59h,	15h, 5Fh, 18h, 59h, 15h,0FFh, 18h, 55h
		    db	15h,0F1h, 15h, 55h, 15h,0F1h, 15h, 55h,	15h,0F1h, 15h,0F5h, 15h,0F1h, 1Fh,0F5h
		    db	15h,0F1h,0FFh,0F5h, 15h,0F1h,0FFh,0F9h,	15h,0F1h,0FFh, 59h, 15h,0F1h,0FFh, 99h
		    db	15h,0FFh,0F5h, 55h, 15h,0FFh,0F5h, 99h,	15h,0FFh, 55h, 55h, 15h,0F5h, 55h, 55h
		    db	15h, 55h, 55h, 55h, 15h, 55h, 55h, 55h,	15h, 55h, 55h, 55h, 15h, 55h, 55h, 55h
		    db	11h, 11h, 11h, 11h, 11h, 11h, 11h, 11h,	11h, 11h, 11h, 11h, 11h, 11h, 11h, 11h


GfxDoorRight:	    db 0F1h, 11h, 11h,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh,0FFh
		    db	9Fh,0FFh,0FFh,0FCh, 95h,0F5h, 55h, 5Ch,	95h, 55h, 55h, 5Ch, 95h, 5Fh, 55h, 5Ch
		    db	95h, 5Ch, 55h, 5Ch, 95h, 8Ch, 55h, 5Ch,	95h, 8Ch,0F5h, 5Ch, 55h, 8Ch,0FFh, 5Ch
		    db	55h, 5Ch,0CFh, 5Ch, 55h, 5Ch,0CFh, 5Ch,	5Fh, 5Ch,0CFh, 5Ch, 5Fh,0FCh,0CFh, 5Ch
		    db	5Fh,0FFh,0CFh, 5Ch, 9Fh,0FFh,0CFh, 5Ch,	95h,0FFh,0CFh, 5Ch, 99h,0FFh,0CFh, 5Ch
		    db	55h,0FFh,0FFh, 5Ch, 99h, 5Fh,0FFh, 5Ch,	55h, 55h,0FFh, 5Ch, 55h, 55h, 5Fh, 5Ch
		    db	55h, 55h, 55h, 5Ch, 55h, 55h, 55h, 5Ch,	55h, 55h, 55h, 5Ch, 55h, 55h, 55h, 5Ch
		    db	11h, 11h, 11h, 1Ch, 11h, 11h, 11h, 1Ch,	11h, 11h, 11h, 1Ch, 11h, 11h, 11h, 1Ch


GfxDoorDown:	    db 0FFh,0FFh,0FFh,0FFh,0FEh,0EEh,0EEh,0EEh,0FEh,0CCh,0CCh,0CCh,0FEh,0C3h, 33h, 33h
		    db 0FEh,0C3h,0CCh,0CCh,0FEh,0CEh,0EEh,0EEh,0FEh,0CCh,0CCh,0CCh,0FEh, 11h, 11h, 11h
		    db 0FFh,0FFh,0FFh,0FFh,0EEh,0EEh,0EEh,0EEh,0CCh,0CCh,0CCh,0CCh, 33h, 33h, 33h, 33h
		    db 0CCh,0CCh,0CCh,0CCh,0EEh,0EEh,0EEh,0EEh,0CCh,0CCh,0CCh,0CCh, 11h, 11h, 11h, 11h
		    db 0FFh,0FFh,0FFh,0FFh,0EEh,0EEh,0EEh,0EEh,0CCh,0CCh,0CCh,0CCh, 33h, 33h, 33h, 33h
		    db 0CCh,0CCh,0CCh,0CCh,0EEh,0EEh,0EEh,0EEh,0CCh,0CCh,0CCh,0CCh, 11h, 11h, 11h, 11h
		    db 0FFh,0FFh,0FFh,0FFh,0EEh,0EEh,0EEh,0EFh,0CCh,0CCh,0CCh, 1Fh, 33h, 33h, 3Ch, 1Fh
		    db 0CCh,0CCh,0ECh, 1Fh,0EEh,0EEh,0ECh, 1Fh,0CCh,0CCh,0CCh, 1Fh, 11h, 11h, 11h, 1Fh

