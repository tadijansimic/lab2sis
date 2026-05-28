% Zadatak 2b i 2c - Impulsni odziv h[n]
n = 0:20;
h_analiticki = (1/3)*(0.25).^n + (2/3)*(-0.5).^n;
h_rek = zeros(size(n));
h_rek(1) = 1;
h_rek(2) = -0.25*h_rek(1); 
for i = 3:length(n)
    h_rek(i) = -0.25*h_rek(i-1) + 0.125*h_rek(i-2);
end

figure;
subplot(2,1,1);
stem(n, h_analiticki, 'b', 'LineWidth', 2);
grid on;
title('Analitičko rešenje (lambde)');
xlabel('n'); ylabel('h[n]');
subplot(2,1,2);
stem(n, h_rek, 'ro');
grid on;
title('Rekurzivno rešenje');
xlabel('n'); ylabel('h[n]');

% Zadatak 2d i 2e - Odziv na u[n]
y = zeros(size(n));
x = ones(size(n));
y(1) = x(1);
y(2) = -0.25*y(1) + x(2);
for i = 3:length(n)
    y(i) = -0.25*y(i-1) + 0.125*y(i-2) + x(i);
end

figure;
stem(n, y, 'filled');
grid on;
title('Prinudni odziv y[n] na pobudu x[n]=u[n]');
xlabel('n'); ylabel('y[n]');

% Zadatak 2f - Poređenje analitičkog i rekurzivnog rešenja za y[n]
y_analiticko = 8/9 - (4/9)*(0.25).^(n+1) - (4/9)*(-0.5).^(n+1);
y_rekurzivno = zeros(size(n));
y_rekurzivno(1) = 1;
y_rekurzivno(2) = -0.25*y_rekurzivno(1) + 1;
for i = 3:length(n)
    y_rekurzivno(i) = -0.25*y_rekurzivno(i-1) + 0.125*y_rekurzivno(i-2) + 1;
end

figure;
subplot(2,1,1);
stem(n, y_analiticko, 'b', 'LineWidth', 2);
grid on;
title('Analitičko rešenje y[n]');
xlabel('n'); ylabel('y[n]');
subplot(2,1,2);
stem(n, y_rekurzivno, 'ro', 'LineWidth', 1);
grid on;
title('Rekurzivno rešenje y[n]');
xlabel('n'); ylabel('y[n]');