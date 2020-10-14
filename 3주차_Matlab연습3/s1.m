clear;
clc;

t = linspace(0, 2.5, 100);
f = 1;
y = cos(2*pi*f*t);

data = [t;y];
fid = fopen('1_sine_wave.txt', 'w');
fprintf(fid, '%f %f\n', data);
fclose(fid);
clear;

d = load('1_sine_wave.txt');

x = d(:, 1);
y1 = d(:, 2);
y2 = y1;

id = find(y1<0);
y2(id) = 0.5*y1(id);

id = find(y1>=0);
y2(id) = 2*y1(id);

figure(1)
plot(x, y1, x, y2, '-*');
grid on;
legend('Original sine wave', 'New sine wave');