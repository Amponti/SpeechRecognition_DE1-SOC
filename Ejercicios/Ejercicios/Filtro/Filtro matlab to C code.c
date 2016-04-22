#include <stdio.h>
#include <stdlib.h>
#include <math.h>

# define PI		3.14159265358979323846	/* pi */
////////////////// FILTRO FIR /////////////
int N = 200;					// Orden del filtro 
//Nf = N+1;           			// Números de Coeficientes 
int n = 0;						// Número de iteraciones (inicia en 0)
int fs = 44100;         		// Frecuencia de muestreo 
int fc1 = 100;            		// Frecuencia de corte mínima
int fc2 = 5000;            		// Frecuencia de corte máxima
double Wc1 = (2*PI*fc1)/fs;		
double Wc2 = (2*PI*fc2)/fs;		
int M = (N/2);					// Coeficiente tipo de filtro

int SW_WINDOW = 0;
int BFlag = 0;

int i,j;
int main()
{
	if(SW_WINDOW==0)
	{
		printf("Tipo de ventana: Blackman\n");
		int BFlag = 0;
	}
	else
	{
		printf("Tipo de ventana: Blackman-Harris\n");
		int BFlag = 1;
	}

	float w=0;
	float hd=0;
	float h=0;
	
	for(i=0;i>=N;i++)
	{
		if (BFlag==0)
		{
			w(i) = (0.42-0.5*cos((2*PI*n)/(N-1))+0.08*cos((4*PI*n)/(N-1)));
		}
		else
		{
			w(i) = (0.35875-0.48829*cos((2*PI*n)/(N-1))+0.14128*cos((4*PI*n)/(N-1))-0.01168*cos((6*PI*n)/(N-1)) );
		}
		
		if(n!=M)
		{
			hd(i) = ((sin(Wc2*((n)-M)))/(PI*((n)-M))) - ((sin(Wc1*((n)-M)))/(PI*((n)-M))) ;
		}
		else
		{
			hd(i) = ((Wc2-Wc1)/PI);
		}
		
		h(i) = hd(i)*w(i);
		n = n+1;
	}

	/////////////////////////////////////////////////////////////////////
	//	ABRIR EL ARCHIVO DE AUDIO!!!!!!!!!!!!!!!!!!!!
	/////////////////////////////////////////////////////////////////////
	double y=0;
	int size = (sizeof(y)/4);	//Suponer que y es el vector donde se encuentra almacenado el audio
    printf("La muestra de audio tiene: %d elementos.\n",size);
    
    float porcentaje = 1;
	size = size * porcentaje;	//Porcentaje entre 0 y 1 dependiendo que tanto se quiere muestrear
	
	double Y[size-N-1];
	double filter;
	
	for(i=0;i>=(size-N);i++)
	{
		filter=0;
		for(j=0;j>=N;j++)
		{
			filter = filter+(h[j]*y[i+(j-1)]);
		}
		Y[i]=filter;
	}
}