function w = myidft(z)
%MYIDFT Inverse discrete Fourier transform.
%   W = MYIDFT(Z) returns the inverse discrete Fourier transform of Z.
%   The vector W is the same size as Z and computed using:
%   w_n = sum_{j=0}^{N-1} z_j exp(2*pi*i*n*j/N)
%
% Athour: Theodor Jonsson (Umeå Univertity, Sweden) 2022-10-03
% N = length(z);
% n_s = 0:N-1;
% j_s = 0:N-1;
% omega_term = exp(2*pi*1i*n_s'*j_s/N);
% w = sum(z*omega_term,1);
% Conjugate version but when testing it is slower:
N = length(z);
w = N*conj(mydft(conj(z)));
end
