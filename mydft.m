function z = mydft(y)
    % Compute the DFT of a vector y of length N
    % z n = 1/N sum {j=0}ˆ{N-1}y j exp(-2 pi j n/N)
    % Athour: Theodor Jonsson (Umeå Univertity, Sweden) 2022-10-03
    % Matrix form is faster!
    N = length(y);
    j_s = 0:N-1;
    x_js = 2*pi*j_s/N;
    n_s = 0:N-1;
    omega_term = exp(-1i*x_js'*n_s);
    % An matrix of omega terms. x_js'*n_s results in NxN matrix
    z = y*omega_term/N;
    % Matrix multiplication with y results in a vector of size 1xN
    % Division by N gives the desired result
end