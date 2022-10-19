function [a0,a,b] = task2a()
    N = 2^8;
    j = 0:N-1;
    x = 2*pi*j/N;
    y_s = t2funcA(x);
    z = mydft(y_s);
    [a0,a,b] = myfouriercoeff(z)
end