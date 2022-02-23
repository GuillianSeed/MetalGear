	
;-------------------------------------------------------------------------------
;
; BIOS
;
;-------------------------------------------------------------------------------


VDP_DR:		equ	#6				; Base port address	for VDP	data read
VDP_DW:		equ	#7				; Base port address	for VDP	data write
RDSLT:		equ	#c				; Reads the value of an address in another slot
CHRGTR:		equ	#10				; Gets the next character (or token) of the	Basic-text
WRSLT:		equ	#14				; Writes a value to	an address in another slot.
OUTDO:		equ	#18				; Output to	current	outputchannel (printer,	diskfile, etc.)
CALSLT:		equ	#1c				; Executes inter-slot call.
DCOMPR:		equ	#20				; Compares HL with DE
ENASLT:		equ	#24				; Switches indicated slot at indicated page	on perpetual
GETYPR:		equ	#28				; Returns Type of DAC
BASVER1:	equ	#2b				; Basic ROM	version	1
BASVER2:	equ	#2c				; Basic ROM	version	2
MSXVER:		equ	#2d				; MSX version number
MSXMID:		equ	#2e				; Bit 0: if	1 then MSX-MIDI	is present internally (MSX turbo R only)
CALLF:		equ	#30				; Executes an interslot call
KEYINT:		equ	#38				; Executes the timer interrupt process routine
INITIO:		equ	#3b				; Initialises the device
INIFNK:		equ	#3e				; Initialises the contents of the function keys
DISSCR:		equ	#41				; inhibits the screen display
ENASCR:		equ	#44				; displays the screen
WRTVDP:		equ	#47				; write data in the	VDP-register
RDVRM:		equ	#4a				; Reads the	content	of VRAM
WRTVRM:		equ	#4d				; Writes data in VRAM
SETRD:		equ	#50				; Enable VDP to read
SETWRT:		equ	#53				; Enable VDP to write
FILVRM:		equ	#56				; fill VRAM	with value
LDIRMV:		equ	#59				; Block transfer to	memory from VRAM
LDIRVM:		equ	#5c				; Block transfer to	VRAM from memory
CHGMOD:		equ	#5f				; Switches to given	screenmode
CHGCLR:		equ	#62				; Changes the screencolors
NMI:		equ	#66				; Executes (non-maskable interupt) handling	routine
CLRSPR:		equ	#69				; Initialises all sprites
INITXT:		equ	#6c				; Switches to SCREEN 0 (text screen 	with 40*24 characters)
INIT32:		equ	#6f				; Switches to SCREEN 1 (text screen	with 32*24 characters)
INIGRP:		equ	#72				; Switches to SCREEN 2 (high resolution screen with	256*192	pixels)
INIMLT:		equ	#75				; Switches to SCREEN 3 (multi-color	screen 64*48 pixels)
SETTXT:		equ	#78				; Switches VDP in SCREEN 0 modus
SETT32:		equ	#7b				; Switches VDP in SCREEN 1 modus
SETGRP:		equ	#7e				; Switches VDP to SCREEN 2 modus
SETMLT:		equ	#81				; Switches VDP to SCREEN 3 modus
CALPAT:		equ	#84				; Returns the address of the sprite	pattern	table
CALATR:		equ	#87				; Returns the address of the sprite	attribute table
GSPSIZ:		equ	#8a				; Returns current sprite size
GRPPRT:		equ	#8d				; Displays a character on the graphic screen
GICINI:		equ	#90				; Initialises PSG and sets initial value for the PLAY statement
WRTPSG:		equ	#93				; Writes data to PSG-register
RDPSG:		equ	#96				; Reads value from PSG-register
STRTMS:		equ	#99				; Tests whether the	PLAY statement is being	executed as a background
CHSNS:		equ	#9c				; Tests the	status of the keyboard buffer
CHGET:		equ	#9f				; One character input (waiting)
CHPUT:		equ	#a2				; Displays one character
LPTOUT:		equ	#a5				; Sends one	character to printer
LPTSTT:		equ	#a8				; Tests printer status
CNVCHR:		equ	#ab				; tests for	the graphic header and transforms the code
PINLIN:		equ	#ae				; Stores in	the specified buffer the character codes input until the return
INLIN:		equ	#b1				; Same as PINLIN except that AUGFLG	(#F6AA)	is set
QINLIN:		equ	#b4				; Prints a questionmark andone space
BREAKX:		equ	#b7				; Tests status of CTRL-STOP
ISCNTC:		equ	#ba				; Tests status of SHIFT-STOP
CKCNTC:		equ	#bd				; Same as ISCNTC. used in Basic
BEEP:		equ	#c0				; generates	beep
CLS:		equ	#c3				; Clears the screen
POSIT:		equ	#c6				; Plaatst cursor op	aangegeven positie
FNKSB:		equ	#c9				; Tests whether the	function key display is	active (FNKFLG)	If so, displays	them, otherwise	erase them
ERAFNK:		equ	#cc				; Erase functionkey	display
DSPFNK:		equ	#cf				; Displays the function keys
TOTEXT:		equ	#d2				; Forces the screen	to be in the text mode
GTSTCK:		equ	#d5				; Returns the joystick status
GTTRIG:		equ	#d8				; Returns current trigger status
GTPAD:		equ	#db				; Returns current touch pad	status
GTPDL:		equ	#de				; Returns currenct value of	paddle
TAPION:		equ	#e1				; Reads the	header block after turning the cassette	motor on
TAPIN:		equ	#e4				; Read data	from the tape
TAPIOF:		equ	#e7				; Stops reading from the tape
TAPOON:		equ	#ea				; Turns on the cassette motor and writes the header
TAPOUT:		equ	#ed				; Writes data on the tape
TAPOOF:		equ	#f0				; Stops writing on the tape
STMOTR:		equ	#f3				; Sets the cassette	motor action
LFTQ:		equ	#f6				; Gives number of bytes in queue
PUTQ:		equ	#f9				; Put byte in queue
RIGHTC:		equ	#fc				; Shifts screenpixel to the	right
				    			; Shifts screenpixel to the	left
UPC:		equ	#102				; Shifts screenpixel up
TUPC:		equ	#105				; Tests whether UPC	is possible, if	possible, execute UPC
DOWNC:		equ	#108				; Shifts screenpixel down
TDOWNC:		equ	#10b				; Tests whether DOWNC is possible, if possible, execute DOWNC
SCALXY:		equ	#10e				; Scales X and Y coordinates
MAPXY:		equ	#111				; Places cursor at current cursor address
FETCHC:		equ	#114				; Gets current cursor addresses mask pattern
STOREC:		equ	#117				; Record current cursor addresses mask pattern
SETATR:		equ	#11a				; Set attribute byte
READC:		equ	#11d				; Reads attribute byte of current screenpixel
SETC:		equ	#120				; Returns currenct screenpixel of specificed attribute byte
NSETCX:		equ	#123				; Set horizontal screenpixels
GTASPC:		equ	#126				; Gets screen relations
PNTINI:		equ	#129				; Initalises the PAINT instruction
SCANR:		equ	#12c				; Scans screenpixels to the	right
SCANL:		equ	#12f				; Scans screenpixels to the	left
CHGCAP:		equ	#132				; Alternates the CAP lamp status
CHGSND:		equ	#135				; Alternates the 1-bit sound port status
RSLREG:		equ	#138				; Reads the	primary	slot register
WSLREG:		equ	#13b				; Writes value to the primary slot register
RDVDP:		equ	#13e				; Reads VDP	status register
SNSMAT:		equ	#141				; Returns the value	of the specified line from the keyboard	matrix
PHYDIO:		equ	#144				; Executes I/O for mass-storage media like diskettes
FORMAT:		equ	#147				; Initialises mass-storage media like formatting of	diskettes
ISFLIO:		equ	#14a				; Tests if I/O to device is	taking place
OUTDLP:		equ	#14d				; Printer output
GETVCP:		equ	#150				; Returns pointer to play queue
GETVC2:		equ	#153				; Returns pointer to variable in queue number VOICEN (byte op #FB38)
KILBUF:		equ	#156				; Clear keyboard buffer
CALBAS:		equ	#159				; Executes inter-slot call to the routine in BASIC interpreter
SUBROM:		equ	#15c				; Calls a routine in SUB-ROM
EXTROM:		equ	#15f				; Calls a routine in SUB-ROM. Most common way
CHKSLZ:		equ	#162				; Search slots for SUB-ROM
CHKNEW:		equ	#165				; Tests screen mode
EOL:		equ	#168				; Deletes to the end of the	line
BIGFIL:		equ	#16b				; Same function as FILVRM (total VRAM can be reached).
NSETRD:		equ	#16e				; Same function as SETRD.(with full	16 bits	VRAM-address)
NSTWRT:		equ	#171				; Same function as SETWRT.(with full 16 bits VRAM-address)
NRDVRM:		equ	#174				; Reads VRAM like in RDVRM.(with full 16 bits VRAM-address)
NWRVRM:		equ	#177				; Writes to	VRAM like in WRTVRM.(with full 16 bits VRAM-address)
RDBTST:		equ	#17a				; Read value of I/O	poort #F4
WRBTST:		equ	#17d				; Write value to I/O poort #F4
CHGCPU:		equ	#180				; Changes CPU mode
GETCPU:		equ	#183				; Returns current CPU mode
PCMPLY:		equ	#186				; Plays specified memory area through the PCM chip
PCMREC:		equ	#189				; Records audio using the PCM chip into the	specified memory area
