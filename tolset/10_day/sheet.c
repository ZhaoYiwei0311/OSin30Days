#include "bootpack.h"

#define SHEET_USE 1

struct SHTCTL *shtctl_init(struct MEMMAN *memman, unsigned char *vram, int xsize, int ysize) {
    struct SHTCTL *ctl;
    int i;
    ctl = (struct SHTCTL *)memman_alloc_4k(memman, sizeof(struct SHTCTL));
    if (ctl == 0) {
        goto err;
    }
    ctl->vram = vram;
    ctl->xsize = xsize;
    ctl->ysize = ysize;
    ctl->top = -1; // 一个SHEET都没有
    for (i = 0; i < MAX_SHEETS; i++) {
        ctl->sheets0[i].flags = 0; // 标记为未使用
    }
err:
    return ctl;
}

struct SHEET *sheet_alloc(struct SHTCTL *ctl) {
    struct SHEET *sht;
    int i;
    for (i = 0; i < MAX_SHEETS; i++) {
        if (ctl->sheets0[i].flags == 0) {
            sht = &ctl->sheets0[i];
            sht->flags = SHEET_USE; // 标记为正在使用
            sht->height = -1; // 隐藏
            return sht;
        }
    }
    return 0; // 所有SHEET都处于正在使用状态
}

void sheet_setbuf(struct SHEET *sht, unsigned char *buf, int xsize, int ysize, int col_inv) {
    sht->buf = buf;
    sht->bxsize = xsize;
    sht->bysize = ysize;
    sht->col_inv = col_inv;
    return;
}

// 设定底板高度的函数
void sheet_updown(struct SHTCTL *ctl, struct SHEET *sht, int height) {
    int h, old = sht->height; // 存储设置前的高度信息

    // 如果指定的高度过高或过低, 则进行修正
    if (height > ctl->top + 1) {
        height = ctl->top + 1;
    }

    if (height < -1) {
        height = -1;
    }

    sht->height = height; // 设定高度

    // 对sheets[]重新排列
    if (old > height) { // 比以前低
        if (height >= 0) {  // 把中间的往上提
            for (h = old; h > height; h--) {
                ctl->sheets[h] = ctl->sheets[h - 1];
                ctl->sheets[h]->height = h;
            }
            ctl->sheets[height] = sht;
        } else { // 隐藏
            if (ctl->top > old) {
                for (h = old; h < ctl->top; h++) { // 把上面的降下来
                    ctl->sheets[h] = ctl->sheets[h + 1];
                    ctl->sheets[h]->height = h;
                }
            }
            ctl->top--; // 由于显示层中的图层减少一个, 所以最上面的图层高度下降
        }
        sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0 + sht->bxsize, sht->vy0 + sht->bysize); // 按新图层的信息重新绘制图画
    } else if (old < height) { // 比以前高
        if (old >= 0) {
            // 把中间的拉下去
            for (h = old; h < height; h++) {
                ctl->sheets[h] = ctl->sheets[h + 1];
                ctl->sheets[h]->height = h;
            }
            ctl->sheets[height] = sht;
        } else { // 由隐藏状态转为显示状态
            for (h = ctl->top; h >= height; h--) { // 将已经在上面的提上来
                ctl->sheets[h + 1] = ctl->sheets[h];
                ctl->sheets[h + 1]->height = h + 1;
            }
            ctl->sheets[height] = sht;
            ctl->top++;     // 由于已显示的图层增加了1个, 所以最上面的图层高度增加
        }
        sheet_refreshsub(ctl, sht->vx0, sht->vy0, sht->vx0 + sht->bxsize, sht->vy0 + sht->bysize); // 按新图层信息重新绘制画面
    }
    return;
}

void sheet_refreshsub(struct SHTCTL *ctl, int vx0, int vy0, int vx1, int vy1) {
    int h, bx, by, vx, vy, bx0, by0, bx1, by1;
    unsigned char *buf, c, *vram = ctl->vram;
    struct SHEET *sht;
    for (h = 0; h <= ctl->top; h++) {
        sht = ctl->sheets[h];
        buf = sht->buf;
        // 使用vx0-vy1, 对bx0-by1进行倒推
        bx0 = vx0 - sht->vx0;
        by0 = vy0 - sht->vy0;
        bx1 = vx1 - sht->vx0;
        by1 = vy1 - sht->vy0;

        if (bx0 < 0) {
            bx0 = 0;
        }
        if (by0 < 0) {
            by0 = 0;
        }
        if (bx1 > sht->bxsize) {
            bx1 = sht->bxsize;
        }
        if (by1 > sht->bysize) {
            by1 = sht->bysize;
        }
        for (by = by0; by < by1; by++) {
            vy = sht->vy0 + by;
            for (bx = bx0; bx < bx1; bx++) {
                vx = sht->vx0 + bx;
                c = buf[by * sht->bxsize + bx];
                if (c != sht->col_inv) {
                    vram[vy * ctl->xsize + vx] = c;
                }
            }
        }
    }
    return;
}

// void sheet_refresh(struct SHTCTL *ctl) {
//     int h, bx, by, vx, vy;
//     unsigned char *buf, c, *vram = ctl->vram;
//     struct SHEET *sht;
//     for (h = 0; h <= ctl->top; h++) {
//         sht = ctl->sheets[h];
//         buf = sht->buf;
//         for (by = 0; by < sht->bysize; by++) { // 从上往下, 最后最上面的内容留在画面上
//             vy = sht->vy0 + by;
//             for (bx = 0; bx < sht->bxsize; bx++) {
//                 vx = sht->vx0 + bx;
//                 c = buf[by * sht->bxsize + bx];
//                 if (c != sht->col_inv) { // 将透明以外的所有像素都复制到VRAM中
//                     vram[vy * ctl->xsize + vx] = c;
//                 }
//             }
//         }
//     }
//     return;
// }

void sheet_refresh(struct SHTCTL *ctl, struct SHEET *sht, int bx0, int by0, int bx1, int by1) {
    if (sht->height >= 0) { // 如果正在显示, 则按新图层信息刷新画面
        sheet_refreshsub(ctl, sht->vx0 + bx0, sht->vy0 + by0, sht->vx0 + bx1, sht->vy0 + by1);
    }
    return;
}

// 不改变图层高度, 只是上下左右移动
void sheet_slide(struct SHTCTL *ctl, struct SHEET *sht, int vx0, int vy0) {
    int old_vx0 = sht->vx0, old_vy0 = sht->vy0;
    sht->vx0 = vx0;
    sht->vy0 = vy0;
    if (sht->height >= 0) { // 如果正在显示, 则按新图层的信息刷新画面
        // 首先记住移动前的显示位置, 在设定新的显示位置
        // 最后只要重新描绘移动前和移动后的地方就可以了
        sheet_refreshsub(ctl, old_vx0, old_vy0, old_vx0 + sht->bxsize, old_vy0 + sht->bysize);
        sheet_refreshsub(ctl, vx0, vy0, vx0 + sht->bxsize, vy0 + sht->bysize);
    }   
    return;
}

void sheet_free(struct SHTCTL *ctl, struct SHEET *sht) {
    if (sht->height >= 0) {
        sheet_updown(ctl, sht, -1); // 如果处于显示状态, 则先设定为隐藏
    }
    sht->flags = 0; // 未使用标志
    return;
}