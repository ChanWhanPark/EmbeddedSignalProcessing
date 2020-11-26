%% Butterworth Filter
[zb, pb, kb] = buttap(5);
n = linspace(-pi, pi, 360);
w = linspace(0, 2, 1000);
figure(1);
subplot(221)
grid on;
hold on;
plot(exp(-1i*n), 'b--');
plot(real(zb), imag(zb), 'ro', 'MarkerSize', 10);
plot(real(pb), imag(pb), 'kx', 'MarkerSize', 10);
xlabel('실수부')
ylabel('허수부 Butterworth')


[tb, fb] = zp2tf(zb, pb, kb);
ffb = freqs(tb, fb, w);
figure(2)
subplot(221)
plot(w, 10*log10(abs(ffb).^2));
grid on;
xlabel('주파수 w');
ylabel('주파수 응답 H|w|^2 Butterworth');

%% Chebyshev Type-1 Filter
[zc1, pc1, kc1] = cheb1ap(5, 10);
figure(1);
subplot(222)
grid on;
hold on;
plot(exp(-1i*n), 'b--');
plot(real(zc1), imag(zc1), 'ro', 'MarkerSize', 10);
plot(real(pc1), imag(pc1), 'kx', 'MarkerSize', 10);
xlabel('실수부')
ylabel('허수부 Chebyshev Type-1')

[tc1, fc1] = zp2tf(zc1, pc1, kc1);
ffc1 = freqs(tc1, fc1, w);
figure(2)
subplot(222)
plot(w, 10*log10(abs(ffc1).^2));
grid on;
xlabel('주파수 w');
ylabel('주파수 응답 H|w|^2 Chebyshev Type-1');

%% Chebyshev Type-2 Filter
[zc2, pc2, kc2] = cheb2ap(5, 30);
figure(1);
subplot(223)
grid on;
hold on;
plot(exp(-1i*n), 'b--');
plot(real(zc2), imag(zc2), 'ro', 'MarkerSize', 10);
plot(real(pc2), imag(pc2), 'kx', 'MarkerSize', 10);
xlabel('실수부')
ylabel('허수부 Chebyshev Type-2')

[tc2, fc2] = zp2tf(zc2, pc2, kc2);
ffc2 = freqs(tc2, fc2, w);
figure(2)
subplot(223)
plot(w, 10*log10(abs(ffc2).^2));
grid on;
xlabel('주파수 w');
ylabel('주파수 응답 H|w|^2 Chebyshev Type-2');

%% Elliptic Filter
[ze, pe, ke] = ellipap(5, 10, 30);
figure(1);
subplot(224)
grid on;
hold on;
plot(exp(-1i*n), 'b--');
plot(real(ze), imag(ze), 'ro', 'MarkerSize', 10);
plot(real(pe), imag(pe), 'kx', 'MarkerSize', 10);
xlabel('실수부')
ylabel('허수부 Elliptic')

[te, fe] = zp2tf(ze, pe, ke);
ffe = freqs(te, fe, w);
figure(2)
subplot(224)
plot(w, 10*log10(abs(ffe).^2));
grid on;
xlabel('주파수 w');
ylabel('주파수 응답 H|w|^2 Elliptic');