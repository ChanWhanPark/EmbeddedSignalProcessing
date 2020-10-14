clear;
clc;

r = 10; % 초기 반지름
x1 = 5; % 중심 x좌표
y1 = 10; % 중심 y좌표

z = linspace(-pi, pi, 1000);
% -pi부터 pi까지 1000개의 구간을 정함
x = r*sin(z) + x1;
y = r*cos(z) + y1;
% sin과 cos을 이용해 원의 좌표를 설정한다.

plot(x, y)
grid;