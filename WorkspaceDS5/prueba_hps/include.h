/*
 * include.h
 *
 *  Created on: 17/05/2016
 *      Author: jdani
 */

#ifndef INCLUDE_H_
#define INCLUDE_H_

#ifndef PI
#define PI		3.14159265358979323846	/* pi */
#endif

typedef struct signals
{
	int * signal;
	int lenght;
}SIGNAL;

void save_signal( SIGNAL * FIR_signal, char * filename);

#endif /* INCLUDE_H_ */
