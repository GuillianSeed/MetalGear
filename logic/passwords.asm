
;---------------------------------------------------------------------------
;
;
; PASSWORDS
;
;
;---------------------------------------------------------------------------

ChkCharTyped:
		    call    ReadKeyboard		    ; Check pressed keys
		    jp	    GetTyped


ReadKeyboard:
		    ld	    b, 9			    ; Keyboard rows to read
		    ld	    hl,	PassKeysHold
		    ld	    de,	PassKeysTrigger

ReadKeyboard2:
		    push    bc

		    push    hl
		    push    de

		    ld	    a, b
		    dec	    a
		    call    SNSMAT
		    cpl
		    pop	    de
		    pop	    hl

		    ld	    c, (hl)
		    ld	    (hl), a			    ; Password entry key hold
		    xor	    c
		    and	    (hl)
		    ld	    (de), a			    ; Password entry key trigger

		    inc	    hl
		    inc	    de

		    pop	    bc
		    djnz    ReadKeyboard2
		    ret


;---------------------------------------------------------------------------
;
; Check	typed keys
;
;---------------------------------------------------------------------------

GetTyped:
		    ld	    hl,	PassKeysTrigger
		    ld	    b, 9			    ; Number of	rows

GetTyped2:
		    ld	    a, (hl)
		    and	    a				    ; Any key typed in this row?
		    jr	    nz,	GetTyped3

		    inc	    hl
		    djnz    GetTyped2
		    ret


GetTyped3:
		    dec	    b
		    ld	    e, b			    ; E	= keyboard row
		    ld	    bc,	800h

GetTyped4:
		    rlca
		    jr	    c, AddCharPassBuf

		    inc	    c
		    djnz    GetTyped4
		    ret


AddCharPassBuf:
		    ld	    a, e			    ; row
		    add	    a, a
		    add	    a, a
		    add	    a, a			    ; x8
		    add	    a, c
		    ld	    de,	PasswordBuffer
		    ld	    hl,	 PasswordBuffer+1
		    ld	    bc,	0Bh
		    ldir
		    ld	    (de), a
		    ret

;DS 4
PassDS_4:	    db	  3, 47h, 2Fh, 1Eh,0FFh

;ANTA WA ERAI
PassANTA_WA:	    db	19h, 11h, 20h, 1Dh, 47h, 11h, 2Bh, 47h,	11h, 2Eh, 24h, 11h,0FFh

;INTRUDER
PassINTRUDER:	    db	20h, 1Dh, 1Eh, 2Dh, 20h, 2Eh, 24h, 19h,0FFh

;ISOLATION
PassISOLATION:	    db	24h, 23h, 19h, 2Eh, 11h, 26h, 23h, 2Fh,	19h,0FFh

;HIRAKE	GOMA
PassHIRAKE:	    db	11h, 25h, 23h, 1Bh, 47h, 1Dh, 27h, 11h,	20h, 19h, 1Ah,0FFh


ChkPassword:
		    ld	    hl,	 PasswordBuffer+0Bh

ChkPassword2:
		    ld	    a, (de)
		    cp	    0FFh			    ; Password end
		    ret	    z

		    cp	    (hl)
		    ret	    nz				    ; Not equal

		    dec	    hl
		    inc	    de
		    jr	    ChkPassword2


ChkPasswords:
		    ld	    de,	PassDS_4
		    call    ChkPassword
		    ld	    c, 0
		    jr	    z, SetMaxClass

		    inc	    c
		    ld	    de,	PassANTA_WA
		    call    ChkPassword
		    jr	    z, SetMaxClass

		    inc	    c
		    ld	    de,	PassINTRUDER
		    call    ChkPassword
		    jr	    z, SetMaxClass

		    inc	    c
		    ld	    de,	PassISOLATION
		    call    ChkPassword
		    jr	    z, SetMaxClass

		    inc	    c
		    ld	    de,	PassHIRAKE
		    call    ChkPassword
		    ret	    nz

;---------------------------------------------------------------------------
; ANTA WA ERAI:	Max. class level
;---------------------------------------------------------------------------

SetMaxClass:
		    ld	    b, c
		    djnz    SetMaxAmmount

		    call    IncClassLv_
		    call    IncClassLv_

IncreaseClass:
		    jp	    IncClassLv_

;---------------------------------------------------------------------------
; INTRUDER: Max. ammount ammo limit
;---------------------------------------------------------------------------

SetMaxAmmount:
		    djnz    SetMaxRations

		    ld	    a, (MaxAmmoRatioF)		    ; Bit 0=Max.Ammo, 1=Max.Rations
		    set	    0, a
		    ld	    (MaxAmmoRatioF), a		    ; Bit 0=Max.Ammo, 1=Max.Rations

		    ld	    hl,	MaxAmmoGun
		    ld	    de,	999h
		    ld	    b, 8

SetMaxAmmount2:
		    ld	    (hl), e
		    inc	    hl
		    ld	    (hl), d
		    inc	    hl
		    djnz    SetMaxAmmount2
		    ret


;---------------------------------------------------------------------------
; ISOLATION: Max. ammount rations
;---------------------------------------------------------------------------

SetMaxRations:
		    djnz    SetAllCards

		    ld	    a, (MaxAmmoRatioF)		    ; Bit 0=Max.Ammo, 1=Max.Rations
		    set	    1, a
		    ld	    (MaxAmmoRatioF), a		    ; Bit 0=Max.Ammo, 1=Max.Rations

		    ld	    hl,	999h
		    ld	    (MaxRations), hl
		    ret


;---------------------------------------------------------------------------
; HIRAKE GOMA: Get all cards
;---------------------------------------------------------------------------

SetAllCards:
		    djnz    IncreaseClass

		    ld	    a, SELECTED_CARD1		    ; Card1
		    ld	    b, 8

SetAllCards2:
		    push    bc
		    push    af
		    ld	    e, a
		    push    de
		    call    GetItemInvAdd_		    ; Check if the card	is already in the inventory
		    pop	    de
		    call    c, AddCardToEquip
		    pop	    af
		    inc	    a
		    pop	    bc
		    djnz    SetAllCards2

		    xor	    a
		    ld	    (DoorOpenArray+0Bh), a	    ; Open GreyFox cell	door
		    ret


AddCardToEquip:
		    ld	    hl,	Equipment		    ; +0 Item ID, +1 tens/units, +2 hundreds, +3 unused

AddCardToEquip2:
		    ld	    a, (hl)
		    and	    a
		    jr	    z, AddCardToEquip3

		    ld	    a, 4
		    call    ADD_HL_A_
		    jr	    AddCardToEquip2


AddCardToEquip3:
		    ld	    (hl), e
		    ld	    a, e
		    inc	    hl
		    add	    a, 23h			    ; #23 + #e(CARD 1 item id) = #31 ("1") Card number
		    ld	    (hl), a
		    ld	    a, e
		    ld	    hl,	ItemsTaken
		    dec	    a
		    call    ADD_HL_A_
		    ld	    (hl), 1			    ; Mark the card as owned
		    ret