function [a0,a,b] = myfouriercoeff(z)
    % z: complex Fourier transform

    % a0: the coefficient a0
    % a: vector with the Fourier coefficients an
    % b: vector with the Fourier coefficients bn
    N = length(z);% Compute the length of vector z
    c = z(2:N); % remove first element z(1) from z-vector
    a0 = z(1);
    rev_c = flip(c); % reverse the order of the elements in c
    % Adding the elements in c and rev_c results in adding the last element of c to the first element of rev_c
    
    a = real(c+rev_c); % real part of the sum
    a = a(1:round(N/2)-1); % Only keep the N/2 - 1 elements
    b = real(1i*(c-rev_c));
    b = b(1:round(N/2)-1); 
end