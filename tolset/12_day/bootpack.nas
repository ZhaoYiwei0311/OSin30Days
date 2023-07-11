[FORMAT "WCOFF"]
[INSTRSET "i486p"]
[OPTIMIZE 1]
[OPTION 1]
[BITS 32]
	EXTERN	_init_gdtidt
	EXTERN	_init_pic
	EXTERN	_io_sti
	EXTERN	_keyfifo
	EXTERN	_fifo8_init
	EXTERN	_mousefifo
	EXTERN	_init_pit
	EXTERN	_io_out8
	EXTERN	_timer_alloc
	EXTERN	_timer_init
	EXTERN	_timer_settime
	EXTERN	_init_keyboard
	EXTERN	_enable_mouse
	EXTERN	_memtest
	EXTERN	_memman_init
	EXTERN	_memman_free
	EXTERN	_init_palette
	EXTERN	_shtctl_init
	EXTERN	_sheet_alloc
	EXTERN	_memman_alloc_4k
	EXTERN	_sheet_setbuf
	EXTERN	_init_screen8
	EXTERN	_init_mouse_cursor8
	EXTERN	_sheet_slide
	EXTERN	_sheet_updown
	EXTERN	_sprintf
	EXTERN	_putfonts8_asc
	EXTERN	_memman_total
	EXTERN	_sheet_refresh
	EXTERN	_timerctl
	EXTERN	_boxfill8
	EXTERN	_io_cli
	EXTERN	_fifo8_status
	EXTERN	_fifo8_get
	EXTERN	_mouse_decode
[FILE "bootpack.c"]
[SECTION .data]
LC0:
	DB	"counter",0x00
LC1:
	DB	"(%3d, %3d)",0x00
LC2:
	DB	"memory %dMB   free : %dKB",0x00
LC3:
	DB	"%010d",0x00
LC7:
	DB	"3[sec]",0x00
LC6:
	DB	"10[sec]",0x00
LC5:
	DB	"[lcr %4d %4d]",0x00
LC4:
	DB	"%02X",0x00
[SECTION .text]
	GLOBAL	_HariMain
_HariMain:
	PUSH	EBP
	MOV	EBP,ESP
	PUSH	EDI
	PUSH	ESI
	PUSH	EBX
	LEA	EBX,DWORD [-44+EBP]
	SUB	ESP,640
	CALL	_init_gdtidt
	CALL	_init_pic
	CALL	_io_sti
	LEA	EAX,DWORD [-188+EBP]
	PUSH	EAX
	PUSH	32
	PUSH	_keyfifo
	CALL	_fifo8_init
	LEA	EAX,DWORD [-316+EBP]
	PUSH	EAX
	PUSH	128
	PUSH	_mousefifo
	CALL	_fifo8_init
	CALL	_init_pit
	PUSH	248
	PUSH	33
	CALL	_io_out8
	ADD	ESP,32
	PUSH	239
	PUSH	161
	CALL	_io_out8
	LEA	EAX,DWORD [-596+EBP]
	PUSH	EAX
	PUSH	8
	PUSH	EBX
	CALL	_fifo8_init
	CALL	_timer_alloc
	PUSH	1
	PUSH	EBX
	MOV	ESI,EAX
	PUSH	EAX
	LEA	EBX,DWORD [-76+EBP]
	CALL	_timer_init
	ADD	ESP,32
	PUSH	1000
	PUSH	ESI
	CALL	_timer_settime
	LEA	EAX,DWORD [-604+EBP]
	PUSH	EAX
	PUSH	8
	PUSH	EBX
	CALL	_fifo8_init
	CALL	_timer_alloc
	PUSH	1
	PUSH	EBX
	MOV	ESI,EAX
	PUSH	EAX
	LEA	EBX,DWORD [-108+EBP]
	CALL	_timer_init
	ADD	ESP,32
	PUSH	300
	PUSH	ESI
	CALL	_timer_settime
	LEA	EAX,DWORD [-612+EBP]
	PUSH	EAX
	PUSH	8
	PUSH	EBX
	CALL	_fifo8_init
	CALL	_timer_alloc
	PUSH	1
	PUSH	EBX
	PUSH	EAX
	MOV	DWORD [-616+EBP],EAX
	CALL	_timer_init
	ADD	ESP,32
	PUSH	50
	PUSH	DWORD [-616+EBP]
	CALL	_timer_settime
	CALL	_init_keyboard
	LEA	EAX,DWORD [-332+EBP]
	PUSH	EAX
	CALL	_enable_mouse
	PUSH	-1073741825
	PUSH	4194304
	CALL	_memtest
	PUSH	3932160
	MOV	ESI,EAX
	CALL	_memman_init
	PUSH	647168
	PUSH	4096
	PUSH	3932160
	CALL	_memman_free
	LEA	EAX,DWORD [-4194304+ESI]
	ADD	ESP,36
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
	MOV	EBX,EAX
	PUSH	EAX
	CALL	_sheet_alloc
	ADD	ESP,32
	PUSH	EBX
	MOV	DWORD [-628+EBP],EAX
	CALL	_sheet_alloc
	PUSH	EBX
	LEA	EBX,DWORD [-588+EBP]
	MOV	DWORD [-632+EBP],EAX
	CALL	_sheet_alloc
	MOVSX	EDX,WORD [4086]
	MOV	DWORD [-636+EBP],EAX
	MOVSX	EAX,WORD [4084]
	IMUL	EAX,EDX
	PUSH	EAX
	PUSH	3932160
	CALL	_memman_alloc_4k
	PUSH	8320
	PUSH	3932160
	MOV	DWORD [-640+EBP],EAX
	CALL	_memman_alloc_4k
	PUSH	-1
	MOV	DWORD [-644+EBP],EAX
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-640+EBP]
	PUSH	DWORD [-628+EBP]
	CALL	_sheet_setbuf
	ADD	ESP,44
	PUSH	99
	PUSH	16
	PUSH	16
	PUSH	EBX
	PUSH	DWORD [-632+EBP]
	CALL	_sheet_setbuf
	PUSH	-1
	PUSH	52
	PUSH	160
	PUSH	DWORD [-644+EBP]
	PUSH	DWORD [-636+EBP]
	CALL	_sheet_setbuf
	ADD	ESP,40
	MOVSX	EAX,WORD [4086]
	PUSH	EAX
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-640+EBP]
	CALL	_init_screen8
	PUSH	99
	PUSH	EBX
	MOV	EBX,2
	CALL	_init_mouse_cursor8
	PUSH	LC0
	PUSH	52
	PUSH	160
	PUSH	DWORD [-644+EBP]
	CALL	_make_window8
	ADD	ESP,36
	PUSH	0
	PUSH	0
	PUSH	DWORD [-628+EBP]
	CALL	_sheet_slide
	MOVSX	EAX,WORD [4084]
	LEA	ECX,DWORD [-16+EAX]
	MOV	EAX,ECX
	CDQ
	IDIV	EBX
	MOV	DWORD [-620+EBP],EAX
	MOVSX	EAX,WORD [4086]
	LEA	ECX,DWORD [-44+EAX]
	MOV	EAX,ECX
	CDQ
	IDIV	EBX
	PUSH	EAX
	MOV	DWORD [-624+EBP],EAX
	PUSH	DWORD [-620+EBP]
	PUSH	DWORD [-632+EBP]
	LEA	EBX,DWORD [-156+EBP]
	CALL	_sheet_slide
	PUSH	72
	PUSH	80
	PUSH	DWORD [-636+EBP]
	CALL	_sheet_slide
	ADD	ESP,36
	PUSH	0
	PUSH	DWORD [-628+EBP]
	CALL	_sheet_updown
	PUSH	1
	PUSH	DWORD [-636+EBP]
	CALL	_sheet_updown
	PUSH	2
	PUSH	DWORD [-632+EBP]
	CALL	_sheet_updown
	PUSH	DWORD [-624+EBP]
	PUSH	DWORD [-620+EBP]
	PUSH	LC1
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,40
	PUSH	EBX
	PUSH	7
	PUSH	0
	PUSH	0
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-640+EBP]
	CALL	_putfonts8_asc
	PUSH	3932160
	CALL	_memman_total
	SHR	EAX,10
	SHR	ESI,20
	MOV	DWORD [ESP],EAX
	PUSH	ESI
	PUSH	LC2
	PUSH	EBX
	CALL	_sprintf
	ADD	ESP,40
	PUSH	EBX
	PUSH	7
	PUSH	32
	PUSH	0
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-640+EBP]
	CALL	_putfonts8_asc
	PUSH	48
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	0
L27:
	PUSH	0
	PUSH	DWORD [-628+EBP]
	CALL	_sheet_refresh
	ADD	ESP,44
L2:
	PUSH	DWORD [_timerctl]
	PUSH	LC3
	LEA	EBX,DWORD [-156+EBP]
	PUSH	EBX
	LEA	EDI,DWORD [-44+EBP]
	LEA	ESI,DWORD [-108+EBP]
	CALL	_sprintf
	PUSH	43
	PUSH	119
	PUSH	28
	PUSH	40
	PUSH	8
	PUSH	160
	PUSH	DWORD [-644+EBP]
	CALL	_boxfill8
	ADD	ESP,40
	PUSH	EBX
	PUSH	0
	PUSH	28
	PUSH	40
	PUSH	160
	PUSH	DWORD [-644+EBP]
	CALL	_putfonts8_asc
	PUSH	44
	PUSH	120
	PUSH	28
	PUSH	40
	PUSH	DWORD [-636+EBP]
	CALL	_sheet_refresh
	ADD	ESP,44
	CALL	_io_cli
	PUSH	_keyfifo
	CALL	_fifo8_status
	PUSH	_mousefifo
	MOV	EBX,EAX
	CALL	_fifo8_status
	PUSH	EDI
	ADD	EBX,EAX
	CALL	_fifo8_status
	LEA	EDX,DWORD [-76+EBP]
	PUSH	EDX
	ADD	EBX,EAX
	CALL	_fifo8_status
	PUSH	ESI
	ADD	EBX,EAX
	CALL	_fifo8_status
	ADD	ESP,20
	LEA	EAX,DWORD [EAX+EBX*1]
	TEST	EAX,EAX
	JE	L29
	PUSH	_keyfifo
	CALL	_fifo8_status
	POP	ECX
	TEST	EAX,EAX
	JNE	L30
	PUSH	_mousefifo
	CALL	_fifo8_status
	POP	EDX
	TEST	EAX,EAX
	JNE	L31
	PUSH	EDI
	CALL	_fifo8_status
	POP	EBX
	TEST	EAX,EAX
	JNE	L32
	LEA	EDX,DWORD [-76+EBP]
	PUSH	EDX
	CALL	_fifo8_status
	POP	ECX
	TEST	EAX,EAX
	JNE	L33
	PUSH	ESI
	CALL	_fifo8_status
	POP	EDX
	TEST	EAX,EAX
	JE	L2
	PUSH	ESI
	CALL	_fifo8_get
	MOV	EBX,EAX
	POP	EAX
	TEST	EBX,EBX
	JE	L24
	PUSH	0
	PUSH	ESI
	PUSH	DWORD [-616+EBP]
	CALL	_timer_init
	PUSH	111
	PUSH	15
	PUSH	96
	PUSH	8
	PUSH	7
L28:
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-640+EBP]
	CALL	_boxfill8
	ADD	ESP,40
	PUSH	50
	PUSH	DWORD [-616+EBP]
	CALL	_timer_settime
	PUSH	112
	PUSH	16
	PUSH	96
	PUSH	8
	PUSH	DWORD [-628+EBP]
	CALL	_sheet_refresh
	ADD	ESP,28
	JMP	L2
L24:
	PUSH	1
	PUSH	ESI
	PUSH	DWORD [-616+EBP]
	CALL	_timer_init
	PUSH	111
	PUSH	15
	PUSH	96
	PUSH	8
	PUSH	14
	JMP	L28
L33:
	LEA	EBX,DWORD [-76+EBP]
	PUSH	EBX
	CALL	_fifo8_get
	PUSH	LC7
	PUSH	7
	PUSH	80
	PUSH	0
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-640+EBP]
	CALL	_putfonts8_asc
	PUSH	96
	PUSH	48
	PUSH	80
L26:
	PUSH	0
	PUSH	DWORD [-628+EBP]
	CALL	_sheet_refresh
	ADD	ESP,48
	JMP	L2
L32:
	PUSH	EDI
	CALL	_fifo8_get
	PUSH	LC6
	PUSH	7
	PUSH	64
	PUSH	0
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-640+EBP]
	CALL	_putfonts8_asc
	PUSH	80
	PUSH	56
	PUSH	64
	JMP	L26
L31:
	PUSH	_mousefifo
	CALL	_fifo8_get
	MOV	EBX,EAX
	CALL	_io_sti
	MOVZX	EAX,BL
	PUSH	EAX
	LEA	EAX,DWORD [-332+EBP]
	PUSH	EAX
	CALL	_mouse_decode
	ADD	ESP,12
	TEST	EAX,EAX
	JE	L2
	PUSH	DWORD [-324+EBP]
	PUSH	DWORD [-328+EBP]
	PUSH	LC5
	LEA	EDX,DWORD [-156+EBP]
	PUSH	EDX
	CALL	_sprintf
	ADD	ESP,16
	MOV	EAX,DWORD [-320+EBP]
	TEST	EAX,1
	JE	L11
	MOV	BYTE [-155+EBP],76
L11:
	TEST	EAX,2
	JE	L12
	MOV	BYTE [-153+EBP],82
L12:
	AND	EAX,4
	JE	L13
	MOV	BYTE [-154+EBP],67
L13:
	PUSH	31
	LEA	EBX,DWORD [-156+EBP]
	PUSH	151
	PUSH	16
	PUSH	32
	PUSH	14
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-640+EBP]
	CALL	_boxfill8
	PUSH	EBX
	PUSH	7
	PUSH	16
	PUSH	32
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-640+EBP]
	CALL	_putfonts8_asc
	ADD	ESP,52
	PUSH	32
	PUSH	152
	PUSH	16
	PUSH	32
	PUSH	DWORD [-628+EBP]
	CALL	_sheet_refresh
	MOV	EDX,DWORD [-328+EBP]
	MOV	EAX,DWORD [-324+EBP]
	ADD	ESP,20
	ADD	DWORD [-624+EBP],EAX
	ADD	DWORD [-620+EBP],EDX
	JS	L34
L14:
	CMP	DWORD [-624+EBP],0
	JS	L35
L15:
	MOVSX	EAX,WORD [4084]
	DEC	EAX
	CMP	DWORD [-620+EBP],EAX
	JLE	L16
	MOV	DWORD [-620+EBP],EAX
L16:
	MOVSX	EAX,WORD [4086]
	DEC	EAX
	CMP	DWORD [-624+EBP],EAX
	JLE	L17
	MOV	DWORD [-624+EBP],EAX
L17:
	PUSH	DWORD [-624+EBP]
	PUSH	DWORD [-620+EBP]
	PUSH	LC1
	LEA	EBX,DWORD [-156+EBP]
	PUSH	EBX
	CALL	_sprintf
	PUSH	15
	PUSH	79
	PUSH	0
	PUSH	0
	PUSH	14
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-640+EBP]
	CALL	_boxfill8
	ADD	ESP,44
	PUSH	EBX
	PUSH	7
	PUSH	0
	PUSH	0
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-640+EBP]
	CALL	_putfonts8_asc
	PUSH	16
	PUSH	80
	PUSH	0
	PUSH	0
	PUSH	DWORD [-628+EBP]
	CALL	_sheet_refresh
	ADD	ESP,44
	PUSH	DWORD [-624+EBP]
	PUSH	DWORD [-620+EBP]
	PUSH	DWORD [-632+EBP]
	CALL	_sheet_slide
	ADD	ESP,12
	JMP	L2
L35:
	MOV	DWORD [-624+EBP],0
	JMP	L15
L34:
	MOV	DWORD [-620+EBP],0
	JMP	L14
L30:
	PUSH	_keyfifo
	CALL	_fifo8_get
	MOV	EBX,EAX
	CALL	_io_sti
	PUSH	EBX
	LEA	EBX,DWORD [-156+EBP]
	PUSH	LC4
	PUSH	EBX
	CALL	_sprintf
	PUSH	31
	PUSH	15
	PUSH	16
	PUSH	0
	PUSH	14
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-640+EBP]
	CALL	_boxfill8
	ADD	ESP,44
	PUSH	EBX
	PUSH	7
	PUSH	16
	PUSH	0
	MOVSX	EAX,WORD [4084]
	PUSH	EAX
	PUSH	DWORD [-640+EBP]
	CALL	_putfonts8_asc
	PUSH	32
	PUSH	16
	PUSH	16
	JMP	L27
L29:
	CALL	_io_sti
	JMP	L2
[SECTION .data]
_closebtn.0:
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
	SUB	ESP,20
	MOV	EBX,DWORD [12+EBP]
	PUSH	0
	LEA	EAX,DWORD [-1+EBX]
	LEA	EDI,DWORD [-2+EBX]
	PUSH	EAX
	MOV	DWORD [-20+EBP],EAX
	PUSH	0
	PUSH	0
	PUSH	8
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	PUSH	1
	PUSH	EDI
	PUSH	1
	PUSH	1
	PUSH	7
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	EDX,DWORD [16+EBP]
	ADD	ESP,56
	DEC	EDX
	MOV	DWORD [-24+EBP],EDX
	PUSH	EDX
	PUSH	0
	PUSH	0
	PUSH	0
	PUSH	8
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	ESI,DWORD [16+EBP]
	SUB	ESI,2
	PUSH	ESI
	PUSH	1
	PUSH	1
	PUSH	1
	PUSH	7
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	ESI
	PUSH	EDI
	PUSH	1
	PUSH	EDI
	PUSH	15
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	PUSH	DWORD [-24+EBP]
	PUSH	DWORD [-20+EBP]
	PUSH	0
	PUSH	DWORD [-20+EBP]
	PUSH	0
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	MOV	EAX,DWORD [16+EBP]
	ADD	ESP,56
	SUB	EAX,3
	PUSH	EAX
	LEA	EAX,DWORD [-3+EBX]
	PUSH	EAX
	PUSH	2
	PUSH	2
	PUSH	8
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	LEA	EAX,DWORD [-4+EBX]
	PUSH	20
	PUSH	EAX
	PUSH	3
	PUSH	3
	PUSH	12
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	ESI
	PUSH	EDI
	PUSH	ESI
	PUSH	1
	PUSH	15
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	PUSH	DWORD [-24+EBP]
	PUSH	DWORD [-20+EBP]
	PUSH	DWORD [-24+EBP]
	PUSH	0
	PUSH	0
	IMUL	ESI,EBX,5
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_boxfill8
	ADD	ESP,56
	PUSH	DWORD [20+EBP]
	PUSH	7
	PUSH	4
	PUSH	24
	PUSH	EBX
	PUSH	DWORD [8+EBP]
	CALL	_putfonts8_asc
	ADD	ESP,24
	MOV	DWORD [-16+EBP],0
	MOV	DWORD [-32+EBP],0
L52:
	LEA	EAX,DWORD [ESI+EBX*1]
	MOV	EDX,DWORD [8+EBP]
	XOR	EDI,EDI
	LEA	ECX,DWORD [-21+EDX+EAX*1]
L51:
	MOV	EAX,DWORD [-32+EBP]
	MOV	DL,BYTE [_closebtn.0+EDI+EAX*1]
	CMP	DL,64
	JE	L57
	CMP	DL,36
	JE	L58
	CMP	DL,81
	MOV	DL,8
	SETNE	AL
	SUB	DL,AL
L46:
	INC	EDI
	MOV	BYTE [ECX],DL
	INC	ECX
	CMP	EDI,15
	JLE	L51
	INC	DWORD [-16+EBP]
	ADD	ESI,EBX
	ADD	DWORD [-32+EBP],16
	CMP	DWORD [-16+EBP],13
	JLE	L52
	LEA	ESP,DWORD [-12+EBP]
	POP	EBX
	POP	ESI
	POP	EDI
	POP	EBP
	RET
L58:
	MOV	DL,15
	JMP	L46
L57:
	XOR	EDX,EDX
	JMP	L46
