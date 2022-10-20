function y = myfourier(a0,a,b,x,period)
    % Calculate the values of the Fourier series given by the coefficients a0, a, b
    % at the points x.
    % a0 - is the constant term, a and b are vectors of the Fourier coefficients.
    % x - is a vector of the points at which to evaluate the Fourier series.
    % period - is the period of the Fourier series.

    % Calculate the different y values for each term in the Fourier series.
    N = length(a);
    n_s = 1:N;
    K = 2*pi/period;
    % And sum them up.
    y = a0 + sum(a.*cos(K*x'*n_s)+b.*sin(K*x'*n_s),2);
end