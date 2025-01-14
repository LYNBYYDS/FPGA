#include "xgpio.h"
#include "xparameters.h"

XGpio led_switch, button;



int main () {
XGpio_Initialize(&led_switch, XPAR_LED_SWITCH_DEVICE_ID);
XGpio_Initialize(&button, XPAR_BOUTONS_DEVICE_ID);

XGpio_SetDataDirection(&led_switch, 1, 0xF);
XGpio_SetDataDirection(&led_switch, 2, 0);
XGpio_SetDataDirection(&button, 1, 0x7);
int clignoter = 0;
bp_c = 1;
int cpt = 0;
void inc_cpt(int *cpt){
	cpt == 16 ? cpt+1 : 0;
}

while(1) {
	/*
	// Permier partie method 1
	XGpio_DiscreteWrite(&led_switch, 2, XGpio_DiscreteRead(&led_switch, 1));

	// Permier partie method 2
	if( XGpio_DiscreteRead(&led_switch, 1) & 0x1 ){
		XGpio_DiscreteSet(&led_switch, 2, 0x1);
	}else if( !(XGpio_DiscreteRead(&led_switch, 1) & 0x1) ){
		XGpio_DiscreteClear(&led_switch, 2, 0x1);
	}
	if( XGpio_DiscreteRead(&led_switch, 1) & 0x2 ){
		XGpio_DiscreteSet(&led_switch, 2, 0x2);
	}else if( !(XGpio_DiscreteRead(&led_switch, 1) & 0x2) ){
		XGpio_DiscreteClear(&led_switch, 2, 0x2);
	}
	if( XGpio_DiscreteRead(&led_switch, 1) & 0x4 ){
		XGpio_DiscreteSet(&led_switch, 2, 0x4);
	}else if( !(XGpio_DiscreteRead(&led_switch, 1) & 0x4) ){
		XGpio_DiscreteClear(&led_switch, 2, 0x4);
	}
	if( XGpio_DiscreteRead(&led_switch, 1) & 0x8 ){
		XGpio_DiscreteSet(&led_switch, 2, 0x8);
	}else if( !(XGpio_DiscreteRead(&led_switch, 1) & 0x8) ){
		XGpio_DiscreteClear(&led_switch, 2, 0x8);
	}
	*/

	// Seconde partie
	clignoter == 0 ? 1 : 0;
	// if the interrtupter 0 is releve
	if( XGpio_DiscreteRead(&led_switch, 1) & 0x1 ){ //the first bit of the switch is 1
		if (clignoter == 1) {
			if( XGpio_DiscreteRead(&led_switch, 1) & 0x1 ){
				XGpio_DiscreteSet(&led_switch, 2, 0xFF00);
			}else if( !(XGpio_DiscreteRead(&led_switch, 1) & 0x1) ){
				XGpio_DiscreteClear(&led_switch, 2, 0xFF00);
		}else{
			XGpio_DiscreteClear(&led_switch, 2, 0xFF00);
		}
	}else {
		XGpio_DiscreteClear(&led_switch, 2, 0xFF00);
	}

	if( !(XGpio_DiscreteRead(&led_switch, 1) & 0x1) ){
		XGpio_DiscreteClear(&led_switch, 2, FF00);
	}

	for(int i = 0; i < 1000; i++){} // function delay
}

return 0;
}
