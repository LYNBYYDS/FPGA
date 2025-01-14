
/*******************************************************************
*
* CAUTION: This file is automatically generated by HSI.
* Version: 2020.2
* DO NOT EDIT.
*
* Copyright (C) 2010-2023 Xilinx, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT 

* 
* Description: Driver configuration
*
*******************************************************************/

#include "xparameters.h"
#include "xgpio.h"

/*
* The configuration table for devices
*/

XGpio_Config XGpio_ConfigTable[XPAR_XGPIO_NUM_INSTANCES] =
{
	{
		XPAR_LED_DEVICE_ID,
		XPAR_LED_BASEADDR,
		XPAR_LED_INTERRUPT_PRESENT,
		XPAR_LED_IS_DUAL
	},
	{
		XPAR_SW_BTN_DEVICE_ID,
		XPAR_SW_BTN_BASEADDR,
		XPAR_SW_BTN_INTERRUPT_PRESENT,
		XPAR_SW_BTN_IS_DUAL
	}
};


