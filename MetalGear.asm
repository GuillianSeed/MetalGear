;----------------------------------------------------------------------------
;
; Metal	Gear (RC750)
;
; Copyright Konami 1987
;
;----------------------------------------------------------------------------
;
; Main Program:
;	Hiroyuki Fukui
;
; Sub Program:
;	Tomoori Ostuka
;	Koji Toyohara
;
; Graphic Design:
;	Masami Tabata
;	Azusa Fujimoto
;
; Main Sound Effect:
;	Iku Mizutani
;
; Subsound Effect:
;	Shigehiro Takenouchi
;	Motoaki Furukawa
;
; Game Design:
;	Hideo Kojima
;
;----------------------------------------------------------------------------
;
; Disassembled by Manuel Pazos 2017
; @ManuelPazosMSX
;
;----------------------------------------------------------------------------


JAPANESE	equ	0	; 1 = Japanese version, 0 = English version

;----------------------------------------------------------------------------
;
; Includes
;
;----------------------------------------------------------------------------

		include	"constants/Bios.asm"
		include	"constants/SystemVariables.asm"
		include	"constants/Structures.asm"
		include	"constants/Enums.asm"
		include	"Variables.asm"


;----------------------------------------------------------------------------
;
; Banks
;
;----------------------------------------------------------------------------
		
		include	"Banks0123.asm"
		include	"Banks456.asm"
		include	"Banks789.asm"
		include	"BanksABC.asm"
		include	"BanksDEF.asm"
		
		end