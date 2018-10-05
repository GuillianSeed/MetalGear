Sfx_RadioCall:	    db 0FEh,   0
SfxRadioCall2:	    db	22h,   1,0A0h,0CAh,0A0h,0A9h,0A1h,   0
		    db 0FEh,   6
		    dw SfxRadioCall2
		    db 0FFh
