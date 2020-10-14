clear;
clc;
%% for�� �̻��
t = linspace( 0, 5, 1000 ) ;
tau = 0.3 ; % ���� 0.3���� ����
y1 = zeros( 1, length(t)) ; % t�� ���̸�ŭ�� ����� ����
y1(find(abs(t - round(t))<=tau)) = 1;
% t�� t�� �ݿø��� ������ ���� 0.3���� �۰ų� ���� ������ ã�� �� ������ 1�� �����Ѵ�.

figure(1)
plot(t, y1)
grid on;

%% for�� ���
y2 = zeros( 1, length(t)) ; % t�� ���̸�ŭ�� ����� ����
for k=1:length(t) % t�� ���̵���
    val = round(t(k)); % t�� �ݿø��� ��
    dist = abs( t(k) - val ); % t�� t�� �ݿø��� ���� ��
    if dist<=tau % ���� ������ �۰ų� ������
        y2(k) = 1 ; % 1�� ���
    else
    y2(k) = 0 ;
    end
end

figure(2)
plot(t, y2)
grid on;