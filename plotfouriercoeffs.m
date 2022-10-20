function plotfouriercoeffs(a0,a,b,a0exact,aexact,bexact)
    % plotfouriercoeffs(a0,a,b)
    % plot the Fourier coefficients a0,a,b along with the exact values
    % a is the cosine coefficients
    % b is the sine coefficients

    % Above you calculate the discrete Fourier transform z
    % and the exact Fourier cosine coefficients a0 =a0exakt and (an) =aexact
    if length(aexact)>1
        figure()
        t_s = 1:length(a)+1;
        t_s = t_s-1; % Start t-index at 0 since we have a0
        stem(t_s,[a0 a],"*") % plot computed Fourier cosine coefficients
        hold on
        t_s = 1:length(aexact)+1;
        t_s = t_s-1; % Start t-index at 0 since we have a0
        stem(t_s,[a0exact aexact],"or")% plot exact Fourier cosine coefficients
        title("Exact and computed Fourier cosine coefficients")
        legend("Computed","Exact");
        xlabel("n"); ylabel("Fourier cosine coefficients an");
        xlim([0 lenght(a)])
        grid on;
        hold off
    end
    if length(bexact)>1
        figure()
        stem(bexact,"or")% plot exact Fourier sine coefficients
        hold on;
        stem(b,"*")% plot computed Fourier sine coefficients
        title("Exact and computed Fourier sine coefficients")
        legend("Computed","Exact");
        xlabel("n"); ylabel("Fourier sine coefficients bn");
        xlim([1 length(b)])
        hold off
    end
end
