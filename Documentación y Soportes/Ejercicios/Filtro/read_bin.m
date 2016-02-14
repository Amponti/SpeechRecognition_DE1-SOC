clear all;
clc;

ArchivoID= fopen('Re_adelante.bin','rb');
A=fread (ArchivoID,263*256,'float32');
%A=fread (ArchivoID);
plot(abs(A));

% ArchivoID= fopen('prbita.bin','rb');
% A=fread (ArchivoID,263*256,'float32');
% sector=263
% 
% A2=zeros(256);
% h=0;
% for o=1:263-1
%     
% %     
%      plot(A(h*o+1:h*o+256));
%      drawnow                                  %# force refresh
%      pause(0.1)                           %# slow down animation
%      h=h+1;
%     for k=1:256
%         A2(k)=A2(k);
%         if((A(k*o)>A2(k)))
%             A2(k)=A(k*o);
%         end
%          
%     end
% %     plot(A2);
% %          drawnow;
% %          pause(0.01);
% end
%bueno sexys ahora si van a entender algo
%% miren 
%%https://courses.cit.cornell.edu/ece576/FinalProjects/f2008/pae26_jsc59/pae26_jsc59/

% // shift the n point spectrum x into the mel frequency m point spectrum xm
% void melshift(float x[], int n, float xm[], int m, float fs)
% {
%     int i, j;
%     
%     float deltaf = fs / n;
%     for (i = 0; i < m; i++) {
%         xm[i] = 0.0;
%         for (j = 0; j < n; j++) {
%             xm[i] += x[j]*melH(j*deltaf, i+1);
%         }
%         xm[i] = log10(xm[i]);
%     }
% }