function z = mydft(y)
    % Compute the DFT of a vector y of length N
    % z n = 1/N sum {j=0}ˆ{N-1}y j exp(-2 pi j n/N)
    % Athour: Theodor Jonsson (Umeå Univertity, Sweden) 2022-10-03

    N = length(y);
    j_s = 0:N-1;
    x_js = 2*pi*j_s/N;
    n_s = 0:N-1;
    omega_term = exp(-1i*x_js'*n_s);
    z = sum(y*omega_term,1)/N;
    % N = length(y);
    % j_s = 0:N-1;
    % % x_js = 2*pi*j_s/N;
    % n_s = 0:N-1;
    % omega = exp(2*pi*1i/N);
    % z = zeros(1,N);
    % for n = n_s
    %     omega_term = exp(-2*pi*1i*n*j_s/N);
    %     z(n+1) = 1/N*sum(y.*omega_term);
    % end
end