function [fast_time,my_time]= task4a()
    % Speed testing of mydft.m
    close all
    M = 1:13;
    my_time = [];
    fast_time = [];
    period = 2*pi;
    % Warm up!
    j = 0:(2^6-1);
    y = j.*period./(2^6);
    z = mydft(y);
    for m = M
        j = 0:(2^m-1);
        y = j.*period./(2^m);
        %y = generate_xs(2^m,period); % Only to generate values.
        tic;
        z = mydft(y);
        t = toc;
        my_time = [my_time;t];

        tic;
        z = fft(y);
        t = toc;
        fast_time = [fast_time;t];
    end
    
    plot(M,fast_time,"r",M,my_time,"b")
    grid on
    xlim([1,11])
    ylim([0,my_time(11)+0.01])
    legend("fft","mydft","Location","northwest")
    xlabel("m")
    ylabel("t (s)")
    title("Computation time")
    hold off
end