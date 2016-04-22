//
//  Project: Experiment 6.6.3 128-point floating-point FFT - Chapter 6
//  File name: fcomplex.h
//
//  Description: C header file icomplex.h for floating-point implementation
//
//  For the book "Real Time Digital Signal Processing:
//                Implementation and Application, 2nd Ed"
//                By Sen M. Kuo, Bob H. Lee, and Wenshun Tian
//                Publisher: John Wiley and Sons, Ltd
//
//  Tools used: CCS v.2.12.07
//              TMS320VC5510 DSK Rev-C
//

struct cmpx
{
  double re;
  double im;
};
typedef struct cmpx complex;
