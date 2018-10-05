
;---------------------------------------------------------------------------
;
; Set limit values for ammo and	rations
;
; The amount of	ammo and rations depends on the	rank.
; This function	sets the limits	and in case that the current amount exceeds it,	the amount is set to match the limit.
;---------------------------------------------------------------------------

SetMaxAmmoVals:
		    ld	    de,	 MaxAmmoGun+1
		    ld	    hl,	MaxAmmoGun
		    ld	    bc,	4Fh
		    ld	    (hl), 0FFh
		    ldir				    ; Clear amounts

		    ld	    a, (Class)			    ; Rank level
		    and	    a
		    ld	    hl,	MaxAmmoLv1
		    ld	    c, 3			    ; Max. rations
		    jr	    z, SetMaxAmmo2

		    dec	    a
		    ld	    hl,	MaxAmmoLv2
		    ld	    c, 6			    ; Max. rations
		    jr	    z, SetMaxAmmo2

		    dec	    a
		    ld	    hl,	MaxAmmoLv3
		    ld	    c, 9			    ; Max. rations
		    jr	    z, SetMaxAmmo2

		    ld	    hl,	MaxAmmoLv4
		    ld	    c, 12h			    ; Max. rations

SetMaxAmmo2:
		    ld	    a, c
		    ld	    de,	MaxAmmoGun
		    ld	    bc,	10h
		    ldir				    ; Update the weapon's maximum amount of ammo

		    ld	    l, a			    ; Max. rations
		    ld	    h, 0
		    ld	    (MaxRations), hl		    ; Update maximum amount of rations
;
; Check	if INTRUDER password cheat is enabled
;
		    ld	    a, (MaxAmmoRatioF)		    ; Bit 0=Max.Ammo, 1=Max.Rations
		    rra					    ; Maximum amount of	ammo?
		    jr	    nc,	SetMaxAmmo3

		    ld	    hl,	MaxAmmoVals
		    ld	    de,	MaxAmmoGun
		    ld	    bc,	10h
		    ldir				    ; Set the maximum amount of	ammo allowed in	the game
;
; Check	if ISOLATION password cheat is enabled
;

SetMaxAmmo3:
		    rra
		    jr	    nc,	ChkMaxRations

		    ld	    hl,	999h
		    ld	    (MaxRations), hl

ChkMaxRations:
		    ld	    a, SELECTED_RATION		    ; Rations
		    call    GetItemInvAdd		    ; Get pointer to rations data in inventory
		    jr	    nc,	ChkMaxAmmo		    ; There are	no rations in inventory

		    ld	    bc,	(MaxRations)
		    call    ChkMaxAmount		    ; Limit the	number of rations
;
; Limit	the ammo of weapons if it exceed the maximum value
;

ChkMaxAmmo:
		    ld	    b, 8			    ; Number of	weapons
		    ld	    c, HAND_GUN
		    ld	    ix,	MaxAmmoGun

ChkMaxAmmo2:
		    ld	    a, c			    ; Weapon ID
		    push    bc
		    push    ix

		    call    GetWeaponInvAdd		    ; Get pointer to the weapon
		    jr	    nc,	ChkMaxAmmo3		    ; Weapon not in the	inventory

		    ld	    c, (ix+0)
		    ld	    b, (ix+1)			    ; Max. weapon ammo value
		    call    ChkMaxAmount

ChkMaxAmmo3:
		    pop	    ix
		    pop	    bc

		    inc	    c				    ; Next weapon ID
		    inc	    ix
		    inc	    ix				    ; Pointer to next weapon ammo limit
		    djnz    ChkMaxAmmo2
		    ret


;----------------------------------------------------------------------------
;
; Maximum ammo values per rank
;
;----------------------------------------------------------------------------

MaxAmmoLv1:	    dw 50h
		    dw 50h
		    dw 15h
		    dw 5
		    dw 5
		    dw 5
		    dw 5
		    dw 5

MaxAmmoLv2:	    dw 100h
		    dw 100h
		    dw 30h
		    dw 10h
		    dw 10h
		    dw 10h
		    dw 10h
		    dw 10h

MaxAmmoLv3:	    dw 200h
		    dw 200h
		    dw 60h
		    dw 20h
		    dw 15h
		    dw 15h
		    dw 15h
		    dw 15h

MaxAmmoLv4:	    dw 300h
		    dw 300h
		    dw 90h
		    dw 30h
		    dw 20h
		    dw 20h
		    dw 20h
		    dw 20h

MaxAmmoVals:	    dw 999h
		    dw 999h
		    dw 999h
		    dw 999h
		    dw 999h
		    dw 999h
		    dw 999h
		    dw 999h


;----------------------------------------------------------------------------
;
; Check	if the current amount of a item	or weapon ammo is within the limit. Clamp the value if the amount exceeds the limit
;
; In:
;  HL =	Item pointer
;  BC =	Max. amount
;
;----------------------------------------------------------------------------


ChkMaxAmount:
		    inc	    hl
		    ld	    e, (hl)
		    inc	    hl
		    ld	    d, (hl)			    ; Number of	units/ammo

		    ex	    de,	hl

		    and	    a
		    sbc	    hl,	bc
		    ret	    z
		    ret	    c				    ; Amount within the	limits

		    ex	    de,	hl

		    ld	    (hl), b
		    dec	    hl
		    ld	    (hl), c			    ; Limit the	amount to the maximum allowed
		    ret