/*
 * filtroFIR.h
 *
 *  Created on: 26/08/2015
 *      Author: jdani
 */

#ifndef FILTROFIR_H_
#define FILTROFIR_H_

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

typedef struct FIR_filters
{
	double * coefs;
	int *taps;
	int order;
	int window_type;
	int filter_type;
	int FS;
	int F1;
	int F2;
	int sw_hw;
}FIR_filter;

typedef struct signalsthreads
{
	SIGNAL * signal;
	FIR_filter * coef;
	int results;
	int offset;
	char id;
}SIGNALTHREAD;


void init_system();
void calc_FIR_coefs(FIR_filter * filter);
void normalize_signal( SIGNAL * FIR_signal, int center);
void save_signal( SIGNAL * FIR_signal, char * filename);
void load_signal( SIGNAL * FIR_signal, char * filename);
void *thread_fir( void *ptr );
void apply_FIR(FIR_filter * filtro, int data, int * FIR_output);
void apply_FIR_whole_signal(FIR_filter * filtro, SIGNAL * FIR_signal, SIGNAL * FIR_output);

void apply_FFT( FIR_filter * filtro, SIGNAL * FIR_signal, SIGNAL * FIR_output );

#endif /* FILTROFIR_H_ */
