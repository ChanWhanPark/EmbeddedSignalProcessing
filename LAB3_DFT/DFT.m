function [f_hat, Xk, N_mult] = DFT(x)
%DFT �� �Լ��� ��� ���� ��ġ
%   �ڼ��� ���� ��ġ
N_mult = 0; % ����Ƚ�� �ʱ�ȭ
N = length(x);
f_hat = linspace(-0.5, 0.5 - (1/N), N);
% �̻����ļ� ����� -1/2���� 1/2-(1/N) ������ �������� N���� ���ļ��� ���´�.

for k = 1:1:N % k����
    for n = 1:1:N % n����
        e = exp(-1i*2*pi*((k-1)/N)*n); % ���� ����
        % k�� 0���� ���۵Ǿ�� �ϱ� ������ k-1�� �ǽ��Ѵ�.
        x0(n) = x(n).* e; % �� ��ȣ�� ���� ������ ���� ���� �ӽ� ������ �����Ѵ�.
        N_mult = N_mult + 1; % ������ 1ȸ �ǽ��Ѵ�.
    end
% f_hat�� -0.5���� 0.5-(1/N)������ ���� ���´�.
% for�� ���꿡���� ���ļ� ������ 0���� 1������ �������� ����� ���� ����.
% �׷��Ƿ� -0.5���� 0.5�� ������ ����ϱ� ����
% 0.5���� 1�� ������ -0.5���� 0������ �Ű��ش�
    if (k+(N/2) <= N) % N = 50�� ��, k = 1���� k = 25����������
        Xk(k+(N/2)) = sum(x0); % ���� Xk(26)���� Xk(50)���� ä���.
    else 
        Xk(k-(N/2)) = sum(x0); % ���� Xk(1)���� Xk(25)���� ä���.
    end
end
