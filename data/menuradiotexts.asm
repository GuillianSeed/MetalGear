;----------------------------------------------------------------------------
; Radio	menu texts
; TRANSCEIVER
; RECV
; 120.
;----------------------------------------------------------------------------
txtTransceiv:	    dw 850h
		    db	"TRANSCEIVER"
		    db 0FEh
		    
		    dw 4038h
		    db	"RECV"
		    db 0FEh
		    
		    dw 2178h
		    db 0A6h,0A8h,0A4h                       ; 120 (upper part)
		    db 0FEh
		    
		    dw 2978h
		    db 0A7h,0A9h,0A5h,0A3h                  ; 120. (lower part)
		    db 0FFh