clear;
clc;
load('LAB9_2_variables.mat')

t = linspace(0, 15, length(y));

figure(5)
y1 = filter(num1, den1, y);
[f1, X1] = myfun_SA(t, y1);
subplot(521)
plot(t, y1);
xlabel('Time[sec]');
ylabel('Ch1 out, y1[n]');
subplot(522)
plot(f1, abs(X1));
xlim([0, 5000]);
xlabel('Frequency[Hz]');


y2 = filter(num2, den2, y);
[f2, X2] = myfun_SA(t, y2);
subplot(523)
plot(t, y2);
xlabel('Time[sec]');
ylabel('Ch2 out, y1[n]');
subplot(524)
plot(f2, abs(X2));
xlim([0, 5000]);
xlabel('Frequency[Hz]');

y3 = filter(num3, den3, y);
[f3, X3] = myfun_SA(t, y3);
subplot(525)
plot(t, y3);
xlabel('Time[sec]');
ylabel('Ch3 out, y1[n]');
subplot(526)
plot(f3, abs(X3));
xlim([0, 5000]);
xlabel('Frequency[Hz]');

y4 = filter(num4, den4, y);
[f4, X4] = myfun_SA(t, y4);
subplot(527)
plot(t, y4);
xlabel('Time[sec]');
ylabel('Ch4 out, y1[n]');
subplot(528)
plot(f4, abs(X4));
xlim([0, 5000]);
xlabel('Frequency[Hz]');

y5 = filter(num5, den5, y);
[f5, X5] = myfun_SA(t, y5);
subplot(529)
plot(t, y5);
xlabel('Time[sec]');
ylabel('Ch5 out, y1[n]');
subplot(5,2,10)
plot(f1, abs(X5));
xlim([0, 5000]);
xlabel('Frequency[Hz]');

c1 = 1; c2 = 5; c3 = 4; c4 = 2; c5 = 1; w = 1;
y_ch = y1*c1 + y2*c2 + y3*c3 + y4*c4 + y5*c5; % (1)
y_mix = sqrt(sum(y.^2)/sum(y_ch.^2))*y_ch; % (2)
y_final = y_mix * w; % (3)
[f, X] = myfun_SA(t, y);
[f0, Xf] = myfun_SA(t, y_final);

figure(6);
subplot(211);
plot(t, y, 'r', t, y_final, 'k');
grid on;
title('c1=1.0, c2=5.0, c3=4.0, c4=2.0, c5=1.0, w=1.0');
xlabel('Time[sec]');
ylabel('Auto Signal');
legend('Input', 'Output');

subplot(212);
plot(f0, abs(X), 'r', f0, abs(Xf), 'k');
grid on;
xlim([0, 5000]);
xlabel('Frequency[Hz]');
ylabel('Magnitude spectrum');
legend('Input', 'Output');

%sound(y_final, fs);