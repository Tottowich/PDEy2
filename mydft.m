function z = mydft(y)
    % Compute the DFT of a vector y of length N
    % z n = 1/N sum {j=0}ˆ{N-1}y j exp(-2 pi j n/N)
    
    % Matrix form is faster!
    N = length(y);
<<<<<<< HEAD
    j_s = 0:N-1; % (1,N)
    x_js = 2*pi*j_s/N; % (1,N)
    n_s = 0:N-1; % (1,N)
    omega_term = exp(-1i*x_js'*n_s); % (N,1)x(1,N) => (N,N)
=======
    j_s = 0:N-1;
    x_js = 2*pi*j_s/N;
    n_s = 0:N-1;
    omega_term = exp(-1i*x_js'*n_s);
<<<<<<< HEAD
>>>>>>> a54e748 (task3a complete)
    % An matrix of omega terms. x_js'*n_s results in NxN matrix
    z = y*omega_term/N; % (1,N)x(N,N) => (1,N)
    % Matrix multiplication with y results in a vector of size 1xN
    % Division by N gives the desired result
=======
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
>>>>>>> 48f90f8 (task3a complete)
end