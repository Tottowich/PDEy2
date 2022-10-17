function [a0,a,b] = task3b()
    % Task 3b Check overshoot at discontinuity
    close all
    N = 2^8;
    period = 2*pi;
    x = generate_xs(N,period);
    y = h(x);
    z = mydft(y);
    [a0,a,b] = myfouriercoeff(z);
    t = linspace(0,period,5000);
    % t = linspace(0,period,5000);
    M= [3,5,10];% the number of terms M must be less than N/2 where N = 2m points
    figure(1)
    plot(t,h(t),'b-',"DisplayName",'Original function',"LineWidth",3)
    hold on
    grid on
    % outs = zeros(length(t),length(M));
    a0exact = 0;
    for m = M
        out = myfourier(a0,a(1:m),b(1:m),t,2*pi); % The partial sum of the Fourier series with M+1 terms
        pl = plot(t,out,"DisplayName","Fourier Series with M = " + m+" terms");
        aexact = zeros(1,m);
        bexact = (2./(pi*(1:m))).*(1-(-1).^(1:m));
        out_exact = myfourier(a0exact,aexact,bexact,t,period);
        plot(t,out_exact,"DisplayName","Exact Fourier Series with M = " + m+" terms")
        legend("Location","northeastoutside")
    end
    % Set legend position to be center bottom
    figure(2)
    M = 1:100;
    diff = zeros(1,length(M));
    diff_exact = zeros(1,length(M));
    t = linspace(0,period/2,5000); % Fine detailed interval for smoother plots
    a0exact = 0;
    for m = M
        % Calculate the fourier representation values using m + 1 fourier coeffients
        out_m = myfourier(a0,a(1:m),b(1:m),t,period);
        % Compute the exact fourier coefficients given the number of coeffients m to use.
        aexact = zeros(1,m);
        bexact = (2./(pi*(1:m))).*(1-(-1).^(1:m));
        % m coeffients + 1 a0 gives m+1 total fourier coefficients.
        out_exact = myfourier(a0exact,aexact,bexact,t,period);
        diff(m) = max_diff(out_m);%,h(t)');
        diff_exact(m) = max_diff(out_exact);%,h(t)');
    end
    plot(M,diff,"DisplayName","Difference with Computed Fourier Series");
    hold on
    grid on
    plot(M,diff_exact,"DisplayName","Difference with Exact Fourier Series");
    legend()
    xlim([0 max(M)])
    title("Difference")
    xlabel("M")
    ylabel("Difference")
    function y = h(x)
        % Discontious function used in task 3.
        y = zeros(size(x));
        y((x>0&x<pi)) = 1;
        y((x>pi&x<2*pi)) = -1;
        y(x==0|x==pi) = 0;
    end
    function diff = max_diff(y1)
        % Calculate the maximum difference between two vectors
        diff = max(abs(y1-1)); %
    end
end