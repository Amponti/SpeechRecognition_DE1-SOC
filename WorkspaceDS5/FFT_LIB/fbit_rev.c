
//
//  Project: Experiment 6.6.3 128-point floating-point FFT - Chapter 6
//  File name: fbit_rev.c
//
//  Description: This is the floating-point FFT bit reversal function
//
//  For the book "Real Time Digital Signal Processing:
//                Implementation and Application, 2nd Ed"
//                By Sen M. Kuo, Bob H. Lee, and Wenshun Tian
//                Publisher: John Wiley and Sons, Ltd
//
//   fbit_rev.c
//   Arrange input samples in bit-reverse addressing order
//         - the index j is the bit reverse of i
//
//
//  Tools used: CCS v.2.12.07
//              TMS320VC5510 DSK Rev-C
//

#include "fcomplex.h"         // Floating-point header file

void bit_rev(complex *X, short EXP)
{
	unsigned short i,j,k;
	unsigned short N=1<<EXP;   // Number of points for FFT
	unsigned short N2=N>>1;
	complex  temp;             // Temporary storage of the complex variable

	for (j=0,i=1;i<N-1;i++)
	{
		k=N2;
		while(k<=j)
		{
			j-=k;
			k>>=1;
		}
		j+=k;

		if (i<j)
		{
			temp = X[j];
			X[j] = X[i];
			X[i] = temp;
		}
	}
}
