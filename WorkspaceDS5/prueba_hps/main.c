//=======================================================================================
//=======================================================================================
// PROGRAMA 		: Prueba FIFO-WAV
// FUNCI�N 			: Pr�ctica Proyecto de Grado
// REALIZADO POR	: Holguer A. Becerra D. - Jefferson M. Garc�a P. - Juan D. Prieto A.
// ORGANIZACI�N		: Universidad pontificia Bolivariana
// FECHA 			: Mayo 2016
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

#include "hps.h"
#include "include.h"

//=======================================================================================
// PAR�METROS
//=======================================================================================
#define REG_BASE 0xC0000000
#define REG_SPAN 0x00100000

#define REG_BASE_LW 0xFF200000
#define REG_SPAN_LW 0x00200000

void* virtual_base;
void* virtual_base_lw;

void* led_addr;
void* sw_addr;
void* key_addr;
void* audio_addr;
void* empty_addr;
void* fclk_addr;
void* fifow_addr;

int fd;
int sw;
int key;
char audio;
int empty;
int fclk;
int fifow;

//=======================================================================================
// RUTINA: INICIO DEL SISTEMA
//=======================================================================================
void init_system()
{
	if((fd=open("/dev/mem",(O_RDWR|O_SYNC)))==-1)
	{
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		exit (1);
	}

	virtual_base = mmap(NULL,REG_SPAN,(PROT_READ|PROT_WRITE),MAP_SHARED,fd,REG_BASE);
	if(virtual_base==MAP_FAILED)
	{
		printf( "ERROR: mmap h2f() failed...\n" );
		close(fd);
		exit (2);
	}

	virtual_base_lw = mmap(NULL,REG_SPAN_LW,(PROT_READ|PROT_WRITE),MAP_SHARED,fd,REG_BASE_LW);

	if(virtual_base_lw==MAP_FAILED)
	{
		printf( "ERROR: mmap lw_h2f() failed...\n" );
		close(fd);
		exit (3);
	}

	led_addr 		= virtual_base_lw + (( unsigned long )( REG_BASE_LW + LED_BASE ) & (unsigned long)( REG_SPAN_LW-1 ));
	sw_addr 		= virtual_base_lw + (( unsigned long )( REG_BASE_LW + SW_BASE ) & (unsigned long)( REG_SPAN_LW-1 ));
	key_addr		= virtual_base + (( unsigned long )( REG_BASE + KEY_BASE ) & (unsigned long)( REG_SPAN-1 ));
	audio_addr		= virtual_base + (( unsigned long )( REG_BASE + AUDIO_L_BASE ) & (unsigned long)( REG_SPAN-1 ));
	empty_addr		= virtual_base + (( unsigned long )( REG_BASE + FIFO_EMPTY_BASE ) & (unsigned long)( REG_SPAN-1 ));
	fclk_addr		= virtual_base + (( unsigned long )( REG_BASE + FIFO_CLK_BASE ) & (unsigned long)( REG_SPAN-1 ));
	fifow_addr		= virtual_base + (( unsigned long )( REG_BASE + AUDIO_R_BASE ) & (unsigned long)( REG_SPAN-1 ));
}

unsigned char finish=0;
unsigned int led=0;
SIGNAL audio_signal;

int main()
{
	//<><><><><><><><><><><><><><><><><>//
	// 		SYSTEM INITIALIZING			//
	//<><><><><><><><><><><><><><><><><>//
	init_system();

	int i=0;
	long lSize = 600000;
	int * buffer;

	buffer = (int*) malloc (sizeof(int)*lSize);

	audio_signal.lenght=lSize;
	audio_signal.signal=(int*) malloc (sizeof(int)*audio_signal.lenght);

	while(1)
	{
		sw=*(unsigned int*)sw_addr;
		key=*(unsigned int*)key_addr;
		empty=*(unsigned int*)empty_addr;
		audio=*(unsigned int*)audio_addr;
		fifow=*(unsigned int*)fifow_addr;
		*(unsigned int *)fclk_addr=0;
		switch(sw)
		{
			case 0:
				*(unsigned int *)fclk_addr=0;
								usleep(1000000);
								*(unsigned int *)fclk_addr=1;
								usleep(1000000);

				led=*(unsigned int*)led_addr;
				*(unsigned int *)led_addr = led+1;
				usleep(100000);
				break;

			case 1:
				led=*(unsigned int*)led_addr;
				*(unsigned int *)led_addr = led-1;
				usleep(100000);
				break;

			case 2:
				if(led<=0)
				{
					led=512;
				}
				else
				{
					led=*(unsigned int*) led_addr;
				}
				*(unsigned int *)led_addr = led>>1;
				usleep(100000);
				break;

			case 3:
				if(led>=512)
				{
					led=1;
				}
				else
				{
					led=*(unsigned int*) led_addr;
				}
				*(unsigned int *)led_addr = led<<1;
				usleep(100000);
				break;

			case 4:
				finish=1;
				break;

			case 256:

				i=0;
				break;

			case 512:
				empty=*(unsigned int*)empty_addr;

				while(!empty && i<600000)
				{

					fifow=*(unsigned int*)fifow_addr;
					empty=*(unsigned int*)empty_addr;
					sw=*(unsigned int*)sw_addr;

					if(sw==4){break;}

					*(unsigned int *)fclk_addr=0;
					usleep(1);
					*(unsigned int *)fclk_addr=1;
					usleep(1);
					*(unsigned int *)fclk_addr=0;
					audio=*(unsigned int*)audio_addr;
					buffer[i] = audio;
					audio_signal.signal[i]=(int)buffer[i];
					i++;
					if(i>600000)
					{
						break;
					}
				}
				break;

			default:
				*(unsigned int *)led_addr = sw;
				usleep(100000);
				break;
		}
		if(finish)
		{
			save_signal(&audio_signal,"audio.bin");

			//desmotar memoria virtual
			munmap(virtual_base_lw,REG_SPAN_LW);
			munmap(virtual_base,REG_SPAN);

			//cerrar arvhivo
			close(fd);
			printf("fin\n");
			return 0;
		}
	}
}