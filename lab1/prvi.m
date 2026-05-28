% Glavni fajl za Laboratorijsku vežbu 1
T = -2:0.01:2; % Vremenski interval za prikaz

% Crtanje elementarnih signala
figure;
subplot(2,3,1); plot(T, u(T), 'LineWidth', 3); title('u(t)'); grid on; grid minor;
subplot(2,3,2); plot(T, rect(T), 'LineWidth', 3); title('rect(t)'); grid on; grid minor;
subplot(2,3,3); plot(T, ramp(T), 'LineWidth', 3); title('ramp(t)'); grid on; grid minor;
subplot(2,3,4); plot(T, tri(T), 'LineWidth', 3); title('tri(t)'); grid on; grid minor;
subplot(2,3,5); plot(T, Sinc(T), 'LineWidth', 3); title('Sinc(t)'); grid on; grid minor;

% Podešavanje Y ose sa desne strane za sve grafike
h = get(gcf, 'Children');
for i = 1:length(h)
    set(h(i), 'YAxisLocation', 'right');
end