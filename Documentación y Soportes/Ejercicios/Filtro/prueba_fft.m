clc
clear all

L1 = 16;

for i = 1:L1
    %y(i) = 0.125*cos(2*pi*(i-1)/L1);
    %x(i) = 0.125*sin(2*pi*(i-1)/L1);
    y(i) = 0.3*cos(2*pi*(i-1)/L1);
    x(i) = 0; %-0.3*sin(2*pi*(i-1)/L1);
    z(i) = complex(y(i),x(i));
end

for L = 1:10
    REX(L) = 2+2*cos(2*pi*(L-1)/L1)+4*sin(2*pi*3*(L-1)/L1);
    IMX(L) = -2+2*sin(2*pi*(L-1)/L1)+4*cos(2*pi*3*(L-1)/L1);
    Z(L) = complex(REX(L),IMX(L));
end


%y = 0.125*cos(2*pi*k/L1);

NFFT = 2^nextpow2(L1);      %% Cantidad de muestras de la transformada de fourier
T = fft(Z,NFFT)/L1; 
X=ifft(T);
%f = fs/2*linspace(0,1,NFFT/2+1);
