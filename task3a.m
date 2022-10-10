function task3a(f,N,period,Ms)
    % N: int, The number of points known to come from the function.
    % M: int, The number of terms M must be less than N/2 where N = 2m points
    x = generate_xs(N,period);
    y = f(x);
    z = mydft(y);
    % Above you have computed the Fourier coefficients a0, an, and bn of h(x)
    [a0,a,b] = myfouriercoeff(z);
    t = linspace(0,period,5000);
    y=a0;
    % for j=1:M% The partial sum of the Fourier series with M+1 terms
    %     y=y+a(j)*cos(j*t)+b(j)*sin(j*t);% add a term of the Fourier series
    % end
	y_s = zeros(length(Ms),length(t));
    i = 1;
    figure()
    % Plot with t vs h(t) legend : Original function
    plot(t,f(t),'b-',"DisplayName",'Original function',"LineWidth",3)
    grid on
    xlabel("t")
    ylabel("y")
    %plot(t,h(t),"Original Function")
    hold on
    pl = 0;
    for m = Ms
        if pl ~= 0
            delete(pl)
        end
        out = myfourier(a0,a(1:m),b(1:m),t);
        y_s(i,:) = out;
        pl = plot(t,out,"r-","LineWidth",2,"DisplayName","Fourier Series with M = " + m +" terms");
        legend()
        pause(10/length(Ms))
    end
    complete = myfourier(a0,a,b,t);
    plot(t,complete,"DisplayName","Complete Fourier series")
    legend()
    hold off
    %plot(t,h(t),t,y_s)% plot h together with several of the partial sums of the Fourier series

    function y = h(x)
        % Discontious function used in task 3.
        y = zeros(size(x));
        y((x>0&x<pi)) = 1;
        y((x>pi&x<2*pi)) = -1;
        y(mod(x,pi)==0) = 0;
    end
end