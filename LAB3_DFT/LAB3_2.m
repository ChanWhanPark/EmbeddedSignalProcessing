%% 3.2.1
N = 50;
n = linspace(0, N-1, N);

f1 = 0.1;
f2 = 0.2;
f3 = 0.3;

x1 = cos(2*pi*f1*n);
x2 = 0.5*cos(2*pi*f2*n);
x3 = 0.1*cos(2*pi*f3*n);

x = x1 + x2 + x3;
[f_hat, Xk, N_mult] = DFT(x);

figure(2)
subplot(211);
stem(n, x);
grid on;
xlabel('n');
ylabel('x[n]');

subplot(212)
stem(f_hat, abs(Xk));
grid on;
xlabel('f_hat');
ylabel('|Xk|');