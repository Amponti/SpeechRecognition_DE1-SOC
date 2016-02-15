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

extern float sin_pri(float jojo);
float fc[] = {0,132.83,290.87,478.9,702.61,968.77,1285.4,1662.2,2110.5,2643.8,3278.3,4033.2,4931.4,6000}; //14 Valores
//fixedpt fc[] = {0,fixedpt_rconst(132.83),fixedpt_rconst(290.87),fixedpt_rconst(478.9),fixedpt_rconst(702.61),fixedpt_rconst(968.77),fixedpt_rconst(1285.4),fixedpt_rconst(1662.2),fixedpt_rconst(2110.5),fixedpt_rconst(2643.8),fixedpt_rconst(3278.3),fixedpt_rconst(4033.2),fixedpt_rconst(4931.4),fixedpt_rconst(6000)}; //14 Valores

// shift the n point spectrum in into the mel frequency m point spectrum mel
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
        //mel[i] = log10(mel[i]);
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
    for (i = 0; i < n; i++) {
        out[i] = 0.0;
        for (j = 0; j < n; j++) {
            out[i] += in[j]*sin_pri(i*pn*(j+0.5));
        }
    }
}
