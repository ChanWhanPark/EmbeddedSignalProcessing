%% (1) 디지털 필터의 pole-zero plot
[zb, pb, kb] = buttap(3);

figure(1)
subplot(221)
n = linspace(-pi, pi, 360);
hold on;
grid on;
plot(exp(-1i*n), 'b--');
plot(real(zb), imag(zb), 'ro', 'MarkerSize', 10);
plot(real(pb), imag(pb), 'kx', 'MarkerSize', 10);
xlabel('Real(s)')
ylabel('Imag(s)')

[num, den] = zp2tf(zb, pb, kb);
[numd, dend] = bilinear(num, den, 5);
[zd, pd, kd] = tf2zp(numd, dend);

subplot(223)
hold on;
grid on;
plot(exp(-1i*n), 'b--');
plot(real(zd), imag(zd), 'ro', 'MarkerSize', 10);
plot(real(pd), imag(pd), 'kx', 'MarkerSize', 10);
xlabel('Real(z)')
ylabel('Imag(z)')

[numd2, dend2] = bilinear(num, den, 10);
[zd2, pd2, kd2] = tf2zp(numd2, dend2);

subplot(224)
hold on;
grid on;
plot(exp(-1i*n), 'b--');
plot(real(zd2), imag(zd2), 'ro', 'MarkerSize', 10);
plot(real(pd2), imag(pd2), 'kx', 'MarkerSize', 10);
xlabel('Real(z)')
ylabel('Imag(z)')

%% (2) 주파수 응답 표기
w = linspace(0, 2, 1000);
hc = freqs(num, den, w);
h5 = freqz(numd, dend, w/5);
h10 = freqz(numd2, dend2, w/10);

figure(2)
subplot(211)
plot(w, abs(hc), 'b-', w, abs(h5), 'g-', w, abs(h10), 'r-');
grid on;
xlabel('Frequency w[rad/sec]');
ylabel('|H(w)|');
legend('ABF', 'DBF, f_s=5Hz', 'DBF, f_s=10Hz');
subplot(212)
plot(w, abs(hc), 'b-', w, abs(h5), 'g-', w, abs(h10), 'r-');
grid on;
xlim([0.9, 1.1]);
xlabel('Frequency w[rad/sec]');
ylabel('|H(w)|');
legend('ABF', 'DBF, f_s=5Hz', 'DBF, f_s=10Hz');

%% (3) 임펄스 응답
L1 = 50;
L2 = 100;
L3 = 150;

figure(3)
subplot(311);
imp1 = [1; zeros(L1-1,1)];
x1 = linspace(0, length(imp1)-1, length(imp1));
y1 = filter(numd2, dend2, imp1);
stem(x1, y1);
grid on;
xlabel('n');
ylabel('h[n], L=50');

subplot(312);
imp2 = [1; zeros(L2-1,1)];
x2 = linspace(0, length(imp2)-1, length(imp2));
y2 = filter(numd2, dend2, imp2);
stem(x2, y2);
grid on;
xlabel('n');
ylabel('h[n], L=100');

subplot(313);
imp3 = [1; zeros(L3-1,1)];
x3 = linspace(0, length(imp3)-1, length(imp3));
y3 = filter(numd2, dend2, imp3);
stem(x3, y3);
grid on;
xlabel('n');
ylabel('h[n], L=150');
