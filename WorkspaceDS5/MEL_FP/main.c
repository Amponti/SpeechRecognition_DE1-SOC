//=======================================================================================
//=======================================================================================
// PROGRAMA 		: Transformada Especto MEL y Transformada Discreta del Coseno (DFT)
// FUNCI�N 			: Pr�ctica Proyecto de Grado
// REALIZADO POR	: Holguer A. Becerra D. - Jefferson M. Garc�a P. - Juan D. Prieto A.
// ORGANIZACI�N		: Universidad pontificia Bolivariana
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

fixedpt mel[12];
fixedpt mfcc[12];

fixedpt fftcoeff[SAMPLE_SIZE*NUM_SAMPLES];

//=======================================================================================
// PAR�METROS
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
// EJECUCI�N MEL SPECTRUM
//=======================================================================================
int FFTCOMPLETE,FFTLEVEL,FFTCOEFF,SWITCH;
int FFTSTART,LEDR;

int main()
{
  //FFTSTART(0);
  while(1)
  {
	  //FFTSTART(1);
      while (!FFTCOMPLETE);  // Wait until FFT operation to finish
      //FFTSTART(0);

	  //Read the level signal to determine start of the command
      level = FFTLEVEL;
	  //Clear the led outputs
	  //LEDR(0);
	  //Check if something is being Spoken
      if (level >60)
      {
    	  //Glow a LED to indicate start of voice
    	  //LEDR(2);
    	  //Save the fft of next 32 samples
		  for(i=0;i<NUM_SAMPLES;i++)
		  {
			  //FFTSTART(1);
			  while(!FFTCOMPLETE)  // Wait until FFT operation to finish
		      //FFTSTART(0);

				  //Save the fftoutput from the fft memory into the array
			  for (j = 0; j < SAMPLE_SIZE; j++)
			  {
				  //FFTADDRESS(j);
				  fftcoeff[i*SAMPLE_SIZE+j] = (float)(short)FFTCOEFF;
			  }
		  }
		  //1 sec sample stored
		  //LEDR(4);
		  // shift the spectrum into the mel scale
		  melcepstrum_conversion(fftcoeff, SAMPLE_SIZE*NUM_SAMPLES, mel, 12, 8000);
		  //LEDR(8);
		  // compute the dct of the mel spectrum
		  dct(mel, mfcc, 12);
		  float sum_mel;
		  //Take the sum of first two coefficients of the dct output
		  //The first two coefficients contains the maximum information
		  sum_mel = (mfcc[0] + fabs(mfcc[1]));
		  //LEDG(0);		//Clear the output LEDs
			if(SWITCH & 1)
			{
		          if(sum_mel > 59)
		          {
		  			  printf("\nYou said Yes");
		  			  printf("\t %f",sum_mel);
		  			  //LEDG(128);
		  		  }
		  		  else if(sum_mel> 50 && sum_mel<58)
		  		  {
		  			  printf("\nYou said No");
		  			  printf("\t %f",sum_mel);
		  			  //LEDG(1);
		  		  }
		  		  else if(sum_mel < 60 && sum_mel > 58)
		  		  {
		  			  printf("\nPlease be loud and clear!!");
		  			  printf("\t %f",sum_mel);
		  		  }
		  		  else if(sum_mel < 51 && sum_mel > 45)
		  		  {
		  			  printf("\nPlease be loud and clear");
		  			  printf("\t %f",sum_mel);
		  		  }
		  		  else
		  		  {
		  		     printf("\nPlease be loud and clear");
		  		     printf("\t %f",sum_mel);
		  		  }
		  }//switch end
		  printf("\n");
	  }
      else
      {
	  //this represent silence
		  //LEDG(0);
		  //LEDR(1);
      }
  }
}
