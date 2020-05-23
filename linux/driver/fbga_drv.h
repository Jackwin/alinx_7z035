#define DEVICE_NAME "fbga_drv"

#define WR_OP 0
#define RD_OP 1

#define CASE0 0
#define CASE1 1
#define CASE2 2

struct fbga_drv
{
    struct platform_device *pdev;
    dev_t devno;
    struct class *fb_class;
    struct cdev fb_cdev;
    void __iomem *paddr;
    void __iomem *vaddr;
    int irq;
};
