//=======================================================================================
//=======================================================================================
// PROGRAMA 		: Transformada Especto MEL y Transformada Discreta del Coseno (DFT)
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
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal.h"
#include "hps.h"
#include "alt_gpio.h"
#include "fixedptc.h"
#include "MEL_includes.h"

float mel[12];
float mfcc[12];

float fftcoeff[SAMPLE_SIZE*NUM_SAMPLES];

//=======================================================================================
// PARÁMETROS
//=======================================================================================
#define REG_BASE 0xC0000000
#define REG_SPAN 0x04000000

//=======================================================================================
// VARIABLES GLOBALES
//=======================================================================================
int i=0,j=0,level=0;
int fd;
void *virtual_base;

//=======================================================================================
// RUTINA: INICIO DEL SISTEMA
//=======================================================================================
//void init_system()
//{
//	if(( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ))) == -1 )
//	{
//		printf( "ERROR: could not open \"/dev/mem\"...\n" );
//		return;
//	}
//
//	virtual_base = mmap( NULL, REG_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, REG_BASE );
//	if( virtual_base == MAP_FAILED )
//	{
//		printf( "ERROR: mmap() failed...\n" );
//		close( fd );
//		return;
//	}
//}
//=======================================================================================
// EJECUCIÓN MEL SPECTRUM
//=======================================================================================
int FFTCOMPLETE,FFTLEVEL,FFTCOEFF,SWITCH;
int FFTSTART,LEDR;

int main(int argc, char *argv[])
{
	SIGNAL FFT_signal;
	load_signal(&FFT_signal, argv[1]);
	//printf("EL tamaño del FFT es: %f", FFT_signal.lenght);

	printf("\nProbando?? antes de MEL");
	melcepstrum_conversion(&FFT_signal, SAMPLE_SIZE*NUM_SAMPLES, mel, 12, 8000);
	printf("\nProbando despues de MEL");
//	//LEDR(8);
//	// compute the dct of the mel spectrum
//	dct(mel, mfcc, 26);
//
//	//Take the sum of first two coefficients of the dct output
//	//The first two coefficients contains the maximum information
//
//	float sum_mel = 0;
//	for(i=0;i<=12;i++)
//	{
//		sum_mel = sum_mel + fabs(mfcc[i]);
//	}
//
//	if(sum_mel > 59)
//	{
//		printf("\nYou said Yes");
//		printf("\t %f",sum_mel);
//	}
//
//	else if(sum_mel> 50 && sum_mel<58)
//	{
//		printf("\nYou said No");
//		printf("\t %f",sum_mel);
//	}
//
//	else if(sum_mel < 60 && sum_mel > 58)
//	{
//		printf("\nPlease be loud and clear!!");
//		printf("\t %f",sum_mel);
//	}
//
//	else if(sum_mel < 51 && sum_mel > 45)
//	{
//		printf("\nPlease be loud and clear");
//		printf("\t %f",sum_mel);
//	}
//	else
//	{
//		printf("\nPlease be loud and clear");
//		printf("\t %f",sum_mel);
//	}
//	printf("\n");
}
