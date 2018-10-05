;----------------------------------------------------------------------------
;
; Index	of sfx and musics
;
;----------------------------------------------------------------------------
idxSoundData:	    dw Sfx_None
		    dw Sfx_Propeller			    ; 2	- Hind D propeller
		    dw Sfx_DogBark			    ; 3	- Sfx dog bark
		    dw Sfx_Laser			    ; 4	- Laser	shot
		    dw Sfx_BulletShot			    ; 5	- Sfx bullet shot
		    dw Sfx_Boomerang			    ; 6	- Sfx boomerang
		    dw Sfx_Pitfall			    ; 7	- Sfx pitfall open
		    dw Sfx_PunchGuard			    ; 8	- Punch	guard
		    dw Sfx_PunchWall			    ; 9	- Sfx punch wall
		    dw Sfx_PunchWallBrk			    ; A	- Sfx punch breakable wall
		    dw Sfx_ShellWhistle			    ; B	- Sfx tank shell whistle
		    dw Sfx_HandGunShot			    ; C	- Sfx hand gun shot
		    dw Sfx_SmgShot			    ; D	- Sfx Sub Machine Gun shot
		    dw Sfx_FireShotSup			    ; E	- Sfx fire shot	using suppressor
		    dw Sfx_ShotGunner			    ; F	- Sfx Shotgunner shot
		    dw Sfx_Damage			    ; 10 - Sfx damage
		    dw Sfx_RoofAir			    ; 11 - Sfx Snake pushed back by the	air
		    dw Sfx_GrenadeShot			    ; 12 - Sfx grenade throw
		    dw Sfx_ShellShot			    ; 13 - Sfx tank shell shot
		    dw Sfx_MissileShot			    ; 14 - Sfx missile launched
		    dw Sfx_Click			    ; 15 - Sfx no ammon	"click", power switch
		    dw Sfx_GuardDead			    ; 16 - Sfx guard dead
		    dw Sfx_PB_MineSet			    ; 17 - Sfx plastic bomb or mine set
		    dw Sfx_ElecDamage			    ; 18 - Electric floor damage
		    dw Sfx_Door				    ; 19 - Sfx Door
		    dw Sfx_Explosion			    ; 1A - Sfx explosion (grenade, rocket)
		    dw Sfx_DoorElevator			    ; 1B - Sfx elevator	door
		    dw Sfx_Explosion2			    ; 1C - Sfx plastic bomb or mine explosion
		    dw Sfx_BarrelHit			    ; 1D - Sfx rolling barrel hits the wall
		    dw Sfx_WallBroken			    ; 1E - Sfx wall broken
		    dw Sfx_LorryMoving			    ; 1F - Sfx lorry moving
		    dw Sfx_MenuMove			    ; 20 - Sfx moving cursor in	menu
		    dw Sfx_UseItem			    ; 21 - Sfx use item
		    dw Sfx_RadioCall			    ; 22 - Sfx incoming	call
		    dw Sfx_TextPrint			    ; 23 - SFX text
		    dw Sfx_PickItem			    ; 24 - Sfx pick item
		    dw Sfx_SpawnItem			    ; 25 - Spawn item
		    dw Sfx_RankUp			    ; 26 - Sfx rank up
		    dw Sfx_RankDown			    ; 27 - Sfx decrement rank
		    dw Sfx_Dummy			    ; 28 - Stop	sfx

		    dw Mus_IntroTara			    ; 29 - Intro Theme of Tara
		    dw Mus_IntroTaraB
		    dw Mus_IntroTaraC

		    dw Mus_ThemeTara			    ; 2C - Theme of Tara
		    dw Mus_ThemeTaraB
		    dw Mus_ThemeTaraC

		    dw Mus_RedAlert			    ; 2F - Red Alert music
		    dw Mus_RedAlertB
		    dw Mus_RedAlertC

		    dw Mus_Alert			    ; 32 - Alert music
		    dw Mus_AlertB
		    dw Mus_AlertC

		    dw Mus_Basement			    ; 35 - Sneaking mission
		    dw Mus_BasementB
		    dw Mus_BasementC

		    dw Mus_MetalGear			    ; 38 - TX55
		    dw Mus_MetalGearB
		    dw Mus_MetalGearC

		    dw Mus_Escape			    ; 3B - Beyond Big Boss
		    dw Mus_EscapeB
		    dw Mus_EscapeC

		    dw Mus_Boss				    ; 3E - Mercenary
		    dw Mus_BossB
		    dw Mus_BossC

		    dw Mus_Ending			    ; 41 - Return of Fox Hunder
		    dw Mus_EndingB
		    dw Mus_EndingC

		    dw Mus_GameOver			    ; 44 - Just	another	dead soldier
		    dw Mus_GameOverB
		    dw Mus_GameOverC

		    dw Sfx_MenuLogoUp			    ; 47 - Menu	logo moves up
		    dw Sfx_MenuLogoUpB
		    dw Sfx_MenuLogoUpC

		    dw Sfx_MenuLogoEnd			    ; 4A - Sfx menu logo stops
		    dw Sfx_MenuLogoEndB
		    dw Sfx_Dummy

		    dw Sfx_Pause			    ; 4D - Sfx pause
		    dw Sfx_PauseB
		    dw Sfx_PauseC

		    dw Sfx_RadioNoise			    ; 50 - Radio noise
		    dw Sfx_RadioNoiseB
		    dw Sfx_RadioNoiseC

		    dw Sfx_BigBossDead			    ; 53 - Big Boss dead
		    dw Sfx_BigBossDeadB
		    dw Sfx_None2

		    dw Sfx_None2			    ; 56 - Ending Explosion
		    dw Sfx_EndingExplox
		    dw Sfx_EndingExploxB

		    dw Sfx_Dummy			    ; 59 - Mute	music (Switch game mode)
		    dw Sfx_Dummy
		    dw Sfx_Dummy

		    dw Sfx_Dummy			    ; 5C - Mute	music and sfx (radio send)
		    dw Sfx_Dummy
		    dw Sfx_Dummy
		    dw Sfx_Dummy

;----------------------------------------------------------------------------
;
; SFXs
;
;----------------------------------------------------------------------------

	include	"sfx/SfxRadioNoise.asm"

	include	"sfx/SfxSpawnItem.asm"

	include	"sfx/SfxMenuLogo.asm"

	include	"sfx/SfxRank.asm"
	
	include	"sfx/SfxPropeller.asm"

Sfx_Dummy:	    db 0FFh

	include	"sfx/SfxDogBark.asm"

	include	"sfx/SfxBulletShot.asm"
	
	include	"sfx/SfxPitfall.asm"
	
	include	"sfx/SfxPunch.asm"
	
	include	"sfx/SfxShots.asm"
	
	include	"sfx/SfxClick.asm"
	
	include	"sfx/SfxGuardDead.asm"
	
	include	"sfx/SfxPBombMineSet.asm"
	
	include	"sfx/SfxExplosions.asm"
	
	include	"sfx/SfxPickUpItem.asm"
	
	include	"sfx/SfxElectricDamage.asm"
	
	include	"sfx/SfxDoors.asm"
	
	include	"sfx/SfxDamage.asm"
	
	include	"sfx/SfxRoofAir.asm"
	
	include	"sfx/SfxTextPrint.asm"
	
	include	"sfx/SfxWallBroken.asm"
	
	include	"sfx/SfxLorry.asm"
	
	include	"sfx/SfxMenuMove.asm"
	
	include	"sfx/SfxUseItem.asm"
	
	include	"sfx/SfxRadioCall.asm"
	
	include	"sfx/SfxShellWhistle.asm"
	
	include	"sfx/SfxBarrelHit.asm"

	include	"sfx/SfxLaser.asm"
	
	include	"sfx/SfxBoomerang.asm"

;----------------------------------------------------------------------------
;
; Musics
;
;----------------------------------------------------------------------------

	include	"music/ThemeOfTara.asm"
	
	include	"music/RedAlert.asm"
	
	include	"music/SneakingMission.asm"

	include	"music/BeyondBigBoss.asm"

	include	"music/MetalGearTX55.asm"

	include	"music/Mercenary.asm"

	include	"music/ReturnOfFoxHunder.asm"

	include	"music/AnotherDeadSoldier.asm"


;----------------------------------------------------------------------------
;
; More SFXs
;
;----------------------------------------------------------------------------

	include	"sfx/SfxPause.asm"

	include	"sfx/SfxBigBossDead.asm"

	include	"sfx/SfxEndingExplosion.asm"







