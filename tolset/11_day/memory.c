
#include "bootpack.h"

#define EFLAGS_AC_BIT		0x00040000
#define CR0_CACHE_DISABLE	0x60000000

unsigned int memtest(unsigned int start, unsigned int end) {
	char flg486 = 0;
	unsigned int eflg, cr0, i;

	// 确认CPU是386还是486以上的. 386无缓存, 486有
	eflg = io_load_eflags();
	eflg |= EFLAGS_AC_BIT; 	// AC-bit = 1
	io_store_eflags(eflg);
	eflg = io_load_eflags();
	if ((eflg & EFLAGS_AC_BIT) != 0) { // 如果是386, 即使设定AC = 1, AC的值还会自动到0
		flg486 = 1;
	}
	eflg &= ~EFLAGS_AC_BIT;	// AC-bit = 0
	io_store_eflags(eflg);

	if (flg486 != 0) {
		cr0 = load_cr0();
		cr0 |= CR0_CACHE_DISABLE; // 禁止缓存
		store_cr0(cr0); 
	}

	i = memtest_sub(start, end);

	if (flg486 != 0) {
		cr0 = load_cr0();
		cr0 &= ~CR0_CACHE_DISABLE; // 允许缓存
		store_cr0(cr0);
	}
	return i;
}

void memman_init(struct MEMMAN *man) {
	man->frees = 0; 		// 可用信息数目
	man->maxfrees = 0; 		// 用于观察可用状况: frees的最大值
	man->lostsize = 0; 		// 释放失败的内存大小总和
	man->losts = 0; 		// 释放失败次数
	return;
}

unsigned int memman_total(struct MEMMAN *man) { // 报告空余内存大小合计
	unsigned int i, t = 0;
	for (i = 0; i < man->frees; i++) {
		t += man->free[i].size;
	}
	return t;
}

unsigned int memman_alloc(struct MEMMAN *man, unsigned int size){ // 分配
	unsigned int i, a;
	for (i = 0; i < man->frees; i++) {
		if (man->free[i].size >= size) {
			// 找到足够大的内存
			a = man->free[i].addr;
			man->free[i].addr += size;
			man->free[i].size -= size;
			if (man->free[i].size == 0) {
				// 如果free[i]变成了0,就减掉一条可用信息
				man->frees--;
				for (; i < man->frees; i++) {
					man->free[i] = man->free[i + 1]; // 结构体赋值
				}
			}
			return a;
		}
	}
	return 0;
}

int memman_free(struct MEMMAN *man, unsigned int addr, unsigned int size) { // 释放
	int i, j;
	// 为便于归纳内存, 将free[]按照addr的顺序排列
	// 所以应该先决定放在哪里
	for (i = 0;  i < man->frees; i++) {
		if (man->free[i].addr > addr) {
			break;
		}
	}
	// free[i - 1].addr < addr < free[i].addr
	if (i > 0) { // 前面有可用内存
		if (man->free[i - 1].addr + man->free[i - 1].size == addr) { // 可以与前面可用内存归纳到一起
			man->free[i - 1].size += size;
		}
		if (i < man->frees) { // 后面有可用内存
			if (addr + size == man->free[i].addr) { // 也可以与后面可用内存归纳到一起
				man->free[i - 1].size += man->free[i].size;
				// man->free[i]删除, free[i]变成0后归纳到前面去
				man->frees--;
				for (; i < man->frees; i++) {
					man->free[i] = man->free[i + 1];
				}
			}
			return 0; // 成功
		}
	}
	if (i < man->frees) { // 不能与前面的可用空间归纳到一起
		 if (addr + size == man->free[i].addr) { // 后面还能归纳到一起
			man->free[i].addr = addr;
			man->free[i].size += size;
			return 0;
		 }
	}
	if (man->frees < MEMMAN_FREES) { // 既不能与前面归纳到一起, 也不能与后面归纳到一起
		for (j = man->frees; j > i; j--) {
			man->free[j] = man->free[j - 1]; // free[i]之后的向后移动腾出空间
		}
		man->frees++;
		if (man->maxfrees < man->frees) {
			man->maxfrees = man->frees; // 更新最大值
		}
		man->free[i].addr = addr;
		man->free[i].size = size;
		return 0;
	}
	// 不能往后移动
	man->losts++;
	man->lostsize += size;
	return -1;
}

unsigned int memman_alloc_4k(struct MEMMAN *man, unsigned int size) {
    unsigned int a;
    // 与运算可以强制归零,向下取整; 而这里是向上取整
    // 举例来说如果以100为单位向上取整, 而我们有数字10
    // 那么可以先加99再向下取整, 可以得到100
    size = (size + 0xfff) & 0xfffff000;
    a = memman_alloc(man, size);
    return a;
}

int memman_free_4k(struct MEMMAN *man, unsigned int addr, unsigned int size) {
    int i;
    // 与运算可以强制归零,向下取整; 而这里是向上取整
    // 举例来说如果以100为单位向上取整, 而我们有数字10
    // 那么可以先加99再向下取整, 可以得到100
    size = (size + 0xfff) & 0xfffff000; 
    i = memman_free(man, addr, size); 
    return i;
}