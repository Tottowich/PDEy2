clear all
close all
fid = fopen('filtre.data','r'); % open filtre.data
Y = fscanf(fid,'%f',[1 inf]); % read filtre.data
fclose(fid);
figure(1), plot(Y); % plot filtre.data
legend("Pre")
grid on
xl  = xlim; % Save limits to use the same for the filtered data
yl = ylim;
Z=fft(Y); % transform data to frequency domain
figure(2)
wcut=0.1*max(abs(Z));% cut-off
N=length(Z);
Z(abs(Z)<wcut) = 0;
Y = ifft(Z); % transform back to time domain
plot(Y,"r"); % plot filtered data in seperate figure
grid on
xlim(xl) % Resize the plot to the same size as the original for comparison
ylim(yl)
legend("Post")
hold off