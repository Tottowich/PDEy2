function plotfouriercoeffs(a0,a,b,a0exact,aexact,bexact)
    % plotfouriercoeffs(a0,a,b)
    % plot the Fourier coefficients a0,a,b
    % a0 is the DC component
    % a is the cosine coefficients
    % b is the sine coefficients

    % Above you calculate the discrete Fourier transform z
    % and the exact Fourier cosine coefficients a0 =a0exakt and (an) =aexact
    if length(aexact)>0
        figure()
        stem([a0 a],"*")% plot computed Fourier cosine coefficients
        hold on
        stem([a0exact aexact],"or")% plot exact Fourier cosine coefficients
        title("Exact and computed Fourier cosine coefficients")
        legend("Computed","Exact");
        xlabel("n"); ylabel("Fourier cosine coefficients an");
        xlim([1 length(a)])
        hold off
    end
    if length(bexact)>0
        figure()
        stem([bexact],"or")% plot exact Fourier sine coefficients
        hold on;
        stem([b],"*")% plot computed Fourier sine coefficients
        title("Exact and computed Fourier sine coefficients")
        legend("Computed","Exact");
        xlabel("n"); ylabel("Fourier sine coefficients bn");
        xlim([1 length(b)])
        hold off    
        
    end
end
