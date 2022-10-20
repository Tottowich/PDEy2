function [a0,a,b] = task2b()
    close all
    N = 2^6; % Number of points in the sequence
    j = 0:N-1;
    x = 2*pi*j/N;
    y_s = abs(cos(x)); % The function to be approximated
    z = mydft(y_s);
    [a0,a,b] = myfouriercoeff(z); % The Fourier coefficients of the function provided the DFT
    a0exact = 2/pi; % The exact value of a0
    n_s = 1:length(a);
    aexact = [];
    for n = n_s
        aexact(2*n) = (4/pi)*((-1)^(n+1))/((4*n^2)-1);
    end
    plotfouriercoeffs(a0,a,0,a0exact,aexact,0) % Plot the Fourier coefficients
end