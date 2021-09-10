#ifndef __FBGA_DRV_H__
#define __FBGA_DRV_H__

#define DEVICE_NAME "fbga_drv"

#define WR_OP 0
#define RD_OP 1

#define MAX_CONFIG_RAM  0xFFF

struct fbga_drv
{
    struct platform_device *pdev;
    dev_t devno;
    struct class *fb_class;
    struct cdev fb_cdev;
    void __iomem *paddr_bram;
    void __iomem *paddr_data;
    void __iomem *paddr_devm;
    void __iomem *vaddr_bram;
    void __iomem *vaddr_data;
    void __iomem *vaddr_devm;
    int irq;
};

struct memory_data {
	char magic[20];
	struct fbga_drv *fdev;
	atomic_t refcnt;
};


#endif

