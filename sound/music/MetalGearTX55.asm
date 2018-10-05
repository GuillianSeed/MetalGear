;----------------------------------------------------------------------------
;
; TX-55
;
;----------------------------------------------------------------------------
MetalGearShare1:    db	50h, 60h, 70h, 80h, 90h,0A0h,0B1h,0FFh
MetalGearShare2:    db	80h, 90h,0A0h,0B0h,0E2h,   0, 10h, 21h,0FFh
MetalGearShare3:    db	10h, 20h, 30h, 40h, 50h, 60h, 71h,0FFh


Mus_MetalGear:	    db 0D6h,0C2h
Mus_MetalGearA2:    db 0D6h,0FBh, 13h,0ECh, 52h,0E3h, 47h,0D1h,0FAh,   0, 40h ;	...
		    db 0FEh,0FFh
		    dw MetalGearShare1
		    db 0F9h,   0, 40h
		    db 0FEh,0FFh
		    dw MetalGearShare1
		    db 0F7h,   0, 40h
		    db 0FEh,0FFh
		    dw MetalGearShare1
		    db 0F5h,   0, 40h
		    db 0FEh,0FFh
		    dw MetalGearShare1
		    db 0D6h,0FAh, 13h, 40h, 60h, 76h,0D1h,0FAh,	  0,0E3h, 70h
		    db 0FEh,0FFh
		    dw MetalGearShare2
		    db 0F9h,   0,0E3h, 70h
		    db 0FEh,0FFh
		    dw MetalGearShare2
		    db 0F8h,   0,0E3h, 70h
		    db 0FEh,0FFh
		    dw MetalGearShare2
		    db 0F5h,   0,0E3h, 70h, 80h, 90h,0A0h,0B0h,0E2h,   0, 10h, 2Ch,0C6h
		    db 0FEh,   2
		    dw Mus_MetalGearA2
MetalGearA3:	    db 0D6h,0FBh, 13h,0ECh, 52h,0E2h,	7,0D1h,0F9h,   0,   0 ;	...
		    db 0FEh,0FFh
		    dw MetalGearShare3
		    db 0F8h,   0,   0
		    db 0FEh,0FFh
		    dw MetalGearShare3
		    db 0F6h,   0,   0
		    db 0FEh,0FFh
		    dw MetalGearShare3
		    db 0F4h,   0,   0
		    db 0FEh,0FFh
		    dw MetalGearShare3
		    db 0D6h,0FAh, 13h,	 0, 20h,0E3h,0B6h,0D1h,0F9h,   0,0B0h,0E2h,   0, 10h, 20h, 30h
		    db	40h, 50h, 61h,0F8h,   0,0E3h,0B0h,0E2h,	  0, 10h, 20h, 30h, 40h, 50h, 61h,0F7h
		    db	  0,0E3h,0B0h,0E2h,   0, 10h, 20h, 30h,	40h, 50h, 61h,0F4h,   0,0E3h,0B0h,0E3h
		    db	  0, 10h, 20h, 30h, 40h, 50h, 6Ch,0C6h
		    db 0FEh,   2
		    dw MetalGearA3
		    db 0FEh,0FEh
		    dw Mus_MetalGearA2


Mus_MetalGearB:	    db 0D6h,0C2h
Mus_MetalGearB2:    db 0D6h,0FDh, 33h,0E4h, 41h,0FAh
		    db	22h, 41h,0FDh, 33h, 41h,0FAh, 22h, 41h,0FDh, 33h, 41h,0FAh, 22h, 41h,0FDh, 33h
		    db	41h, 40h, 60h, 71h,0FAh, 22h, 71h,0FDh,	33h, 71h,0FAh, 22h, 71h,0FDh, 33h, 71h
		    db 0FAh, 22h, 71h,0FDh, 33h, 91h,0FAh, 22h,	91h
		    db 0FEh,   2
		    dw Mus_MetalGearB2
MetalGearB3:	    db 0EFh,0E8h,0FDh, 33h,0E4h,   1,0FAh, 22h,	  1,0FDh, 33h,	 1,0FAh, 22h,	1,0FDh
		    db	33h,   1,0FAh, 22h,   1,0FDh, 33h,   1,	  0,   0,0E4h,0B1h,0FAh, 22h,0B1h,0FDh
		    db	33h,0B1h,0FAh, 22h,0B1h,0FDh, 33h,0B1h,0FAh, 22h,0B1h,0FDh, 33h,0B1h,0FAh, 22h
		    db 0B1h
		    db 0FEh,   2
		    dw MetalGearB3
		    db 0FEh,0FEh
		    dw Mus_MetalGearB2


Mus_MetalGearC:	    db 0D6h,0C2h
Mus_MetalGearC2:    db 0EFh,0D6h,0E9h,	 4, 41h, 41h, 41h, 41h,	41h, 41h, 41h, 40h, 40h, 71h, 71h, 71h
		    db	71h, 71h, 71h, 91h, 91h
		    db 0FEh,   2
		    dw Mus_MetalGearC2
MetalGearC3:	    db 0EFh,0E9h,   5,	 1,   1,   1,	1,   1,	  1,   1,   0,	 0,0E9h,   4,0B1h,0B1h
		    db 0B1h,0B1h,0B1h,0B1h,0B1h,0B1h
		    db 0FEh,   2
		    dw MetalGearC3
		    db 0FEh,0FEh
		    dw Mus_MetalGearC2
