
 PARAMETER VERSION = 2.2.0


BEGIN OS
 PARAMETER OS_NAME = standalone
 PARAMETER OS_VER = 7.3
 PARAMETER PROC_INSTANCE = microblaze_0
END


BEGIN PROCESSOR
 PARAMETER DRIVER_NAME = cpu
 PARAMETER DRIVER_VER = 2.12
 PARAMETER HW_INSTANCE = microblaze_0
END


BEGIN DRIVER
 PARAMETER DRIVER_NAME = gpio
 PARAMETER DRIVER_VER = 4.7
 PARAMETER HW_INSTANCE = boutons
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = gpio
 PARAMETER DRIVER_VER = 4.7
 PARAMETER HW_INSTANCE = led_switch
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = intc
 PARAMETER DRIVER_VER = 3.12
 PARAMETER HW_INSTANCE = microblaze_0_axi_intc
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = bram
 PARAMETER DRIVER_VER = 4.5
 PARAMETER HW_INSTANCE = microblaze_0_local_memory_dlmb_bram_if_cntlr
END

BEGIN DRIVER
 PARAMETER DRIVER_NAME = bram
 PARAMETER DRIVER_VER = 4.5
 PARAMETER HW_INSTANCE = microblaze_0_local_memory_ilmb_bram_if_cntlr
END


