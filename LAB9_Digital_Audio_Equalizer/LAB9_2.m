clear; clc;

%[y, fs] = audioread('Audio_Song_Female01_10sec.wav');
[y, fs] = audioread('Audio_Pop01_15sec.wav');
figure(3);
hold on;
f = linspace(0, fs/2, (fs/2)+1);

[num1, den1] = butter(7, 500/(fs/2), 'low');
[z1, p1] = tf2zp(num1, den1);
w1 = freqz(num1, den1, length(f));
plot(f, abs(w1));

[num2, den2] = butter(6, [500/(fs/2), 1500/(fs/2)], 'bandpass');
w2 = freqz(num2, den2, length(f));
[z2, p2] = tf2zp(num2, den2);
plot(f, abs(w2));

[num3, den3] = butter(6, [1500/(fs/2), 2500/(fs/2)], 'bandpass');
w3 = freqz(num3, den3, length(f));
[z3, p3] = tf2zp(num3, den3);
plot(f, abs(w3));

[num4, den4] = butter(6, [2500/(fs/2), 3500/(fs/2)], 'bandpass');
w4 = freqz(num4, den4, length(f));
[z4, p4] = tf2zp(num4, den4);
plot(f, abs(w4));

[num5, den5] = butter(10, 3500/(fs/2), 'high');
w5 = freqz(num5, den5, length(f));
[z5, p5] = tf2zp(num5, den5);
plot(f, abs(w5));

hold off;
xlim([0, 5000]);
xlabel('Frequency [Hz]');
ylabel('Frequency response |H(f)|');
legend('Channel 1 filter', 'Channel 2 filter', 'Channel 3 filter', 'Channel 4 filter', 'Channel 5 filter');

figure(4)
n = linspace(-pi, pi, 360);
subplot(321);
hold on;
grid on;
plot(exp(-1i*n), 'b--');
plot(real(z1), imag(z1), 'ro', 'MarkerSize', 10);
plot(real(p1), imag(p1), 'kx', 'MarkerSize', 10);
xlabel('Ch1 Filter');
hold off;

subplot(322);
hold on;
grid on;
plot(exp(-1i*n), 'b--');
plot(real(z2), imag(z2), 'ro', 'MarkerSize', 10);
plot(real(p2), imag(p2), 'kx', 'MarkerSize', 10);
xlabel('Ch2 Filter');
hold off;

subplot(323);
hold on;
grid on;
plot(exp(-1i*n), 'b--');
plot(real(z3), imag(z3), 'ro', 'MarkerSize', 10);
plot(real(p3), imag(p3), 'kx', 'MarkerSize', 10);
xlabel('Ch3 Filter');
hold off;

subplot(324);
hold on;
grid on;
plot(exp(-1i*n), 'b--');
plot(real(z4), imag(z4), 'ro', 'MarkerSize', 10);
plot(real(p4), imag(p4), 'kx', 'MarkerSize', 10);
xlabel('Ch4 Filter');
hold off;

subplot(325);
hold on;
grid on;
plot(exp(-1i*n), 'b--');
plot(real(z5), imag(z5), 'ro', 'MarkerSize', 10);
plot(real(p5), imag(p5), 'kx', 'MarkerSize', 10);
xlabel('Ch5 Filter');
hold off;

save('LAB9_2_variables')