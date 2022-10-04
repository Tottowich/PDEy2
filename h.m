function y = h(x)
% Discontious function used in task 3.
y = zeros(size(x));
y((x>0&x<pi)) = 1;
y((x>pi&x<2*pi)) = -1;
y(x==0|x==pi) = 0;
end