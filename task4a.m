function [fast_time,my_time]= task4a()
    % Speed testing of mydft.m
    close all
    M = 1:11;
    my_time = [];
    fast_time = [];
    period = 2*pi;
    for m = M
        y = generate_xs(2^m,period); % Only to generate values.
        tic; % Begin speed testing of mydft
        z = mydft(y);
        t = toc; % Finish speed  testing of mydft
        my_time = [my_time;t];

        tic;
        z = fft(y);
        t = toc;
        fast_time = [fast_time;t];
    end
    
    plot(M,fast_time,"r",M,my_time,"b") % Plot the results
    grid on
    legend("fft","mydft","Location","northwest")
    xlabel("m")
    ylabel("t (s)") % Time in seconds
    title("Computation time")
    hold off
end