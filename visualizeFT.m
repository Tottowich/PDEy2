function visualizeFT(f,period,N)
    arguments
        f (1,1) function_handle = @(x) x
        period (1,1) double = 2*pi
        N (1,1) double = 256
    end
    % Above you calculate the discrete Fourier transform z
    % and the exact Fourier cosine coefficients a0 =a0exakt and (an) =aexact
    x = generate_xs(N,period);
    y = f(x);
    x_plot = linspace(0,period,1000);
    y_plot = f(x_plot);
    z = mydft(y);
    [a0,a,b]=myfouriercoeff(z);% cosine coefficients calculated from the DFT z
    size(a)
    figure()
    stem([a0 a],'*')% plot computed Fourier cosine coefficients
    hold on
    % stem([a0exact aexact],‘or’)% plot exact Fourier cosine coefficients
    xlim([0, length(a)])
    grid on;
    hold off;
    xlabel('n'); ylabel('Fourier cosine coefficients an');
    title('Exact and computed Fourier coefficients');
    legend('Computed');%,'Exact');
    figure();
    plot(x_plot,y_plot,'-',"LineWidth",4)% plot the function f(x)
    hold on
    plot(x_plot,myfourier(a0,a,b,x_plot,period),'r-o',"LineWidth",2)% plot the Fourier series
    hold off
    xlabel('x'); ylabel('f(x)');
    grid on;
    title('Function and Fourier series');
    legend('Function','Fourier series');
end