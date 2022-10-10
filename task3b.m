function [a0,a,b] = task3b()
    % Task 3b Check overshoot at discontinuity
    close all
    N = 2^8;
    period = 2*pi;
    x = generate_xs(N,period);
    y = h(x);
    z = mydft(y);
    [a0,a,b] = myfouriercoeff(z);
    % t = linspace(0,period,5000);
    M= [3,5,10];% the number of terms M must be less than N/2 where N = 2m points
    y=a0;
    % for j=1:M;% The partial sum of the Fourier series with M+1 terms
    % y=y+a(j)*cos(j*t)+b(j)*sin(j*t);% add a term of the Fourier series
    % end
    interval = linspace(0+eps,period/2-eps,N);
    figure(1)
    plot(interval,h(interval),'b-',"DisplayName",'Original function',"LineWidth",3)
    hold on
    grid on
    % outs = zeros(length(interval),length(M));
    for m = M
        a0exact = 0;
        aexact = zeros(1,m);
        bexact = (2/pi*(1:m)).*(1-(-1).^(1:m));
        out = myfourier(a0,a(1:m),b(1:m),interval,2*pi); % The partial sum of the Fourier series with M+1 terms
        out_exact = myfourier(a0exact,aexact,bexact,interval,2*pi);

        pl = plot(interval,out,"DisplayName","Fourier Series with M = " + (m + 1)+" terms");
        plot(interval,out_exact,"DisplayName","Exact Fourier Series with M = " + (m + 1)+" terms")
        legend()
    end
    xlim([0 pi])
    % Set legend position to be center bottom
    legend('Location','south')
    figure(2)
    M = 1:100;
    diff = zeros(1,length(M));
    diff_exact = zeros(1,length(M));
    for m = M
        a0exact = 0;
        aexact = zeros(1,m);
        bexact = (2/pi*(1:m)).*(1-(-1).^(1:m));
        out_m = myfourier(a0,a(1:m),b(1:m),interval,2*pi);
        out_exact = myfourier(a0exact,aexact,bexact,interval,2*pi);
        diff(m) = max_diff(out_m,h(interval)');
        diff_exact(m) = max_diff(out_exact,h(interval)');
    end
    plot(M,diff,"DisplayName","Difference with Computed Fourier Series");
    hold on
    plot(M,diff_exact,"DisplayName","Difference with Exact Fourier Series");
    legend()
    xlim([0 100])
    title("Difference")
    xlabel("M")
    ylabel("Difference")
    function y = h(x)
        % Discontious function used in task 3.
        y = ones(size(x));
        % y((x>0&x<pi)) = 1;
        % y((x>pi&x<2*pi)) = -1;
        % y(x==0|x==pi) = 0;
    end
    function diff = max_diff(y1,y2)
        % Calculate the maximum difference between two vectors
        diff = abs(y1-y2);
        diff = max(abs(y1-y2));
    end
end