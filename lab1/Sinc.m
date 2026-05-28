function y = Sinc(t)
y = sin(pi * t) ./ (pi * t);
y(t == 0) = 1;