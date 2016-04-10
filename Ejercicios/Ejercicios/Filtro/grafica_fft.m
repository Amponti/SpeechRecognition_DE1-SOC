% plot_fft.m  time sequence input, 3 types of output

function plot_fft
  clear
  format compact

   % get user input, e.g. short_count.dat
  filename=input('enter file name: ', 's');
  fid=fopen(filename, 'r');
  [v,n] = fscanf(fid, '%f'); % default size of n changes      
  fignum=0;
  if 2*int32(n/2)~=n
    n=n-1;
  end
  disp([num2str(n) ' points to process'])
  fignum = fignum+1;
  figure(fignum)
  plot(1:n,v(1:n))
  grid on
  axis tight
  xlabel('sample number');
  ylabel('amplitude');
  title(['input data ' filename]);

  u=fft(v(1:n));
  uu=fftshift(u);
  disp(['length of ' filename ' =' num2str(length(uu))])

  fignum = fignum+1;
  figure(fignum)
  plot(1:n,abs(u))
  grid on
  axis tight
  xlabel('frequency bin');
  ylabel('linear amplitude');
  title(['raw FFT of input ' filename]);

  fignum = fignum+1;
  figure(fignum)
  plot(-n/2+1:n/2,abs(uu))
  set(gca,'XTick',-n/2:n/10:n/2)
  grid on
  axis tight
  xlabel('frequency bin');
  ylabel('linear amplitude');
  title(['shifted FFT of input ' filename]);

  fignum = fignum+1;
  figure(fignum)
  plot(-n/2+1:n/2,20.0 .* log(abs(uu)+0.000000001))
  set(gca,'XTick',-n/2:n/10:n/2)
  grid on
  xlabel('frequency bin');
  ylabel('db amplitude');
  axis([-n/2 n/2 0 20.0*log(max(abs(uu)))]);
  title(['shifted log FFT of input ' filename]);

 end % plot_fft