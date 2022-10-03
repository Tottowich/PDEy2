function task2()
N = 2e5;
j = 0:N-1;
x = 2*pi*j/N;
y_s = t2func(x);
z = mydft(y_s);
end