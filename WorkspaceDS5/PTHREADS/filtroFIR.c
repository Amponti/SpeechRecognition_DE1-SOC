/*
 * filtroFIR.c
 *
 *  Created on: 26/08/2015
 *      Author: jdani
 */

#include "filtroFIR.h"
#include <stdlib.h>
#include <stdio.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal.h"
#include "hps.h"
#include "alt_gpio.h"

double w[3000];//= (float*) malloc (sizeof(float)*N);
double hd[3000];//=(float*) malloc (sizeof(float)*N);

extern volatile unsigned long *val1_addr;
//extern volatile unsigned long *val2_addr;
extern volatile unsigned long *select_addr;
extern volatile unsigned long *wr_addr;
extern volatile unsigned long *result_addr;

void calc_FIR_coefs(FIR_filter * filter)
{
	int n = 0;							// Número de iteraciones (inicia en 0)
	int fs = filter->FS;         		// Frecuencia de muestreo
	int fc1 = filter->F1;            	// Frecuencia de corte mínima
	int fc2 = filter->F2;            	// Frecuencia de corte máxima
	double Wc1 = (2*PI*fc1)/fs;
	double Wc2 = (2*PI*fc2)/fs;
	int N = (filter->order)+1;
	int M = (N/2);						// Coeficiente tipo de filtro

	//test
	printf("Parametros Filtro FIR: \nOrden: %d \nFrec. Muestreo: %d \nFrec. Corte 1: %d \nFrec. Corte 2: %d\n",filter->order,filter->FS,filter->F1,filter->F2);
	//test

	if(N>3000)
	{
		return;
	}

	int i;

	filter->coefs=(double *) malloc(sizeof(double)*N);
	filter->taps=(int *) malloc(sizeof(int)*N);

	int window_type = filter->window_type;
	int filter_type = filter->filter_type;

	double window_mask;
	double not_equal_filter_mask;
	double equal_filter_mask;

	switch(window_type)
	{
		case 0:		//HANN
			printf("Window type: HANN.\n");
			break;
		case 1:		//BARTLETT
			printf("Window type: BARTLETT.\n");
			break;
		case 2:		//HAMMING
			printf("Window type: HAMMING.\n");
			break;
		case 3:		//BOHMAN
			printf("Window type: BOHMAN.\n");
			break;
		case 4:		//BLACKMAN
			printf("Window type: BLACKMAN.\n");
			break;
		case 5:		//BLACKMAN HARRIS
			printf("Window type: BLACKMAN HARRIS.\n");
			break;
		default:
			printf("Error: window type selection.\n");
			break;
	}
	switch(filter_type)
	{
		case 0:		//LOW PASS FILTER
			printf("Filter type: LOW PASS FILTER.\n");
			break;
		case 1:		//HIGH PASS FILTER
			printf("Filter type: HIGH PASS FILTER.\n");
			break;
		case 2:		//BAND PASS FILTER
			printf("Filter type: BAND PASS FILTER.\n");
			break;
		case 3:		//BAND STOP FILTER
			printf("Filter type: BAND STOP FILTER.\n");
			break;
		default:
			printf("Error: filter type selection.\n");
			break;
	}
	for(i=0;i<N;i++)
	{
		switch(window_type)
		{
			case 0:		//HANN
				window_mask = (0.5*(1-cos((2*PI*n)/(N-1))));
				break;
			case 1:		//BARTLETT
				window_mask = (0.62-0.48*((n/(N-1))-0.5)+0.38*cos(2*PI*((2/(N-1))-0.5)));
				break;
			case 2:		//HAMMING
				window_mask = (0.54-0.46*(1-cos((2*PI*n)/(N-1))));
				break;
			case 3:		//BOHMAN
				window_mask = ((1-((n-((N-1)/2))/((N-1)/2)))*cos(PI*((n-((N-1)/2))/((N-1)/2)))+(1/PI)*sin(PI*((n-((N-1)/2))/((N-1)/2))));
				break;
			case 4:		//BLACKMAN -ready
				window_mask = (0.42-0.5*cos((2*PI*n)/(N-1))+0.08*cos((4*PI*n)/(N-1)));
				break;
			case 5:		//BLACKMAN HARRIS
				window_mask = (0.35875-0.48829*cos((2*PI*n)/(N-1))+0.14128*cos((4*PI*n)/(N-1))-0.01168*cos((6*PI*n)/(N-1)));
				break;
			default:
				window_mask = 0;
				break;
		}

		switch(filter_type)
		{
			case 0:		//LOW PASS FILTER -ready
				not_equal_filter_mask = (sin(Wc1*(n-M))/(PI*(n-M)));
				equal_filter_mask = (Wc1/PI);
				break;
			case 1:		//HIGH PASS FILTER -ready
				not_equal_filter_mask = (-1)*(sin(Wc1*(n-M))/(PI*(n-M)));
				equal_filter_mask = (1-(Wc1/PI));
				break;
			case 2:		//BAND PASS FILTER -ready
				not_equal_filter_mask = ((sin(Wc2*(n-M))/(PI*(n-M)))-(sin(Wc1*(n-M))/(PI*(n-M))));
				equal_filter_mask = ((Wc2-Wc1)/PI);
				break;
			case 3:		//BAND STOP FILTER
				not_equal_filter_mask = ((sin(Wc1*(n-M))/(PI*(n-M)))-(sin(Wc2*(n-M))/(PI*(n-M))));
				equal_filter_mask = (1-((Wc2-Wc1)/PI));
				break;
			default:
				not_equal_filter_mask = 0;
				equal_filter_mask = 0;
				break;
		}

		w[i] = window_mask;
		if(n!=M)
		{
			hd[i] = not_equal_filter_mask;
		}
		else
		{
			hd[i] = equal_filter_mask;
		}
		filter->coefs[i] = hd[i]*w[i];
		//filter->taps[i]=0;
		n = n+1;
	}
}

void normalize_signal( SIGNAL * FIR_signal, int center)
{
	int prom=0;
	int i;
	for(i=0;i<FIR_signal->lenght; i++)
	{
		prom=prom+FIR_signal->signal[i];
	}
	prom=prom/FIR_signal->lenght;
	prom=center-prom;

	for(i=0;i<FIR_signal->lenght; i++)
	{
		FIR_signal->signal[i]=FIR_signal->signal[i]+prom;
	}
}

void load_signal( SIGNAL * FIR_signal, char * filename)
{
	FILE * pFile;
	long lSize;
	char * buffer;
	int i;
	size_t result;

	pFile = fopen (filename,"rb");
	if(pFile==NULL)
	{
		printf("No se pudo leer el archivo.\n");
		exit (1);
	}

	//obtain file size
	fseek (pFile , 0 , SEEK_END);
	lSize = ftell (pFile);
	rewind (pFile);

	//allocate memory to contain the whole file
	buffer = (char*) malloc (sizeof(char)*lSize);

	if (buffer == NULL)
	{
		printf("Error en memoria");
		exit (2);
	}

	//copy the file into the buffer
	result = fread (buffer,1,lSize,pFile);
	if (result != lSize)
	{
		printf("Error de lectura");
		exit (3);
	}
	printf("Archivo almacenado en buffer.\n");

	FIR_signal->lenght=lSize;
	FIR_signal->signal=(int*) malloc (sizeof(int)*FIR_signal->lenght);

	for(i=0;i<lSize; i++)
	{
		FIR_signal->signal[i]=(int)buffer[i];
	}

	//terminate
	fclose(pFile);
	free(buffer);
}

void save_signal( SIGNAL * FIR_signal, char * filename)
{
	FILE * pFilt;
	int i;
	pFilt = fopen(filename,"wb");
	//save
	unsigned char dato;
	for(i=0;i<FIR_signal->lenght;i++)
	{

		dato=(unsigned char)FIR_signal->signal[i];
		fwrite ( &dato, sizeof(char), 1, pFilt);
	}
	fclose(pFilt);
}

void apply_FIR(FIR_filter * filtro, int data, int * FIR_output)
{

}

double acc_multi(FIR_filter * filtro, SIGNAL * FIR_signal,int offset,int offset2)
{
	int 	i;
	unsigned int resultado;
	double * data_result;
	double result=0;//
	int * data1;
	int * data2;

	alt_write_word(wr_addr, 0 );
	//enviar serial los coef y data
	for(i=0;i<4;i++)
	{
		alt_write_word(wr_addr, 0);
		alt_write_word(select_addr, i);
		data1=(float*)&FIR_signal->signal[i+offset+offset2];
		data2=(float*)&filtro->coefs[i+offset2];
		alt_write_word(val1_addr, data1);
		alt_write_word(val1_addr,data2);
		alt_write_word(wr_addr, 1 );
	}

	alt_write_word(wr_addr, 0);
	data_result=(float*)&resultado;
	//recibir y sumar serial los coef y data
	for(i=0;i<4;i++)
	{
		alt_write_word(select_addr, i);
		resultado = alt_read_word(result_addr);
		result=result+*data_result;
	}
	return result;
}

void apply_FIR_whole_signal(FIR_filter * filtro, SIGNAL * FIR_signal, SIGNAL * FIR_output)
{
	int 	i,j;
	double 	filter;
	int	 	resultado;
	int 	size = FIR_signal->lenght;
	int 	N = filtro->order+1;

	double data;
	if(filtro->sw_hw==0)
	{//SW
		for(i=0;i<(size-N);i++)
		{
			filter=0;
			for(j=0;j<N;j++)
			{
				data=(double)FIR_signal->signal[i+(j)];
				filter = filter+(filtro->coefs[j] * data);
			}
			resultado=(int)filter;
			FIR_output->signal[i]=resultado;
		}
	}
}

void * fir_thread(void *shared)
{
	SIGNALTHREAD * tempThreads= (SIGNALTHREAD *)shared ;

	int 	i,j;
	double 	filter;
	int	 	resultado;
	int 	size = tempThreads->signal_in->lenght;
	int 	N = tempThreads->filter->order+1;

	double data;
	
	printf("Thread[%d] %d %d\n",tempThreads->id,tempThreads->offset,size);
	
	for(i=(tempThreads->offset);i<((tempThreads->offset+(size/NTHREADS))-N);i++)
	{
		filter=0;
		for(j=0;j<N;j++)
		{
			data=(double)tempThreads->signal_in->signal[i+(j)];
			filter = filter+(tempThreads->filter->coefs[j] * data);
		}
		resultado=(int)filter;
		tempThreads->signal_out->signal[i]=resultado;
	}
}

void apply_FIR_whole_signal_pthreads(FIR_filter * filtro, SIGNAL * FIR_signal, SIGNAL * FIR_output)
{
	int 	size = FIR_signal->lenght;
	int 	N = filtro->order+1;

	SIGNALTHREAD  tempThreads[4];
	pthread_t * thr[4];

	tempThreads[0].signal_in=FIR_signal;
	tempThreads[0].signal_out=FIR_output;
	tempThreads[0].filter=filtro;
	tempThreads[0].offset=0;
	tempThreads[0].id=1;

	tempThreads[1].signal_in=FIR_signal;
	tempThreads[1].signal_out=FIR_output;
	tempThreads[1].filter=filtro;
	tempThreads[1].offset=(size/NTHREADS)+N;
	tempThreads[1].id=2;
	
	tempThreads[2].signal_in=FIR_signal;
	tempThreads[2].signal_out=FIR_output;
	tempThreads[2].filter=filtro;
	tempThreads[2].offset=tempThreads[1].offset+(size/NTHREADS)+N;
	tempThreads[2].id=3;

	tempThreads[3].signal_in=FIR_signal;
	tempThreads[3].signal_out=FIR_output;
	tempThreads[3].filter=filtro;
	tempThreads[3].offset=tempThreads[2].offset+(size/NTHREADS)+N;
	tempThreads[3].id=4;
	
	printf("size real %d \n",size);
	pthread_create(&thr[0], NULL, fir_thread, (void *)&tempThreads[0]);
	pthread_create(&thr[1], NULL, fir_thread, (void *)&tempThreads[1]);
	pthread_create(&thr[2], NULL, fir_thread, (void *)&tempThreads[2]);
	pthread_create(&thr[3], NULL, fir_thread, (void *)&tempThreads[3]);

	pthread_join(thr[0], NULL);
	pthread_join(thr[1], NULL);
	pthread_join(thr[2], NULL);
	pthread_join(thr[3], NULL);
}
