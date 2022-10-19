function FourierAnimation(f,N,period,Ms)
    close all
    x = generate_xs(N,period);
    y = f(x);
    z = mydft(y);
    [a0,a,b] = myfouriercoeff(z);
    % N: int, The number of points known to come from the function.
    % M: int, The number of terms M must be less than N/2 where N = 2m points
    % Above you have computed the Fourier coefficients a0, an, and bn of h(x)
    t = linspace(0,period,5000);
    y=a0;
	y_s = zeros(length(Ms),length(t));
    i = 1;
    figure()
    % Plot with t vs h(t) legend : Original function
    plot(t,f(t),'b-',"DisplayName",'Original function',"LineWidth",3)
    ylim([-1,1])
    grid on
    xlabel("t")
    ylabel("y")
    hold on
    pl = 0;
    pause;
    disp("Start");
    for m = Ms
        if pl ~= 0
            delete(pl)
        end
        out = myfourier(a0,a(1:m),b(1:m),t,period);
        y_s(i,:) = out;
        pl = plot(t,out,"r-","DisplayName","Fourier Series with M = " + m +" terms");
        legend()
        pause(15/length(Ms))
    end
    complete = myfourier(a0,a,b,t,period);
    plot(t,complete,"DisplayName","Complete Fourier series")
    legend()
    hold off
end