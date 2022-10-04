function x_s = generate_xs(N,period)
    % Generating x-values became repetative so wrote a helper function.
    j = 0:N-1;
    x_s = period*j/N;
end