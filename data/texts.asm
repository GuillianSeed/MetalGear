;----------------------------------------------------------------------------
;
; Texts index
;
;----------------------------------------------------------------------------
idxTexts:           dw txtRelieve
                    dw txtOpIntrude
                    dw txtMission
                    dw txtTakeWeapon
                    dw txtEmpty                             ; 5
                    dw txtDontMove
                    dw txtCaught
                    dw txtEmpty                             ; Ration
                    dw txtEmpty                             ; About rations
                    dw txtYourReply                         ; 10
                    dw txtEmpty                             ; Card1
                    dw txtEmpty                             ; About cards
                    dw txtEmpty                             ; Binoculars
                    dw txtEmpty                             ; About binoculars
                    dw txtFinalThread                       ; 15
                    dw txtEmpty                             ; Handgun
                    dw txtEmpty                             ; About handgun
                    dw txtEmpty                             ; Mine
                    dw txtEmpty                             ; About mine
                    dw txtResistance                        ; 20
                    dw txtEmpty                             ; Ammo
                    dw txtEmpty                             ; About ammo
                    dw txtSchneider
                    dw txtEmpty                             ; Be carefull on cameras
                    dw txtGasMask                           ; 25
                    dw txtGasMaskLoc
                    dw txtDianeFreq
                    dw txtImSaved
                    dw txtEmpty                             ; Remote controlled missile
                    dw txtEmpty                             ; 30 About remote controlled missile
                    dw txtRadioKNK
                    dw txtFoxHoundInf
                    dw txtSleepy
                    dw txtSlept
                    dw txtDesetGuards                       ; 35
                    dw txtTutorial
                    dw txtEmpty                             ; Card2
                    dw txtDestroyPS
                    dw txtMissilLoc
                    dw txtEmpty                             ; 40 Cardboard box
                    dw txtEmpty                             ; About cardboard box
                    dw txtWindBarrier
                    dw txtEmpty                             ; Silencer
                    dw txtEmpty                             ; About silencer
                    dw txtStaff                             ; 45
                    dw txtEmpty                             ; Grenade launcher
                    dw txtEmpty                             ; About grenade launcher
                    dw txtEmpty                             ; About infrareds
                    dw txtEmpty                             ; About camouflage
                    dw txtChkBugged                         ; 50
                    dw txtBombSuitLoc
                    dw txtFoxHundInfo
                    dw txtEmpty                             ; Schenider isolated cell
                    dw txtCellCaught
                    dw txtEmpty                             ; Card 4
                    dw txtEmpty                             ; SMG
                    dw txtEmpty                             ; About SMG
                    dw txtChkWall
                    dw txtGrayFox
                    dw txtFindGear                          ; 60
                    dw txtShootGunn
                    dw txtGearTaken
                    dw txtEmpty                             ; Card 3
                    dw txtBombWall
                    dw txtEmpty                             ; Body armor
                    dw txtEmpty                             ; About body armor
                    dw txtEmpty                             ; Bomb Blast suit
                    dw txtEmpty                             ; About Bomb Blast Suit
                    dw txtEmpty                             ; Plastic Bomb
                    dw txtEmpty                             ; 70 About plastic bomb
                    dw txtEmpty                             ; Enemy uniform
                    dw txtEmpty                             ; About enemy uniform
                    dw txtEmpty                             ; (empty)
                    dw txtEmpty                             ; (empty)
                    dw txtEmpty                             ; IR Goggles
                    dw txtEmpty                             ; About IR goggles
                    dw txtParachCourtyard
                    dw txtMadnarLocation
                    dw txtMachGunKid
                    dw txtMachGunKidInfo                    ; 80
                    dw txtEmpty                             ; Parachute
                    dw txtEmpty                             ; About parachute
                    dw txtParacFind
                    dw txtRescued_
                    dw txtEmpty                             ; Mine detector
                    dw txtEmpty                             ; About mine detector
                    dw txtEmpty                             ; Mine detector location
                    dw txtHindDGrenade
                    dw txtTooLate
                    dw txtDrMovedB2                         ; 90
                    dw txtGoofed
                    dw txtTankMines
                    dw txtUseUniform
                    dw txtUniformLoc
                    dw txtDianeNewFreq
                    dw txtEmpty                             ; Flashlight
                    dw txtEmpty                             ; About flashlight
                    dw txtEmpty                             ; Antenna
                    dw txtJammingAtk
                    dw txtEmpty                             ; 100 - Elevator only goes up
                    dw txtDrUndergCell
                    dw txtEmpty                             ; Card 5
                    dw txtEmpty                             ; South elevator only goes down
                    dw txtEmpty                             ; (EMPTY)
                    dw txtEmpty                             ; (EMPTY)
                    dw txtGasArea
                    dw txtUserNorthElev
                    dw txtImFireTrop
                    dw txtTrap
                    dw txtEmpty                             ; 110 Card 6
                    dw txtEmpty                             ; North elevator is ahead
                    dw txtFlashLoc
                    dw txtPitfalls
                    dw txtArnorlds
                    dw txtUseCompass
                    dw txtJennifer
                    dw txtRocketLaunch
                    dw txtOpeningDoor
                    dw txtEmpty                             ; Rocket launcher
                    dw txtEmpty                             ; 120 Compass
                    dw txtEmpty                             ; Antidote
                    dw txtCompassLoc
                    dw txtWaterChan
                    dw txtSaveEllen
                    dw txtImMadnar
                    dw txtSecrPassage
                    dw txtComeIn
                    dw txtHelpMe
                    dw txtImElen
                    dw txtUseAntidote                       ; 130
                    dw txtRescued                           ; (!?)
                    dw txtGoLeftDoor
                    dw txtRightLorry
                    dw txtDestroyWall
                    dw txtOxygenLoc
                    dw txtSwitchOffMSX
                    dw txtCardLoc
                    dw txtBossRevealed
                    dw txtCowardDuck
                    dw txtClimbLeftLadder                   ; 140
                    dw txtUseHandGun
                    dw txtDuckCard8
                    dw txtEmpty                             ; Card 8
                    dw txtBigBossIdBad
                    dw txtEmpty                             ; Destroy left wall
                    dw txtRunFast
                    dw txtBigBossConf
                    dw txtUseCigarette
                    dw txtUpToYou
                    dw txtEmergency                         ; 150
                    dw txtEmpty                             ; Gas mask
                    dw txtEmpty                             ; Oxygen tank
                    dw txtEmpty                             ; Card 7
                    dw txtEmpty                             ; About gas mask
                    dw txtN313End                           ; 155
                    dw txtTheyHaveSil
                    dw txtEmpty                             ; Diane went shopping
                    dw txtEmpty                             ; Diane is taking a shower
                    dw txtEmpty                             ; Stop coming to Diane!


;----------------------------------------------------------------------------
;
; Texts
;
;----------------------------------------------------------------------------
txtRelieve:         db    0, 52h, 45h, 4Ch, 49h, 45h, 56h, 45h,0FFh
txtOpIntrude:       db  13h,0D1h,   0,0A1h,0A2h,0FEh, 4Fh, 50h, 45h, 52h, 41h, 54h, 49h, 4Fh, 4Eh,   0
                    db 0A3h,   0, 4Eh, 33h, 31h, 33h, 5Ch,0FDh, 50h, 45h, 4Eh, 45h, 54h, 52h, 41h, 54h
                    db  45h,   0,0CEh,   0,0B8h, 97h, 53h,0FEh,0A4h,   0,0DAh,0FEh,0A5h,0FEh,0A6h,0FEh
                    db 0A7h, 3Dh,0FDh, 46h, 49h, 52h, 53h, 54h, 5Fh,0FEh,0A8h,   0, 4Dh, 49h, 53h, 53h
                    db  49h, 4Eh, 47h,0FEh,0A9h,   0,0DAh,   0,0AAh,0FEh,0A7h, 3Dh,0FDh,0A8h,   0, 49h
                    db  4Eh,   0,0CEh,   0,0D6h,   0, 4Fh, 46h,0FEh, 31h, 32h, 30h, 38h, 35h,   0,0ABh
                    db    0,0ACh,   0,0E2h, 5Ch,0FEh,0A2h,0ADh,0FFh
txtMission:         db  13h,0D1h,   0,0A1h,0A2h,0FEh, 4Dh, 49h, 53h, 49h, 4Fh, 4Eh, 3Dh,0FEh,0D8h,   0
                    db 0F1h,   0,0E6h,0FEh,0CEh,   0,0B8h, 97h, 53h,   0,0FAh, 5Fh,0FEh,0A4h, 5Ch,0FDh
                    db 0EEh,   0, 41h, 43h, 54h, 49h,0E2h,   0,0E5h,   0,0E6h,   0,0E3h,0FEh, 44h, 49h
                    db  53h, 43h, 4Fh, 56h, 45h, 52h, 45h, 44h,   0,0EBh,0FEh,0CEh,   0,0B8h, 5Ch,0FEh
                    db 0A2h,0ADh,0FFh
txtTakeWeapon:      db  13h,0D1h,   0,0A1h,0A2h,0FEh,0EEh,   0,0CEh,   0,0D2h, 53h,   0,0DAh,0FEh,0D3h
                    db    0,0ABh,0FEh,0CEh,   0,0B8h, 97h, 53h,   0,0EFh, 3Eh,0FDh,0AFh,   0,0E7h,   0
                    db 0BCh,0FEh, 41h, 4Eh,   0, 49h, 5Ch, 44h, 5Ch,0D4h,   0,0E6h,   0,0EDh,0FEh,0CEh
                    db    0,0DBh, 5Ch,0FEh,0A2h,0ADh,0FFh
txtDontMove:        db    4, 44h, 4Fh, 4Eh, 97h, 54h,   0,0AEh, 3Dh,0FFh
txtCaught:          db    4,0AFh,   0, 41h, 52h, 45h,   0,0B0h, 44h, 3Dh,0FFh
txtYourReply:       db    3,0D1h,   0,0CBh,0A2h,0FEh,0AFh, 52h,   0, 52h, 45h, 50h, 4Ch, 59h, 5Fh,0D5h
                    db  5Ch,0FFh
txtFinalThread:     db    3, 4Ch, 49h, 53h, 54h, 45h, 4Eh, 3Dh,   0,0CBh,0A2h,0FEh, 49h, 97h, 4Ch, 4Ch
                    db    0,0EAh,   0, 44h, 49h, 45h,0A2h,0FDh, 49h, 97h, 4Ch, 4Ch,   0, 47h, 45h, 54h
                    db    0,0AFh, 5Ch,0FEh, 4Fh, 4Eh, 45h,   0, 44h, 41h, 59h, 5Ch,0FDh, 53h, 45h, 45h
                    db    0,0AFh,   0, 41h,0D8h,0A2h,0FFh
txtResistance:      db  13h,0D1h,   0,0A1h,0A2h,0FEh,0ECh,   0,0C2h,   0,0E3h,0FEh, 53h, 4Fh, 4Dh, 45h
                    db    0,0B1h, 5Ch,0FDh, 54h, 52h, 59h,   0,0E6h,   0,0A8h,   0,0D9h,0FEh,0CEh,   0
                    db 0FCh, 3Dh,0FEh,0A2h,0ADh,0FFh
txtSchneider:       db  13h,0D1h,   0,0CEh,   0,0B1h,0FEh,0B5h, 5Fh,0B2h,0A2h,0FDh, 49h,   0,0C1h,   0
                    db  42h, 52h, 49h, 45h, 46h,   0,0AFh,   0,0E2h,0FEh,0CEh,   0,0FAh,   0, 44h, 45h
                    db  54h, 41h, 49h, 4Ch, 53h, 5Ch,0FEh,0D5h,   0,0A8h,   0,0E2h,0FEh,0B3h,   0, 31h
                    db  32h, 30h, 37h, 39h, 5Ch,0FEh,0A2h,0ADh,0FFh
txtGasMask:         db    3,0D1h,   0,0A1h,0A2h,0FEh,0B4h,   0, 41h,   0,0F0h,   0, 4Dh, 41h, 53h, 4Bh
                    db    0, 49h, 4Eh,0FEh,0CEh,   0,0F0h,   0,0F6h, 5Ch,0FEh,0A2h,0ADh,0FFh
txtGasMaskLoc:      db  13h,0D1h,   0,0CEh,   0,0B1h,0FEh,0B5h, 5Fh,0B2h,0A2h,0FDh, 47h, 4Fh,   0,0E6h
                    db    0,0CEh,   0, 53h, 4Fh, 55h, 54h, 48h,   0, 50h, 41h, 52h, 54h,   0, 4Fh, 46h
                    db 0FEh,0CEh,   0, 31h, 53h, 54h,   0,0C7h,   0,0E6h,   0, 47h, 45h, 54h,0FEh,0AFh
                    db  52h,   0, 4Dh, 41h, 53h, 4Bh, 5Ch,0FEh,0A2h,0ADh,0FFh
txtDianeFreq:       db  11h,0B6h, 3Dh,0FDh,0B1h, 5Fh,0D7h,0FEh,0C1h,   0, 53h, 55h, 50h, 50h, 4Fh, 52h
                    db  54h,   0,0AFh,0FEh,0E2h,   0,0B3h,   0, 31h, 32h, 30h, 33h, 33h, 5Ch,0FFh
txtImSaved:         db    0,0B6h,0FFh
txtRadioKNK:        db  13h,0D1h,   0, 52h, 41h, 44h, 49h, 4Fh,   0, 4Bh, 4Eh, 4Bh, 5Ch,0FEh,0CCh,   0
                    db  4Eh, 45h, 57h, 53h,   0, 46h, 4Ch, 41h, 53h, 48h, 3Dh,0FDh,0ECh,   0, 57h, 41h
                    db  53h,   0, 41h, 50h, 50h, 41h, 52h, 45h, 4Eh, 54h, 4Ch, 59h,0FEh, 41h,   0, 54h
                    db  52h, 45h, 4Dh, 45h, 4Eh, 44h, 4Fh, 55h, 53h,   0, 45h, 41h, 52h, 54h, 48h,0FEh
                    db  54h, 52h, 45h, 4Dh, 4Fh, 52h,   0, 49h, 4Eh,   0,0CEh,   0, 52h, 45h, 47h, 49h
                    db  4Fh, 4Eh,   0, 4Fh, 46h,0FEh, 47h, 41h, 4Ch, 5Ah, 42h, 55h, 52h, 47h, 5Fh, 53h
                    db  4Fh, 55h, 54h, 48h,   0, 41h, 46h, 52h, 49h, 43h, 41h,0FEh, 41h, 54h,   0, 4Dh
                    db  49h, 44h, 4Eh, 49h, 47h, 48h, 54h, 5Ch,0FFh
txtFoxHoundInf:     db  11h,0B6h, 3Dh,0FDh,0B7h, 45h, 52h,0FEh,0A3h, 44h,0FEh, 41h,   0, 46h, 45h, 57h
                    db    0, 44h, 41h, 59h, 53h,   0, 41h, 47h, 4Fh,0FDh,0DAh,   0, 49h, 53h,   0, 53h
                    db  41h, 46h, 45h,   0,0ACh, 5Ch,0FDh, 48h, 45h,   0, 57h, 41h, 53h,   0,0B0h, 44h
                    db    0,0EBh,0FEh,0CEh,   0,0B8h, 5Ch,0FFh
txtSleepy:          db    4, 49h, 97h, 4Dh,   0, 53h, 4Ch, 45h, 45h, 50h, 59h, 5Ch,0FFh
txtSlept:           db    4,0ADh, 53h, 4Ch, 45h, 50h, 54h, 3Dh,0FFh
txtDesetGuards:     db    1, 50h, 52h, 4Fh, 42h, 41h, 42h, 4Ch, 59h, 5Fh,0FEh,0B7h, 45h, 52h,0FEh,0D8h
                    db  45h, 44h,   0,0F1h, 5Ch,0FDh, 44h, 4Fh, 4Eh, 97h, 54h,   0, 4Dh, 41h, 4Bh, 45h
                    db    0,0F7h,0FEh,0F2h,   0, 48h, 49h, 4Dh, 5Fh,0FEh, 41h, 54h,   0, 41h, 4Eh, 59h
                    db    0, 43h, 4Fh, 53h, 54h, 5Ch,0FFh
txtTutorial:        db    3,0D1h,   0,0A1h,0A2h,0FEh,0C1h,   0, 45h, 58h, 50h, 4Ch, 41h, 49h, 4Eh,   0
                    db  48h, 4Fh, 57h,   0,0E6h,0FEh, 55h, 53h, 45h,   0, 46h, 40h, 4Bh, 45h, 59h, 5Ch
                    db 0FDh, 46h, 40h, 31h,   0,0B9h,   0, 50h, 41h, 55h, 53h, 45h, 5Ch,0FEh, 46h, 40h
                    db  32h,   0,0B9h,   0,0BAh,0FEh,0AFh, 52h,   0,0D2h, 53h, 5Ch,0FEh, 46h, 40h, 33h
                    db    0,0B9h,   0,0BAh,0FEh,0AFh, 52h,   0,0D3h, 5Ch,0FDh, 46h, 40h, 34h,   0,0B9h
                    db 0FEh,0FCh,   0,0D6h, 5Ch,0FEh, 52h, 45h, 4Dh, 45h, 4Dh, 42h, 45h, 52h,   0, 54h
                    db  48h, 45h, 53h, 45h,   0, 57h, 45h, 4Ch, 4Ch, 5Ch,0FEh,0A2h,0ADh,0FFh
txtDestroyPS:       db  13h,0D1h,   0,0A1h,0A2h,0FDh,0FBh,   0, 44h, 4Fh, 57h, 4Eh,   0,0CEh,   0, 50h
                    db  4Fh, 57h, 45h, 52h,0FEh, 53h, 55h, 50h, 50h, 4Ch, 59h,   0, 42h, 4Fh, 58h,   0
                    db 0D9h,0FEh,0CEh,   0,0DFh,0FEh,0E0h,   0,0E6h,   0, 47h, 45h, 54h,   0, 52h, 49h
                    db  44h,   0, 4Fh, 46h,0FEh,0CEh,   0, 48h, 49h, 47h, 48h, 40h, 56h, 4Fh, 4Ch, 54h
                    db  41h, 47h, 45h, 5Ch,0FDh,0A2h,0ADh,0FFh
txtMissilLoc:       db    3,0D1h,   0,0B2h,0A2h,0FEh,0CEh,   0,0DFh,0FEh,0E0h,   0, 49h, 53h,   0,0E4h
                    db    0, 49h, 4Eh,0FEh,0CEh,   0, 53h, 4Fh, 55h, 54h, 48h, 45h, 41h, 53h, 54h, 45h
                    db  52h, 4Eh,   0, 41h, 52h, 45h, 41h, 5Ch,0FEh,0A2h,0ADh,0FFh
txtWindBarrier:     db  13h,0D1h,   0,0A1h,0A2h,0FEh, 57h, 49h, 4Eh, 44h,   0, 42h, 41h, 52h, 52h, 49h
                    db  45h, 52h,   0, 49h, 53h,0FEh, 45h, 58h, 54h, 45h, 4Eh, 44h, 45h, 44h,   0,0E2h
                    db 0FEh,0CEh,   0, 52h, 4Fh, 4Fh, 46h, 54h, 4Fh, 50h, 5Ch,0FDh, 4Ch, 4Fh, 4Fh, 4Bh
                    db    0,0F2h,0FEh,0CEh,   0,0F3h,   0,0E6h,0FEh,0E3h,   0, 49h, 4Eh,0E6h,   0,0CEh
                    db    0, 42h, 41h, 52h, 52h, 49h, 45h, 52h, 5Ch,0FEh,0A2h,0ADh,0FFh
txtStaff:           db    3, 4Eh, 45h, 58h, 54h, 5Fh,0FEh, 57h, 45h,   0, 49h, 4Eh, 54h, 52h, 4Fh, 44h
                    db  55h, 43h, 45h,0FEh,0A7h,   0, 53h, 54h, 41h, 46h, 46h,0A2h,0FDh,   0,   0,   0
                    db    0,   0, 4Dh, 41h, 49h, 4Eh,   0, 50h, 52h, 4Fh, 47h, 52h, 41h, 4Dh,0FEh,0FEh
                    db    0,   0,   0,   0, 48h, 49h, 52h, 4Fh, 59h, 55h, 4Bh, 49h,   0, 46h, 55h, 4Bh
                    db  55h, 49h,0FEh,0FDh,   0,   0,   0,   0,   0,   0, 53h, 55h, 42h,   0, 50h, 52h
                    db  4Fh, 47h, 52h, 41h, 4Dh,0FEh,0FEh,   0,   0,   0,   0, 54h, 4Fh, 4Dh, 4Fh, 4Eh
                    db  4Fh, 52h, 49h,   0, 4Fh, 53h, 54h, 55h, 4Bh, 41h,0FEh,   0,   0,   0,   0,   0
                    db  4Bh, 4Fh, 4Ah, 49h,   0, 54h, 4Fh, 59h, 4Fh, 48h, 41h, 52h, 41h,0FDh,   0,   0
                    db    0,   0, 47h, 52h, 41h, 50h, 48h, 49h, 43h,   0, 44h, 45h, 53h, 49h, 47h, 4Eh
                    db 0FEh,0FEh,   0,   0,   0,   0,   0, 4Dh, 41h, 53h, 41h, 4Dh, 49h,   0, 54h, 41h
                    db  42h, 41h, 54h, 41h,0FEh,   0,   0,   0,   0,   0, 41h, 5Ah, 55h, 53h, 41h,   0
                    db  46h, 55h, 4Ah, 49h, 4Dh, 4Fh, 54h, 4Fh,0FDh,   0,   0,   0, 4Dh, 41h, 49h, 4Eh
                    db    0, 53h, 4Fh, 55h, 4Eh, 44h,   0, 45h, 46h, 46h, 45h, 43h, 54h,0FEh,0FEh,   0
                    db    0,   0,   0,   0,   0, 49h, 4Bh, 55h,   0, 4Dh, 49h, 5Ah, 55h, 54h, 41h, 4Eh
                    db  49h,0FDh,   0,   0,   0, 53h, 55h, 42h,   0, 53h, 4Fh, 55h, 4Eh, 44h,   0, 45h
                    db  46h, 46h, 45h, 43h, 54h,0FEh,0FEh,   0, 53h, 48h, 49h, 47h, 45h, 48h, 49h, 52h
                    db  4Fh,   0, 54h, 41h, 4Bh, 45h, 4Eh, 4Fh, 55h, 43h, 48h, 49h,0FEh,   0,   0,   0
                    db    0, 4Dh, 4Fh, 54h, 4Fh, 41h, 4Bh, 49h,   0, 46h, 55h, 52h, 55h, 4Bh, 41h, 57h
                    db  41h,0FDh,   0,   0,   0,   0,   0,   0, 47h, 41h, 4Dh, 45h,   0, 44h, 45h, 53h
                    db  49h, 47h, 4Eh,0FEh,0FEh,   0,   0,   0,   0,   0, 48h, 49h, 44h, 45h, 4Fh,   0
                    db  4Bh, 4Fh, 4Ah, 49h, 4Dh, 41h,0FDh,   0,   0,   0,   0,   0, 50h, 52h, 45h, 53h
                    db  45h, 4Eh, 54h, 45h, 44h,   0,   0, 42h, 59h,0FEh,0FEh,   0,   0,   0,   0,   0
                    db    0,   0,   0, 4Bh, 4Fh, 4Eh, 41h, 4Dh, 49h,0FEh,0FEh,   0,   0,   0,   0,   0
                    db    0,   0,   0,   0, 31h, 39h, 38h, 37h,0FFh
txtChkBugged:       db  13h,0D1h,   0,0A1h,0A2h,0FEh,0BBh,   0,0AFh, 52h,   0,0D3h, 3Dh,0FEh,0BBh,   0
                    db  49h, 46h,   0,0AFh,   0,0BCh,   0,0E3h, 45h, 4Eh,0FEh, 42h, 55h, 47h, 47h, 45h
                    db  44h,   0,0EBh,   0,0CEh,   0,0B8h, 5Ch,0FEh,0A2h,0ADh,0FFh
txtBombSuitLoc:     db    3,0D1h,   0,0B2h,0A2h,0FEh,0CEh,   0,0F3h,0FEh,0E1h,   0,0E3h,   0, 46h, 4Fh
                    db  55h, 4Eh, 44h,   0, 49h, 4Eh,0FEh,0CEh,   0,0C6h, 5Ch,0FEh,0A2h,0ADh,0FFh
txtFoxHundInfo:     db  11h,0B6h, 3Dh,0FDh,0B7h, 45h, 52h,0FEh, 43h, 41h, 4Ch, 4Ch, 45h, 44h,0FEh,0A9h
                    db    0,0C2h,   0, 42h, 45h,0FDh,0BDh,   0, 49h, 4Eh,0FEh,0CEh,   0,0BEh,   0,0C0h
                    db  5Ch,0FFh
txtCellCaught:      db  11h,0B6h, 3Dh,0FDh,0CEh,   0, 42h, 45h, 53h, 54h,   0,0F7h,   0, 4Fh, 46h,0FEh
                    db 0D8h, 49h, 4Eh, 47h,   0,0F1h,   0, 54h, 4Fh,0FEh,0CEh,   0,0BEh,   0,0C0h, 5Fh
                    db 0FDh, 49h, 53h,   0,0E6h,   0, 41h, 4Ch, 4Ch, 4Fh, 57h,   0,0CEh,0FEh,0B8h,   0
                    db 0E6h,   0,0B0h,0FEh,0AFh, 5Ch,0FFh
txtChkWall:         db  13h,0D1h,   0,0A1h,0A2h,0FEh,0AEh,   0, 4Fh, 55h, 54h, 5Fh,0DAh,   0, 4Ch, 4Fh
                    db  43h, 41h, 54h, 45h,0FEh,0A9h, 97h, 53h,   0,0BFh,0FEh,0C0h, 5Ch,0FDh,0BBh,   0
                    db 0CEh,   0,0E8h, 3Dh,0FEh,0A2h,0ADh,0FFh
txtGrayFox:         db  11h, 49h, 97h, 4Dh,   0,0A9h, 5Ch,0FDh,0A6h,0FEh,0A7h,   0, 48h, 41h, 53h,0FDh
                    db  4Eh, 55h, 43h, 4Ch, 45h, 41h, 52h,   0,0D2h, 53h,0FEh, 44h, 45h, 53h, 49h, 47h
                    db  4Eh, 45h, 44h,   0,0F2h,   0, 45h, 56h, 45h, 52h, 59h,0FEh, 50h, 41h, 52h, 54h
                    db    0, 4Fh, 46h,   0, 45h, 41h, 52h, 54h, 48h, 5Ch,0FDh, 49h, 46h,   0, 49h, 54h
                    db    0, 49h, 53h,   0,0D0h, 44h, 5Fh,0FEh, 4Eh, 55h, 43h, 4Ch, 45h, 41h, 52h,   0
                    db  41h, 54h, 54h, 41h, 43h, 4Bh,0FDh,0ABh,   0, 41h, 4Eh, 59h, 57h, 48h, 57h, 52h
                    db  45h,0FDh,0C1h,   0,0E3h,0FEh, 50h, 4Fh, 53h, 53h, 49h, 42h, 4Ch, 45h, 5Ch,0FDh
                    db 0A7h,   0,0C2h,   0,0E3h,0FEh,0A5h, 45h, 44h, 5Fh,0FDh,0E3h,0F2h, 45h,   0, 49h
                    db  54h,   0, 49h, 53h,0FEh,0D0h, 44h, 5Ch,0FDh,0ECh,   0, 49h, 53h,   0,0C3h,   0
                    db  4Fh, 4Eh, 45h,0FEh,0F7h,   0,0E6h,   0,0A5h,0FEh,0A7h, 5Ch,0FDh,0C4h, 5Fh, 57h
                    db  48h, 4Fh,0FEh, 44h, 45h, 56h, 45h, 4Ch, 4Fh, 50h, 45h, 44h,   0, 49h, 54h,   0
                    db  4Bh, 4Eh, 4Fh, 57h,0FEh,0CEh,   0,0C3h,   0, 4Dh, 45h, 54h, 48h, 4Fh, 44h, 5Ch
                    db 0FFh
txtFindGear:        db  13h,0D1h,   0,0A1h,0A2h,0FEh,0EEh,   0, 42h, 41h, 43h, 4Bh,   0,0AFh, 52h,   0
                    db 0D2h, 53h,0FEh,0DAh,   0,0D3h, 5Fh,0FEh,0DAh,   0, 47h, 45h, 54h,   0, 4Fh, 55h
                    db  54h,   0, 4Fh, 46h,   0,0F4h, 3Dh,0FDh, 54h, 48h, 45h, 59h,   0,0C2h,   0,0E3h
                    db    0, 43h, 4Fh, 4Eh, 43h, 45h, 41h, 4Ch, 45h, 44h,0FEh, 49h, 4Eh,   0, 41h,   0
                    db 0F6h, 5Ch,0FEh,0FBh,   0,0CEh,   0,0DBh, 3Dh,0FEh,0A2h,0ADh,0FFh
txtGearTaken:       db    1, 49h,   0, 54h, 4Fh, 4Fh, 4Bh,   0, 42h, 41h, 43h, 4Bh,   0,0FEh,0CEh,   0
                    db 0D2h, 53h,0FEh,0DAh,   0,0D3h, 5Ch,0FFh
txtShootGunn:       db    1, 49h, 97h, 4Dh,   0, 53h, 48h, 4Fh, 4Fh, 54h,   0, 47h, 55h, 4Eh, 4Eh, 45h
                    db  52h, 3Dh,0FDh, 4Eh, 4Fh, 42h, 4Fh, 44h, 59h,   0, 48h, 41h, 53h,0FDh, 45h, 56h
                    db  45h, 52h,   0,0E3h, 45h, 4Eh,   0, 41h, 42h, 4Ch, 45h,   0,0E6h,0FEh, 45h, 53h
                    db  43h, 41h, 50h, 45h,   0,0ABh,   0,0F4h, 5Ch,0FFh
txtBombWall:        db  13h,0D1h,   0,0B2h,0A2h,0FDh,0AFh,   0,0E7h,   0, 4Bh, 4Eh, 4Fh, 43h, 4Bh,0FEh
                    db 0CEh,   0,0E8h,   0,0DAh,   0, 42h, 4Ch, 41h, 53h, 54h,   0, 49h, 54h,0FEh, 57h
                    db  48h, 49h, 43h, 48h,   0, 53h, 4Fh, 55h, 4Eh, 44h, 53h,0FEh, 49h, 52h, 52h, 45h
                    db  47h, 55h, 4Ch, 41h, 52h, 4Ch, 59h, 5Ch,0FEh,0A2h,0ADh,0FFh
txtParachCourtyard: db  11h,0B6h, 3Dh,0FDh,0CEh,   0,0C3h,   0,0F7h,   0,0E6h,0FEh, 52h, 45h, 41h, 43h
                    db  48h,   0,0CEh,   0,0CFh,0FEh, 49h, 53h,   0,0EBh,   0, 50h, 41h, 52h, 41h, 43h
                    db  48h, 55h, 54h, 45h, 5Ch,0FFh
txtMadnarLocation:  db  11h,0B6h, 3Dh,0FDh,0C4h,   0, 49h, 53h,0FEh,0BDh,   0,0E6h,0FDh, 41h,   0,0BFh
                    db    0,0C0h,   0, 49h, 4Eh,0FEh,0CEh,   0,0CFh, 5Ch,0FFh
txtMachGunKid:      db    1, 49h, 97h, 4Dh,   0,0FEh,0DEh, 3Dh,0FDh, 49h, 97h, 4Ch, 4Ch,   0,0EAh,   0
                    db  4Ch, 45h, 54h,0FEh,0AFh,   0, 47h, 4Fh,   0, 41h, 48h, 45h, 41h, 44h, 3Eh,0FFh
txtMachGunKidInfo:  db    3,0DCh,   0,0D1h,   0,0D7h,0A2h,0FEh,0DEh,   0,0C2h,   0,0E3h,0FEh,0F9h, 45h
                    db  44h,   0,0EBh,0FEh,0DFh,   0,0E0h, 5Ch,0FEh,0A2h,0ADh,0FFh
txtParacFind:       db    3,0D1h,   0,0B2h,0A2h,0FEh,0AFh,   0,0E1h,   0, 47h, 45h, 54h,0FEh,0CEh,   0
                    db  50h, 41h, 52h, 41h, 43h, 48h, 55h, 54h, 45h,   0,0E2h,0FEh,0CEh,   0, 32h, 4Eh
                    db  44h,   0,0C7h, 5Ch,0FEh,0A2h,0ADh,0FFh
txtRescued_:        db    0,0B6h,0FFh
txtHindDGrenade:    db    3,0DCh,   0,0D1h,   0,0D7h,0A2h,0FEh, 48h, 49h, 4Eh, 44h, 40h, 44h,   0,0C2h
                    db    0,0E3h,0FEh,0A5h, 45h, 44h,   0,0EBh,0FEh, 47h, 52h, 45h, 4Eh, 41h, 44h, 45h
                    db    0, 4Ch, 41h, 55h, 4Eh, 43h, 48h, 45h, 52h, 5Ch,0FEh,0A2h,0DDh,0FFh
txtTooLate:         db    4,0A2h,0C4h, 5Ch,0FEh, 49h, 54h, 97h, 53h,   0,0E6h, 4Fh,   0, 4Ch, 41h, 54h
                    db  45h, 5Ch,0FFh
txtDrMovedB2:       db  11h,0B6h, 3Dh,0FDh,0C4h,   0, 57h, 41h, 53h,0FEh, 51h, 55h, 49h, 43h, 4Bh, 4Ch
                    db  59h,   0,0AEh, 44h,   0,0E6h,0FEh,0C5h,   0, 4Eh, 4Fh, 5Ch, 32h, 5Ch,0FDh,0C5h
                    db    0, 4Eh, 4Fh, 5Ch, 32h,   0, 4Ch, 49h, 45h, 53h,0FEh, 31h, 30h, 4Bh, 4Dh,   0
                    db  54h, 4Fh,   0,0CEh,   0, 4Eh, 4Fh, 52h, 54h, 48h,0FEh,0ABh,   0,0F4h, 5Ch,0FFh
txtGoofed:          db    1, 49h,   0, 47h, 4Fh, 4Fh, 46h, 45h, 44h, 3Eh,0FEh,0CEh,   0,0EFh,0FEh, 53h
                    db  54h, 41h, 52h, 54h, 45h, 44h,   0,0E6h,   0,0AEh, 3Dh,0FFh
txtTankMines:       db    3,0DCh,   0,0D1h,   0,0D7h,0A2h,0FEh,0A5h,   0,0CEh,   0, 54h, 41h, 4Eh, 4Bh
                    db    0,0D9h,0FEh,0CEh,   0, 4Ch, 41h, 4Eh, 44h,   0, 4Dh, 49h, 4Eh, 45h, 5Ch,0FEh
                    db 0A2h,0DDh,0FFh
txtUseUniform:      db  13h,0D1h,   0,0A1h,0A2h,0FEh,0BBh,   0, 50h, 4Fh, 49h, 4Eh, 54h, 3Dh,0FDh,0B4h
                    db 0FEh, 41h, 4Eh,   0,0B8h, 97h, 53h,   0, 55h, 4Eh, 49h,0F2h, 4Dh,0FEh,0DAh,   0
                    db 0D8h,   0,0F1h, 5Ch,0FDh,0C1h,   0, 55h, 53h, 45h,   0,0B3h,   0, 31h, 32h, 30h
                    db  31h, 33h,0FEh,0F2h,   0, 46h, 55h, 54h, 55h, 52h, 45h,   0,0A8h, 5Ch,0FEh,0A2h
                    db 0ADh,0FFh
txtUniformLoc:      db  13h,0D1h,   0,0B2h,0A2h,0FDh,0B8h, 97h, 53h,   0, 55h, 4Eh, 49h,0F2h, 4Dh,   0
                    db  49h, 53h,0FEh,0E4h,   0, 49h, 4Eh,0FEh,0CEh,   0,0C6h,   0, 4Fh, 46h,0FEh,0C5h
                    db    0, 4Eh, 4Fh, 5Ch, 31h, 5Ch,0FDh,0C1h,   0,0A8h,0FEh, 49h, 4Eh,   0,0CEh,   0
                    db 0D6h,   0, 4Fh, 46h,   0, 31h, 32h, 30h, 32h, 36h,0FEh,0ABh,   0,0ACh,   0,0E2h
                    db  5Ch,0FEh,0A2h,0ADh,0FFh
txtDianeNewFreq:    db  13h,0DCh,   0,0D1h,   0,0D7h,0A2h,0FEh,0C1h,   0,0A8h,   0,0E2h,0FEh,0B3h,   0
                    db  31h, 32h, 30h, 39h, 31h,   0,0ABh,0FEh,0ACh,   0,0E2h, 5Ch,0FDh,0A2h,0DDh,0FFh
txtJammingAtk:      db    3,0D1h,   0,0A1h,0A2h,0FEh, 49h, 54h,   0, 57h, 41h, 53h,   0, 4Ah, 41h, 4Dh
                    db  4Dh, 49h, 4Eh, 47h, 5Fh, 42h, 55h, 54h,0A2h,0FEh, 4Fh, 4Bh,   0,0ACh, 5Ch,0FEh
                    db 0A2h,0ADh,0FFh
txtDrUndergCell:    db  11h,0B6h, 3Dh,0FDh,0C4h,   0, 49h, 53h,0FEh,0BDh,   0, 49h, 4Eh,0FEh,0CEh,   0
                    db 0C6h, 5Ch,0FFh
txtGasArea:         db    3,0D1h,   0,0B2h,0A2h,0FEh,0F5h,   0,0AFh,   0,0E6h,0FEh,0CEh,   0,0F0h,   0
                    db 0F6h, 3Dh,0FEh,0A2h,0ADh,0FFh
txtUserNorthElev:   db    0,0B6h,0FFh
txtImFireTrop:      db    4, 49h, 97h, 4Dh,   0, 46h, 49h, 52h, 45h,   0, 54h, 52h, 4Fh, 4Fh, 50h, 45h
                    db  52h, 3Dh,0FDh, 49h,   0,0C1h,0FDh, 42h, 55h, 52h, 4Eh,   0,0AFh,   0, 41h, 4Ch
                    db  49h, 56h, 45h, 3Dh,0FFh

;YOU ARE CAUGHT IN A TRAP.*IN FACT,*WE HAVE CONFINED DR. PETTROVICH ON THE SECOND FLOOR.* I WILL GET YOU FOXHOUNDER!
txtTrap:            db    1,0AFh,   0, 41h, 52h, 45h,   0, 43h, 41h, 55h, 47h, 48h, 54h,   0, 49h, 4Eh
                    db 0FEh, 41h,   0, 54h, 52h, 41h, 50h, 5Ch,0FDh, 49h, 4Eh,   0, 46h, 41h, 43h, 54h
                    db  5Fh,0FDh, 57h, 45h,   0,0BCh,   0,0BDh,0FEh,0C4h,   0,0E2h,0FEh,0CEh,   0, 53h
                    db  45h, 43h,0E2h, 44h,   0,0C7h, 5Ch,0FDh, 49h,   0,0C1h,   0, 47h, 45h, 54h,   0
                    db 0AFh,0FEh,0B7h, 45h, 52h, 3Dh,0FFh
txtFlashLoc:        db    3,0D1h,   0,0B2h,0A2h,0FEh,0CEh,   0, 46h, 4Ch, 41h, 53h, 48h,   0, 4Ch, 49h
                    db  47h, 48h, 54h,   0,0E1h,   0,0E3h,0FEh, 46h, 4Fh, 55h, 4Eh, 44h,   0,0E2h,   0
                    db 0CEh,   0, 31h, 53h, 54h,   0,0C7h, 5Ch,0FEh,0A2h,0ADh,0FFh
txtPitfalls:        db    3,0DCh,   0,0D1h,   0,0D7h,0A2h,0FEh,0D5h,   0, 54h, 41h, 4Bh, 45h,   0, 43h
                    db  41h, 52h, 45h, 5Fh,0FEh,0ECh,   0, 4Dh, 41h, 59h,   0,0E3h,   0, 41h,   0, 50h
                    db  49h, 54h, 46h, 41h, 4Ch, 4Ch, 5Ch,0FEh,0A2h,0DDh,0FFh
txtArnorlds:        db    3,0DCh,   0,0D1h,   0,0D7h,0A2h,0FEh,0CEh,   0,0DBh, 4Bh, 45h, 45h, 50h, 45h
                    db  52h, 5Fh,0FEh,0F8h,0FEh, 49h, 53h,   0, 49h, 4Eh, 56h, 49h, 4Eh, 43h, 49h, 42h
                    db  4Ch, 45h, 3Dh,0FEh, 45h, 53h, 43h, 41h, 50h, 45h, 3Dh,0FFh
txtUseCompass:      db  11h,0B6h, 3Dh,0FDh,0AFh,   0,0C2h,   0,0BCh,0FEh, 41h,   0, 43h, 4Fh, 4Dh, 50h
                    db  41h, 53h, 53h,   0,0E6h,   0, 43h, 52h, 4Fh, 53h, 53h,0FEh,0CEh,   0, 44h, 45h
                    db  53h, 45h, 52h, 54h, 5Ch,0FFh
txtJennifer:        db  11h,0B6h, 3Dh,0FDh,0AFh,   0, 4Dh, 49h, 47h, 48h, 54h,   0,0E3h,   0, 41h, 42h
                    db  4Ch, 45h,0FEh,0E6h,   0,0A8h,   0,0C8h,0FEh, 4Fh, 46h,   0,0B1h,   0,0E2h,0FDh
                    db 0B3h,   0, 31h, 32h, 30h, 34h, 38h, 5Ch,0FDh, 42h, 55h, 54h,   0, 53h, 48h, 45h
                    db    0, 49h, 53h,   0, 50h, 52h, 4Fh, 55h, 44h, 5Fh,0FEh,0DAh,0FEh, 57h, 4Fh, 55h
                    db  4Ch, 44h, 4Eh, 97h, 54h,   0, 41h, 4Eh, 53h, 57h, 45h, 52h, 5Fh,0FDh, 49h, 46h
                    db    0,0AFh,   0, 57h, 45h, 52h, 45h,   0,0E5h,0FEh,0CEh,   0, 45h, 58h, 45h, 43h
                    db  55h, 54h, 49h, 56h, 45h, 5Ch,0FFh
txtRocketLaunch:    db  13h,0D1h,   0,0C8h,0A2h,0FEh,0C1h,   0, 41h, 52h, 52h, 41h, 4Eh, 47h, 45h,0FEh
                    db  41h,   0,0CAh, 5Ch,0FDh, 43h, 4Fh, 4Dh, 45h,   0,0F2h,0FEh, 41h,   0,0CAh, 3Dh
                    db 0FEh,0A2h,0ADh,0FFh
txtOpeningDoor:     db    3,0D1h,   0,0C8h,0A2h,0FEh,0C1h,   0,0EDh,   0,0CEh,   0,0DBh, 5Ch,0FEh,0A2h
                    db 0ADh,0FFh
txtCompassLoc:      db    3,0D1h,   0,0B2h,0A2h,0FEh,0CEh,   0, 43h, 4Fh, 4Dh, 50h, 41h, 53h, 53h,   0
                    db 0E1h,   0,0E3h,0FEh, 46h, 4Fh, 55h, 4Eh, 44h,   0,0E2h,   0,0CEh,   0, 32h, 4Eh
                    db  44h,   0,0C7h, 5Ch,0FEh,0A2h,0ADh,0FFh
txtWaterChan:       db    1,0B6h, 3Dh,0FDh,0CEh,   0, 44h, 49h, 54h, 43h, 48h,   0,0C1h,   0,0F5h,0FEh
                    db 0AFh,   0,0E6h,0FEh,0CEh,   0, 4Eh, 4Fh, 5Ch, 33h,   0,0C5h, 5Ch,0FFh
;I'M DR. PETTROVICH.*MY DAUGHTER ELLEN WAS TAKEN AS HOSTAGE.*SAVE ELLEN OR,I WON'T DISCUSS METAL GEAR.
txtSaveEllen:       db  11h, 49h, 97h, 4Dh,   0,0C4h, 5Ch,0FDh, 4Dh, 59h,   0, 44h, 41h, 55h, 47h, 48h
                    db  54h, 45h, 52h,   0,0C9h,0FEh, 57h, 41h, 53h,   0, 54h, 41h, 4Bh, 45h, 4Eh,0FEh
                    db  41h, 53h,   0, 48h, 4Fh, 53h, 54h, 41h, 47h, 45h, 5Ch,0FDh, 53h, 41h, 56h, 45h
                    db    0,0C9h,0FEh, 4Fh, 52h, 5Fh, 49h,   0, 57h, 4Fh, 4Eh, 97h, 54h,   0, 44h, 49h
                    db  53h, 43h, 55h, 53h, 53h,0FEh,0A7h, 5Ch,0FFh

; I'M DR. PETTROVICH.* METAL GEAR IS IN 100TH BASEMENT OF BUILDING NO.3,*
;20KM TO THE NORTH OF HERE.* METAL GEAR CAN BE DESTOROYED IN ONLY ONE WAY.*
;ATTACH PLASTIC BOMB TO THE FOOT OF METAL GEAR.*
;R,R,L,R,L,L,R,L,L,R,R,L,R,L,R,...IN ORDER.*
;I FORGOT THE REMAINDER.* ANYWAY,* SET 16 UNITS.* YOU CAN NOT,DESTOROY*IF YOU COMMIT AN ERROR IN THE ORDER.*
;MR. ARNOLD HAS AN I.D. CARD* TO GET OUT OF BUILDING NO.2.*
;YOU SHOULD USE A ROCKET LAUNCHER TO KILL MR. ARNOLD.
txtImMadnar:        db  11h, 49h, 97h, 4Dh,   0,0C4h, 5Ch,0FDh,0A7h,   0, 49h, 53h,   0, 49h, 4Eh,0FEh
                    db  31h, 30h, 30h, 54h, 48h,   0,0C6h,   0, 4Fh, 46h,0FEh,0C5h,   0, 4Eh, 4Fh, 5Ch
                    db  33h, 5Fh,0FDh, 32h, 30h, 4Bh, 4Dh,   0,0E6h,   0,0CEh,   0, 4Eh, 4Fh, 52h, 54h
                    db  48h,0FEh, 4Fh, 46h,   0,0F4h, 5Ch,0FDh,0A7h,   0,0E1h,   0,0E3h,0FEh,0A5h, 45h
                    db  44h,0FEh, 49h, 4Eh,   0,0C3h,   0, 4Fh, 4Eh, 45h,   0,0F7h, 5Ch,0FDh, 41h, 54h
                    db  54h, 41h, 43h, 48h,   0, 50h, 4Ch, 41h, 53h, 54h, 49h, 43h,   0, 42h, 4Fh, 4Dh
                    db  42h,0FEh,0E6h,   0,0CEh,   0, 46h, 4Fh, 4Fh, 54h,   0, 4Fh, 46h,0FEh,0A7h, 5Ch
                    db 0FDh, 52h, 5Fh, 52h, 5Fh, 4Ch, 5Fh, 52h, 5Fh, 4Ch, 5Fh, 4Ch, 5Fh, 52h, 5Fh, 4Ch
                    db  5Fh, 4Ch, 5Fh,0FEh, 52h, 5Fh, 52h, 5Fh, 4Ch, 5Fh, 52h, 5Fh, 4Ch, 5Fh, 52h, 5Fh
                    db 0A2h,0FEh, 49h, 4Eh,   0, 4Fh, 52h, 44h, 45h, 52h, 5Ch,0FDh, 49h,   0,0F2h, 47h
                    db  4Fh, 54h,0FEh,0CEh,   0, 52h, 45h, 4Dh, 41h, 49h, 4Eh, 44h, 45h, 52h, 5Ch,0FDh
                    db  41h, 4Eh, 59h,0F7h, 5Fh,0FDh, 53h, 45h, 54h,   0, 31h, 36h,   0, 55h, 4Eh, 49h
                    db  54h, 53h, 5Ch,0FDh,0AFh,   0, 43h, 41h, 4Eh,   0,0E5h, 5Fh,0FEh,0A5h,0FDh, 49h
                    db  46h,   0,0AFh,   0, 43h, 4Fh, 4Dh, 4Dh, 49h, 54h,0FEh, 41h, 4Eh,   0, 45h, 52h
                    db  52h, 4Fh, 52h,0FEh, 49h, 4Eh,   0,0CEh,   0, 4Fh, 52h, 44h, 45h, 52h, 5Ch,0FDh
                    db 0F8h,   0, 48h, 41h, 53h,0FEh, 41h, 4Eh,   0, 49h, 5Ch, 44h, 5Ch,   0,0D4h,0FDh
                    db 0E6h,   0, 47h, 45h, 54h,   0, 4Fh, 55h, 54h,   0, 4Fh, 46h,0FEh,0C5h,   0, 4Eh
                    db  4Fh, 5Ch, 32h, 5Ch,0FDh,0AFh,   0,0E7h,   0, 55h, 53h, 45h,0FEh, 41h,   0,0CAh
                    db 0FEh,0E6h,   0,0F9h,   0,0F8h, 5Ch,0FFh
txtSecrPassage:     db    3,0D1h,   0,0B2h,0A2h,0FEh, 53h, 45h, 43h, 52h, 45h, 54h,   0, 53h, 55h, 42h
                    db 0F7h,   0,0ABh,0FEh,0CEh,   0, 53h, 4Fh, 55h, 54h, 48h, 45h, 41h, 53h, 54h,   0
                    db 0F5h, 53h,   0,0AFh,0FEh,0E6h,   0, 4Eh, 4Fh, 5Ch, 31h,   0,0C5h, 5Ch,0FEh,0A2h
                    db 0ADh,0FFh
txtComeIn:          db    0, 43h, 4Fh, 4Dh, 45h,   0, 49h, 4Eh,0FFh

txtHelpMe:          db    0, 48h, 45h, 4Ch, 50h,   0, 4Dh, 45h,0FFh

txtImElen:          db  11h, 54h, 48h, 41h, 4Eh, 4Bh,   0,0AFh, 5Ch,0FDh, 49h, 97h, 4Dh,   0,0CEh,   0
                    db  44h, 41h, 55h, 47h, 48h, 54h, 45h, 52h,   0, 4Fh, 46h,0FEh,0C4h, 5Fh,0FEh,0C9h
                    db  5Ch,0FDh, 4Dh, 59h,   0, 46h, 41h, 54h, 48h, 45h, 52h,   0, 57h, 41h, 53h,0FEh
                    db 0F2h, 43h, 45h, 44h,   0,0E6h,   0, 44h, 45h, 56h, 45h, 4Ch, 4Fh, 50h,0FEh,0A7h
                    db  5Ch,0FDh,0D5h,   0, 48h, 45h, 4Ch, 50h,0FEh, 4Dh, 59h,   0, 46h, 41h, 54h, 48h
                    db  45h, 52h,0FEh, 55h, 52h, 47h, 45h, 4Eh, 54h, 4Ch, 59h, 5Ch,0FFh

txtUseAntidote:     db    3,0DCh,   0,0D1h,   0,0D7h,0A2h,0FEh, 41h, 4Eh,   0, 41h, 4Eh, 54h, 49h, 44h
                    db  4Fh, 54h, 45h,   0, 49h, 53h,   0, 47h, 4Fh, 4Fh, 44h,   0,0F2h,0FEh,0CEh,   0
                    db  50h, 4Fh, 49h, 53h, 4Fh, 4Eh,   0, 4Fh, 46h,0FEh, 41h,   0, 53h, 43h, 4Fh, 52h
                    db  50h, 49h, 4Fh, 4Eh, 5Ch,0FEh,0A2h,0DDh,0FFh

txtRescued:         db    0,0B6h,0FFh

txtGoLeftDoor:      db    3,0D1h,   0,0A1h,0A2h,0FEh, 45h, 4Eh, 54h, 45h, 52h,   0,0CEh,   0, 4Ch, 45h
                    db  46h, 54h,   0,0DBh, 5Ch,0FEh,0A2h,0ADh,0FFh

txtRightLorry:      db    3,0D1h,   0,0A1h,0A2h,0FEh, 43h, 52h, 45h, 45h, 50h,   0, 49h, 4Eh,0E6h,   0
                    db 0CEh,   0,0EFh,0FEh,0E2h,   0,0CEh,   0, 52h, 49h, 47h, 48h, 54h,   0, 53h, 49h
                    db  44h, 45h, 5Ch,0FEh,0A2h,0ADh,0FFh

txtDestroyWall:     db    3,0D1h,   0,0C8h,0A2h,0FEh,0AFh,   0,0E7h,   0,0FBh,   0, 44h, 4Fh, 57h, 4Eh
                    db 0FEh,0CEh,   0,0E8h, 5Ch,0FEh,0A2h,0ADh,0FFh

txtOxygenLoc:       db    3,0D1h,   0,0C8h,0A2h,0FEh,0ECh,   0, 49h, 53h,   0, 41h, 4Eh,   0, 4Fh, 58h
                    db  59h, 47h, 45h, 4Eh,0FEh, 43h, 59h, 4Ch, 49h, 4Eh, 44h, 45h, 52h,   0,0E3h, 59h
                    db  4Fh, 4Eh, 44h,0FEh,0CEh,   0,0E8h, 5Ch,0FEh,0A2h,0ADh,0FFh

txtSwitchOffMSX:    db  13h,0D1h,   0,0A1h,0A2h,0FEh,0CBh, 3Dh,0FEh, 53h, 54h, 4Fh, 50h,   0,0CEh,   0
                    db  4Fh, 50h, 45h, 52h, 41h, 54h, 49h, 4Fh, 4Eh, 5Ch,0FEh, 53h, 57h, 49h, 54h, 43h
                    db  48h,   0, 4Fh, 46h, 46h,   0,0AFh, 52h,   0, 4Dh, 53h, 58h,0FEh, 41h, 54h,   0
                    db 0E2h, 43h, 45h, 5Ch,0FDh,0D1h,   0,0CEh,   0, 43h, 4Fh, 4Dh, 4Dh, 41h, 4Eh, 44h
                    db  5Ch,0FEh,0A2h,0ADh,0FFh

txtCardLoc:         db  13h,0D1h,   0,0C8h,0A2h,0FEh, 41h,   0,0D4h,   0, 57h, 48h, 49h, 43h, 48h,   0
                    db  4Fh, 50h, 45h, 4Eh,0FEh,0CEh,   0, 4Eh, 45h, 58h, 54h,   0,0DBh,   0, 4Ch, 49h
                    db  45h, 53h,   0, 49h, 4Eh,0FEh,0CEh,   0, 45h, 41h, 53h, 54h,   0, 4Fh, 46h,   0
                    db 0C5h,   0, 33h, 5Ch,0FDh,0CEh,   0, 45h, 41h, 53h, 54h, 45h, 52h, 4Eh,   0, 53h
                    db  49h, 44h, 45h,   0,0F5h, 53h,0FEh,0E6h,   0,0CEh,   0, 44h, 49h, 54h, 43h, 48h
                    db 0FEh, 4Fh, 46h,   0,0C5h,   0, 32h, 5Ch,0FEh,0A2h,0ADh,0FFh

txtBossRevealed:    db  13h,0D1h,   0,0B2h,0A2h,0FEh, 49h,   0,0BCh,   0, 44h, 49h, 53h, 43h, 4Fh, 56h
                    db  45h, 52h, 45h, 44h,0FEh, 57h, 48h, 4Fh,   0,0CEh,   0, 42h, 4Fh, 53h, 53h,   0
                    db  4Fh, 46h,0FEh,0A4h,   0, 49h, 53h, 5Ch,0FDh,0CEh,   0, 42h, 4Fh, 53h, 53h,   0
                    db  49h, 53h, 5Ch,0A2h,0FDh, 4Fh, 48h,   0, 4Eh, 4Fh, 3Eh,0FEh, 57h, 48h, 41h, 5Ch
                    db  41h, 5Ch,0A2h,0A2h,0FFh

txtCowardDuck:      db    1, 49h, 97h, 4Dh,   0, 43h, 4Fh, 57h, 41h, 52h, 44h,   0, 44h, 55h, 43h, 4Bh
                    db  3Dh,0FDh,0AFh,   0,0E1h, 97h, 54h,0FDh, 53h, 48h, 4Fh, 4Fh, 54h,   0, 4Dh, 45h
                    db  5Fh,0FDh,0E1h,   0,0AFh, 5Bh,0FFh

;RESCUED!*I'M A BROTHER OF*JENNIFER.*CLIMB THE LEFT*LADDER*WHEN ESCAPING.
txtClimbLeftLadder: db  11h,0B6h, 3Dh,0FDh, 49h, 97h, 4Dh,   0, 41h,   0, 42h, 52h, 4Fh, 54h, 48h, 45h
                    db  52h,   0, 4Fh, 46h,0FDh,0C8h, 5Ch,0FDh, 43h, 4Ch, 49h, 4Dh, 42h,   0,0CEh,   0
                    db  4Ch, 45h, 46h, 54h,0FDh, 4Ch, 41h, 44h, 44h, 45h, 52h,0FDh, 57h, 48h, 45h, 4Eh
                    db    0, 45h, 53h, 43h, 41h, 50h, 49h, 4Eh, 47h, 5Ch,0FFh

txtUseHandGun:      db  13h,0DCh,   0,0D1h,   0,0D7h,0A2h,0FDh, 55h, 53h, 45h,   0,0CEh,   0, 48h, 41h
                    db  4Eh, 44h,   0, 47h, 55h, 4Eh,   0,0E6h,0FEh,0B0h,   0,0CEh,   0, 50h, 52h, 49h
                    db  53h, 4Fh, 4Eh, 45h, 52h, 53h, 5Fh,0FEh,0E5h,   0,0E6h,   0,0F9h,   0, 54h, 48h
                    db  45h, 4Dh, 5Ch,0FEh,0A2h,0DDh,0FFh

txtDuckCard8:       db  13h,0D1h,   0,0C8h,0A2h,0FEh, 43h, 4Fh, 57h, 41h, 52h, 44h,   0, 44h, 55h, 43h
                    db  4Bh,   0, 48h, 41h, 53h,   0,0D4h,   0, 38h, 5Ch,0FDh, 4Dh, 59h,   0, 42h, 52h
                    db  4Fh, 54h, 48h, 45h, 52h,   0, 49h, 53h,   0, 41h, 4Dh, 4Fh, 4Eh, 47h,0FEh,0CEh
                    db    0, 43h, 41h, 50h, 54h, 49h, 56h, 45h, 53h, 5Ch,0FEh,0D5h,   0, 44h, 4Fh, 4Eh
                    db  97h, 54h,   0,0F9h,   0, 54h, 48h, 45h, 4Dh, 5Ch,0FEh,0A2h,0ADh,0FFh
txtBigBossIdBad:    db  11h,0B6h, 3Dh,0FDh, 42h, 4Fh, 53h, 53h,   0, 4Fh, 46h,0FEh,0A4h,   0, 49h, 53h
                    db 0FEh,0A1h, 5Fh,0FDh, 47h, 45h, 4Eh, 45h, 52h, 41h, 4Ch,   0, 43h, 4Fh, 4Dh, 4Dh
                    db  41h, 4Eh, 44h, 41h, 4Eh, 54h,0FEh, 4Fh, 46h,   0,0B7h, 5Ch,0FDh, 45h, 56h, 45h
                    db  52h, 59h, 54h, 48h, 49h, 4Eh, 47h,   0, 49h, 53h,   0, 44h, 4Fh, 4Eh, 45h,0FEh
                    db 0EBh,   0, 48h, 49h, 4Dh, 5Ch,0FFh
txtRunFast:         db    3,0D1h,   0,0C8h,0A2h,0FEh,0AFh,   0,0C2h,   0, 52h, 55h, 4Eh,   0, 46h, 41h
                    db  53h, 54h, 5Ch,0FEh,0A2h,0ADh,0FFh
txtBigBossConf:     db  11h,0CBh, 3Dh,0FEh,0AFh, 97h, 56h, 45h,   0, 46h, 49h, 4Eh, 41h, 4Ch, 4Ch, 59h
                    db 0FEh, 43h, 4Fh, 4Dh, 45h,   0,0F4h, 5Ch,0FDh, 59h, 45h, 41h, 48h, 5Fh, 49h, 97h
                    db  4Dh,   0,0A1h,0FEh, 47h, 45h, 4Eh, 45h, 52h, 41h, 4Ch,   0, 43h, 4Fh, 4Dh, 4Dh
                    db  41h, 4Eh, 44h, 41h, 4Eh, 54h,0FEh, 4Fh, 46h,   0,0B7h, 5Ch,0FDh,0DAh,   0, 49h
                    db  4Eh,   0, 43h, 48h, 41h, 52h, 47h, 45h,   0, 4Fh, 46h,0FEh, 54h, 48h, 49h, 53h
                    db    0,0FAh, 5Fh,0FEh,0A4h, 5Ch,0FDh, 49h,   0, 47h, 41h, 56h, 45h,   0,0AFh,0FEh
                    db  49h, 4Eh, 53h, 54h, 52h, 55h, 43h, 54h, 49h, 4Fh, 4Eh, 53h,0FEh,0E6h,   0, 42h
                    db  52h, 49h, 4Eh, 47h,   0, 42h, 41h, 43h, 4Bh,0FDh, 46h, 41h, 4Ch, 53h, 45h,   0
                    db  49h, 4Eh,0F2h, 4Dh, 41h, 54h, 49h, 4Fh, 4Eh,0FEh, 4Fh, 46h,   0,0A7h, 5Ch,0FDh
                    db  48h, 4Fh, 57h, 45h, 56h, 45h, 52h, 5Fh,0FEh,0AFh,   0, 41h, 43h, 43h, 4Fh, 4Dh
                    db  50h, 4Ch, 49h, 53h, 48h, 45h, 44h,0FEh,0E6h, 4Fh,   0, 4Dh, 55h, 43h, 48h, 5Ch
                    db 0FDh,0AFh,   0,0BCh,0FEh,0D0h, 4Ch, 59h,   0, 53h, 4Dh, 41h, 53h, 48h, 45h, 44h
                    db 0FEh, 4Dh, 59h,   0, 41h, 4Dh, 42h, 49h, 54h, 49h, 4Fh, 4Eh, 53h, 5Ch,0FDh,0CBh
                    db  3Eh,0FDh, 49h,   0,0C1h,   0,0E5h,0FEh, 44h, 49h, 45h,   0, 41h, 4Ch, 4Fh, 4Eh
                    db  45h, 5Ch,0FDh,0AFh,   0,0C1h,   0, 4Ah, 4Fh, 49h, 4Eh,   0, 4Dh, 45h, 5Ch,0FFh
txtUseCigarette:    db  13h,0D1h,   0,0C8h,0A2h,0FEh,0AFh,   0,0E1h,   0, 45h, 58h, 54h, 45h, 4Eh, 44h
                    db    0,0CEh,   0, 54h, 49h, 4Dh, 45h,0FEh, 4Ch, 49h, 4Dh, 49h, 54h,   0,0EBh,   0
                    db  55h, 53h, 49h, 4Eh, 47h,0FEh, 41h,   0, 43h, 49h, 47h, 41h, 52h, 45h, 54h, 54h
                    db  45h, 5Ch,0FDh,0D5h,   0, 52h, 45h, 54h, 55h, 52h, 4Eh,   0, 49h, 4Eh,0FEh, 53h
                    db  41h, 46h, 45h, 54h, 59h, 5Fh,0FEh,0CBh, 3Dh,0FFh
txtUpToYou:         db  13h,0D1h,   0,0D7h,0A2h,0FEh, 49h,   0, 44h, 4Fh, 4Eh, 97h, 54h,   0, 4Bh, 4Eh
                    db  4Fh, 57h,   0, 48h, 4Fh, 57h,   0,0E6h,0FEh,0E9h,   0,0A1h, 5Ch,0FEh, 49h, 54h
                    db    0, 41h, 4Ch, 4Ch,   0, 44h, 45h, 50h, 45h, 4Eh, 44h, 53h,   0,0E2h,   0,0AFh
                    db  5Ch,0FEh,0CBh, 3Dh,0FDh, 49h,   0, 4Ch, 4Fh, 56h, 45h,0A2h, 5Ch,0FEh, 4Eh, 4Fh
                    db  5Fh, 49h, 54h,   0, 57h, 41h, 53h,0FEh, 41h,   0, 4Dh, 45h, 52h, 45h,   0, 4Eh
                    db  4Fh, 54h, 48h, 49h, 4Eh, 47h, 3Dh,0FEh, 47h, 4Fh, 4Fh, 44h,   0, 4Ch, 55h, 43h
                    db  4Bh, 3Eh,0FFh

; EMERGENCY!!*EMERGENCY!!*THE SELF-DESTRUCTION SWITCH OF* OUTER HEAVEN HAS BEEN ACTIVATED.*ESCAPE QUICKLY!!
txtEmergency:       db    1,0CCh, 3Eh,0FDh,0CCh, 3Eh,0FDh,0CEh,0FEh, 53h, 45h, 4Ch, 46h, 40h,0CDh,0FEh
                    db  53h, 57h, 49h, 54h, 43h, 48h,   0, 4Fh, 46h,0FDh,0A4h,   0, 48h, 41h, 53h,0FEh
                    db 0E3h, 45h, 4Eh,   0, 41h, 43h, 54h, 49h, 56h, 41h, 54h, 45h, 44h, 5Ch,0FDh, 45h
                    db  53h, 43h, 41h, 50h, 45h,   0, 51h, 55h, 49h, 43h, 4Bh, 4Ch, 59h, 3Eh,0FFh
txtN313End:         db  13h,0D1h,   0,0CBh,0A2h,0FEh,0A7h, 97h, 53h,0FEh,0CDh,   0, 49h, 53h,0FEh, 41h
                    db    0, 53h, 55h, 43h, 43h, 45h, 53h, 53h, 5Ch,0FDh, 4Fh, 50h, 45h, 52h, 41h, 54h
                    db  49h, 4Fh, 4Eh,   0,   0,0A3h,   0, 4Eh, 33h, 31h, 33h,0FEh, 46h, 49h, 4Eh, 49h
                    db  53h, 48h, 45h, 44h, 3Dh,0A2h,0FDh, 45h, 56h, 45h, 52h, 59h, 54h, 48h, 49h, 4Eh
                    db  47h,   0, 49h, 53h,   0, 46h, 49h, 4Eh, 49h, 53h, 48h, 45h, 44h, 5Ch,0FDh, 49h
                    db    0,0C1h,   0, 47h, 4Fh,   0, 42h, 41h, 43h, 4Bh,   0,0ACh, 5Ch,0FEh,0A2h,0ADh
                    db 0FFh

; HELLO THIS IS DIANE... I SUPPOSE THEY HAVE A SILENCER. ...BYE
txtTheyHaveSil:     db    3,0DCh,   0,0D1h,   0,0D7h,0A2h,0FEh, 49h,   0, 53h, 55h, 50h, 50h, 4Fh, 53h
                    db  45h,   0, 54h, 48h, 45h, 59h,   0,0BCh,0FEh, 41h,   0, 53h, 49h, 4Ch, 45h, 4Eh
                    db  43h, 45h, 52h, 5Ch,0FEh,0A2h,0DDh,0FFh

txtEmpty:           db 0FFh


;----------------------------------------------------------------------------
;
; Dictionary index
;
;----------------------------------------------------------------------------
idxDictionary:	    dw dicBigBoss
		    dw dicPoints
		    dw dicIntruder
		    dw dicOutHeav
		    dw dicDestroy
		    dw dicUltimWeap
		    dw dicMetalGear
		    dw dicContact
		    dw dicGreyFox
		    dw dicSearchFor
		    dw dicFrom
		    dw dicNow
		    dw dicOver
		    dw dicMove
		    dw dicYou
		    dw dicCapture
		    dw dicResistance
		    dw dicMrSchneider
		    dw dicWaveBand
		    dw dicPutOn
		    dw dicLeader
		    dw dicRescued
		    dw dicFoxHound
		    dw dicEnemy
		    dw dicKeyFor
		    dw dicSelecting
		    dw dicCheck
		    dw dicHave
		    dw dicConfined
		    dw dicSecret
		    dw dicSolitary
		    dw dicCell
		    dw dicWill
		    dw dicMust
		    dw dicOnly
		    dw dicDrPettrovic
		    dw dicBuilding
		    dw dicBasement
		    dw dicFloor
		    dw dicJennifer
		    dw dicEllen
		    dw dicRocketLaunch
		    dw dicSolidSnake
		    dw dicEmergency
		    dw dicDestruction
		    dw dicThe
		    dw dicCourtyard
		    dw dicComplete
		    dw dicThisIs
		    dw dicWeapon
		    dw dicEquipment
		    dw dicCard
		    dw dicPlease
		    dw dicBand
		    dw dicDiane
		    dw dicGain
		    dw dicWith
		    dw dicAnd
		    dw dicDoor
		    dw dicHello
		    dw dicBye
		    dw dicMachGunKid
		    dw dicRemoteCtrl
		    dw dicMissile
		    dw dicCan
		    dw dicOn
		    dw dicBe
		    dw dicAvailable
		    dw dicNot
		    dw dicTo
		    dw dicShould
		    dw dicWall
		    dw dicDefeat
		    dw dicNever
		    dw dicBy
		    dw dicThere
		    dw dicOpen
		    dw dicTake
		    dw dicLorry
		    dw dicGas
		    dw dicAccess
		    dw dicFor
		    dw dicBombBlastS
		    dw dicHere
		    dw dicLead
		    dw dicRoom
		    dw dicWay
		    dw dicMrArnold
		    dw dicKill
		    dw dicFortress
		    dw dicBreak
		    dw dicTransceiver

;----------------------------------------------------------------------------
;
; Dictionary entries
;
;----------------------------------------------------------------------------
dicBigBoss:	    db	"BIG",   0, "BOSS",0FFh
dicPoints:	    db	#5c, #5c, #5c,0FFh
dicIntruder:	    db	"INTRUDE",0FFh
dicOutHeav:	    db	"OUTER",   0, "HEAVEN",0FFh
dicDestroy:	    db	"DESTOROY",0FFh
dicUltimWeap:	    db	"THE",   0, "ULTIMATE",   0, "WEAPON",0FFh
dicMetalGear:	    db	"METAL",   0, "GEAR",0FFh
dicContact:	    db	"CONTACT",0FFh
dicGreyFox:	    db	"GREY",   0, "FOX",0FFh
dicSearchFor:	    db	"SEARCH",   0, "FOR",0FFh
dicFrom:	    db	"FROM",0FFh
dicNow:		    db	"NOW",0FFh
dicOver:	    db	"OVER",0FFh
dicMove:	    db	"MOVE",0FFh
dicYou:		    db	"YOU",0FFh
dicCapture:	    db	"CAPTURE",0FFh
dicResistance:	    db	"RESISTANCE",0FFh
dicMrSchneider:	    db	"MR",#5C,"SCHNEIDER",0FFh
dicWaveBand:	    db	"WAVEBAND",0FFh
dicPutOn:	    db	"PUT",   0, "ON",0FFh
dicLeader:	    db	"LEADER",0FFh
dicRescued:	    db	"RESCUED",0FFh
dicFoxHound:	    db	"FOX",   0, "HOUND",0FFh
dicEnemy:	    db	"ENEMY",0FFh
dicKeyFor:	    db	"KEY",   0, "FOR",0FFh
dicSelecting:	    db	"SELECTING",0FFh
dicCheck:	    db	"CHECK",0FFh
dicHave:	    db	"HAVE",0FFh
dicConfined:	    db	"CONFINED",0FFh
dicSecret:	    db	"SECRET",0FFh
dicSolitary:	    db	"SOLITARY",0FFh
dicCell:	    db	"CELL",0FFh
dicWill:	    db	"WILL",0FFh
dicMust:	    db	"MUST",0FFh
dicOnly:	    db	"ONLY",0FFh
dicDrPettrovic:	    db	"DR",#5C,"PETTROVICH",0FFh
dicBuilding:	    db	"BUILDING",0FFh
dicBasement:	    db	"BASEMENT",0FFh
dicFloor:	    db	"FLOOR",0FFh
dicJennifer:	    db	"JENNIFER",0FFh
dicEllen:	    db	"ELLEN",0FFh
dicRocketLaunch:    db	"ROCKET",   0, "LAUNCHER",0FFh
dicSolidSnake:	    db	"SOLID",   0, "SNAKE",0FFh
dicEmergency:	    db	"EMERGENCY",0FFh
dicDestruction:	    db	"DESTRUCTION",0FFh
dicThe:		    db	"THE",0FFh
dicCourtyard:	    db	"COURTYARD",0FFh
dicComplete:	    db	"COMPLETE",0FFh
dicThisIs:	    db	"THIS",   0, "IS",0FFh
dicWeapon:	    db	"WEAPON",0FFh
dicEquipment:	    db	"EQUIPMENTS",0FFh
dicCard:	    db	"CARD",0FFh
dicPlease:	    db	"PLEASE",0FFh
dicBand:	    db	"BAND",0FFh
dicDiane:	    db	"DIANE",0FFh
dicGain:	    db	"GAIN",0FFh
dicWith:	    db	"WITH",0FFh
dicAnd:		    db	"AND",0FFh
dicDoor:	    db	"DOOR",0FFh
dicHello:	    db	"HELLO=",0FFh
dicBye:		    db	"BYE",0FFh
dicMachGunKid:	    db	"MACHINE",   0, "GUN",   0, "KID",0FFh
dicRemoteCtrl:	    db	"REMOTE@CONTROL",0FFh
dicMissile:	    db	"MISSILE",0FFh
dicCan:		    db	"CAN",0FFh
dicOn:		    db	"ON",0FFh
dicBe:		    db	"BE",0FFh
dicAvailable:	    db	"AVAILABLE",0FFh
dicNot:		    db	"NOT",0FFh
dicTo:		    db	"TO",0FFh
dicShould:	    db	"SHOULD",0FFh
dicWall:	    db	"WALL",0FFh
dicDefeat:	    db	"DEFEAT",0FFh
dicNever:	    db	"NEVER",0FFh
dicBy:		    db	"BY",0FFh
dicThere:	    db	"THERE",0FFh
dicOpen:	    db	"OPEN",0FFh
dicTake:	    db	"TAKE",0FFh
dicLorry:	    db	"LORRY",0FFh
dicGas:		    db	"GAS",0FFh
dicAccess:	    db	"ACCESS",0FFh
dicFor:		    db	"FOR",0FFh
dicBombBlastS:	    db	"BOMB",   0, "BLAST",   0, "SUIT",0FFh
dicHere:	    db	"HERE",0FFh
dicLead:	    db	"LEAD",0FFh
dicRoom:	    db	"ROOM",0FFh
dicWay:		    db	"WAY",0FFh
dicMrArnold:	    db	"MR",#5C,"ARNOLD",0FFh
dicKill:	    db	"KILL",0FFh
dicFortress:	    db	"FORTRESS",0FFh
dicBreak:	    db	"BREAK",0FFh
dicTransceiver:	    db	"TRANSCEIVER",0FFh