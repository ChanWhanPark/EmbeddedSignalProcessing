N = 8;
f0 = 0.1;
n = linspace(0, N-1, N);

x = cos(2*pi*f0*n);

[f_hat, Xk, N_mult] = FFT(x);

figure(1);
subplot(211);
stem(n, x, 'ro');
xlim([0, 8]);
subplot(212);
stem(f_hat, abs(Xk));

N_mult