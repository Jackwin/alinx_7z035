#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <unistd.h>
#include <signal.h>

void my_signal_fun(int signum){
    static int cnt;
    printf("signal = %d, %d times\n",signum, ++cnt);
}

int main(int argc, char **argv)
{
	int i;
	int fd;
	char rdata[4];
	unsigned char val[16]={0x4,0x3,0x5,0x6,0x5,0x6,0x7,0x8,0x9,0xa,0xb,0xc,0xd,0xe,0xf,0x0};
    int flags;

    signal(SIGIO, my_signal_fun);

	fd = open("/dev/fbga_drv", O_RDWR); 
	if (fd <= 0) {
		printf("open error!\n");
		return -1;
	}

	//contribute async message with device
    fcntl(fd, F_SETOWN, getpid());
    flags = fcntl(fd, F_GETFL);
    fcntl(fd, F_SETFL, flags | FASYNC);

    //write operation
    for(i=0;i<4;i++)
    {
        //val = (1<<i);
        write(fd,val,16); //write val to fd device, size is 4 byte
        sleep(4);
        read(fd,rdata,4); //read fd device to rdata, size is 4 byte
        printf("\nrdata is : %08x\n", *(int*)rdata);
        sleep(1);
    }
    while(1){
        sleep(1);
    }
    close(fd);
	return 0;
}
