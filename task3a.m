function task3a()
    close all
    N = 2^8;
    period = 2*pi;
    x = generate_xs(N,period);
    y = h(x);
    z = mydft(y);
    [a0,a,b] = myfouriercoeff(z);
    t = linspace(0,period,5000);
    M= [3,5,10];% the number of terms M must be less than N/2 where N = 2m points
    % y=a0;
    %for j=1:M;% The partial sum of the Fourier series with M+1 terms
    %y=y+a(j)*cos(j*t)+b(j)*sin(j*t); % add a term of the Fourier series
    %end
    plot(t,h(t),'b-',"DisplayName",'Original function',"LineWidth",3)
    hold on
    grid on
    
    for m = M
        out = myfourier(a0,a(1:m),b(1:m),t,period); % The partial sum of the Fourier series with M+1 terms
        % y_s(i,:) = out;
        pl = plot(t,out,"DisplayName","Fourier Series with M = " + (m)+" terms");
        legend()
    end
    xlabel('x')
    ylabel('y')

    function y = h(x)
        % Discontious function used in task 3.
        y = zeros(size(x));
        y((x>0&x<pi)) = 1;
        y((x>pi&x<2*pi)) = -1;
        y((x==0|x==pi)) = 0;
    end
end