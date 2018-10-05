;----------------------------------------------------------------------------
;
; Index of item names
;
;----------------------------------------------------------------------------
idxItemName:    dw txtArmor
                dw txtSuit
                dw txtLight
                dw txtGoggles
                dw txtMask
                dw txtCigar
                dw txtDetector
                dw txtAntenna
                dw txtScope
                dw txtBombe
                dw txtCompass
                dw txtParachute
                dw txtAntidote
                dw txtCard1
                dw txtCard2
                dw txtCard3
                dw txtCard4
                dw txtCard5
                dw txtCard6
                dw txtCard7
                dw txtCard8
                dw txtRation
                dw txtTrans
                dw txtUniform
                dw txtBox


;----------------------------------------------------------------------------
;
; Items names
;
;----------------------------------------------------------------------------
txtArmor:       db  60h, 40h, 7Eh, 40h,0FFh
txtSuit:        db  6Ch, 40h, 71h,0FFh 
txtLight:       db  86h, 61h, 73h,0FFh 
txtGoggles:     db  69h, 98h, 40h, 67h, 98h, 88h,0FFh
txtMask:        db  65h, 98h, 6Ch, 7Eh, 6Ch, 67h,0FFh
txtCigar:       db  6Fh, 79h, 98h, 69h,0FFh
txtDetector:    db  6Fh, 8Dh, 70h, 66h,0FFh
txtAntenna:     db  60h, 8Dh, 72h, 74h,0FFh
txtScope:       db  6Ch, 98h, 40h, 80h,0FFh
txtBombe:       db  7Dh, 98h, 8Dh, 7Ch, 98h,0FFh
txtCompass:     db  69h, 8Dh, 79h, 97h, 6Ch,0FFh
txtParachute:   db  86h, 93h, 65h, 6Ah, 8Dh,0FFh
txtAntidote:    db  73h, 98h, 67h, 68h, 6Bh,0FFh
txtCard1:       db  65h, 40h, 73h, 98h,   0, 31h,0FFh
txtCard2:       db  65h, 40h, 73h, 98h,   0, 32h,0FFh
txtCard3:       db  65h, 40h, 73h, 98h,   0, 33h,0FFh
txtCard4:       db  65h, 40h, 73h, 98h,   0, 34h,0FFh
txtCard5:       db  65h, 40h, 73h, 98h,   0, 35h,0FFh
txtCard6:       db  65h, 40h, 73h, 98h,   0, 36h,0FFh
txtCard7:       db  65h, 40h, 73h, 98h,   0, 37h,0FFh
txtCard8:       db  65h, 40h, 73h, 98h,   0, 38h,0FFh
txtRation:      db  89h, 40h, 6Bh, 96h, 8Dh,0FFh
txtTrans:       db  79h, 93h, 6Bh, 8Dh, 66h,0FFh
txtUniform:     db  84h, 75h, 7Dh, 40h, 80h,0FFh
txtBox:         db  6Fh, 98h, 8Dh, 7Dh, 98h, 40h, 88h,0FFh