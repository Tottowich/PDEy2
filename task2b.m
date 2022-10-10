function [a0,a,b] = task2b()
    N = 2^10;
    j = 0:N-1;
    x = 2*pi*j/N;
    %f = @(x) abs(cos(x));
    f = @(x) 1-x.^2;
    y_s = f(x);
    z = mydft(y_s);
    [a0,a,b] = myfouriercoeff(z);
    a0exact = 2/pi;
    n_s = 1:length(a);
    aexact = 0;
    for n = n_s
        aexact(2*n) = (4/pi)*((-1)^(n+1))/((4*n^2)-1);
    end
    %aexact = -4/pi*(-1).^n./(4*n.^2-1);
    plotfouriercoeffs(a0,a,0,a0exact,aexact,0)
    visualizeFT(f,2*pi,N)
end