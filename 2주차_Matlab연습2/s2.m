clear;
clc;

t = linspace(0, 6, 1000);

y1 = exp(-t);
y2 = cos(pi*t);
y3 = y1.*y2;

subplot(311)
plot(t, y1, 'r')
grid on

subplot(312)
plot(t, y2, 'g')
grid on 

subplot(313)
plot(t, y3, 'b')
grid on