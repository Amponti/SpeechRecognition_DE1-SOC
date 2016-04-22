/*
 * filtroFIR.c
 *
 *  Created on: 26/08/2015
 *      Author: jdani
 */

#include "FFT_includes.h"
#include <stdlib.h>
#include <stdio.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal.h"
#include "hps.h"
#include "alt_gpio.h"
#include "fftc.h"

//MEL Filterbank 26 filters, needs 28 points
float fc[] = 	{	300, 	 358.98,  421.45,  487.6,   557.66,
					631.85,  710.41,  793.61,  881.72,  975.03,
					1073.84, 1178.47, 1289.29, 1406.64, 1530.9,
					1662.51, 1801.87, 1949.46, 2105.75, 2271.26,
					2446.53, 2632.15, 2828.71, 3036.87, 3257.31,
					3490.75, 3737.96, 4000
				}; 	//28 Valores

//float fc[] = {0,132.83,290.87,478.9,702.61,968.77,1285.4,1662.2,2110.5,2643.8,3278.3,4033.2,4931.4,6000};

//shift the n point spectrum in into the mel frequency m point spectrum mel

static float A[2*N];
static float Z[2*N];

void normalize_signal( SIGNAL * FFT_signal, int center)
{
	int prom=0;
	int i;
	for(i=0;i<FFT_signal->lenght; i++)
	{
		prom=prom+FFT_signal->signal[i];
	}
	prom=prom/FFT_signal->lenght;
	prom=center-prom;

	for(i=0;i<FFT_signal->lenght; i++)
	{
		FFT_signal->signal[i]=FFT_signal->signal[i]+prom;
	}
}

void save_type(char * inpfile, char * outpfile, int * enable)
{
	size_t length;
	length = strlen(inpfile);
	int n=3;
	int num_code=length-n;
	int i;
	for(i=0;i<=n;i++)
	{
		outpfile[i]=inpfile[i+num_code];
	}
}

void save_signal( SIGNAL * FFT_signal, char * filename)
{
	FILE * pFilt;
	int i;
	pFilt = fopen(filename,"wb");
	//save
	unsigned char dato;
	for(i=0;i<FFT_signal->lenght;i++)
	{
		dato=(unsigned char)FFT_signal->signal[i];
		fwrite ( &dato, sizeof(char), 1, pFilt);
	}
	fclose(pFilt);
}

void melcepstrum_conversion(float in[], int n, float mel[], int m, float fs)
{
    int i, j;
    FILE* outp = fopen("MEL.bin","wb");

	int *float_2_int;
	int dato;

    float deltaf = fs / n;
    for (i = 0; i < m; i++)
    {
        mel[i] = 0.0;
        for (j = 0; j < n; j++)
        {
            mel[i] += in[j]*melH(j*deltaf, i+1);
        }
        mel[i] = log10(mel[i]);

        float_2_int=(int *)&mel[i];
		dato=*float_2_int;
		fwrite(&dato, 1, 4, outp);
    }
	fclose(outp);
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
	FILE* outp = fopen("MFCC.bin","wb");
    int i,j;

    int *float_2_int;
	int dato;

    double pn = PI / n;
    for (i = 0; i < n; i++)
    {
        out[i] = 0.0;
        for (j = 0; j < n; j++)
        {
            out[i] += in[j]*cos(i*pn*(j+0.5));
        }
        float_2_int=(int *)&out[i];
		dato=*float_2_int;
		fwrite(&dato, 1, 4, outp);
    }
	fclose(outp);
}

