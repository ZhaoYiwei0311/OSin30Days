[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_boxfill8
	EXTERN	_putfonts8_asc
	EXTERN	_sheet_refresh
	EXTERN	_init_gdtidt
	EXTERN	_init_pic
	EXTERN	_io_sti
	EXTERN	_fifo32_init
	EXTERN	_init_pit
	EXTERN	_init_keyboard
	EXTERN	_enable_mouse
	EXTERN	_io_out8
	EXTERN	_memtest
	EXTERN	_memman_init
	EXTERN	_memman_free
	EXTERN	_init_palette
	EXTERN	_shtctl_init
	EXTERN	_task_init
	EXTERN	_task_run
	EXTERN	_sheet_alloc
	EXTERN	_memman_alloc_4k
	EXTERN	_sheet_setbuf
	EXTERN	_init_screen8
	EXTERN	_task_alloc
	EXTERN	_timer_alloc
	EXTERN	_timer_init
	EXTERN	_timer_settime
	EXTERN	_init_mouse_cursor8
	EXTERN	_sheet_slide
	EXTERN	_sheet_updown
	EXTERN	_sprintf
	EXTERN	_memman_total
	EXTERN	_fifo32_put
	EXTERN	_fifo32_status
	EXTERN	_io_cli
	EXTERN	_fifo32_get
	EXTERN	_mouse_decode
	EXTERN	_task_sleep
	EXTERN	_io_stihlt
	EXTERN	_wait_KBC_sendready
	EXTERN	_task_now
[FILE "bootpack.c"]
[SECTION .text]
	GLOBAL	_putfonts8_asc_sht
_putfonts8_asc_sht:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	SUB	ESP,12
	MOV	EAX,DWORD [8+EBP]
	MOV	EDI,DWORD [16+EBP]
	MOV	DWORD [-16+EBP],EAX
	MOV	EBX,DWORD [20+EBP]
	MOV	EAX,DWORD [12+EBP]
	MOV	DWORD [-20+EBP],EAX
	MOV	EAX,DWORD [28+EBP]
	MOV	DWORD [-24+EBP],EAX
	LEA	EAX,DWORD [15+EDI]
	PUSH	EAX
	MOV	EAX,DWORD [-20+EBP]
	MOV	ESI,DWORD [32+EBP]
	MOVSX	EBX,BL
	LEA	ESI,DWORD [EAX+ESI*8]
	LEA	EAX,DWORD [-1+ESI]
	PUSH	EAX
	PUSH	EDI
	PUSH	DWORD [-20+EBP]
	MOVZX	EAX,BYTE [24+EBP]
	PUSH	EAX
	MOV	EAX,DWORD [-16+EBP]
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	PUSH	DWORD [-24+EBP]
	PUSH	EBX
	PUSH	EDI
	PUSH	DWORD [-20+EBP]
	MOV	EAX,DWORD [-16+EBP]
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_putfonts8_asc
	MOV	DWORD [16+EBP],EDI
	LEA	EAX,DWORD [16+EDI]
	MOV	DWORD [20+EBP],ESI
	MOV	DWORD [24+EBP],EAX
	ADD	ESP,52
	MOV	EAX,DWORD [-20+EBP]
	MOV	DWORD [12+EBP],EAX
	MOV	EAX,DWORD [-16+EBP]
	MOV	DWORD [8+EBP],EAX
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_sheet_refresh
	GLOBAL	_make_textbox8
_make_textbox8:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	SUB	ESP,20
	MOV	EAX,DWORD [12+EBP]
	MOV	ESI,DWORD [16+EBP]
	ADD	EAX,DWORD [20+EBP]
	SUB	ESI,3
	PUSH	ESI
	MOV	DWORD [-16+EBP],EAX
	MOV	EAX,DWORD [16+EBP]
	ADD	EAX,DWORD [24+EBP]
	MOV	DWORD [-20+EBP],EAX
	MOV	EAX,DWORD [-16+EBP]
	INC	EAX
	PUSH	EAX
	MOV	DWORD [-24+EBP],EAX
	MOV	EAX,DWORD [12+EBP]
	PUSH	ESI
	SUB	EAX,2
	PUSH	EAX
	MOV	DWORD [-28+EBP],EAX
	MOV	EAX,DWORD [8+EBP]
	PUSH	15
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EDI,DWORD [12+EBP]
	MOV	EAX,DWORD [-20+EBP]
	SUB	EDI,3
	INC	EAX
	PUSH	EAX
	MOV	DWORD [-32+EBP],EAX
	PUSH	EDI
	MOV	EAX,DWORD [8+EBP]
	PUSH	ESI
	PUSH	EDI
	PUSH	15
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EAX,DWORD [8+EBP]
	ADD	ESP,56
	MOV	EBX,DWORD [-20+EBP]
	ADD	EBX,2
	PUSH	EBX
	PUSH	DWORD [-24+EBP]
	PUSH	EBX
	PUSH	EDI
	PUSH	7
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EAX,DWORD [-16+EBP]
	PUSH	EBX
	ADD	EAX,2
	PUSH	EAX
	PUSH	ESI
	PUSH	EAX
	MOV	EAX,DWORD [8+EBP]
	PUSH	7
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EAX,DWORD [8+EBP]
	ADD	ESP,56
	MOV	EBX,DWORD [16+EBP]
	SUB	EBX,2
	MOV	EDI,DWORD [12+EBP]
	PUSH	EBX
	DEC	EDI
	PUSH	DWORD [-16+EBP]
	PUSH	EBX
	PUSH	EDI
	PUSH	0
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EAX,DWORD [8+EBP]
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-28+EBP]
	PUSH	EBX
	PUSH	DWORD [-28+EBP]
	PUSH	0
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EAX,DWORD [8+EBP]
	ADD	ESP,56
	PUSH	DWORD [-32+EBP]
	PUSH	DWORD [-16+EBP]
	PUSH	DWORD [-32+EBP]
	PUSH	DWORD [-28+EBP]
	PUSH	8
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EAX,DWORD [8+EBP]
	PUSH	DWORD [-32+EBP]
	PUSH	DWORD [-24+EBP]
	PUSH	EBX
	PUSH	DWORD [-24+EBP]
	PUSH	8
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	MOV	EAX,DWORD [16+EBP]
	ADD	ESP,56
	DEC	EAX
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-16+EBP]
	PUSH	EAX
	PUSH	EDI
	MOVZX	EAX,BYTE [28+EBP]
	PUSH	EAX
	MOV	EAX,DWORD [8+EBP]
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
[SECTION .data]
_keytable0.0:
	DB	0
	DB	0
	DB	49
	DB	50
	DB	51
	DB	52
	DB	53
	DB	54
	DB	55
	DB	56
	DB	57
	DB	48
	DB	45
	DB	94
	DB	0
	DB	0
	DB	81
	DB	87
	DB	69
	DB	82
	DB	84
	DB	89
	DB	85
	DB	73
	DB	79
	DB	80
	DB	64
	DB	91
	DB	0
	DB	0
	DB	65
	DB	83
	DB	68
	DB	70
	DB	71
	DB	72
	DB	74
	DB	75
	DB	76
	DB	59
	DB	58
	DB	0
	DB	0
	DB	93
	DB	90
	DB	88
	DB	67
	DB	86
	DB	66
	DB	78
	DB	77
	DB	44
	DB	46
	DB	47
	DB	0
	DB	42
	DB	0
	DB	32
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	55
	DB	56
	DB	57
	DB	45
	DB	52
	DB	53
	DB	54
	DB	43
	DB	49
	DB	50
	DB	51
	DB	48
	DB	46
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	92
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	92
	DB	0
	DB	0
_keytable1.1:
	DB	0
	DB	0
	DB	33
	DB	34
	DB	35
	DB	36
	DB	37
	DB	38
	DB	39
	DB	40
	DB	41
	DB	126
	DB	61
	DB	126
	DB	0
	DB	0
	DB	81
	DB	87
	DB	69
	DB	82
	DB	84
	DB	89
	DB	85
	DB	73
	DB	79
	DB	80
	DB	96
	DB	123
	DB	0
	DB	0
	DB	65
	DB	83
	DB	68
	DB	70
	DB	71
	DB	72
	DB	74
	DB	75
	DB	76
	DB	43
	DB	42
	DB	0
	DB	0
	DB	125
	DB	90
	DB	88
	DB	67
	DB	86
	DB	66
	DB	78
	DB	77
	DB	60
	DB	62
	DB	63
	DB	0
	DB	42
	DB	0
	DB	32
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	55
	DB	56
	DB	57
	DB	45
	DB	52
	DB	53
	DB	54
	DB	43
	DB	49
	DB	50
	DB	51
	DB	48
	DB	46
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	95
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	0
	DB	124
	DB	0
	DB	0
LC0:
	DB	"console",0x00
LC1:
	DB	"task_a",0x00
LC2:
	DB	"(%3d, %3d)",0x00
LC3:
	DB	"memory %dMB   free : %dKB",0x00
LC6:
	DB	"[lcr %4d %4d]",0x00
LC4:
	DB	"%02X",0x00
LC5:
	DB	" ",0x00
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	SUB	ESP,1096
	MOV	DWORD [-1092+EBP],0
	MOV	DWORD [-1096+EBP],0
	MOV	AL,BYTE [4081]
	PUSH	7
	SAR	AL,4
	PUSH	16
	PUSH	144
	MOV	EDX,EAX
	PUSH	28
	AND	EDX,7
	PUSH	8
	MOV	DWORD [-1100+EBP],EDX
	PUSH	EDI
	MOV	DWORD [-1104+EBP],-1
	CALL	_make_textbox8
	MOV	DWORD [-1056+EBP],7
	CALL	_init_gdtidt
	CALL	_init_pic
	CALL	_io_sti
	LEA	EAX,DWORD [-636+EBP]
	PUSH	0
	PUSH	EAX
	LEA	EAX,DWORD [-44+EBP]
	PUSH	128
	PUSH	EAX
	CALL	_fifo32_init
	ADD	ESP,40
	CALL	_init_pit
	LEA	EDX,DWORD [-44+EBP]
	PUSH	256
	PUSH	EDX
	CALL	_init_keyboard
	LEA	EAX,DWORD [-780+EBP]
	PUSH	EAX
	LEA	EAX,DWORD [-44+EBP]
	PUSH	512
	PUSH	EAX
	CALL	_enable_mouse
	PUSH	248
	PUSH	33
	CALL	_io_out8
	PUSH	239
	PUSH	161
	CALL	_io_out8
	LEA	EDX,DWORD [-76+EBP]
	ADD	ESP,36
	LEA	EAX,DWORD [-764+EBP]
	PUSH	0
	PUSH	EAX
	PUSH	32
	PUSH	EDX
	CALL	_fifo32_init
	PUSH	-1073741825
	PUSH	4194304
	CALL	_memtest
	PUSH	3932160
	MOV	DWORD [-1060+EBP],EAX
	CALL	_memman_init
	PUSH	647168
	PUSH	4096
	PUSH	3932160
	CALL	_memman_free
	MOV	EAX,DWORD [-1060+EBP]
	ADD	ESP,40
	SUB	EAX,4194304
	PUSH	EAX
	PUSH	4194304
	PUSH	3932160
	CALL	_memman_free
	CALL	_init_palette
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [4088]
	PUSH	3932160
	CALL	_shtctl_init
	PUSH	3932160
	MOV	ESI,EAX
	CALL	_task_init
	ADD	ESP,32
	MOV	DWORD [-1084+EBP],EAX
	MOV	DWORD [-20+EBP],EAX
	PUSH	0
	PUSH	1
	PUSH	EAX
	CALL	_task_run
	PUSH	ESI
	CALL	_sheet_alloc
	MOVSX	EDX,WORD [4086]
	MOV	DWORD [-1064+EBP],EAX
	MOVSX	EAX,WORD [4084]
	IMUL	EAX,EDX
	PUSH	EAX
	PUSH	3932160
	CALL	_memman_alloc_4k
	PUSH	-1
	MOV	EBX,EAX
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	EBX
	PUSH	DWORD [-1064+EBP]
	CALL	_sheet_setbuf
	ADD	ESP,44
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	EBX
	LEA	EBX,DWORD [-1036+EBP]
	CALL	_init_screen8
	PUSH	ESI
	CALL	_sheet_alloc
	PUSH	42240
	PUSH	3932160
	MOV	DWORD [-1072+EBP],EAX
	CALL	_memman_alloc_4k
	PUSH	-1
	PUSH	165
	MOV	DWORD [-1080+EBP],EAX
	PUSH	256
	PUSH	EAX
	PUSH	DWORD [-1072+EBP]
	CALL	_sheet_setbuf
	ADD	ESP,44
	PUSH	0
	PUSH	LC0
	PUSH	165
	PUSH	256
	PUSH	DWORD [-1080+EBP]
	CALL	_make_window8
	PUSH	0
	PUSH	128
	PUSH	240
	PUSH	28
	PUSH	8
	PUSH	DWORD [-1072+EBP]
	CALL	_make_textbox8
	ADD	ESP,44
	CALL	_task_alloc
	PUSH	65536
	PUSH	3932160
	MOV	DWORD [-1088+EBP],EAX
	CALL	_memman_alloc_4k
	MOV	EDX,DWORD [-1088+EBP]
	ADD	EAX,65528
	MOV	DWORD [100+EDX],EAX
	MOV	DWORD [76+EDX],_console_task
	MOV	DWORD [116+EDX],8
	MOV	DWORD [120+EDX],16
	MOV	DWORD [124+EDX],8
	MOV	DWORD [128+EDX],8
	MOV	DWORD [132+EDX],8
	MOV	DWORD [136+EDX],8
	MOV	EDX,DWORD [-1072+EBP]
	MOV	DWORD [4+EAX],EDX
	PUSH	2
	PUSH	2
	PUSH	DWORD [-1088+EBP]
	CALL	_task_run
	PUSH	ESI
	CALL	_sheet_alloc
	PUSH	8320
	PUSH	3932160
	MOV	EDI,EAX
	CALL	_memman_alloc_4k
	ADD	ESP,32
	PUSH	-1
	MOV	DWORD [-1076+EBP],EAX
	PUSH	52
	PUSH	144
	PUSH	EAX
	PUSH	EDI
	CALL	_sheet_setbuf
	PUSH	1
	PUSH	LC1
	PUSH	52
	PUSH	144
	PUSH	DWORD [-1076+EBP]
	CALL	_make_window8
	ADD	ESP,40
	PUSH	7
	PUSH	16
	PUSH	128
	PUSH	28
	PUSH	8
	PUSH	EDI
	CALL	_make_textbox8
	MOV	DWORD [-1052+EBP],8
	CALL	_timer_alloc
	PUSH	1
	MOV	DWORD [-1040+EBP],EAX
	LEA	EAX,DWORD [-44+EBP]
	PUSH	EAX
	PUSH	DWORD [-1040+EBP]
	CALL	_timer_init
	ADD	ESP,36
	PUSH	50
	PUSH	DWORD [-1040+EBP]
	CALL	_timer_settime
	PUSH	ESI
	CALL	_sheet_alloc
	PUSH	99
	PUSH	16
	PUSH	16
	MOV	DWORD [-1068+EBP],EAX
	PUSH	EBX
	PUSH	EAX
	CALL	_sheet_setbuf
	ADD	ESP,32
	PUSH	99
	PUSH	EBX
	MOV	EBX,2
	CALL	_init_mouse_cursor8
	MOVSX	EAX,WORD [4084]
	LEA	ECX,DWORD [-16+EAX]
	MOV	EAX,ECX
	CDQ
	IDIV	EBX
	MOV	DWORD [-1044+EBP],EAX
	MOVSX	EAX,WORD [4086]
	PUSH	0
	LEA	ECX,DWORD [-44+EAX]
	PUSH	0
	MOV	EAX,ECX
	CDQ
	IDIV	EBX
	PUSH	DWORD [-1064+EBP]
	MOV	DWORD [-1048+EBP],EAX
	LEA	EBX,DWORD [-124+EBP]
	CALL	_sheet_slide
	PUSH	4
	PUSH	32
	PUSH	DWORD [-1072+EBP]
	CALL	_sheet_slide
	ADD	ESP,32
	PUSH	56
	PUSH	64
	PUSH	EDI
	CALL	_sheet_slide
	PUSH	DWORD [-1048+EBP]
	PUSH	DWORD [-1044+EBP]
	PUSH	DWORD [-1068+EBP]
	CALL	_sheet_slide
	PUSH	0
	PUSH	DWORD [-1064+EBP]
	CALL	_sheet_updown
	ADD	ESP,32
	PUSH	1
	PUSH	DWORD [-1072+EBP]
	CALL	_sheet_updown
	PUSH	2
	PUSH	EDI
	CALL	_sheet_updown
	PUSH	3
	PUSH	DWORD [-1068+EBP]
	CALL	_sheet_updown
	PUSH	DWORD [-1048+EBP]
	PUSH	DWORD [-1044+EBP]
	PUSH	LC2
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,40
	PUSH	10
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	0
	PUSH	0
	PUSH	DWORD [-1064+EBP]
	CALL	_putfonts8_asc_sht
	PUSH	3932160
	CALL	_memman_total
	SHR	DWORD [-1060+EBP],20
	SHR	EAX,10
	MOV	DWORD [ESP],EAX
	PUSH	DWORD [-1060+EBP]
	PUSH	LC3
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,44
	PUSH	40
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	32
	PUSH	0
	PUSH	DWORD [-1064+EBP]
	CALL	_putfonts8_asc_sht
	LEA	EDX,DWORD [-76+EBP]
	PUSH	237
	PUSH	EDX
	CALL	_fifo32_put
	LEA	EAX,DWORD [-76+EBP]
	ADD	ESP,36
	PUSH	DWORD [-1100+EBP]
	PUSH	EAX
	CALL	_fifo32_put
	POP	ECX
	POP	EBX
L4:
	LEA	EBX,DWORD [-76+EBP]
	PUSH	EBX
	CALL	_fifo32_status
	POP	EDX
	TEST	EAX,EAX
	JLE	L7
	CMP	DWORD [-1104+EBP],0
	JS	L53
L7:
	LEA	EBX,DWORD [-44+EBP]
	CALL	_io_cli
	PUSH	EBX
	CALL	_fifo32_status
	POP	ESI
	TEST	EAX,EAX
	JE	L54
	PUSH	EBX
	CALL	_fifo32_get
	MOV	ESI,EAX
	CALL	_io_sti
	POP	ECX
	LEA	EAX,DWORD [-256+ESI]
	CMP	EAX,255
	JBE	L55
	LEA	EAX,DWORD [-512+ESI]
	CMP	EAX,255
	JBE	L56
	CMP	ESI,1
	JG	L4
	TEST	ESI,ESI
	JE	L47
	PUSH	0
	PUSH	EBX
	PUSH	DWORD [-1040+EBP]
	CALL	_timer_init
	MOV	DWORD [-1056+EBP],0
L52:
	ADD	ESP,12
	PUSH	50
	PUSH	DWORD [-1040+EBP]
	CALL	_timer_settime
	MOV	EAX,DWORD [-1052+EBP]
	PUSH	43
	ADD	EAX,7
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-1052+EBP]
	PUSH	DWORD [-1056+EBP]
	PUSH	DWORD [4+EDI]
	PUSH	DWORD [EDI]
	CALL	_boxfill8
	MOV	EAX,DWORD [-1052+EBP]
	ADD	ESP,36
	ADD	EAX,8
	PUSH	44
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-1052+EBP]
	PUSH	EDI
	CALL	_sheet_refresh
	ADD	ESP,20
	JMP	L4
L47:
	PUSH	1
	PUSH	EBX
	PUSH	DWORD [-1040+EBP]
	CALL	_timer_init
	MOV	DWORD [-1056+EBP],7
	JMP	L52
L56:
	MOV	EDX,ESI
	MOVZX	EAX,DL
	PUSH	EAX
	LEA	EAX,DWORD [-780+EBP]
	PUSH	EAX
	CALL	_mouse_decode
	POP	EDX
	POP	ECX
	TEST	EAX,EAX
	JE	L4
	PUSH	DWORD [-772+EBP]
	PUSH	DWORD [-776+EBP]
	PUSH	LC6
	LEA	EBX,DWORD [-124+EBP]
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,16
	MOV	EAX,DWORD [-768+EBP]
	TEST	EAX,1
	JE	L37
	MOV	BYTE [-123+EBP],76
L37:
	TEST	EAX,2
	JE	L38
	MOV	BYTE [-121+EBP],82
L38:
	AND	EAX,4
	JE	L39
	MOV	BYTE [-122+EBP],67
L39:
	PUSH	15
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	16
	PUSH	32
	PUSH	DWORD [-1064+EBP]
	CALL	_putfonts8_asc_sht
	MOV	EDX,DWORD [-776+EBP]
	MOV	EAX,DWORD [-772+EBP]
	ADD	ESP,28
	ADD	DWORD [-1048+EBP],EAX
	ADD	DWORD [-1044+EBP],EDX
	JS	L57
L40:
	CMP	DWORD [-1048+EBP],0
	JS	L58
L41:
	MOVSX	EAX,WORD [4084]
	DEC	EAX
	CMP	DWORD [-1044+EBP],EAX
	JLE	L42
	MOV	DWORD [-1044+EBP],EAX
L42:
	MOVSX	EAX,WORD [4086]
	DEC	EAX
	CMP	DWORD [-1048+EBP],EAX
	JLE	L43
	MOV	DWORD [-1048+EBP],EAX
L43:
	PUSH	DWORD [-1048+EBP]
	PUSH	DWORD [-1044+EBP]
	PUSH	LC2
	PUSH	EBX
	CALL	_sprintf
	PUSH	10
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	0
	PUSH	0
	PUSH	DWORD [-1064+EBP]
	CALL	_putfonts8_asc_sht
	ADD	ESP,44
	PUSH	DWORD [-1048+EBP]
	PUSH	DWORD [-1044+EBP]
	PUSH	DWORD [-1068+EBP]
	CALL	_sheet_slide
	ADD	ESP,12
	TEST	DWORD [-768+EBP],1
	JE	L4
	MOV	EAX,DWORD [-1048+EBP]
	SUB	EAX,8
	PUSH	EAX
	MOV	EAX,DWORD [-1044+EBP]
	SUB	EAX,80
	PUSH	EAX
	PUSH	EDI
	CALL	_sheet_slide
	ADD	ESP,12
	JMP	L4
L58:
	MOV	DWORD [-1048+EBP],0
	JMP	L41
L57:
	MOV	DWORD [-1044+EBP],0
	JMP	L40
L55:
	PUSH	EAX
	LEA	EBX,DWORD [-124+EBP]
	PUSH	LC4
	PUSH	EBX
	CALL	_sprintf
	PUSH	2
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	16
	PUSH	0
	PUSH	DWORD [-1064+EBP]
	CALL	_putfonts8_asc_sht
	ADD	ESP,40
	CMP	ESI,383
	JG	L11
	CMP	DWORD [-1096+EBP],0
	JNE	L12
	MOV	AL,BYTE [_keytable0.0-256+ESI]
L50:
	MOV	BYTE [-124+EBP],AL
L14:
	MOV	DL,BYTE [-124+EBP]
	LEA	EAX,DWORD [-65+EDX]
	CMP	AL,25
	JA	L15
	TEST	DWORD [-1100+EBP],4
	JNE	L49
	CMP	DWORD [-1096+EBP],0
	JE	L17
L15:
	MOV	AL,BYTE [-124+EBP]
	TEST	AL,AL
	JE	L19
	CMP	DWORD [-1092+EBP],0
	JNE	L20
	CMP	DWORD [-1052+EBP],127
	JG	L19
	PUSH	1
	LEA	EAX,DWORD [-124+EBP]
	PUSH	EAX
	PUSH	7
	PUSH	0
	PUSH	28
	PUSH	DWORD [-1052+EBP]
	PUSH	EDI
	MOV	BYTE [-123+EBP],0
	CALL	_putfonts8_asc_sht
	ADD	ESP,28
	ADD	DWORD [-1052+EBP],8
L19:
	CMP	ESI,270
	JE	L59
L23:
	CMP	ESI,271
	JE	L60
L27:
	CMP	ESI,298
	JE	L61
L30:
	CMP	ESI,310
	JE	L62
L31:
	CMP	ESI,426
	JE	L63
L32:
	CMP	ESI,438
	JE	L64
L33:
	MOV	EAX,DWORD [-1052+EBP]
	PUSH	43
	ADD	EAX,7
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-1052+EBP]
	PUSH	DWORD [-1056+EBP]
	PUSH	DWORD [4+EDI]
	PUSH	DWORD [EDI]
	CALL	_boxfill8
	MOV	EAX,DWORD [-1052+EBP]
	PUSH	44
	ADD	EAX,8
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-1052+EBP]
	PUSH	EDI
	CALL	_sheet_refresh
	ADD	ESP,48
	JMP	L4
L64:
	AND	DWORD [-1096+EBP],-3
	JMP	L33
L63:
	AND	DWORD [-1096+EBP],-2
	JMP	L32
L62:
	OR	DWORD [-1096+EBP],2
	JMP	L31
L61:
	OR	DWORD [-1096+EBP],1
	JMP	L30
L60:
	CMP	DWORD [-1092+EBP],0
	JNE	L28
	PUSH	0
	PUSH	LC1
	PUSH	DWORD [4+EDI]
	PUSH	DWORD [-1076+EBP]
	MOV	DWORD [-1092+EBP],1
	CALL	_make_wtitle8
	MOV	EDX,DWORD [-1072+EBP]
	PUSH	1
	PUSH	LC0
	PUSH	DWORD [4+EDX]
L51:
	PUSH	DWORD [-1080+EBP]
	CALL	_make_wtitle8
	ADD	ESP,32
	PUSH	21
	PUSH	DWORD [4+EDI]
	PUSH	0
	PUSH	0
	PUSH	EDI
	CALL	_sheet_refresh
	MOV	EDX,DWORD [-1072+EBP]
	PUSH	21
	PUSH	DWORD [4+EDX]
	PUSH	0
	PUSH	0
	PUSH	EDX
	CALL	_sheet_refresh
	ADD	ESP,40
	JMP	L27
L28:
	PUSH	1
	PUSH	LC1
	PUSH	DWORD [4+EDI]
	PUSH	DWORD [-1076+EBP]
	MOV	DWORD [-1092+EBP],0
	CALL	_make_wtitle8
	MOV	EAX,DWORD [-1072+EBP]
	PUSH	0
	PUSH	LC0
	PUSH	DWORD [4+EAX]
	JMP	L51
L59:
	CMP	DWORD [-1092+EBP],0
	JNE	L24
	CMP	DWORD [-1052+EBP],8
	JLE	L23
	PUSH	1
	PUSH	LC5
	PUSH	7
	PUSH	0
	PUSH	28
	PUSH	DWORD [-1052+EBP]
	PUSH	EDI
	CALL	_putfonts8_asc_sht
	ADD	ESP,28
	SUB	DWORD [-1052+EBP],8
	JMP	L23
L24:
	MOV	EAX,DWORD [-1088+EBP]
	PUSH	264
	ADD	EAX,16
	PUSH	EAX
	CALL	_fifo32_put
	POP	EBX
	POP	EAX
	JMP	L23
L20:
	MOVSX	EAX,AL
	ADD	EAX,256
	PUSH	EAX
	MOV	EAX,DWORD [-1088+EBP]
	ADD	EAX,16
	PUSH	EAX
	CALL	_fifo32_put
	POP	EAX
	POP	EDX
	JMP	L19
L17:
	LEA	EAX,DWORD [32+EDX]
	MOV	BYTE [-124+EBP],AL
	JMP	L15
L49:
	CMP	DWORD [-1096+EBP],0
	JE	L15
	JMP	L17
L12:
	MOV	AL,BYTE [_keytable1.1-256+ESI]
	JMP	L50
L11:
	MOV	BYTE [-124+EBP],0
	JMP	L14
L54:
	PUSH	DWORD [-1084+EBP]
	CALL	_task_sleep
	CALL	_io_stihlt
	POP	EBX
	JMP	L4
L53:
	PUSH	EBX
	CALL	_fifo32_get
	MOV	DWORD [-1104+EBP],EAX
	CALL	_wait_KBC_sendready
	PUSH	DWORD [-1104+EBP]
	PUSH	96
	CALL	_io_out8
	ADD	ESP,12
	JMP	L7
[SECTION .data]
_closebtn.2:
	DB	"OOOOOOOOOOOOOOO@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"OQQQ@@QQQQ@@QQ$@"
	DB	"OQQQQ@@QQ@@QQQ$@"
	DB	"OQQQQQ@@@@QQQQ$@"
	DB	"OQQQQQQ@@QQQQQ$@"
	DB	"OQQQQQ@@@@QQQQ$@"
	DB	"OQQQQ@@QQ@@QQQ$@"
	DB	"OQQQ@@QQQQ@@QQ$@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"OQQQQQQQQQQQQQ$@"
	DB	"O$$$$$$$$$$$$$$@"
	DB	"@@@@@@@@@@@@@@@@"
[SECTION .text]
	GLOBAL	_make_wtitle8
_make_wtitle8:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	PUSH	ESI
	CMP	BYTE [20+EBP],0
	JE	L66
	MOV	BL,7
	MOV	DL,12
L67:
	MOV	EAX,DWORD [12+EBP]
	PUSH	20
	SUB	EAX,4
	XOR	EDI,EDI
	PUSH	EAX
	PUSH	3
	PUSH	3
	MOVZX	EAX,DL
	PUSH	EAX
	PUSH	DWORD [12+EBP]
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	PUSH	DWORD [16+EBP]
	MOVSX	EAX,BL
	PUSH	EAX
	PUSH	4
	PUSH	24
	PUSH	DWORD [12+EBP]
	PUSH	DWORD [8+EBP]
	CALL	_putfonts8_asc
	ADD	ESP,52
	IMUL	EBX,DWORD [12+EBP],5
	MOV	DWORD [-16+EBP],0
L83:
	MOV	EAX,DWORD [12+EBP]
	MOV	EDX,DWORD [8+EBP]
	ADD	EAX,EBX
	XOR	ESI,ESI
	LEA	ECX,DWORD [-21+EDX+EAX*1]
L82:
	MOV	DL,BYTE [_closebtn.2+ESI+EDI*1]
	CMP	DL,64
	JE	L88
	CMP	DL,36
	JE	L89
	CMP	DL,81
	MOV	DL,8
	SETNE	AL
	SUB	DL,AL
L77:
	INC	ESI
	MOV	BYTE [ECX],DL
	INC	ECX
	CMP	ESI,15
	JLE	L82
	INC	DWORD [-16+EBP]
	ADD	EDI,16
	ADD	EBX,DWORD [12+EBP]
	CMP	DWORD [-16+EBP],13
	JLE	L83
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
L89:
	MOV	DL,15
	JMP	L77
L88:
	XOR	EDX,EDX
	JMP	L77
L66:
	MOV	BL,8
	MOV	DL,15
	JMP	L67
	GLOBAL	_make_window8
_make_window8:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	SUB	ESP,24
	MOV	EAX,DWORD [16+EBP]
	MOV	EBX,DWORD [12+EBP]
	MOV	DWORD [-16+EBP],EAX
	MOV	ESI,DWORD [8+EBP]
	MOV	EAX,DWORD [20+EBP]
	MOV	DWORD [-20+EBP],EAX
	MOVSX	EAX,BYTE [24+EBP]
	MOV	DWORD [-24+EBP],EAX
	LEA	EAX,DWORD [-1+EBX]
	PUSH	0
	MOV	DWORD [-28+EBP],EAX
	PUSH	EAX
	PUSH	0
	PUSH	0
	PUSH	8
	PUSH	EBX
	PUSH	ESI
	CALL	_boxfill8
	LEA	EAX,DWORD [-2+EBX]
	PUSH	1
	MOV	DWORD [-32+EBP],EAX
	PUSH	EAX
	PUSH	1
	PUSH	1
	PUSH	7
	PUSH	EBX
	PUSH	ESI
	CALL	_boxfill8
	MOV	EAX,DWORD [-16+EBP]
	ADD	ESP,56
	DEC	EAX
	MOV	DWORD [-36+EBP],EAX
	PUSH	EAX
	PUSH	0
	PUSH	0
	PUSH	0
	PUSH	8
	PUSH	EBX
	PUSH	ESI
	CALL	_boxfill8
	MOV	EDI,DWORD [-16+EBP]
	SUB	EDI,2
	PUSH	EDI
	PUSH	1
	PUSH	1
	PUSH	1
	PUSH	7
	PUSH	EBX
	PUSH	ESI
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	EDI
	PUSH	DWORD [-32+EBP]
	PUSH	1
	PUSH	DWORD [-32+EBP]
	PUSH	15
	PUSH	EBX
	PUSH	ESI
	CALL	_boxfill8
	PUSH	DWORD [-36+EBP]
	PUSH	DWORD [-28+EBP]
	PUSH	0
	PUSH	DWORD [-28+EBP]
	PUSH	0
	PUSH	EBX
	PUSH	ESI
	CALL	_boxfill8
	MOV	EAX,DWORD [-16+EBP]
	ADD	ESP,56
	SUB	EAX,3
	PUSH	EAX
	LEA	EAX,DWORD [-3+EBX]
	PUSH	EAX
	PUSH	2
	PUSH	2
	PUSH	8
	PUSH	EBX
	PUSH	ESI
	CALL	_boxfill8
	PUSH	EDI
	PUSH	DWORD [-32+EBP]
	PUSH	EDI
	PUSH	1
	PUSH	15
	PUSH	EBX
	PUSH	ESI
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	DWORD [-36+EBP]
	PUSH	DWORD [-28+EBP]
	PUSH	DWORD [-36+EBP]
	PUSH	0
	PUSH	0
	PUSH	EBX
	PUSH	ESI
	CALL	_boxfill8
	MOV	DWORD [8+EBP],ESI
	MOV	EAX,DWORD [-24+EBP]
	MOV	DWORD [12+EBP],EBX
	MOV	DWORD [20+EBP],EAX
	ADD	ESP,28
	MOV	EAX,DWORD [-20+EBP]
	MOV	DWORD [16+EBP],EAX
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	JMP	_make_wtitle8
[SECTION .data]
LC7:
	DB	"%11d",0x00
[SECTION .text]
	GLOBAL	_task_b_main
_task_b_main:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	XOR	EDI,EDI
	PUSH	EBX
	LEA	EAX,DWORD [-556+EBP]
	SUB	ESP,564
	LEA	EBX,DWORD [-44+EBP]
	MOV	DWORD [-576+EBP],0
	PUSH	0
	PUSH	EAX
	PUSH	128
	PUSH	EBX
	CALL	_fifo32_init
	CALL	_timer_alloc
	PUSH	100
	PUSH	EBX
	MOV	ESI,EAX
	PUSH	EAX
	CALL	_timer_init
	PUSH	100
	PUSH	ESI
	CALL	_timer_settime
	ADD	ESP,36
L92:
	LEA	EBX,DWORD [-44+EBP]
	CALL	_io_cli
	PUSH	EBX
	INC	EDI
	CALL	_fifo32_status
	POP	EDX
	TEST	EAX,EAX
	JE	L98
	PUSH	EBX
	CALL	_fifo32_get
	MOV	EBX,EAX
	CALL	_io_sti
	POP	ECX
	CMP	EBX,100
	JNE	L92
	MOV	EAX,EDI
	LEA	EBX,DWORD [-572+EBP]
	SUB	EAX,DWORD [-576+EBP]
	PUSH	EAX
	PUSH	LC7
	PUSH	EBX
	CALL	_sprintf
	PUSH	11
	PUSH	EBX
	PUSH	8
	PUSH	0
	PUSH	28
	PUSH	24
	PUSH	DWORD [8+EBP]
	CALL	_putfonts8_asc_sht
	ADD	ESP,40
	MOV	DWORD [-576+EBP],EDI
	PUSH	100
	PUSH	ESI
	CALL	_timer_settime
	POP	EAX
	POP	EDX
	JMP	L92
L98:
	CALL	_io_sti
	JMP	L92
[SECTION .data]
LC8:
	DB	">",0x00
[SECTION .text]
	GLOBAL	_console_task
_console_task:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	MOV	EDI,16
	PUSH	EBX
	SUB	ESP,560
	CALL	_task_now
	MOV	DWORD [-572+EBP],0
	PUSH	EAX
	MOV	DWORD [-568+EBP],EAX
	LEA	EAX,DWORD [-556+EBP]
	MOV	EBX,DWORD [-568+EBP]
	PUSH	EAX
	ADD	EBX,16
	PUSH	128
	PUSH	EBX
	CALL	_fifo32_init
	CALL	_timer_alloc
	PUSH	1
	PUSH	EBX
	PUSH	EAX
	MOV	DWORD [-564+EBP],EAX
	CALL	_timer_init
	PUSH	50
	PUSH	DWORD [-564+EBP]
	CALL	_timer_settime
	ADD	ESP,36
	PUSH	1
	PUSH	LC8
	PUSH	0
	PUSH	7
	PUSH	28
	PUSH	8
	PUSH	DWORD [8+EBP]
	CALL	_putfonts8_asc_sht
	ADD	ESP,28
L100:
	CALL	_io_cli
	MOV	EBX,DWORD [-568+EBP]
	ADD	EBX,16
	PUSH	EBX
	CALL	_fifo32_status
	POP	EDX
	TEST	EAX,EAX
	JE	L115
	PUSH	EBX
	CALL	_fifo32_get
	MOV	ESI,EAX
	CALL	_io_sti
	POP	EAX
	CMP	ESI,1
	JLE	L116
L105:
	LEA	EAX,DWORD [-256+ESI]
	CMP	EAX,255
	JA	L108
	CMP	ESI,264
	JE	L117
	CMP	EDI,239
	JG	L108
	MOV	EAX,ESI
	PUSH	1
	MOV	BYTE [-558+EBP],AL
	LEA	EAX,DWORD [-558+EBP]
	PUSH	EAX
	PUSH	0
	PUSH	7
	PUSH	28
	PUSH	EDI
	ADD	EDI,8
	PUSH	DWORD [8+EBP]
	MOV	BYTE [-557+EBP],0
	CALL	_putfonts8_asc_sht
L114:
	ADD	ESP,28
L108:
	PUSH	43
	LEA	EAX,DWORD [7+EDI]
	PUSH	EAX
	MOV	EAX,DWORD [8+EBP]
	PUSH	28
	PUSH	EDI
	PUSH	DWORD [-572+EBP]
	PUSH	DWORD [4+EAX]
	PUSH	DWORD [EAX]
	CALL	_boxfill8
	LEA	EAX,DWORD [8+EDI]
	PUSH	44
	PUSH	EAX
	PUSH	28
	PUSH	EDI
	PUSH	DWORD [8+EBP]
	CALL	_sheet_refresh
	ADD	ESP,48
	JMP	L100
L117:
	CMP	EDI,16
	JLE	L108
	PUSH	1
	PUSH	LC5
	PUSH	0
	PUSH	7
	PUSH	28
	PUSH	EDI
	SUB	EDI,8
	PUSH	DWORD [8+EBP]
	CALL	_putfonts8_asc_sht
	JMP	L114
L116:
	TEST	ESI,ESI
	JE	L106
	PUSH	0
	PUSH	EBX
	PUSH	DWORD [-564+EBP]
	CALL	_timer_init
	MOV	DWORD [-572+EBP],7
L113:
	ADD	ESP,12
	PUSH	50
	PUSH	DWORD [-564+EBP]
	CALL	_timer_settime
	POP	ECX
	POP	EBX
	JMP	L105
L106:
	PUSH	1
	PUSH	EBX
	PUSH	DWORD [-564+EBP]
	CALL	_timer_init
	MOV	DWORD [-572+EBP],0
	JMP	L113
L115:
	PUSH	DWORD [-568+EBP]
	CALL	_task_sleep
	CALL	_io_sti
	POP	EAX
	JMP	L100
