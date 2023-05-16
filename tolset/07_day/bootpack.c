/* bootpack縺ｮ繝｡繧､繝ｳ */

#include "bootpack.h"
#include <stdio.h>

extern struct FIFO8 keyfifo;
extern struct FIFO8 mousefifo;
void enable_mouse(void);
void init_keyboard(void);

void HariMain(void)
{
	struct BOOTINFO *binfo = (struct BOOTINFO *) ADR_BOOTINFO;
	char s[40], mcursor[256], keybuf[32], mousebuf[128];
	int mx, my, i, j;

	init_gdtidt();
	init_pic();
	io_sti(); /* IDT/PIC縺ｮ蛻晄悄蛹悶′邨ゅｏ縺｣縺溘�ｮ縺ｧCPU縺ｮ蜑ｲ繧願ｾｼ縺ｿ遖∵ｭ｢繧定ｧ｣髯､ */

	fifo8_init(&keyfifo, 32, keybuf);		// 蛻晏ｧ句喧??
	fifo8_init(&mousefifo, 128, mousebuf); 	// 蛻晏ｧ句喧鮠�?
	io_out8(PIC0_IMR, 0xf9); /* PIC1縺ｨ繧ｭ繝ｼ繝懊�ｼ繝峨ｒ險ｱ蜿ｯ(11111001) */
	io_out8(PIC1_IMR, 0xef); /* 繝槭え繧ｹ繧定ｨｱ蜿ｯ(11101111) */

	init_keyboard();

	init_palette();
	init_screen8(binfo->vram, binfo->scrnx, binfo->scrny);
	mx = (binfo->scrnx - 16) / 2; /* 逕ｻ髱｢荳ｭ螟ｮ縺ｫ縺ｪ繧九ｈ縺�縺ｫ蠎ｧ讓呵ｨ育ｮ� */
	my = (binfo->scrny - 28 - 16) / 2;
	init_mouse_cursor8(mcursor, COL8_008484);
	putblock8_8(binfo->vram, binfo->scrnx, 16, 16, mx, my, mcursor, 16);
	sprintf(s, "(%d, %d)", mx, my);
	putfonts8_asc(binfo->vram, binfo->scrnx, 0, 0, COL8_FFFFFF, s);

	enable_mouse();

	for (;;) {
		io_cli();
		if (fifo8_status(&keyfifo) + fifo8_status(&mousefifo) == 0) {
			io_stihlt();
		} else {
			if (fifo8_status(&keyfifo) != 0) {
				i = fifo8_get(&keyfifo);
				io_sti();
				sprintf(s, "%02X", i);
				boxfill8(binfo->vram, binfo->scrnx, COL8_008484, 0, 16, 15, 31);
				putfonts8_asc(binfo->vram, binfo->scrnx, 0, 16, COL8_FFFFFF, s);		
			}
			if (fifo8_status(&mousefifo) != 0) {
				i = fifo8_get(&mousefifo);
				io_sti();
				sprintf(s, "%02X", i);
				boxfill8(binfo->vram, binfo->scrnx, COL8_008484, 32, 16, 47, 31);
				putfonts8_asc(binfo->vram, binfo->scrnx, 32, 16, COL8_FFFFFF, s);
			}
		}
	}
}

#define PORT_KEYDAT             0x0060
#define PORT_KEYSTA             0x0064
#define PORT_KEYCMD             0x0064
#define KEYSTA_SEND_NOTREADY    0x02 // 豈�?逕ｨ謨ｰ謐ｮ
#define KEYCMD_WRITE_MODE       0x60 // 讓｡蠑�?螳壽欠莉､
#define KBC_MODE                0x47 // 蛻ｩ逕ｨ鮠�?讓｡蠑�

void wait_KBC_sendready(void) {
    /* 遲牙ｾ�??謗ｧ蛻ｶ?霍ｯ蜃�?螳�? */
	// 逕ｱ莠�??譏ｯ鮠�?蜈�?謗･蛻ｰ??謗ｧ蛻ｶ?霍ｯ, 
	// 辟ｶ蜷�??謗ｧ蛻ｶ?霍ｯ蜀�?謗･蛻ｰCPU荳�
	// 謇莉･隕∝�育ｭ牙ｾ�?霍ｯ?謗･荳�
    for (;;) {
		// 螯よ棡?謗･荳贋ｺ�, CPU莉�??蜿ｷ?0x0064?謇?蜿也噪謨ｰ謐ｮ逧�
		// 蛟呈焚隨ｬ莠御ｽ搾ｼ井ｻ惹ｽ惹ｽ�?蟋区焚逧�隨ｬ莠御ｽ搾ｼ�??譏ｯ0
        if ((io_in8(PORT_KEYSTA) & KEYSTA_SEND_NOTREADY) == 0) {
            break;
        }
    }
    return;
}

void init_keyboard(void) {
    /* 蛻晏ｧ句喧??謗ｧ蛻ｶ?霍ｯ */
    wait_KBC_sendready();
    io_out8(PORT_KEYCMD, KEYCMD_WRITE_MODE);
    wait_KBC_sendready();
    io_out8(PORT_KEYDAT, KBC_MODE);
    return;
}

#define KEYCMD_SENDTO_MOUSE     0xd4
#define MOUSECMD_ENABLE         0xf4

void enable_mouse(void) {
	// 豼豢ｻ鮠�?
	wait_KBC_sendready();
	// 螯よ棡蠕??謗ｧ蛻ｶ?霍ｯ?騾∵欠莉､0xd4�ｼ御ｸ倶ｸ荳ｪ謨ｰ謐ｮ蟆ｱ莨夊�ｪ??騾�?鮠�?
    io_out8(PORT_KEYCMD, KEYCMD_SENDTO_MOUSE);
    wait_KBC_sendready();
	// MOUSECMD_ENABLE陦ｨ遉ｺ騾夂衍CPU隕∵ｺ先ｺ蝉ｸ肴妙蝨ｰ?騾�鮠�?謖�莉､莠�
    io_out8(PORT_KEYDAT, MOUSECMD_ENABLE);
    return; /* ?蛻ｩ逧�?,??謗ｧ蛻ｶ蜈ｶ莨夊ｿ秘∝屓ACK(0xfa)*/
}