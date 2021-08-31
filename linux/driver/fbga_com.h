#ifndef __FBGA_COM_H__
#define __FBGA_COM_H__

/*
 * fbga driver and app common defines
 * author:  delphiqin@foxmail.com
 * date:    2021-08-13
 */

#define CASE0 0
#define CASE1 1
#define CASE2 2

#define IOCMD_DEVM_GET  0x300
#define IOCMD_DEVM_SET  0x301

#define IOCMD_DMA_CONFIGTX    0x400
#define IOCMD_DMA_CONFIGRX    0x401


#define DMA_REGOFF_RESET    0x0
#define DMA_REGOFF_TXEN     0x0100
#define DMA_REGOFF_TXADDR   0x0108
#define DMA_REGOFF_TXLEN    0x0110
#define DMA_REGOFF_TXTB     0x0118  //tail len and body len
#define DMA_REGOFF_TXMOD    0x0120  //transe mode and body number
#define DMA_REGOFF_RXADDR   0x0208




struct devm_data {
    int32_t reg_off;
    int32_t val;
};

struct data_config_t {
    uint32_t addr_off;  //offset to addr_data
    uint64_t data_len;
};

#endif
