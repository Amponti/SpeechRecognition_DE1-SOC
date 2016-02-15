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
#include "./include/hwlib.h"
#include "./include/socal/socal.h"
#include "./include/socal/hps.h"
#include "./include/socal/alt_gpio.h"

// This is a integer SIN lookup table
// Values are (SIN(x) * 1024)
short int_sin_array[360]=
{0, 17, 35, 53, 71, 89, 107, 124, 142, 160,
177, 195, 212, 230, 247, 265, 282, 299, 316, 333,
350, 366, 383, 400, 416, 432, 448, 464, 480, 496,
512, 527, 542, 557, 572, 587, 601, 616, 630, 644,
658, 671, 685, 698, 711, 724, 736, 748, 760, 772,
784, 795, 806, 817, 828, 838, 848, 858, 868, 877,
886, 895, 904, 912, 920, 928, 935, 942, 949, 955,
962, 968, 973, 979, 984, 989, 993, 997, 1001, 1005,
1008, 1011, 1014, 1016, 1018, 1020, 1021, 1022, 1023, 1023,
1024, 1023, 1023, 1022, 1021, 1020, 1018, 1016, 1014, 1011,
1008, 1005, 1001, 997, 993, 989, 984, 979, 973, 968,
962, 955, 949, 942, 935, 928, 920, 912, 904, 895,
886, 877, 868, 858, 848, 838, 828, 817, 806, 795,
784, 772, 760, 748, 736, 724, 711, 698, 685, 671,
658, 644, 630, 616, 601, 587, 572, 557, 542, 527,
512, 496, 480, 464, 448, 432, 416, 400, 383, 366,
350, 333, 316, 299, 282, 265, 247, 230, 212, 195,
177, 160, 142, 124, 107, 89, 71, 53, 35, 17,
0, -18, -36, -54, -72, -90, -108, -125, -143, -161,
-178, -196, -213, -231, -248, -266, -283, -300, -317, -334,
-351, -367, -384, -401, -417, -433, -449, -465, -481, -497,
-512, -528, -543, -558, -573, -588, -602, -617, -631, -645,
-659, -672, -686, -699, -712, -725, -737, -749, -761, -773,
-785, -796, -807, -818, -829, -839, -849, -859, -869, -878,
-887, -896, -905, -913, -921, -929, -936, -943, -950, -956,
-963, -969, -974, -980, -985, -990, -994, -998, -1002, -1006,
-1009, -1012, -1015, -1017, -1019, -1021, -1022, -1023, -1024, -1024,
-1024, -1024, -1024, -1023, -1022, -1021, -1019, -1017, -1015, -1012,
-1009, -1006, -1002, -998, -994, -990, -985, -980, -974, -969,
-963, -956, -950, -943, -936, -929, -921, -913, -905, -896,
-887, -878, -869, -859, -849, -839, -829, -818, -807, -796,
-785, -773, -761, -749, -737, -725, -712, -699, -686, -672,
-659, -645, -631, -617, -602, -588, -573, -558, -543, -528,
-512, -497, -481, -465, -449, -433, -417, -401, -384, -367,
-351, -334, -317, -300, -283, -266, -248, -231, -213, -196,
-178, -161, -143, -125, -108, -90, -72, -54, -36, -18};

// This is a integer COS lookup table
// Values are (COS(x) * 1024)
short int_cos_array[360]=
{1024, 1023, 1023, 1022, 1021, 1020, 1018, 1016, 1014, 1011,
1008, 1005, 1001, 997, 993, 989, 984, 979, 973, 968,
962, 955, 949, 942, 935, 928, 920, 912, 904, 895,
886, 877, 868, 858, 848, 838, 828, 817, 806, 795,
784, 772, 760, 748, 736, 724, 711, 698, 685, 671,
658, 644, 630, 616, 601, 587, 572, 557, 542, 527,
512, 496, 480, 464, 448, 432, 416, 400, 383, 366,
350, 333, 316, 299, 282, 265, 247, 230, 212, 195,
177, 160, 142, 124, 107, 89, 71, 53, 35, 17,
0, -18, -36, -54, -72, -90, -108, -125, -143, -161,
-178, -196, -213, -231, -248, -266, -283, -300, -317, -334,
-351, -367, -384, -401, -417, -433, -449, -465, -481, -497,
-512, -528, -543, -558, -573, -588, -602, -617, -631, -645,
-659, -672, -686, -699, -712, -725, -737, -749, -761, -773,
-785, -796, -807, -818, -829, -839, -849, -859, -869, -878,
-887, -896, -905, -913, -921, -929, -936, -943, -950, -956,
-963, -969, -974, -980, -985, -990, -994, -998, -1002, -1006,
-1009, -1012, -1015, -1017, -1019, -1021, -1022, -1023, -1024, -1024,
-1024, -1024, -1024, -1023, -1022, -1021, -1019, -1017, -1015, -1012,
-1009, -1006, -1002, -998, -994, -990, -985, -980, -974, -969,
-963, -956, -950, -943, -936, -929, -921, -913, -905, -896,
-887, -878, -869, -859, -849, -839, -829, -818, -807, -796,
-785, -773, -761, -749, -737, -725, -712, -699, -686, -672,
-659, -645, -631, -617, -602, -588, -573, -558, -543, -528,
-512, -497, -481, -465, -449, -433, -417, -401, -384, -367,
-351, -334, -317, -300, -283, -266, -248, -231, -213, -196,
-178, -161, -143, -125, -108, -90, -72, -54, -36, -18,
-1, 17, 35, 53, 71, 89, 107, 124, 142, 160,
177, 195, 212, 230, 247, 265, 282, 299, 316, 333,
350, 366, 383, 400, 416, 432, 448, 464, 480, 496,
512, 527, 542, 557, 572, 587, 601, 616, 630, 644,
658, 671, 685, 698, 711, 724, 736, 748, 760, 772,
784, 795, 806, 817, 828, 838, 848, 858, 868, 877,
886, 895, 904, 912, 920, 928, 935, 942, 949, 955,
962, 968, 973, 979, 984, 989, 993, 997, 1001, 1005,
1008, 1011, 1014, 1016, 1018, 1020, 1021, 1022, 1023, 1023};

// Integer sin lookup
double int_sin( int deg )
{
	deg %= 360;
	if(deg < 0)
	{
	  deg += 360;
	}
	return((double)int_sin_array[deg]/1024);
}

// Integer cos lookup
double int_cos( int deg )
{
	deg %= 360;
	if(deg < 0)
	{
		deg += 360;
	}
	return((double)int_cos_array[deg]/1024);
}

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
	printf("calculando: FIR %d, %d, %d, %d",filter->order,filter->FS,filter->F1,filter->F2);
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
				window_mask = (0.5*(1-int_cos(TODEGREE((2*PI*n)/(N-1)))));
				break;
			case 1:		//BARTLETT
				window_mask = (0.62-0.48*((n/(N-1))-0.5)+0.38*int_cos((TODEGREE(2*PI))*((n/(N-1))-0.5)));
				break;
			case 2:		//HAMMING
				window_mask = (0.54-0.46*(1-int_cos((TODEGREE(2*PI*n))/(N-1))));
				break;
			case 3:		//BOHMAN
				window_mask = ((1-((n-((N-1)/2))/((N-1)/2))) * int_cos((TODEGREE(PI))-((n-((N-1)/2))/((N-1)/2))) + (1/PI)*int_sin((TODEGREE(PI))-((n-((N-1)/2))/((N-1)/2))));
				break;
			case 4:		//BLACKMAN -ready
				window_mask = (0.42-0.5*int_cos(TODEGREE((2*PI*n)/(N-1)))+0.08*int_cos(TODEGREE((4*PI*n)/(N-1))));
				break;
			case 5:		//BLACKMAN HARRIS
				window_mask = (0.35875-0.48829*int_cos((TODEGREE(2*PI*n))/(N-1))+0.14128*int_cos((TODEGREE(4*PI*n))/(N-1))-0.01168*int_cos((TODEGREE(6*PI*n))/(N-1)));
				break;
			default:
				window_mask = 0;
				break;
		}

		switch(filter_type)
		{
			case 0:		//LOW PASS FILTER -ready
				not_equal_filter_mask = (int_sin(TODEGREE(Wc1*(n-M)))/(PI*(n-M)));
				equal_filter_mask = (Wc1/PI);
				break;
			case 1:		//HIGH PASS FILTER -ready
				not_equal_filter_mask = (-1)*(int_sin(TODEGREE(Wc1*(n-M)))/(PI*(n-M)));
				equal_filter_mask = (1-(Wc1/PI));
				break;
			case 2:		//BAND PASS FILTER -ready
				not_equal_filter_mask = ((int_sin(TODEGREE((Wc2*(n-M))))/(PI*(n-M)))-(int_sin(TODEGREE((Wc1*(n-M))))/(PI*(n-M))));
				equal_filter_mask = ((Wc2-Wc1)/PI);
				break;
			case 3:		//BAND STOP FILTER
				not_equal_filter_mask = ((int_sin(TODEGREE((Wc1*(n-M))))/(PI*(n-M)))-(int_sin(TODEGREE((Wc2*(n-M))))/(PI*(n-M))));
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

double acc_multi(FIR_filter * filtro, SIGNAL * FIR_signal,int offset,int offset2){

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

	SIGNALTHREAD * tempThreads1;
	SIGNALTHREAD * tempThreads2;
	pthread_t * thr1,thr2;



	double data;
	if(filtro->sw_hw==0){//SW

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


void * fir_thread(void *shared){
	SIGNALTHREAD * tempThreads= (SIGNALTHREAD *)shared ;

	int 	i,j;
	double 	filter;
	int	 	resultado;
	int 	size = tempThreads->signal_in->lenght;
	int 	N = tempThreads->filter->order+1;


	double data;
	for(i=(tempThreads->offset);i<((tempThreads->offset+size/2)-N);i++)
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

	SIGNALTHREAD  tempThreads1;
	SIGNALTHREAD  tempThreads2;
	pthread_t * thr1,thr2;

	tempThreads1.signal_in=FIR_signal;
	tempThreads1.signal_out=FIR_output;
	tempThreads1.filter=filtro;
	tempThreads1.offset=0;
	tempThreads1.id=1;


	tempThreads2.signal_in=FIR_signal;
	tempThreads2.signal_out=FIR_output;
	tempThreads2.filter=filtro;
	tempThreads2.offset=size>>1-N;
	tempThreads2.id=2;


	pthread_create(&thr1, NULL, fir_thread, &tempThreads1);
	pthread_create(&thr2, NULL, fir_thread, &tempThreads2);



	pthread_join(thr1, NULL);
	pthread_join(thr2, NULL);


}









