;----------------------------------------------------------------------------
;
; Index of weapon names
;
;----------------------------------------------------------------------------
idxWeaponName:  dw txtHandGun
                dw txtSMG
                dw txtGrenade
                dw txtRocket
                dw txtP_Bomb
                dw txtLandMine
                dw txtMissile
                dw txtSilencer

;----------------------------------------------------------------------------
;
; Weapon names
;
;----------------------------------------------------------------------------
txtHandGun:     db  79h, 8Dh, 73h, 98h,   0, 65h, 98h, 8Dh,0FFh
txtSMG:         db  6Ah, 7Bh, 98h, 7Eh, 6Bh, 8Dh, 65h, 98h, 8Dh,0FFh
txtGrenade:     db  67h, 98h, 89h, 77h, 40h, 73h, 98h,0FFh
txtRocket:      db  8Ah, 68h, 93h, 73h, 86h, 8Dh, 70h, 94h, 40h,0FFh
txtP_Bomb:      db  50h, 79h, 98h, 67h, 6Fh, 98h, 8Dh,0FFh
txtLandMine:    db  6Bh, 98h, 86h, 61h,0FFh
txtMissile:     db  87h, 82h, 69h, 8Dh, 7Fh, 6Ah, 61h, 88h,0FFh
txtSilencer:    db  6Ah, 61h, 89h, 8Dh, 6Ah, 40h, 0FFh