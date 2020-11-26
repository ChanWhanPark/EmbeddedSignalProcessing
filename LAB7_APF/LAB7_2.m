clear;
clc;

%% 1. Butterworth 차수 구하기
N = log10((1/10^(-4))-1) / (2*log10(1+1));

%% 2. Butterworth pole-zero plot
[z, p, k] = buttap(ceil(N));
n = linspace(-pi, pi, 360);
w = linspace(0, 3, 1000);
figure(3);
grid on;
hold on;
plot(exp(-1i*n), 'b--');
plot(real(z), imag(z), 'ro', 'MarkerSize', 20);
plot(real(p), imag(p), 'kx', 'MarkerSize', 20);
xlabel('실수부')
ylabel('허수부 Butterworth')

%% 3. 주파수 응답 표기
[t, f] = zp2tf(z, p, k);
ff = freqs(t, f, w);
figure(4)
plot(w, 10*log10(abs(ff).^2));
grid on;
xlim([0, 2.5]);
ylim([-50, 0]);
xlabel('주파수 w');
ylabel('주파수 응답 H|w|^2 Butterworth');

%% 4. 필터 변환
w = linspace(0, 5000, 50000);
[numt1, dent1] = lp2lp(t, f, 300);
f1 = freqs(numt1, dent1, w);
[numt2, dent2] = lp2bp(t, f, 650, 700); % passband = [300, 1000];
f2 = freqs(numt2, dent2, w);
[numt3, dent3] = lp2bp(t, f, 1500, 1000); % passband = [1000, 2000];
f3 = freqs(numt3, dent3, w);
[numt4, dent4] = lp2bp(t, f, 3000, 2000); % passband = [2000, 4000];
f4 = freqs(numt4, dent4, w);
[numt5, dent5] = lp2hp(t, f, 4000);
f5 = freqs(numt5, dent5, w);
figure(5)
hold on;
grid on;
plot(w, 10*log10(abs(f1).^2), 'b-');
plot(w, 10*log10(abs(f2).^2), 'g-');
plot(w, 10*log10(abs(f3).^2), 'r-');
plot(w, 10*log10(abs(f4).^2), 'c-');
plot(w, 10*log10(abs(f5).^2), 'm-');

xlabel('Frequency, [Hz]');
ylabel('|H(w)|^2, [dB]');
xlim([0, 5000]);
ylim([-30, 10]);
legend('Filter 1, LPF', 'Fliter 2, BPF', 'Fliter 3, BPF', 'Fliter 4, BPF', 'Fliter 5, HPF');
