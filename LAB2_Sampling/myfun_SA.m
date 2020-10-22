function [f0,X] = myfun_SA(t,x)
%MYFUN_SA �� �Լ��� ��� ���� ��ġ
%   �ڼ��� ���� ��ġ
N = length(x); %x�� ���� ��ȣ����ŭ�� ����
fs = 1 / (abs(t(2) - t(1)));
X = fftshift(fft(x)) / fs; % x�� ���� ����Ʈ��
f = [0:N-1] / N;
f_0 = f(find(f<0.5));
f_1 = f(find(f>=0.5));
f0 = [f_1-1 f_0] * fs;
end

