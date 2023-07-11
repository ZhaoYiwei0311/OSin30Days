#include "bootpack.h"

struct FIFO8 mousefifo;

void inthandler2c(int *esp) {
/* PS/2マウスからの割り込み */

	unsigned char data;
	io_out8(PIC1_OCW2, 0x64);	/* IRQ-12受付完了をPIC1に通知 */
	io_out8(PIC0_OCW2, 0x62);	/* IRQ-02受付完了をPIC0に通知 */
	data = io_in8(PORT_KEYDAT);
	fifo8_put(&mousefifo, data);
	return;
}

#define KEYCMD_SENDTO_MOUSE		0xd4
#define MOUSECMD_ENABLE			0xf4

void enable_mouse(struct MOUSE_DEC *mdec) {
	/* 鼠标有效 */
	wait_KBC_sendready();
    io_out8(PORT_KEYCMD, KEYCMD_SENDTO_MOUSE);
    wait_KBC_sendready();
    io_out8(PORT_KEYDAT, MOUSECMD_ENABLE);
	mdec->phase =0; // 等待0xfa的阶段
    return; 
}


int mouse_decode(struct MOUSE_DEC *mdec, unsigned char dat) {
	if (mdec->phase == 0) {
		/* 等待鼠标0xfa的状态 */
		if (dat == 0xfa) {
			mdec->phase = 1;
		}
		return 0;
	}
	if (mdec->phase == 1) {
		/* 等待鼠标的第一字节 */
		if ((dat & 0xc8) == 0x08) {
			// 如果第一字节正确, 即对点击有反应的部分在8-f范围内, 如果不在dat就会被舍去
			// 这么做是为防止硬件错误如接触不良导致的数据错位
			mdec->buf[0] = dat;
			mdec->phase = 2;
		}
		return 0;
	} 
	if (mdec->phase == 2) {
		/* 等待鼠标的第二字节 */
		mdec->buf[1] = dat;
		mdec->phase = 3;
		return 0;
	} 
	if (mdec->phase == 3) {
		/* 等待鼠标的第三字节 */
		mdec->buf[2] = dat;
		mdec->phase = 1;
		mdec->btn = mdec->buf[0] & 0x07; // 取出后三位
		mdec->x = mdec->buf[1];

		mdec->y = mdec->buf[2];
		if ((mdec->buf[0] & 0x10) != 0) {
			mdec->x |= 0xffffff00; // 将x第8位和以后都设为1
		}
		if ((mdec->buf[0] & 0x20) != 0) {
			mdec->y |= 0xffffff00; // 将y第8位和以后都设为1
		}
		mdec->y = -mdec->y; // 鼠标的y方向与画面符号相反
		return 1;
	}
	return -1;
}