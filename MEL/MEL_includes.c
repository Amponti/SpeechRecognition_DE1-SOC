/*
 * filtroFIR.c
 *
 *  Created on: 26/08/2015
 *      Author: jdani
 */

#include "MEL_includes.h"
#include <stdlib.h>
#include <stdio.h>

#include <sys/mman.h>
#include "hwlib.h"
#include "socal.h"
#include "hps.h"
#include "alt_gpio.h"
#include "fixedptc.h"

float fc[] = {0,132.83,290.87,478.9,702.61,968.77,1285.4,1662.2,2110.5,2643.8,3278.3,4033.2,4931.4,6000}; //14 Valores

// shift the n point spectrum in into the mel frequency m point spectrum mel

void load_signal( SIGNAL * FIR_signal, char * filename)
{
	FILE * pFile;
	long lSize;
	char * buffer;
	int i;
	size_t result;

	pFile = fopen (filename,"rb");
	if(pFile==NULL)
	{
		printf("No se pudo leer el archivo.\n");
		exit (1);
	}

	//obtain file size
	fseek (pFile , 0 , SEEK_END);
	lSize = ftell (pFile);
	rewind (pFile);

	//allocate memory to contain the whole file
	buffer = (char*) malloc (sizeof(char)*lSize);

	if (buffer == NULL)
	{
		printf("Error en memoria");
		exit (2);
	}

	//copy the file into the buffer
	result = fread (buffer,1,lSize,pFile);
	if (result != lSize)
	{
		printf("Error de lectura");
		exit (3);
	}
	printf("Archivo almacenado en buffer.\n");

	FIR_signal->lenght=lSize;
	FIR_signal->signal=(int*) malloc (sizeof(int)*FIR_signal->lenght);

	for(i=0;i<lSize; i++)
	{
		FIR_signal->signal[i]=(int)buffer[i];
	}

	//terminate
	fclose(pFile);
	free(buffer);
}


void melcepstrum_conversion(float in[], int n, float mel[], int m, float fs)
{
    int i, j;

    float deltaf = fs / n;
    for (i = 0; i < m; i++)
    {
        mel[i] = 0.0;
        for (j = 0; j < n; j++)
        {
            mel[i] += in[j]*melH(j*deltaf, i+1);
        }
        mel[i] = log10(mel[i]);
    }
}

// compute the value of the mel triangle filter bank i at frequency f
double melH(int f, int i)
{
    if (f < fc[i-1] || f >= fc[i+1]) return 0;
    if (f < fc[i]) return (f-fc[i-1])/(fc[i]-fc[i-1]);
    else           return (f-fc[i+1])/(fc[i]-fc[i+1]);
}

// O(n2) dct - simple but slow (use for small vectors only)
void dct(float in[], float out[], int n)
{
    int i,j;

    double pn = PI / n;
    for (i = 0; i < n; i++)
    {
        out[i] = 0.0;
        for (j = 0; j < n; j++)
        {
            out[i] += in[j]*sin(i*pn*(j+0.5));
        }
    }
}
