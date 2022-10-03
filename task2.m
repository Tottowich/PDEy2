function coeffs = task2()
N = 2^5;
j = 0:N-1;
x = 2*pi*j/N;
y_s = t2func(x);
z = mydft(y_s);
[a0,a,b] = myfouriercoeff(z)
coeffs = z; % WRONG
end