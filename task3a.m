function task3a()
    close all
    N = 2^8;
    period = 2*pi;
    x = generate_xs(N,period); % generate x values
    y = h(x);
    z = mydft(y);
    [a0,a,b] = myfouriercoeff(z);
    t = linspace(0,period,5000);
    M = [3,5,10]; % the number of terms M must be less than N/2.
    plot(t,h(t),'b-',"DisplayName",'Original function',"LineWidth",3)
    xlim([-1,7])
    hold on
    grid on
    
    for m = M
        out = myfourier(a0,a(1:m),b(1:m),t,period); % The partial sum of the Fourier series with M+1 terms
        pl = plot(t,out,"DisplayName","Fourier Series with M = " + (m)+" terms");
        legend()
    end
    xlabel('x')
    ylabel('y')
    title('Fourier Series Approximation of h(x)')

    function y = h(x)
        % Discontious function used in task 3.
        y = zeros(size(x));
        y((x>0&x<pi)) = 1;
        y((x>pi&x<2*pi)) = -1;
        y((x==0|x==pi)) = 0;
    end
end