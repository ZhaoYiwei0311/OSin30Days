; hello-os
; TAB=4

; ?yFAT12iฎ???pIใ? Stand FAT12 format floppy code

		DB		0xeb, 0x4e, 0x90
		DB		"HELLOIPL"		; ??๎ๆผฬi8?j
		DW		512				; ?ข๎ๆisectorjๅฌiK?512?j
		DB		1				; โฦiclusterjๅฌiK??1ข๎ๆj
		DW		1				; FATNnสui๊ส?ๆ๊ข๎ๆj
		DB		2				; FATขiK??2j
		DW		224				; ชฺ?ๅฌi๊ส?224?j
		DW		2880			; ?ฅ?ๅฌiK??2880๎ๆ1440*1024/512j
		DB		0xf0			; ฅ??^iK??0xf0j
		DW		9				; FATI?xiK?ฅ9๎ๆj
		DW		18				; ๊ขฅนitrackjL{ข๎ๆiK??18j
		DW		2				; ฅ?iK?ฅ2j
		DD		0				; sgpชๆCK?ฅ0
		DD		2880			; dส๊ฅ?ๅฌ
		DB		0,0,0x29		; ำ?sพiล่j
		DD		0xffffffff		; iย\ฅjษ??
		DB		"HELLO-OS   "	; ฅ?IผฬiK??11?CsซU๓ij
		DB		"FAT12   "		; ฅ?iฎผฬiK?ฅ8?CsซU๓ij
		RESB	18				; ๆ๓o18?

; ๖ๅฬ

		DB		0xb8, 0x00, 0x00, 0x8e, 0xd0, 0xbc, 0x00, 0x7c
		DB		0x8e, 0xd8, 0x8e, 0xc0, 0xbe, 0x74, 0x7c, 0x8a
		DB		0x04, 0x83, 0xc6, 0x01, 0x3c, 0x00, 0x74, 0x09
		DB		0xb4, 0x0e, 0xbb, 0x0f, 0x00, 0xcd, 0x10, 0xeb
		DB		0xee, 0xf4, 0xeb, 0xfd

; Mง?ฆช

		DB		0x0a, 0x0a		; ?s?
		DB		"hello, world"
		DB		0x0a			; ?s
		DB		0

		RESB	0x1fe-$			; Uส0x00ผ0x001fe

		DB		0x55, 0xaa

; ??๎ๆศOช?o

		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	4600
		DB		0xf0, 0xff, 0xff, 0x00, 0x00, 0x00, 0x00, 0x00
		RESB	1469432
