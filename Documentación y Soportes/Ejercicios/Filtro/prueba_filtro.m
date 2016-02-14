%% Eliminación de frecuencias parasitas existentes en una canción
%%____________________________________________
close all;
clear all;
clc;
%%____________________________________________
%% Llamado de la canción
[y,fs]=audioread('adelante.wav');
%% y = la señal de la cancion fs = frecuencia de muestreo
%%____________________________________________
% Graficar la señal original en el tiempo
subplot(2,1,1) 
L1=length(y);              %% Tamaño del vector de Y (cancion)
Ni1 = 1;                     %% Graficar desde este valor inicial
No1 = L1;                     %% Grafica valor final
T=L1/fs;                     %% Periodo de la cancion
t=linspace(0,T,T*fs);       %% Vector de tiempo desde 0 hasta T, contemplado para los puntos del vector L
plot(t(Ni1:No1),y(Ni1:No1))     %% Grafica señal de la cancion vs tiempo
title('SEÑAL ORIGINAL')     %% Título 
xlabel('Tiempo (s)')        %% Etiqueta del eje X 
ylabel('Amplitud (V)')      %% Etiqueta del eje Y 
%%____________________________________________
%%Pasar la canción a la transformada rápida de Fourier
NFFT = 2^nextpow2(L1);      %% Cantidad de muestras de la transformada de fourier
npoint = 2^8;
Y = fft(y,NFFT); 
f = fs/2*linspace(0,1,NFFT/2+1);
%%____________________________________________
%%Grafica del espectro original
subplot(2,1,2)
L2 = length(f);              %% Tamaño del vector de Y (cancion)
Ni2 = 1;
No2 = L2;
plot(f(Ni2:No2),abs(Y(Ni2:No2)))
title('ESPECTRO DE LA SEÑAL ORIGINAL') 
xlabel('Frecuencia (HZ)') 
ylabel('|Y(f)|') 
