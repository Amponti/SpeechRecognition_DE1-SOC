//=======================================================================================
//=======================================================================================
// PROGRAMA 		: Transformada Rápida de Fourier (FFT)
// FUNCIÓN 			: Práctica Proyecto de Grado
// REALIZADO POR	: Holguer A. Becerra D. - Jefferson M. García P. - Juan D. Prieto A.
// ORGANIZACIÓN		: Universidad pontificia Bolivariana
// FECHA 			: Agosto 2015
//=======================================================================================
//=======================================================================================

//=======================================================================================
// LIBRERIAS
//=======================================================================================
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "fcomplex.h"		// Floating-point header file
#include "float_fft.h"

#include "input_f.dat"

//=======================================================================================
// PARÁMETROS
//=======================================================================================


//=======================================================================================
// VARIABLES GLOBALES
//=======================================================================================
complex X[N];
complex W[EXP];
complex temp;
short spectrum[N]; // cambiar por spectrum[13*N];

//=======================================================================================
// EJECUCIÓN FILTRO FIR
//=======================================================================================
int main(int argc, char *argv[])
{
	unsigned short  i,j,L,LE,LE1;

	for (L=1; L<=EXP; L++)		// Create twiddle factor table
	{
		LE=1<<L;
		LE1=LE>>1;
		W[L-1].re = cos(pi/LE1);
		W[L-1].im = -sin(pi/LE1);
	}

	for (j=0; j<(13*N); j++)	// este for deberia ser solo hasta j<13, para lograr el efecto de 13*128=1664 (tamaño del archivo .dat)
	{
		for (i=0; i<N; i++);
		{
			X[i].re = input7_f[j++];	// input7_f[j*i]
			X[i].im = 0.0;
		}

		// Start FFT
		bit_rev(X,EXP);
		fft(X,EXP,W,1);

		for (i=0; i<N; i++)
		{
			temp.re = X[i].re*X[i].re;
			temp.im = X[i].im*X[i].im;
			spectrum[i] = (short)((temp.re+temp.im)*32767);		// spectrum[j*i]
		}
	}
	return (0);
}
