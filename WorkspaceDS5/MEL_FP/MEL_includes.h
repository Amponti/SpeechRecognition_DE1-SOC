/*
 * filtroFIR.h
 *
 *  Created on: 26/08/2015
 *      Author: jdani
 */

#ifndef MELSPECTRUM_H_
#define MELSPECTRUM_H_

#define SAMPLE_SIZE 256
#define NUM_SAMPLES 173

#ifndef PI
#define PI		3.14159265358979323846	/* pi */
#endif

void init_system();
void dct(float in[], float out[], int n);
double melH(int f, int i);
void melcepstrum_conversion(float in[], int n, float mel[], int m, float fs);
#endif /* MELSPECTRUM_H_ */
