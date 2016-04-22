% low_pass or Band_pass filters with windows Blackman Harris
clear all
close all
clc

Nf = 600;            % Orden del filtro 
N = Nf+1;           % Números de Coeficientes 
n = 0;
fs = 44100;         % Frecuencia de muestreo 
fc1 = 100;            % Frecuencia de corte mínima
fc2 = 3600;            % Frecuencia de corte máxima
Wc1 = (2*pi*fc1)/fs;
Wc2 = (2*pi*fc2)/fs;
M = floor(N/2);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Quest Dialog: cuadro de pregunta al usuario para ejecutar una operación
choice = questdlg('Seleccione una ventana para filtrar: ','FILTRO FIR!','Blackman','Blackman-Harris','Blackman');
% Manejo por switch case de la respuesta del usuario
switch choice
    case 'Blackman'
        BFlag = 1;
        BHFlag = 0;
    case 'Blackman-Harris'
        BFlag = 0;
        BHFlag = 1;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:N
    if (BFlag==1)
        w(i) = (0.42-0.5*cos((2*pi*n)/(N-1))+0.08*cos((4*pi*n)/(N-1)));
    else
        w(i) = (0.35875-0.48829*cos((2*pi*n)/(N-1))+0.14128*cos((4*pi*n)/(N-1))-0.01168*cos((6*pi*n)/(N-1)) );  
    end
    if n ~= M
        hd(i) = ((sin(Wc2*((n)-M)))/(pi*((n)-M))) - ((sin(Wc1*((n)-M)))/(pi*((n)-M))) ;
    else
        hd(i) = ((Wc2-Wc1)/pi);
    end
    h(i) = hd(i)*w(i);
    n = n+1;
end

fvtool(h);

[y, fs]=audioread('song.wav'); %archivo audio
y=y';
save('songdata.txt','y','-ascii')

a=[1,2,3,4,5,6,7,8,9];
a=a';
save('example.txt','a','-ascii')
%Escriba su codigo de su filtro aqui
%-----------------------------------

size=length(y);%tamano de la cancion muestras
porcentaje_senal=1;%se calcula el porcentaje de la señal 
size=size*porcentaje_senal;%tamaño del audio dependiendo del porcentaje que se quiere mostrar.
% Y=[0:1:size-N-1];%
%y=zeros(size-N);%crea el tamaño Y que inicialmente son ceros, de las muestras de la ventana.

for i=1:((size)-N)%recorrer la cancion
    resultado_filtro=0;%se inicializa en cero, asi no haya guardado los datos anteriores
    for j=1:N% recorrer las N muestras que requiere el filtro
        resultado_filtro=resultado_filtro+(h(j)*y(i+(j-1)));%toma los valores de la señal del audio I y lo multiplicapor la ventana de h(J)
    end
    Y(i)=resultado_filtro;% muestra el resultado del filtro
end
plot(Y)


%%sound(Y,44100)% sonar pulsos
%wavwrite(y,44100,'pulsos.wav')%% si se quiere guardar el resultado en wav

%Escriba su codigo de su filtro hasta aqui


%sound(y,fs)% audio filtrado