clear;
clc;

t = linspace( 0, 2, 1000 ) ;
tau = 0.3 ;
y1 = zeros( 1, length(t)) ;
y1(find(abs(t - round(t))<=tau)) = 1;
% �������� 2�� for�� ������� ���� �κ� ����

f = 5;
y2 = cos(2*pi*f*t + pi*y1);
% ������ ����

figure(1)
subplot(211)
plot(t, y1) ;
grid on ;

ylim([0 1.1]) ;
subplot(212)
plot(t, y2) ;
grid on