; naskfunc
; TAB=4

[FORMAT "WCOFF"]				; オブジェクトファイルを作るモード	
[INSTRSET "i486p"]				; 486の命令まで使いたいという記述
[BITS 32]						; 32ビットモード用の機械語を作らせる
[FILE "naskfunc.nas"]			; ソースファイル名情報

		GLOBAL	_io_hlt, _io_cli, _io_sti, _io_stihlt
		GLOBAL	_io_in8,  _io_in16,  _io_in32
		GLOBAL	_io_out8, _io_out16, _io_out32
		GLOBAL	_io_load_eflags, _io_store_eflags
		GLOBAL	_load_gdtr, _load_idtr
		GLOBAL	_load_cr0, _store_cr0
		GLOBAL	_load_tr
		GLOBAL	_asm_inthandler20, _asm_inthandler21
		GLOBAL	_asm_inthandler27, _asm_inthandler2c
		GLOBAL	_asm_inthandler0d
		GLOBAL	_memtest_sub
		GLOBAL	_farjmp, _farcall
		GLOBAL	_asm_hrb_api, _start_app
		GLOBAL	_asm_cons_putchar
		EXTERN	_inthandler20, _inthandler21
		EXTERN	_inthandler27, _inthandler2c
		EXTERN	_cons_putchar
		EXTERN	_hrb_api	

[SECTION .text]

_io_hlt:	; void io_hlt(void);
		HLT
		RET

_io_cli:	; void io_cli(void);
		CLI
		RET

_io_sti:	; void io_sti(void);
		STI
		RET

_io_stihlt:	; void io_stihlt(void);
		STI
		HLT
		RET

_io_in8:	; int io_in8(int port);
		MOV		EDX,[ESP+4]		; port
		MOV		EAX,0
		IN		AL,DX
		RET

_io_in16:	; int io_in16(int port);
		MOV		EDX,[ESP+4]		; port
		MOV		EAX,0
		IN		AX,DX
		RET

_io_in32:	; int io_in32(int port);
		MOV		EDX,[ESP+4]		; port
		IN		EAX,DX
		RET

_io_out8:	; void io_out8(int port, int data);
		MOV		EDX,[ESP+4]		; port
		MOV		AL,[ESP+8]		; data
		OUT		DX,AL
		RET

_io_out16:	; void io_out16(int port, int data);
		MOV		EDX,[ESP+4]		; port
		MOV		EAX,[ESP+8]		; data
		OUT		DX,AX
		RET

_io_out32:	; void io_out32(int port, int data);
		MOV		EDX,[ESP+4]		; port
		MOV		EAX,[ESP+8]		; data
		OUT		DX,EAX
		RET

_io_load_eflags:	; int io_load_eflags(void);
		PUSHFD		; PUSH EFLAGS という意味
		POP		EAX
		RET

_io_store_eflags:	; void io_store_eflags(int eflags);
		MOV		EAX,[ESP+4]
		PUSH	EAX
		POPFD		; POP EFLAGS という意味
		RET

_load_gdtr:		; void load_gdtr(int limit, int addr);
		MOV		AX,[ESP+4]		; limit
		MOV		[ESP+6],AX
		LGDT	[ESP+6]
		RET

_load_idtr:		; void load_idtr(int limit, int addr);
		MOV		AX,[ESP+4]		; limit
		MOV		[ESP+6],AX
		LIDT	[ESP+6]
		RET

_asm_inthandler20:
		PUSH    ES
        PUSH    DS
        PUSHAD
        MOV     EAX,ESP
        PUSH    EAX
        MOV     AX,SS

        MOV     DS,AX
        MOV     ES,AX
        CALL    _inthandler20
        POP     EAX
        POPAD
        POP     DS
        POP     ES
        IRETD

_asm_inthandler21:
		PUSH	ES
		PUSH	DS
		PUSHAD
		MOV		EAX,ESP
		PUSH	EAX
		MOV		AX,SS
		MOV		DS,AX
		MOV		ES,AX
		CALL	_inthandler21
		POP		EAX
		POPAD
		POP		DS
		POP		ES
		IRETD

_asm_inthandler27:
		PUSH	ES
		PUSH	DS
		PUSHAD
		MOV		EAX,ESP
		PUSH	EAX
		MOV		AX,SS
		MOV		DS,AX
		MOV		ES,AX
		CALL	_inthandler27
		POP		EAX
		POPAD
		POP		DS
		POP		ES
		IRETD

_asm_inthandler2c:
		PUSH	ES
		PUSH	DS
		PUSHAD
		MOV		EAX,ESP
		PUSH	EAX
		MOV		AX,SS
		MOV		DS,AX
		MOV		ES,AX
		CALL	_inthandler2c
		POP		EAX
		POPAD
		POP		DS
		POP		ES
		IRETD

_asm_inthandler0d:
        STI
        PUSH    ES
        PUSH    DS
        PUSHAD
        MOV     AX,SS
        CMP     AX,1*8
        JNE     .from_app
;   当操作系统活动时产生中断的情况和之前差不多
        MOV     EAX,ESP
        PUSH    SS              ; 保存中断时的SS
        PUSH    EAX             ; 保存中断时的ESP
        MOV     AX,SS
        MOV     DS,AX
        MOV     ES,AX

        CALL    _inthandler0d
		CMP     EAX,0       ; 只有这里不同
        JNE     end_app     ; 只有这里不同
        POP 	EAX
        POPAD
        POP     DS
        POP     ES
        ADD     ESP,4           ; 在INT 0x0d中需要这句
        IRETD
.from_app:
;   当应用程序活动时产生中断
        CLI
        MOV     EAX,1*8
        MOV     DS,AX           ; 先仅将DS设定为操作系统用
        MOV     ECX,[0xfe4]     ; 操作系统的ESP
        ADD     ECX,-8
        MOV     [ECX+4],SS      ; 保存产生中断时的SS
        MOV     [ECX],ESP     	; 保存产生中断时的ESP
        MOV     SS,AX
        MOV     ES,AX
        MOV     ESP,ECX
        STI
        CALL    _inthandler0d
        CLI
        CMP     EAX,0
        JNE     .kill
        POP     ECX
        POP     EAX
        MOV     SS,AX           ; 将SS恢复为应用程序用
        MOV     ESP,ECX         ; 将ESP恢复为应用程序用
        POPAD
        POP     DS

        POP     ES
        ADD     ESP,4           ; INT 0x0d需要这句
        IRETD
.kill:
;   将应用程序强制结束
        MOV     EAX,1*8         ; 操作系统用的DS/SS
        MOV     ES,AX
        MOV     SS,AX
        MOV     DS,AX
        MOV     FS,AX
        MOV     GS,AX
        MOV     ESP,[0xfe4]     ; 强制返回到start_app时的ESP
        STI         ; 切换完成后恢复中断请求
        POPAD   ; 恢复事先保存的寄存器值
        RET

_load_cr0:		; int load_cr0(void);
		MOV		EAX,CR0
		RET

_load_tr:		; void load_tr(int tr);
		LTR		[ESP+4]			; tr
		RET

_store_cr0:		; void store_cr0(int cr0);
		MOV		EAX,[ESP+4]
		MOV		CR0,EAX
		RET

_memtest_sub: 	; unsigned int memetest_sub(unsigned int start, unsigned int end)
		PUSH	EDI		; 由于还要使用EBX, ESI, EDI
		PUSH 	ESI
		PUSH 	EBX
		MOV 	ESI,0Xaa55aa55		; pat0 = 0xaa55aa55;
		MOV 	EDI,0X55aa55aa		; pat1 = 0x55aa55aa;
		MOV 	EAX,[ESP+12+4]		; i = start;

mts_loop:
		MOV 	EBX,EAX
		ADD 	EBX,0xffc		; p = i + 0xffc;
		MOV 	EDX,[EBX]		; old = *p;
		MOV		[EBX],ESI		; *p = pat0;
		XOR		DWORD [EBX],0xffffffff		; *p ^= 0xffffffff;
		CMP		EDI,[EBX]					; if (*p != pat1) goto fin;
		JNE 	mts_fin
		XOR     DWORD [EBX],0xffffffff  	; *p ^= 0xffffffff;
        CMP     ESI,[EBX]               	; if (*p != pat0) goto fin;
        JNE     mts_fin	
		MOV 	[EBX],EDX		; *p = old;
		ADD		EAX,0x1000		; i += 0x1000;
		CMP		EAX,[ESP+12+8]	; if (i <= end) goto mts_loop;
		JBE		mts_loop
		POP 	EBX
		POP		ESI
		POP		EDI
		RET

mts_fin:
		MOV 	[EBX],EDX		; *p = old
		POP		EBX
		POP		ESI
		POP		EDI
		RET

_taskswitch4:	; void taskswitch4(void);
		JMP		4*8:0
		RET

_taskswitch3:	; void taskswitch3(void);
		JMP		3*8:0
		RET

_farjmp:		; void farjmp(int eip, int cs);
		JMP 	FAR [ESP+4]		; eip, cs
		RET

_asm_cons_putchar:
		STI
		PUSHAD
        PUSH    1
        AND     EAX,0xff    ; 将AH和EAX的高位置0，将EAX置为已存入字符编码的状态
        PUSH    EAX	
        PUSH    DWORD [0x0fec]  ; 读取内存并PUSH该值
        CALL    _cons_putchar
        ADD     ESP,12      ; 将栈中的数据丢弃
		POPAD
        IRETD

_farcall:		; void farcall(int eip, int cs);
		CALL	FAR[ESP + 4]	;eip, cs
		RET

_asm_hrb_api:
        STI
        PUSH    DS
        PUSH    ES
        PUSHAD      ; 用于保存的PUSH
        PUSHAD      ; 用于向hrb_api传值的PUSH
        MOV     AX,SS
        MOV     DS,AX       ; 将操作系统用段地址存入DS和ES
        MOV     ES,AX
        CALL    _hrb_api
        CMP     EAX,0       ; 当EAX不为0时程序结束
        JNE     end_app
        ADD     ESP,32
        POPAD
        POP     ES
        POP     DS
        IRETD
end_app:

;   EAX为tss.esp0的地址
        MOV     ESP,[EAX]
        POPAD
        RET                 ; 返回cmd_app

_start_app:	; void start_app(int eip, int cs, int esp, int ds)
		PUSHAD		;将32位寄存器的值全部保存起来
		MOV		EAX,[ESP+36] 		; 应用程序用EIP
		MOV		ECX,[ESP+40]		; 应用程序用CS
		MOV		EDX,[ESP+44]		; 应用程序用ESP
		MOV 	EBX,[ESP+48]		; 应用程序用DS/SS
		MOV		EBP,[ESP+52]		; tss.esp0的地址
		MOV		[EBP],ESP			; 保存操作系统用ESP
		MOV		[EBP+4],SS			; 保存操作系统用SS
		MOV		ES,BX
		MOV		DS,BX
		MOV		FS,BX
		MOV		GS,BX

; 下面调整栈, 以免用RETF跳转到应用程序
		OR		ECX,3				; 将应用程序用段号和3进行OR运算
		OR		EBX,3				; 将应用程序用段号和3进行OR运算
		PUSH	EBX					; 应用程序的SS
		PUSH	EDX					; 应用程序的ESP
		PUSH	ECX					; 应用程序的CS
		PUSH	EAX					; 应用程序的EIP
		RETF
; 应用程序结束后不会回到这里