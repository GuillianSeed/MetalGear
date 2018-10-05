;----------------------------------------------------------------------------
;
; Init Big Boss
;
;----------------------------------------------------------------------------

InitBigBoss:
		    ld	    hl,	BigBossStat		    ; 0=Dead, 1=Confession dialog
		    bit	    0, (hl)
		    jp	    nz,	DismissActor		    ; Remove actor is defeated

		    ld	    (ix+BIG_BOSS.Wait),	2	    ; Two iterations delay to refresh the sprites

		    call    ResetActorSpeed

		    ld	    (ix+BIG_BOSS.Direction), DIR_RIGHT ; 1=Up, 2=Down, 3=Left, 4=Right
		    jr	    BigBossSetSpr_



;----------------------------------------------------------------------------
;
; Big Boss logic
;
;----------------------------------------------------------------------------

BigBossLogic:
		    ld	    a, (ix+BIG_BOSS.Status)
		    call    JumpIndex

		    dw BigBossSpeech
		    dw BigBossThink
		    dw BigBossRun
		    dw BigBossShowUp			    ; Shows up to shoot
		    dw BB_Shoot
		    dw BigBossCover


;----------------------------------------------------------------------------
;
; Big Boss speech
;
;----------------------------------------------------------------------------

BigBossSpeech:
		    dec	    (ix+BIG_BOSS.Wait)
		    ret	    nz				    ; Delay to refresh sprites before the speech

		    ld	    (ix+BIG_BOSS.Status), 1	    ; Status think next	movement
		    call    SetRandomWait1_20

		    ld	    hl,	BigBossStat		    ; 0=Dead, 1=Confession dialog
		    bit	    1, (hl)			    ; Speech done?
		    ret	    nz				    ; Yes, no need to say it again

		    set	    1, (hl)			    ; Set speech flag

		    ld	    a, 147			    ; Big Boss confession
		    jp	    SetTextUnskip2


;----------------------------------------------------------------------------
;
; Big Boss thinks next action: shoot or	move
;
;----------------------------------------------------------------------------

BigBossThink:
		    call    BBChkPlayerNear		    ; Checks if	Big Boss is near the player
		    jr	    c, BigBossSetRunAway	    ; Yes, run away

		    call    BBChkShoot			    ; Check if Big Boss	is covered in the same row/column of crates as the player
		    jr	    nc,	BBSetMovToPlayer

		    dec	    (ix+BIG_BOSS.Wait)
		    ret	    nz				    ; Wait before showing up to	shoot

		    ld	    (ix+BIG_BOSS.Status), 3	    ; Status show up and shoot
		    ld	    (ix+BIG_BOSS.Moving), 1	    ; Enable movement
		    ld	    (ix+BIG_BOSS.Wait),	5

		    call    BBSetDirToPlayer		    ; Sets the direction to move towards the player

		    jr	    BigBossSetSpr_


BigBossSetRunAway:
		    ld	    (ix+BIG_BOSS.Status), 2
		    ld	    (ix+BIG_BOSS.Moving), 1	    ; 0=Does not move
		    call    BigBossCalcAway		    ; Sets the direction and speed to run away from the	player

BigBossSetSpr_:
		    jr	    BigBossSetSpr		    ; Animate and update the sprite


;----------------------------------------------------------------------------
;
; Decide to move towards the player
;
;----------------------------------------------------------------------------

BBSetMovToPlayer:
		    ld	    (ix+BIG_BOSS.Status), 2	    ; Status run
		    ld	    (ix+BIG_BOSS.Moving), 1	    ; Enable movement
		    ld	    (ix+BIG_BOSS.Dummy), 2	    ; (!?) Not used

		    call    BBSetDirToPlayer		    ; Sets the direction to move towards the player

		    jr	    BigBossSetSpr		    ; Animate and update the sprite



;----------------------------------------------------------------------------
;
; Big Boss runs
;
;----------------------------------------------------------------------------

BigBossRun:
		    call    BigBossSetSpr		    ; Animate and update the sprite

		    call    BBChkTurnCorner		    ; Decide the direction when	turning	at a corner

		    call    BBChkCovered		    ; Is Big Boss behind a crate?
		    ret	    nz

		    call    BBChkPlayerNear		    ; Is too near the player?
		    jr	    c, BigBossSetRunAway	    ; Yes, run away

		    call    BBChkShoot			    ; Check if Big Boss	is covered in the same row/column of crates as the player
		    ret	    nc

		    ld	    (ix+BIG_BOSS.Status), 1	    ; Status think next	action
		    ld	    (ix+BIG_BOSS.Moving), 0	    ; Stop moving
		    jr	    BBAimToPlayer		    ; Select direction to show up from the crate



;----------------------------------------------------------------------------
;
; Show up from a crate
;
;----------------------------------------------------------------------------

BigBossShowUp:
		    call    BigBossSetSpr		    ; Animate and update the sprite
		    dec	    (ix+BIG_BOSS.Wait)
		    ret	    nz				    ; Continue moving

		    ld	    (ix+BIG_BOSS.Status), 4	    ; Status shoot
		    ld	    (ix+BIG_BOSS.Moving), 0	    ; Stop moving
		    ld	    (ix+BIG_BOSS.Wait),	5
		    jr	    BBAimToPlayer		    ; Select direction towards the player



;----------------------------------------------------------------------------
;
; Big Boss shoots
;
;----------------------------------------------------------------------------

BB_Shoot:
		    dec	    (ix+BIG_BOSS.Wait)
		    ret	    nz				    ; wait before shooting

		    ld	    (ix+BIG_BOSS.Status), 5	    ; Status cover
		    ld	    (ix+BIG_BOSS.Moving), 1	    ; Enable movement

		    ld	    a, (ix+BIG_BOSS.Direction)	    ; 1=Up, 2=Down, 3=Left, 4=Right
		    call    GetOppositeDir
		    ld	    (ix+BIG_BOSS.Direction), a	    ; Select the direction to go back behind the crate

		    call    BigBossSetSpeed		    ; Update speed
		    call    BBChkUpDownCorridors	    ; Is Big Boss shooting vertically or horizontally?

		    ld	    c, ID_BULLET_HORIZ
		    jp	    nz,	AddEnemyShot2
		    inc	    c				    ; ID_BULLET_VERT

		    jp	    AddEnemyShot2


;----------------------------------------------------------------------------
;
; Big Boss takes cover
;
;----------------------------------------------------------------------------

BigBossCover:
		    call    BigBossSetSpr		    ; Animate and update the sprite
		    call    BBChkCovered
		    ret	    nz				    ; Not covered yet

		    ld	    (ix+BIG_BOSS.Status), 1	    ; Status think next	movement
		    ld	    (ix+BIG_BOSS.Moving), 0	    ; Stop moving

		    call    SetRandomWait1_20

		    jr	    BBAimToPlayer


;----------------------------------------------------------------------------
;
; Animate Big Boss
;
;----------------------------------------------------------------------------

BigBossSetSpr:
		    ld	    a, (ix+BIG_BOSS.Direction)	    ; Animate and update the sprite

BigBossSetSpr2:
		    add	    a, a
		    add	    a, 3Fh			    ; #41 Big Boss UP sprite ID	- (UP=1	* 2) = #3F
		    bit	    1, (ix+BIG_BOSS.ANIM_CNT)
		    jr	    nz,	BigBossSetSpr3
		    inc	    a

BigBossSetSpr3:
		    ld	    (ix+BIG_BOSS.SpriteId), a
		    ret


;----------------------------------------------------------------------------
;
; Set the Big Boss direction to	aim to the player
;
;----------------------------------------------------------------------------

BBAimToPlayer:
		    call    BBChkUpDownCorridors	    ; Checks if	Big Boss is in the upper or lower corridors

		    ld	    b, 2
		    jr	    z, BBAimToPlayer2

		    ld	    a, (ix+BIG_BOSS.X)
		    ld	    b, 4

BBAimToPlayer2:
		    rlca
		    and	    1
		    sub	    b
		    neg
		    jr	    BigBossSetSpr2


;----------------------------------------------------------------------------
;
; Set the direction to move away from the player
;
;----------------------------------------------------------------------------

BigBossCalcAway:
		    call    BBChkUpDownCorridors	    ; Sets the direction and speed to run away from the	player
		    jr	    nz,	BigBossCalcAway2

		    ld	    a, (PlayerX)
		    cp	    (ix+BIG_BOSS.X)

		    ld	    a, DIR_RIGHT
		    jr	    c, BigBossSetDir		    ; Set Big Boss direction and update	his speed according to it
		    dec	    a				    ; Left

;----------------------------------------------------------------------------
;
; Set the Big Boss direction and update	his speed according to it
;
;----------------------------------------------------------------------------

BigBossSetDir:
		    ld	    (ix+BIG_BOSS.Direction), a	    ; Set Big Boss direction and update	his speed according to it
		    ld	    a, (ix+BIG_BOSS.Direction)	    ; (!?)

BigBossSetSpeed:
		    call    SetWalkSpeedFast2
		    sla	    e
		    sla	    d				    ; Speed x 2
		    ld	    (ix+BIG_BOSS.SpeedY), e
		    ld	    (ix+BIG_BOSS.SpeedX), d
		    ret


BigBossCalcAway2:
		    ld	    a, (PlayerY)
		    cp	    (ix+BIG_BOSS.Y)

		    ld	    a, DIR_DOWN
		    jr	    c, BigBossSetDir		    ; Set Big Boss direction and update	his speed according to it
		    dec	    a				    ; Up

		    jr	    BigBossSetDir		    ; Set Big Boss direction and update	his speed according to it



;----------------------------------------------------------------------------
;
; Select the direction to move towards the player
;
;----------------------------------------------------------------------------

BBSetDirToPlayer:
		    call    BBChkUpDownCorridors	    ; Sets the direction to move towards the player
		    jr	    nz,	BBCalcShowUpDir2

		    ld	    a, (PlayerX)
		    cp	    (ix+BIG_BOSS.X)

		    ld	    a, DIR_LEFT
		    jr	    c, BigBossSetDir		    ; Set Big Boss direction and update	his speed according to it
		    inc	    a				    ; Right
		    jr	    BigBossSetDir		    ; Set Big Boss direction and update	his speed according to it


BBCalcShowUpDir2:
		    ld	    a, (PlayerY)
		    cp	    (ix+BIG_BOSS.Y)

		    ld	    a, DIR_UP
		    jr	    c, BigBossSetDir		    ; Set Big Boss direction and update	his speed according to it
		    inc	    a				    ; Down

		    jr	    BigBossSetDir		    ; Set Big Boss direction and update	his speed according to it



;----------------------------------------------------------------------------
;
; Decide the direction at a corner
;
;----------------------------------------------------------------------------

BBChkTurnCorner:
		    call    BigBossChkSpeedY		    ; Is he moving in the Y axis?
		    jr	    nz,	BBChkTurnCorner3	    ; Yes

		    ld	    a, (ix+BIG_BOSS.X)
		    cp	    24				    ; X	Left corridor
		    jr	    z, BBChkTurnCorner2

		    cp	    200				    ; X	Right corridor
		    ret	    nz

BBChkTurnCorner2:
		    bit	    7, (ix+BIG_BOSS.Y)		    ; Moving up	or down?

		    ld	    a, DIR_DOWN			    ; Down
		    jr	    z, BigBossSetDir		    ; Set Big Boss direction and update	his speed according to it
		    dec	    a				    ; Up

		    jr	    BigBossSetDir		    ; Set Big Boss direction and update	his speed according to it


BBChkTurnCorner3:
		    ld	    a, (ix+BIG_BOSS.Y)
		    cp	    56
		    jr	    z, BBChkTurnCorner4

		    cp	    168
		    ret	    nz

BBChkTurnCorner4:
		    bit	    7, (ix+BIG_BOSS.X)

		    ld	    a, DIR_RIGHT
		    jr	    z, BigBossSetDir		    ; Set Big Boss direction and update	his speed according to it
		    dec	    a				    ; LEFT

		    jr	    BigBossSetDir		    ; Set Big Boss direction and update	his speed according to it


;----------------------------------------------------------------------------
;
; Sets a random	value (1-32) in	.Wait field
;
;----------------------------------------------------------------------------

SetRandomWait1_20:
		    ld	    a, r
		    xor	    (ix+BIG_BOSS.ANIM_CNT)
		    and	    1Fh
		    inc	    a
		    ld	    (ix+BIG_BOSS.Wait),	a
		    ret


;----------------------------------------------------------------------------
;
; Check	if Big Boss is in a safe place to shoot	from
;
;----------------------------------------------------------------------------

BBChkCovered:
		    call    BBChkUpDownCorridors	    ; Checks if	Big Boss is in the upper or lower corridors
		    jr	    z, BBChkCovered3

		    ld	    a, (ix+BIG_BOSS.Y)
		    cp	    58h
		    ret	    z

BBChkCovered2:
		    cp	    98h
		    ret


BBChkCovered3:
		    ld	    a, (ix+BIG_BOSS.X)
		    cp	    30h
		    ret	    z

		    cp	    70h
		    ret	    z

		    cp	    0B0h
		    ret


;----------------------------------------------------------------------------
;
; Check	if Big Boss is near the	player
;
;----------------------------------------------------------------------------

BBChkPlayerNear:
		    ld	    a, (PlayerX)
		    sub	    (ix+BIG_BOSS.X)
		    add	    a, 48h
		    cp	    91h
		    ret	    nc

		    ld	    a, (PlayerY)
		    sub	    (ix+BIG_BOSS.Y)
		    add	    a, 48h
		    cp	    91h
		    ret


;----------------------------------------------------------------------------
;
; Check	if Big Boss is in a good place to shoot
; Behind a crate in the	same row/column	as the player
;
;----------------------------------------------------------------------------

BBChkShoot:
		    call    BBChkUpDownCorridors	    ; Checks if	Big Boss is in the upper or lower corridors
		    jr	    nz,	CheckCrateColumn

; Check	row

		    ld	    a, (PlayerX)
		    sub	    (ix+BIG_BOSS.X)
		    jr	    CheckCrateSize


CheckCrateColumn:
		    ld	    a, (PlayerY)
		    sub	    (ix+BIG_BOSS.Y)

CheckCrateSize:
		    add	    a, 30h
		    cp	    61h
		    ret


;----------------------------------------------------------------------------
;
; Check	if Big Boss is in the upper or lower corridor
;
;----------------------------------------------------------------------------

BBChkUpDownCorridors:
		    ld	    a, (ix+BIG_BOSS.Y)		    ; Checks if	Big Boss is in the upper or lower corridors
		    cp	    56
		    ret	    z

		    cp	    168
		    ret



;----------------------------------------------------------------------------
;
; Check	if Big Boss is moving in the Y axis
;
;----------------------------------------------------------------------------

BigBossChkSpeedY:
		    ld	    a, (ix+BIG_BOSS.SpeedY)
		    or	    a
		    ret
