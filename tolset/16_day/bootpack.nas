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
	EXTERN	_sprintf
	EXTERN	_task_alloc
	EXTERN	_timer_alloc
	EXTERN	_timer_init
	EXTERN	_timer_settime
	EXTERN	_init_mouse_cursor8
	EXTERN	_sheet_slide
	EXTERN	_sheet_updown
	EXTERN	_memman_total
	EXTERN	_io_cli
	EXTERN	_fifo32_status
	EXTERN	_fifo32_get
	EXTERN	_mouse_decode
	EXTERN	_task_sleep
	EXTERN	_io_stihlt
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
_keytable.0:
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
LC0:
	DB	"task_b%d",0x00
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
	XOR	ESI,ESI
	PUSH	EBX
	LEA	EBX,DWORD [-44+EBP]
	SUB	ESP,944
	PUSH	7
	PUSH	16
	PUSH	144
	PUSH	28
	PUSH	8
	PUSH	EDI
	CALL	_make_textbox8
	CALL	_init_gdtidt
	CALL	_init_pic
	CALL	_io_sti
	LEA	EAX,DWORD [-604+EBP]
	PUSH	0
	PUSH	EAX
	PUSH	128
	PUSH	EBX
	CALL	_fifo32_init
	ADD	ESP,40
	CALL	_init_pit
	PUSH	256
	PUSH	EBX
	CALL	_init_keyboard
	LEA	EAX,DWORD [-620+EBP]
	PUSH	EAX
	PUSH	512
	PUSH	EBX
	CALL	_enable_mouse
	PUSH	248
	PUSH	33
	CALL	_io_out8
	PUSH	239
	PUSH	161
	CALL	_io_out8
	ADD	ESP,36
	PUSH	-1073741825
	PUSH	4194304
	CALL	_memtest
	PUSH	3932160
	MOV	DWORD [-932+EBP],EAX
	CALL	_memman_init
	PUSH	647168
	PUSH	4096
	PUSH	3932160
	CALL	_memman_free
	MOV	EAX,DWORD [-932+EBP]
	SUB	EAX,4194304
	PUSH	EAX
	PUSH	4194304
	PUSH	3932160
	CALL	_memman_free
	ADD	ESP,36
	CALL	_init_palette
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [4088]
	PUSH	3932160
	CALL	_shtctl_init
	PUSH	3932160
	MOV	DWORD [-936+EBP],EAX
	CALL	_task_init
	PUSH	0
	PUSH	1
	MOV	DWORD [-948+EBP],EAX
	PUSH	EAX
	MOV	DWORD [-20+EBP],EAX
	CALL	_task_run
	ADD	ESP,32
	PUSH	DWORD [-936+EBP]
	CALL	_sheet_alloc
	MOVSX	EDX,WORD [4086]
	MOV	DWORD [-940+EBP],EAX
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
	PUSH	DWORD [-940+EBP]
	CALL	_sheet_setbuf
	ADD	ESP,32
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	EBX
	CALL	_init_screen8
	ADD	ESP,12
L8:
	PUSH	DWORD [-936+EBP]
	CALL	_sheet_alloc
	PUSH	7488
	PUSH	3932160
	MOV	DWORD [-636+EBP+ESI*4],EAX
	CALL	_memman_alloc_4k
	PUSH	-1
	MOV	EBX,EAX
	PUSH	52
	PUSH	144
	PUSH	EAX
	PUSH	DWORD [-636+EBP+ESI*4]
	CALL	_sheet_setbuf
	LEA	EAX,DWORD [-92+EBP]
	ADD	ESP,32
	PUSH	ESI
	PUSH	LC0
	PUSH	EAX
	CALL	_sprintf
	LEA	EDX,DWORD [-92+EBP]
	PUSH	0
	PUSH	EDX
	PUSH	52
	PUSH	144
	PUSH	EBX
	CALL	_make_window8
	ADD	ESP,32
	CALL	_task_alloc
	PUSH	65536
	MOV	EBX,EAX
	PUSH	3932160
	MOV	DWORD [-908+EBP+ESI*4],EAX
	CALL	_memman_alloc_4k
	ADD	EAX,65528
	MOV	DWORD [72+EBX],EAX
	MOV	EBX,DWORD [-636+EBP+ESI*4]
	MOV	EAX,DWORD [-908+EBP+ESI*4]
	MOV	ECX,DWORD [72+EAX]
	MOV	DWORD [48+EAX],_task_b_main
	MOV	DWORD [88+EAX],8
	MOV	DWORD [92+EAX],16
	MOV	DWORD [96+EAX],8
	MOV	DWORD [100+EAX],8
	MOV	DWORD [104+EAX],8
	MOV	DWORD [108+EAX],8
	MOV	DWORD [4+ECX],EBX
	LEA	EBX,DWORD [1+ESI]
	PUSH	EBX
	MOV	ESI,EBX
	PUSH	2
	PUSH	EAX
	CALL	_task_run
	ADD	ESP,20
	CMP	EBX,2
	JLE	L8
	PUSH	DWORD [-936+EBP]
	CALL	_sheet_alloc
	PUSH	8320
	PUSH	3932160
	MOV	EDI,EAX
	CALL	_memman_alloc_4k
	PUSH	-1
	PUSH	52
	MOV	EBX,EAX
	PUSH	144
	PUSH	EAX
	PUSH	EDI
	CALL	_sheet_setbuf
	ADD	ESP,32
	PUSH	1
	PUSH	LC1
	PUSH	52
	PUSH	144
	PUSH	EBX
	LEA	EBX,DWORD [-892+EBP]
	CALL	_make_window8
	PUSH	7
	PUSH	16
	PUSH	128
	PUSH	28
	PUSH	8
	PUSH	EDI
	CALL	_make_textbox8
	ADD	ESP,44
	MOV	DWORD [-924+EBP],8
	MOV	DWORD [-928+EBP],7
	CALL	_timer_alloc
	PUSH	1
	MOV	DWORD [-912+EBP],EAX
	LEA	EAX,DWORD [-44+EBP]
	PUSH	EAX
	PUSH	DWORD [-912+EBP]
	CALL	_timer_init
	PUSH	50
	PUSH	DWORD [-912+EBP]
	CALL	_timer_settime
	PUSH	DWORD [-936+EBP]
	CALL	_sheet_alloc
	PUSH	99
	PUSH	16
	PUSH	16
	MOV	DWORD [-944+EBP],EAX
	PUSH	EBX
	PUSH	EAX
	CALL	_sheet_setbuf
	ADD	ESP,44
	PUSH	99
	PUSH	EBX
	MOV	EBX,2
	CALL	_init_mouse_cursor8
	MOVSX	EAX,WORD [4084]
	LEA	ECX,DWORD [-16+EAX]
	MOV	EAX,ECX
	CDQ
	IDIV	EBX
	MOV	DWORD [-916+EBP],EAX
	MOVSX	EAX,WORD [4086]
	PUSH	0
	LEA	ECX,DWORD [-44+EAX]
	PUSH	0
	MOV	EAX,ECX
	CDQ
	IDIV	EBX
	PUSH	DWORD [-940+EBP]
	MOV	DWORD [-920+EBP],EAX
	LEA	EBX,DWORD [-92+EBP]
	CALL	_sheet_slide
	PUSH	56
	PUSH	168
	PUSH	DWORD [-636+EBP]
	CALL	_sheet_slide
	ADD	ESP,32
	PUSH	116
	PUSH	8
	PUSH	DWORD [-632+EBP]
	CALL	_sheet_slide
	PUSH	116
	PUSH	168
	PUSH	DWORD [-628+EBP]
	CALL	_sheet_slide
	PUSH	56
	PUSH	8
	PUSH	EDI
	CALL	_sheet_slide
	ADD	ESP,36
	PUSH	DWORD [-920+EBP]
	PUSH	DWORD [-916+EBP]
	PUSH	DWORD [-944+EBP]
	CALL	_sheet_slide
	PUSH	0
	PUSH	DWORD [-940+EBP]
	CALL	_sheet_updown
	PUSH	1
	PUSH	DWORD [-636+EBP]
	CALL	_sheet_updown
	PUSH	2
	PUSH	DWORD [-632+EBP]
	CALL	_sheet_updown
	ADD	ESP,36
	PUSH	3
	PUSH	DWORD [-628+EBP]
	CALL	_sheet_updown
	PUSH	4
	PUSH	EDI
	CALL	_sheet_updown
	PUSH	5
	PUSH	DWORD [-944+EBP]
	CALL	_sheet_updown
	PUSH	DWORD [-920+EBP]
	PUSH	DWORD [-916+EBP]
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
	PUSH	DWORD [-940+EBP]
	CALL	_putfonts8_asc_sht
	PUSH	3932160
	CALL	_memman_total
	SHR	DWORD [-932+EBP],20
	SHR	EAX,10
	MOV	DWORD [ESP],EAX
	PUSH	DWORD [-932+EBP]
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
	PUSH	DWORD [-940+EBP]
	CALL	_putfonts8_asc_sht
	ADD	ESP,28
L9:
	LEA	EBX,DWORD [-44+EBP]
	CALL	_io_cli
	PUSH	EBX
	CALL	_fifo32_status
	POP	ESI
	TEST	EAX,EAX
	JE	L36
	PUSH	EBX
	CALL	_fifo32_get
	MOV	ESI,EAX
	CALL	_io_sti
	POP	EDX
	LEA	EAX,DWORD [-256+ESI]
	CMP	EAX,255
	JBE	L37
	LEA	EAX,DWORD [-512+ESI]
	CMP	EAX,255
	JBE	L38
	CMP	ESI,1
	JG	L9
	TEST	ESI,ESI
	JE	L31
	PUSH	0
	PUSH	EBX
	PUSH	DWORD [-912+EBP]
	CALL	_timer_init
	MOV	DWORD [-928+EBP],0
L35:
	ADD	ESP,12
	PUSH	50
	PUSH	DWORD [-912+EBP]
	CALL	_timer_settime
	MOV	EAX,DWORD [-924+EBP]
	PUSH	43
	ADD	EAX,7
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-924+EBP]
	PUSH	DWORD [-928+EBP]
	PUSH	DWORD [4+EDI]
	PUSH	DWORD [EDI]
	CALL	_boxfill8
	MOV	EAX,DWORD [-924+EBP]
	ADD	ESP,36
	ADD	EAX,8
	PUSH	44
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-924+EBP]
	PUSH	EDI
	CALL	_sheet_refresh
	ADD	ESP,20
	JMP	L9
L31:
	PUSH	1
	PUSH	EBX
	PUSH	DWORD [-912+EBP]
	CALL	_timer_init
	MOV	DWORD [-928+EBP],7
	JMP	L35
L38:
	MOV	EDX,ESI
	MOVZX	EAX,DL
	PUSH	EAX
	LEA	EAX,DWORD [-620+EBP]
	PUSH	EAX
	CALL	_mouse_decode
	POP	EDX
	POP	ECX
	TEST	EAX,EAX
	JE	L9
	PUSH	DWORD [-612+EBP]
	PUSH	DWORD [-616+EBP]
	PUSH	LC6
	LEA	EBX,DWORD [-92+EBP]
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,16
	MOV	EAX,DWORD [-608+EBP]
	TEST	EAX,1
	JE	L21
	MOV	BYTE [-91+EBP],76
L21:
	TEST	EAX,2
	JE	L22
	MOV	BYTE [-89+EBP],82
L22:
	AND	EAX,4
	JE	L23
	MOV	BYTE [-90+EBP],67
L23:
	PUSH	15
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	16
	PUSH	32
	PUSH	DWORD [-940+EBP]
	CALL	_putfonts8_asc_sht
	MOV	EDX,DWORD [-616+EBP]
	MOV	EAX,DWORD [-612+EBP]
	ADD	ESP,28
	ADD	DWORD [-920+EBP],EAX
	ADD	DWORD [-916+EBP],EDX
	JS	L39
L24:
	CMP	DWORD [-920+EBP],0
	JS	L40
L25:
	MOVSX	EAX,WORD [4084]
	DEC	EAX
	CMP	DWORD [-916+EBP],EAX
	JLE	L26
	MOV	DWORD [-916+EBP],EAX
L26:
	MOVSX	EAX,WORD [4086]
	DEC	EAX
	CMP	DWORD [-920+EBP],EAX
	JLE	L27
	MOV	DWORD [-920+EBP],EAX
L27:
	PUSH	DWORD [-920+EBP]
	PUSH	DWORD [-916+EBP]
	PUSH	LC2
	PUSH	EBX
	CALL	_sprintf
	PUSH	10
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	0
	PUSH	0
	PUSH	DWORD [-940+EBP]
	CALL	_putfonts8_asc_sht
	ADD	ESP,44
	PUSH	DWORD [-920+EBP]
	PUSH	DWORD [-916+EBP]
	PUSH	DWORD [-944+EBP]
	CALL	_sheet_slide
	ADD	ESP,12
	TEST	DWORD [-608+EBP],1
	JE	L9
	MOV	EAX,DWORD [-920+EBP]
	SUB	EAX,8
	PUSH	EAX
	MOV	EAX,DWORD [-916+EBP]
	SUB	EAX,80
	PUSH	EAX
	PUSH	EDI
	CALL	_sheet_slide
	ADD	ESP,12
	JMP	L9
L40:
	MOV	DWORD [-920+EBP],0
	JMP	L25
L39:
	MOV	DWORD [-916+EBP],0
	JMP	L24
L37:
	PUSH	EAX
	LEA	EBX,DWORD [-92+EBP]
	PUSH	LC4
	PUSH	EBX
	CALL	_sprintf
	PUSH	2
	PUSH	EBX
	PUSH	14
	PUSH	7
	PUSH	16
	PUSH	0
	PUSH	DWORD [-940+EBP]
	CALL	_putfonts8_asc_sht
	ADD	ESP,40
	CMP	ESI,339
	JG	L9
	MOV	AL,BYTE [_keytable.0-256+ESI]
	TEST	AL,AL
	JE	L16
	CMP	DWORD [-924+EBP],143
	JG	L16
	PUSH	1
	MOV	BYTE [-92+EBP],AL
	PUSH	EBX
	PUSH	7
	PUSH	0
	PUSH	28
	PUSH	DWORD [-924+EBP]
	PUSH	EDI
	MOV	BYTE [-91+EBP],0
	CALL	_putfonts8_asc_sht
	ADD	ESP,28
	ADD	DWORD [-924+EBP],8
L16:
	CMP	ESI,270
	JE	L41
L17:
	MOV	EAX,DWORD [-924+EBP]
	PUSH	43
	ADD	EAX,7
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-924+EBP]
	PUSH	DWORD [-928+EBP]
	PUSH	DWORD [4+EDI]
	PUSH	DWORD [EDI]
	CALL	_boxfill8
	MOV	EAX,DWORD [-924+EBP]
	PUSH	44
	ADD	EAX,8
	PUSH	EAX
	PUSH	28
	PUSH	DWORD [-924+EBP]
	PUSH	EDI
	CALL	_sheet_refresh
	ADD	ESP,48
	JMP	L9
L41:
	CMP	DWORD [-924+EBP],8
	JLE	L17
	PUSH	1
	PUSH	LC5
	PUSH	7
	PUSH	0
	PUSH	28
	PUSH	DWORD [-924+EBP]
	PUSH	EDI
	CALL	_putfonts8_asc_sht
	ADD	ESP,28
	SUB	DWORD [-924+EBP],8
	JMP	L17
L36:
	PUSH	DWORD [-948+EBP]
	CALL	_task_sleep
	CALL	_io_stihlt
	POP	ECX
	JMP	L9
[SECTION .data]
_closebtn.1:
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
	GLOBAL	_make_window8
_make_window8:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	SUB	ESP,12
	CMP	BYTE [24+EBP],0
	JE	L43
	MOV	BYTE [-17+EBP],7
	MOV	BYTE [-18+EBP],12
L44:
	MOV	EAX,DWORD [12+EBP]
	PUSH	0
	DEC	EAX
	PUSH	EAX
	MOV	DWORD [-24+EBP],EAX
	PUSH	0
	PUSH	0
	PUSH	8
	PUSH	DWORD [12+EBP]
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	ESI,DWORD [12+EBP]
	PUSH	1
	SUB	ESI,2
	PUSH	ESI
	PUSH	1
	PUSH	1
	PUSH	7
	PUSH	DWORD [12+EBP]
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	EDI,DWORD [16+EBP]
	ADD	ESP,56
	DEC	EDI
	PUSH	EDI
	PUSH	0
	PUSH	0
	PUSH	0
	PUSH	8
	PUSH	DWORD [12+EBP]
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	EBX,DWORD [16+EBP]
	SUB	EBX,2
	PUSH	EBX
	PUSH	1
	PUSH	1
	PUSH	1
	PUSH	7
	PUSH	DWORD [12+EBP]
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	EBX
	PUSH	ESI
	PUSH	1
	PUSH	ESI
	PUSH	15
	PUSH	DWORD [12+EBP]
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	PUSH	EDI
	PUSH	DWORD [-24+EBP]
	PUSH	0
	PUSH	DWORD [-24+EBP]
	PUSH	0
	PUSH	DWORD [12+EBP]
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	EAX,DWORD [16+EBP]
	ADD	ESP,56
	SUB	EAX,3
	PUSH	EAX
	MOV	EAX,DWORD [12+EBP]
	SUB	EAX,3
	PUSH	EAX
	PUSH	2
	PUSH	2
	PUSH	8
	PUSH	DWORD [12+EBP]
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	EAX,DWORD [12+EBP]
	PUSH	20
	SUB	EAX,4
	PUSH	EAX
	PUSH	3
	PUSH	3
	MOVZX	EAX,BYTE [-18+EBP]
	PUSH	EAX
	PUSH	DWORD [12+EBP]
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	EBX
	PUSH	ESI
	PUSH	EBX
	PUSH	1
	PUSH	15
	PUSH	DWORD [12+EBP]
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	PUSH	EDI
	PUSH	DWORD [-24+EBP]
	PUSH	EDI
	XOR	EDI,EDI
	PUSH	0
	PUSH	0
	PUSH	DWORD [12+EBP]
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	DWORD [20+EBP]
	MOVSX	EAX,BYTE [-17+EBP]
	PUSH	EAX
	PUSH	4
	PUSH	24
	PUSH	DWORD [12+EBP]
	PUSH	DWORD [8+EBP]
	CALL	_putfonts8_asc
	ADD	ESP,24
	IMUL	EBX,DWORD [12+EBP],5
	MOV	DWORD [-16+EBP],0
L60:
	MOV	EAX,DWORD [12+EBP]
	MOV	EDX,DWORD [8+EBP]
	ADD	EAX,EBX
	XOR	ESI,ESI
	LEA	ECX,DWORD [-21+EDX+EAX*1]
L59:
	MOV	DL,BYTE [_closebtn.1+ESI+EDI*1]
	CMP	DL,64
	JE	L65
	CMP	DL,36
	JE	L66
	CMP	DL,81
	MOV	DL,8
	SETNE	AL
	SUB	DL,AL
L54:
	INC	ESI
	MOV	BYTE [ECX],DL
	INC	ECX
	CMP	ESI,15
	JLE	L59
	INC	DWORD [-16+EBP]
	ADD	EDI,16
	ADD	EBX,DWORD [12+EBP]
	CMP	DWORD [-16+EBP],13
	JLE	L60
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
L66:
	MOV	DL,15
	JMP	L54
L65:
	XOR	EDX,EDX
	JMP	L54
L43:
	MOV	BYTE [-17+EBP],8
	MOV	BYTE [-18+EBP],15
	JMP	L44
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
L68:
	LEA	EBX,DWORD [-44+EBP]
	CALL	_io_cli
	PUSH	EBX
	INC	EDI
	CALL	_fifo32_status
	POP	EDX
	TEST	EAX,EAX
	JE	L74
	PUSH	EBX
	CALL	_fifo32_get
	MOV	EBX,EAX
	CALL	_io_sti
	POP	ECX
	CMP	EBX,100
	JNE	L68
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
	JMP	L68
L74:
	CALL	_io_sti
	JMP	L68
