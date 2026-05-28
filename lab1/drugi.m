
t = -5:0.01:10;

g1 = rect(t) .* cos(2*pi*t);
g2 = u(t) .* ramp(-t);
g3 = g_zadatak(t); 

figure;
subplot(2,2,1); plot(t, g1, 'LineWidth', 2); title('g(t) = rect(t)sin(2\pi t)'); grid on;

g1_trans = -3 * rect(t+3) .* cos(2*pi*(t+3)); 

figure;
subplot(2,2,1); plot(t, g1, 'LineWidth', 2); title('Original'); grid on;
subplot(2,2,2); plot(t, g1_trans, 'LineWidth', 2); title('-3g(t+3)'); grid on;

function y = u(t)
y = (t > 0) + 0.5 * (t == 0);
end

function y = rect(t)
y = (abs(t) < 0.5) + 0.5 * (abs(t) == 0.5);
end

function y = ramp(t)
y = t .* (t > 0);
end

function y = g_zadatak(t)
y = zeros(size(t));
y(t < -1) = -2;
y(t >= -1 & t < 1) = 2 * t(t >= -1 & t < 1);
y(t >= 1 & t < 3) = 3 - t(t >= 1 & t < 3).^2;
y(t >= 3) = -6;
end