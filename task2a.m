function [a0,a,b] = task2a()
    N = 2^8; % or 2^5.
    j = 0:N-1;
    x = 2*pi*j/N;
    y_s = 3-2*cos(15*x)+4*sin(20*x); % The specified function. 
    z = mydft(y_s); % Use the function mydft to calculate the DFT of y_s.
    [a0,a,b] = myfouriercoeff(z) % Use the function myfouriercoeff to calculate the Fourier coefficients.
end