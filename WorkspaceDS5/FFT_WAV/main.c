//=======================================================================================
//=======================================================================================
// PROGRAMA 		: Transformada R�pida de Fourier (FFT)
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
#include "./include/hwlib.h"
#include "./include/socal/socal.h"
#include "./include/socal/hps.h"
#include "./include/socal/alt_gpio.h"

#include "hps_0.h"
#include "FFT_includes.h"

//=======================================================================================
// PAR�METROS
//=======================================================================================
#define REG_BASE 0xC0000000
#define REG_SPAN 0x04000000

//=======================================================================================
// VARIABLES GLOBALES
//=======================================================================================
int i=0,j=0;
int fd;
void *virtual_base;

static float A[2*N]; /* available for modifying transform */
static float Z[2*N];
//=======================================================================================
// RUTINA: INICIO DEL SISTEMA
//=======================================================================================
void init_system()
{
	if(( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ))) == -1 )
	{
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return;
	}

	virtual_base = mmap( NULL, REG_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, REG_BASE );
	if( virtual_base == MAP_FAILED )
	{
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return;
	}
}
//=======================================================================================
// EJECUCI�N FILTRO FIR
//=======================================================================================
int main(int argc, char *argv[])
{
	FILE * inp;
	FILE * outp;
	FILE * outp2;
	int sread,swrite,k,i,sect,sectcnt,first;
	char riff[4],wave[4],fmt[4],stuf,data[4],sbyte,ibyte,more[4];
	int fsize,nbytes,rate,avgrate,csize,nbread,bad;
	float savg,smin,smax;
	short ccode,channels,blockalign,bps;
	float float_data=0.0;
	int *float_2_int;
	int dato;
	char type[3];
	int enable;

	printf("fft_wav.c running \n");
	if(argc<2)
	{
		printf("Debe seleccionar un archivo wav para lectura.\n");
		exit(1);
	}

	inp = fopen(argv[1], "rb");

	if(inp == NULL)
	{
		printf("No se pudo abrir %s para lectura.\n", argv[1]);
		exit(1);
	}

	if(argc<3)
	{
		printf("No selecciono un archivo de salida, creando junk.wav por defecto.\n");
		outp = fopen("junk.wav","wb");
		if(outp == NULL)
		{
			printf("No se pudo abrir junk.wav para escritura.\n");
			exit(1);
		}
	}
	else /* open users output file */
	{
		outp = fopen(argv[2], "wb");
		save_type(argv[2], type);
		if(type[0]=='w' && type[1]=='a' && type[2]=='v')	enable=1;
		else												enable=2;

		if(outp == NULL)
		{
			printf("No se pudo abrir %s para escritura. \n", argv[2]);
			exit(1);
		}
	}

	printf("Formato de escritura: %s\n",type);
	printf("Leyendo %s ...\n", argv[1]);

	sread = fread(&riff[0], 1, 4, inp);
	printf("first 4 bytes should be RIFF: <%c%c%c%c>\n",riff[0],riff[1],riff[2],riff[3]);

	sread = fread(&fsize, 1, 4, inp);
	printf("file has: %d +8 bytes \n", fsize);

	sread = fread(&wave[0], 1, 4, inp);
	printf("should be WAVE: <%c%c%c%c>\n",wave[0],wave[1],wave[2],wave[3]);

	sread = fread(&fmt[0], 1, 4, inp);
	printf("should be fmt: <%c%c%c%c>\n",fmt[0],fmt[1],fmt[2],fmt[3]);

	sread = fread(&nbytes, 1, 4, inp);
	printf("block has: %d more bytes \n", nbytes);

	sread = fread(&ccode, 1, 2, inp);
	printf("compression code = %d \n", ccode);
	nbytes = nbytes-2;

	sread = fread(&channels, 1, 2, inp);
	printf("channels = %d \n", channels);
	nbytes = nbytes-2;

	sread = fread(&rate, 1, 4, inp);
	printf("rate = %d  \n", rate);
	nbytes = nbytes-4;

	sread = fread(&avgrate, 1, 4, inp);
	printf("avg rate = %d \n", avgrate);
	nbytes = nbytes-4;

	sread = fread(&blockalign, 1, 2, inp);
	printf("blockalign = %d  \n", blockalign);
	nbytes = nbytes-2;

	sread = fread(&bps, 1, 2, inp);
	printf("bits per sample = %d \n", bps);
	nbytes = nbytes-2;

	printf("bytes left in fmt = %d \n", nbytes);

	for(i=0; i<nbytes; i++)
	{
		sread = fread(&stuf, 1, 1, inp);
		swrite = fwrite(&stuf, 1, 1, outp);
	}

	sread = fread(&data[0], 1, 4, inp);
	printf("should be data: <%c%c%c%c>\n",data[0],data[1],data[2],data[3]);

	sread = fread(&csize, 1, 4, inp);
	printf("chunk has: %d more bytes \n", csize);

	nbread = 44+nbytes;
	printf("%d bytes read so far \n", nbread);

	switch (enable)
	{
		case 1: 	// wav
		{
			swrite = fwrite(&riff[0], 1, 4, outp);
			swrite = fwrite(&fsize, 1, 4, outp);
			swrite = fwrite(&wave[0], 1, 4, outp);
			swrite = fwrite(&fmt[0], 1, 4, outp);
			swrite = fwrite(&nbytes, 1, 4, outp);
			swrite = fwrite(&ccode, 1, 2, outp);
			swrite = fwrite(&channels, 1, 2, outp);
			swrite = fwrite(&rate, 1, 4, outp);
			swrite = fwrite(&avgrate, 1, 4, outp);
			swrite = fwrite(&blockalign, 1, 2, outp);
			swrite = fwrite(&bps, 1, 2, outp);
			for(i=0; i<nbytes; i++)
			{
				swrite = fwrite(&stuf, 1, 1, outp);
			}
			swrite = fwrite(&data[0], 1, 4, outp);
			swrite = fwrite(&csize, 1, 4, outp);
		}
		break;

		case 2:	// bin
		{

		}
		break;

		default:	// wav
		{
			printf("Error en lectura del tipo de archivo");
			exit(1);
		}
		break;
	}

	bad = 0;
	savg = 0;
	sect = 0;
	sectcnt = 0;
	first = 0; /* control some debug print */

	for(i=0; i<csize; i++)
	{
		if(sect<N)
		{
			sread = fread(&sbyte, 1, 4, inp);
			if(sread !=1 && bad==0)
			{
				bad=1;
				printf("no read on byte %d \n", i);
			}
			Z[2*sect] = (float)sbyte;
			Z[2*sect+1] = 0.0; /* no complex component */
			sect++;
		}
		else /* process N samples */
		{
			sect = 0;
			i--;
			sectcnt++;
			if(first)
			{
				printf("raw data \n");
				for(k=0; k<2*N; k++) A[k] = Z[k];
				for(k=0; k<N; k++) printf("k=%d, AR=%g, AI=%g \n",k,A[2*k],A[2*k+1]);
			}

			fft256(Z); /* transform */

			if(first)
			{
				printf("\ntransform \n");
				for(k=0; k<N; k++) printf("k=%d, ZR=%g, ZI=%g \n",k,Z[2*k],Z[2*k+1]);
				first = 0;
			}

			/* optional modifications */

			//ifft64(Z); /* inverse transform */
			//if(first)
			//{
			//printf("inverse transform \n");
			//for(k=0; k<N; k++) printf("k=%d, ZR=%g, ZI=%g \n",k,Z[2*k],Z[2*k+1]);
			//first = 0;
			//}

			for(k=0; k<N; k++)
			{
				float_data=Z[2*k];
				float_2_int=(int *)&float_data;
			    dato=*float_2_int;

			    swrite = fwrite(&dato, 1, 4, outp);
				/*
				// porque no tenia el >= lo acabo de poner podria ponerlo si
				if(Z[2*k]>=127.5){
						//Z[2*k]=127.0;
						sbyte = 127;
				}
				else if(Z[2*k]<(-127.5)){
					sbyte = -127;
					//Z[2*k]=-127.0;
				}
				else{
					sbyte = (char)(Z[2*k]);
				}
				swrite = fwrite(&sbyte, 1, 1, outp);
				//ibyte = sbyte;
				 * */

				savg = savg + float_data;
				if(i==0)
				{
					smin=float_data;
					smax=smin;
				}
				smin = float_data<smin?float_data:smin;
				smax = float_data>smax?float_data:smax;
				if(i<300 && k<20)
				{
					printf("byte %d= %f \n", k, float_data);
				}
			}
		} /* end else part to write out transformed values */
	} /* end i<csize loop */
	/* just write leftovers, could find a smaller transform and pad */
	printf("writing %d unchanged bytes, after sector %d \n", sect, sectcnt);
	for(k=0; k<sect; k++)
	{
		float_data=Z[2*k];

		float_2_int=(int *)&float_data;

	    dato=*float_2_int;
	    //swrite = fwrite(&dato, 1, 4, outp);
	    swrite = fwrite(&dato, 1, 4, outp);
//		sbyte = (int)(Z[2*k]);
//		swrite = fwrite(&sbyte, 1, 1, outp);
	}
	savg = savg / (float)csize;
	printf("smin=%f, smax=%f, savg=%f \n", smin, smax, savg);

	nbread = nbread+csize;
	printf("%d bytes read so far \n", nbread);

	while(1) /* just copy remaining chunks */
	{
		sread = fread(&more[0], 1, 4, inp);
		if(sread != 4) goto done;
		swrite = fwrite(&more[0], 1, 4, outp);
		printf("could be , <%c%c%c%c>\n",more[0],more[1],more[2],more[3]);

		sread = fread(&csize, 1, 4, inp); /* check for more chunks */
		if(sread != 4) goto done;
		swrite = fwrite(&csize, 1, 4, outp);
		printf("chunk has %d bytes \n", csize);

		for(i=0; i<csize; i++)
		{
			sread = fread(&sbyte, 1, 1, inp);
			if(sread != 1) goto done;
			swrite = fwrite(&sbyte, 1, 1, outp);
		}
		nbread = nbread + 8 + csize;
		printf("%d bytes read so far \n", nbread);
	} /* end copying remaining chunks */

	done: ;
	fclose(inp);
	fflush(outp);
	fclose(outp);
	printf("fft1_wave done. new %s file written \n", argv[2]);

	return 0;
}