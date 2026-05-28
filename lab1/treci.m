% --- Zadatak 3: Složeni diskretni signali i transformacije ---
n = -20:20; % Definišemo diskretni domen

% a) Definišemo signale
x1 = 3*cos(3*pi*n/10) + 2*sin(2*pi*(n+1)/6);
x2 = 3*n .* exp(-abs(n/5));
x3 = 17*(n.^2)/3 + 13*(n.^3);

% Crtanje signala iz tačke a)
figure;
subplot(3,1,1); stem(n, x1); title('x1[n]'); grid on;
subplot(3,1,2); stem(n, x2); title('x2[n]'); grid on;
subplot(3,1,3); stem(n, x3); title('x3[n]'); grid on;

% b) Transformacije signala g[n] (prema zadatku 3b)
% Definišemo g[n] prema uslovima (korišćenjem logičkog indeksiranja)
g = zeros(size(n));
g(n < -2) = 1;
g(n >= -2 & n <= 0) = -4 + 2*n(n >= -2 & n <= 0);
g(n > 0 & n <= 4) = 4 - 2*n(n > 0 & n <= 4);
g(n > 4 & n < 8) = 13 - 2*n(n > 4 & n < 8);
g(n >= 8) = -1;

% Primeri transformacija
figure;
subplot(2,2,1); stem(n, g); title('Original g[n]'); grid on;
subplot(2,2,2); stem(n, g_trans1(g, n)); title('g[2n]'); grid on;
subplot(2,2,3); stem(n, g_trans2(g, n)); title('2g[n/2 + 1]'); grid on;

% c) Parni i neparni deo (opšta formula)
% ye[n] = (x[n] + x[-n])/2
% yo[n] = (x[n] - x[-n])/2
% Napomena: Ovo radi za signale simetrične oko n=0. 
% Za "flippovanje" niza u MATLAB-u koristi fliplr(x).

% --- LOKALNE FUNKCIJE ---
function y = g_trans1(g, n)
% Primer za g[2n]
% Ovo zahteva redefinisanje indeksa, jer 2n nije uvek ceo broj
y = zeros(size(n));
indeksi = (2*n >= min(n) & 2*n <= max(n));
y(indeksi) = g(2*n(indeksi) - min(n) + 1); 
end

function y = g_trans2(g, n)
% Primer za 2*g[n/2 + 1]
y = zeros(size(n));
% ... primeni sličnu logiku mapiranja indeksa ...
end