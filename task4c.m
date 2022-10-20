clear all
load('splat');% load sound, e.g: ’splat’,’gong’,’handel’,’train’
sound(y,Fs); % play sound
Y = mydft(y).*length(y);% fft from Matlab
W=Y;
M=max(abs(Y));
omg_r = 0.7; % specify the relative threshold value
N = length(y);

W(abs(Y)>omg_r*M) = 0;
% compressed signal and original signal expressed as a sparse array
WS = sparse(W);
YS = sparse(Y);
% compare size before-after
before = whos('YS');
after = whos('WS');
comprRatio = before.bytes/after.bytes
% play back the sound
pause(5);% delay in order to finish playing original sound
disp('Play compressed signal');
w= real(ifft(full(WS)));
sound(w, Fs)