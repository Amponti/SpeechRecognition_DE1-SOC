//
//  Project: Experiment 6.6.3 128-point floating-point FFT - Chapter 6
//  File name: float_fft.c
//
//  Description: Floating-point complex radix-2 decimation-in-time FFT
//
//  For the book "Real Time Digital Signal Processing:
//                Implementation and Application, 2nd Ed"
//                By Sen M. Kuo, Bob H. Lee, and Wenshun Tian
//                Publisher: John Wiley and Sons, Ltd
//
//  Perform in place FFT the output overwrite the input array
//
//  Tools used: CCS v.2.12.07
//              TMS320VC5510 DSK Rev-C
//

#include "fcomplex.h"       // Floating-point header file

void fft(complex *X, unsigned short EXP, complex *W, unsigned short SCALE)
{
	complex  temp;            	// Temporary storage of complex variable
	complex  U;               	// Twiddle factor W^k
	unsigned short i,j;
	unsigned short id;        	// Index for lower point in butterfly
	unsigned short N=1<<EXP;  	// Number of points for FFT
	unsigned short L;        	// FFT stage
	unsigned short LE;       	// Number of points in sub DFT at stage L
								// and offset to next DFT in stage
	unsigned short LE1;			// Number of butterflies in one DFT at
								// stage L.  Also is offset to lower point
								// in butterfly at stage L
	float scale;

	scale = 0.5;
	if (SCALE == 0)
	{
		scale = 1.0;
	}
	for (L=1; L<=EXP; L++)    	// FFT butterfly
	{
		LE=1<<L;                // LE=2^L=points of sub DFT
		LE1=LE>>1;              // Number of butterflies in sub-DFT
		U.re = 1.0;
		U.im = 0.;
		for (j=0; j<LE1;j++)
		{
			for(i=j; i<N; i+=LE)  // Do the butterflies
			{
				id=i+LE1;
				temp.re = (X[id].re*U.re - X[id].im*U.im)*scale;
				temp.im = (X[id].im*U.re + X[id].re*U.im)*scale;

				X[id].re = X[i].re*scale - temp.re;
				X[id].im = X[i].im*scale - temp.im;

				X[i].re = X[i].re*scale + temp.re;
				X[i].im = X[i].im*scale + temp.im;
			}

			// Recursive compute W^k as U*W^(k-1)
			temp.re = U.re*W[L-1].re - U.im*W[L-1].im;
			U.im = U.re*W[L-1].im + U.im*W[L-1].re;
			U.re = temp.re;
		}
	}
}
