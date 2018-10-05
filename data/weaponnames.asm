;----------------------------------------------------------------------------
;
; Index	of weapon names
;
;----------------------------------------------------------------------------
idxWeaponName:	    dw txtHandGun
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
txtHandGun:	    db	"HAND",   0, "GUN", #ff 

txtSMG:		    db	"SMG", #ff 

txtGrenade:	    db	"GRENADE", #ff 

txtRocket:	    db	"ROCKET", #ff 

txtP_Bomb:	    db	"P@BOMB", #ff 

txtLandMine:	    db	"L@MAIN", #ff 

txtMissile:	    db	"MISSILE", #ff 

txtSilencer:	    db	"SILENCER", #ff 