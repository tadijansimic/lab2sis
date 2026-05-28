% Definicija sistema
s = tf('s');
sys = 1 / (s^2 + 5*s + 6);
t = 0:0.01:7;

% Impulsni odziv (BC)
h_analiticki = (exp(-2*t) - exp(-3*t));
[h_matlab, t_matlab] = impulse(sys, t);
figure;
plot(t, h_analiticki, 'b', 'LineWidth', 2); 
hold on;                                    
plot(t_matlab, h_matlab, 'r--', 'LineWidth', 2);
grid on;
title('Impulsni odziv');
xlabel('t [s]');
ylabel('h(t)');
legend('Analitički', 'impulse');
hold off;

% Odziv na u(t) (D, E)
y_analiticki = (1/6 - 0.5*exp(-2*t) + (1/3)*exp(-3*t));
x = ones(size(t));
[y_lsim, t_lsim] = lsim(sys, x, t);
figure;
plot(t, y_analiticki, 'b', 'LineWidth', 3);
hold on;
plot(t_lsim, y_lsim, 'r--', 'LineWidth', 1.5);
yline(1/6, '--g', 'Ustaljeno stanje 1/6');
grid on;
title('Odziv na u(t)');
xlabel('t [s]');
ylabel('y(t)');
legend('Analitički', 'lsim', 'Ustaljeno stanje');
hold off;

% Bodeov dijagram (F)
figure;
bode(sys);
grid on;
title('Bodeov dijagram prenosne funkcije H(s)');
hold on;
margin(sys);
hold off;