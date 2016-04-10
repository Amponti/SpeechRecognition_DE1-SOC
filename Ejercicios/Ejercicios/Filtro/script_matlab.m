fileName='filter2.wav';
[y, fs, nbits]=wavread(fileName);
y0=y*(2^8/2)+(2^8/2);
right=uint16(y0)/2;
fil=fopen('adelante2.bin','wb')
fwrite(fil,right)
fclose(fil)

