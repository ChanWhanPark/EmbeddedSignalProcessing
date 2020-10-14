clear;
clc;

t1 = linspace(0, 1, 100);
t2 = linspace(1, 6, 500);

y1 = t1;
y2 = 1 ./ t2;

t = [t1 t2];
y = [y1 y2];

figure(1)
plot(t, y)
xlabel('t');
ylabel('y');
grid on;
