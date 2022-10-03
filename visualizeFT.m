function visualizeFT(f)
    % Above you calculate the discrete Fourier transform z
    % and the exact Fourier cosine coefficients a0 =a0exakt and (an) =aexact
    x_s = 
    [a0,a,b]=myfouriercoeff(z);% cosine coefficients calculated from the DFT z
    figure()
    stem([a0 a],‘*’)% plot computed Fourier cosine coefficients
    hold on
    stem([a0exact aexact],‘or’)% plot exact Fourier cosine coefficients
    xlim([1 10])
    hold off
    xlabel(’n’); ylabel(’Fourier cosine coefficients an’);
    title(’Exact and computed Fourier coefficients’)
    legend(’Computed’,’Exact’);
end