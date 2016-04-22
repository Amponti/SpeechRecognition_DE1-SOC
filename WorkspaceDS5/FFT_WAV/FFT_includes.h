/*
 * filtroFIR.h
 *
 *  Created on: 26/08/2015
 *      Author: jdani
 */

#ifndef FILTROFIR_H_
#define FILTROFIR_H_

#define N 256
#define PI		3.14159265358979323846	/* pi */
#define TODEGREE(x) x*(180/PI)

double int_cos( int deg );
double int_sin( int deg );

#define SW_MODE 0
#define HW_MODE 1

#define HANN				0
#define BARTLETT			1
#define HAMMING				2
#define BOHMAN				3
#define BLACKMAN			4
#define BLACKMAN_HARRIS		5

#define LP_FILTER			0
#define HP_FILTER			1
#define BP_FILTER			2
#define BS_FILTER			3

typedef struct signals
{
	int * signal;
	int lenght;
}SIGNAL;

void init_system();
void normalize_signal( SIGNAL * FFT_signal, int center);
void save_type(char * inpfile, char * outpfile);
void save_signal( SIGNAL * FFT_signal, char * filename);
#endif /* FILTROFIR_H_ */
