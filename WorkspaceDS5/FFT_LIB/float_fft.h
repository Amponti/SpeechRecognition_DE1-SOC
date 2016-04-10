//
//  Project: Experiment 6.6.3 128-point floating-point FFT - Chapter 6
//  File name: float_fft.h
//
//  Description: This is the header file for the FFT experiment
//
//  For the book "Real Time Digital Signal Processing:
//                Implementation and Application, 2nd Ed"
//                By Sen M. Kuo, Bob H. Lee, and Wenshun Tian
//                Publisher: John Wiley and Sons, Ltd
//
//  Tools used: CCS v.2.12.07
//              TMS320VC5510 DSK Rev-C
//

extern void fft(complex *, unsigned short, complex *, unsigned short);
extern void bit_rev(complex *, short);

#define N   128             // Number of FFT points
#define EXP 7               // EXP=log2(N)
#define pi  3.1415926535897
#define K   3               // Index of Xk (0<K< N/2)
