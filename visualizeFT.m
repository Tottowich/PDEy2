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
    figure();
    plot(x_plot,y_plot,'-',"LineWidth",6)% plot the function f(x)
    hold on
    plot(x_plot,myfourier(a0,a,b,x_plot,period),'r-',"LineWidth",1)% plot the Fourier series
    hold off
    xlabel('x'); ylabel('f(x)');
    grid on;
    title('Function and Fourier series');
    legend('Function','Fourier series');
end