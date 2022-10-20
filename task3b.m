function [a0,a,b] = task3b()
    % Task 3b Check overshoot at discontinuity
    close all
    N = 2^11;
    period = 2*pi;
    x = generate_xs(N,period);
    y = h(x);
    z = mydft(y);
    [a0,a,b] = myfouriercoeff(z);
    t = linspace(0,period,5000); % Values to plot
    M= [3,5,10];
    % the number of terms M must be less than N/2 where N = 2m points
    figure(1)
    plot(t,h(t),'b-',"DisplayName",'h(x)',"LineWidth",3)
    xlabel("x")
    ylabel("y")
    hold on
    grid on
    a0exact = 0;
    % Plot to check the convergence of the Fourier series
    for m = M
        out = myfourier(a0,a(1:m),b(1:m),t,period); % The partial sum of the Fourier series with M+1 terms
        pl = plot(t,out,"DisplayName","Fourier Series with M = "+m+" terms");
        legend("Location","northeast")
    end
    title("Fourier Series Approximation of h(x)")
    hold off

    figure(2)
    M = 1:100;
    diff = zeros(1,length(M));
    diff_exact = zeros(1,length(M));
    t = linspace(0+eps,pi-eps,5000); % Fine detailed interval for smoother plots
    a0exact = 0;
    for m = M
        % Calculate the fourier representation values using m + 1 fourier coeffients
        out_m = myfourier(a0,a(1:m),b(1:m),t,period);
        % Compute the exact fourier coefficients given the number of coeffients m to use.
        aexact = zeros(1,m);
        bexact = (2./(pi*(1:m))).*(1-(-1).^(1:m));
        out_exact = myfourier(a0exact,aexact,bexact,t,period);
        diff(m) = max_diff(out_m);
        diff_exact(m) = max_diff(out_exact);
    end
    plot(M,diff,"DisplayName","Difference with Computed Fourier Coefficients");
    hold on
    grid on
    plot(M,diff_exact,"DisplayName","Difference with Exact Fourier Coefficients");
    legend()
    xlim([0 max(M)])
    title("Difference")
    xlabel("M")
    ylabel("E(M)")
    function y = h(x)
        % Discontious function used in task 3.
        y = zeros(size(x));
        y((x>0&x<pi)) = 1;
        y((x>pi&x<2*pi)) = -1;
        y((x==0|x==pi)) = 0;
    end
    function diff = max_diff(y1)
        % Calculate the maximum difference between two vectors
        diff = max(y1-1);
        diff = max(diff,0); % Only consider overshoots,i.e. positive differences
    end
end