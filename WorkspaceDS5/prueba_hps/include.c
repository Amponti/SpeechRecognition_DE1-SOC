/*
 * include.c
 *
 *  Created on: 17/05/2016
 *      Author: jdani
 */

#include "include.h"
#include <stdlib.h>
#include <stdio.h>

void save_signal( SIGNAL * FIR_signal, char * filename)
{
	FILE * pFilt;
	int i;
	pFilt = fopen(filename,"wb");

	short dato;
	for(i=0;i<(FIR_signal->lenght);i++)
	{
		dato=(short)FIR_signal->signal[i];
		fwrite (&dato, sizeof(short), 1, pFilt);
	}
	fclose(pFilt);
}
