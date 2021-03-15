#include <sys/types.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <signal.h>

//驱动代码中定义
#define IOCMD_DEVM_GET  0x300
#define IOCMD_DEVM_SET  0x301

struct devm_data {
    int32_t reg_off;
    int32_t val;
};

void* gp_data = NULL;

void dump_mem(unsigned char* data, int len) {
    printf("------------------------------------");
    int i;
    for (i = 0; i < len; i++) {
        if (0 == i%16) {
            printf("\n");
        }
        printf("%02x ", data[i]);
    }

    printf("\n------------------------------------\n");
}

void my_signal_fun(int signum){
    static int cnt;
    printf("signal = %d, %d times\n",signum, ++cnt);
	dump_mem((unsigned char*)gp_data, 32);
}

int main(int argc, char **argv)
{
	int i;
	int fd;
	char rdata[16];
	unsigned char val[16]={0x1,0x2,0x3,0x4,0x5,0x6,0x7,0x8,0x9,0xa,0xb,0xc,0xd,0xe,0xf,0x0};
    int flags;

    //测试中断发送该信号
    signal(SIGIO, my_signal_fun);

	fd = open("/dev/fbga_drv", O_RDWR); 
	if (fd <= 0) {
		printf("open error!\n");
		return -1;
	}

    gp_data = mmap(0, 256, PROT_READ, MAP_SHARED, fd, 0); 
    if (MAP_FAILED == gp_data) {
        printf("map failed!\n");
        exit(1);
    }

	//contribute async message with device
    fcntl(fd, F_SETOWN, getpid());
    flags = fcntl(fd, F_GETFL);
    fcntl(fd, F_SETFL, flags | FASYNC);

    printf("test debug interrupt signal...\n");
    system("/sd/ql/gpio_set.sh int");
    sleep(1);
    printf("triggerred interrupt\n");
    printf("test done\n\n");

    printf("test datamover...\n");
    system("/sd/ql/gpio_set.sh dm");
    printf("triggerred datamover\n");
    sleep(1);
    system("/sd/ql/gpio_set.sh int");
    sleep(1);
    printf("test done\n\n");

    //通过读写接口测试测试bram读写
    printf("test bram write enable\n");
    system("/sd/ql/gpio_set.sh brw");
    sleep(1);
    printf("bram read now.\n");
    read(fd,rdata,16); 
    dump_mem(rdata, 16);
    printf("test done\n\n");

    printf("test bram write data\n");
    write(fd,val,16); 
    printf("bram read now.\n");
    read(fd,rdata,16); 
    dump_mem(rdata, 16);
    printf("test done\n\n");
    

    printf("test devm read\n");
    struct devm_data dd;
    dd.reg_off = 0;
    dd.val = 0;
    fcntl(fd, IOCMD_DEVM_GET, &dd);
    printf("devm read off:%d, val:0x%08x\n", dd.reg_off, dd.val);
    dd.reg_off = 4;
    dd.val = 0;
    fcntl(fd, IOCMD_DEVM_GET, &dd);
    printf("devm read off:%d, val:0x%08x\n", dd.reg_off, dd.val);
    dd.reg_off = 8;
    dd.val = 0;
    fcntl(fd, IOCMD_DEVM_GET, &dd);
    printf("devm read off:%d, val:0x%08x\n", dd.reg_off, dd.val);
    printf("test done\n\n");

    scanf("%d", &i);
    close(fd);
	return 0;
}
