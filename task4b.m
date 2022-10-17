clear all
close all
fid = fopen('filtre.data','r'); % open filtre.data
Y = fscanf(fid,'%f',[1 inf]); % read filtre.data
fclose(fid);
figure(1), plot(Y); % plot filtre.data
grid on
hold on
Z=fft(Y); % transform data
figure(1)
wcut=0.1*max(abs(Z));% cut-off
N=length(Z);
Z(abs(Z)<wcut) = 0;
Y = ifft(Z);
plot(Y);
legend("Pre","Post")
hold off