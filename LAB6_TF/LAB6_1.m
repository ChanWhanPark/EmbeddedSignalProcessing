zero = roots([1 5]);
pole = roots([1 2 5]);
figure(1)
hold on;
grid on;
plot(real(zero), imag(zero), 'ro', 'MarkerSize', 10);
plot(real(pole), imag(pole), 'kx', 'MarkerSize', 10);
xlabel("실수부 real")
ylabel("허수부 imag")
xlim([-6, 1]);
ylim([-2.5, 2.5]);

[r, p, k] = residue([1 5], [1 2 5]);
t = linspace(0, 10, 100);
s = h(r, p, t, 'c');
figure(2)
subplot(211)
plot(t, s);
grid on;
xlabel('t[sec]');
ylabel('h(t)');

wc = linspace(-4, 4, 100);
fq = freqs([1 5], [1 2 5], wc);
subplot(212)
plot(wc, abs(fq));
grid on;
xlabel('w');
ylabel('H|w|');