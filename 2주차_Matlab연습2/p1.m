clear;
clc;

r = 10; % �ʱ� ������
x1 = 5; % �߽� x��ǥ
y1 = 10; % �߽� y��ǥ

z = linspace(-pi, pi, 1000);
% -pi���� pi���� 1000���� ������ ����
x = r*sin(z) + x1;
y = r*cos(z) + y1;
% sin�� cos�� �̿��� ���� ��ǥ�� �����Ѵ�.

plot(x, y)
grid;