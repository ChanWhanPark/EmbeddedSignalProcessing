clear;
clc;

%% (1) Butterworth 7차 Analog Filter
[zb, pb, kb] = buttap(7);
[num, den] = zp2tf(zb, pb, kb);
[num1, den1] = lp2lp(num, den, 300*2*pi);

%% (2) Bilinear Transformation
fs = 3000;
[num2, den2] = bilinear(num1, den1, 3000);

%% (3) x[n] 발생
f1 = 100;
f2 = 500;
N = 500;
n = linspace(0, N-1, N);
x = cos(2*pi*(f1/fs)*n) + cos(2*pi*(f2/fs)*n);

%% (4) 출력 계산
y = filter(num2, den2, x);

%% (5) 크기 스펙트럼
t = n / fs;
[fx, Xx] = myfun_SA(t, x);
[fy, Xy] = myfun_SA(t, y);
w = linspace(0, 600*2*pi, 600*2*pi +1);
figure(5)
subplot(321);
plot(t, x);
grid on;
xlim([0, 0.1])
xlabel('t[sec]');
ylabel('x(t)');

subplot(322)
plot(fx, abs(Xx));
grid on;
xlim([0, 600]);
xlabel('Frequency, f[Hz]');
ylabel('|X(f)|');

subplot(324)
h = freqz(num2, den2, w/fs);
plot(w/(2*pi), abs(h));
grid on;
xlim([0, 600])
xlabel('Frequency, f[Hz]');
ylabel('Frequency response |H_d(f)|');

subplot(325)
plot(t, y);
grid on;
xlim([0, 0.1])
xlabel('t[sec]');
ylabel('y(t)');

subplot(326)
plot(fy, abs(Xy));
grid on;
xlim([0, 600]);
xlabel('Frequency, f[Hz]');
ylabel('|Y(f)|');