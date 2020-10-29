N = 50;
f0 = 0.1;
n = linspace(0, N-1, N);

x = cos(2 * pi * f0 * n);

[f_hat, Xk, N_mult] = DFT(x);

subplot(211);
stem(n, x);
grid on;
xlabel('n');
ylabel('x[n]');

subplot(212);
stem(f_hat, abs(Xk));
grid on;
xlabel('f_hat');
ylabel('X|k|');

N_mult