function task4a()
    % Speed testing of mydft.m
    
    M = 1:12;
    my_time = [];
    fast_time = [];
    period = 2*pi;
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
    size(fast_time)
    size(my_time)
    plot(2.^M,fast_time,"r",2.^M,my_time,"b")
    grid on
    legend("fft","mydft")