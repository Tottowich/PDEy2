function [a0,a,b] = myfouriercoeff(z)
    % -In data -
    % z: complex Fourier transform
    % - Out data -
    % a0: the coefficient a0
    % a: vector with the Fourier coefficients an
    % b: vector with the Fourier coefficients bn
    N = length(z);% Compute the length of vector z
    c = z(2:N);% remove first element z(1) from z-vector
    a0 = z(1);
    rev_c = flip(c);
    a = real(c+rev_c);
    a = a(1:round(N/2));
    b = real(1i*(c-rev_c));
    b = b(1:round(N/2));
    % a = real(a(1:round(N/2)));
    % b = real(b(1:round(N/2)));
end