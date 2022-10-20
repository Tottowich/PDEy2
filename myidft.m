function w = myidft(z)
    %MYIDFT Inverse discrete Fourier transform.
    N = length(z);
    w = N*conj(mydft(conj(z))); % Using the provided formula for the inverse DFT. (see mydft.m)
end
