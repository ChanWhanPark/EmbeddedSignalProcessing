function [n, x] = convolution(n1,x1, n2, x2)

%% n�� ���� ����
first = n1(1) + n2(1);
last = n1(length(n1)) + n2(length(n2));
len = last - first + 1;
n = linspace(first, last, len);
% �̻��ȣ x1�� a <= n <= b�� ���ǵǰ� x2�� c <= n <= d�� ���ǵǸ�
% ������� ��ȣ�� ������ a+c <= n <= b+d�� �ǰ�
% ������� ��ȣ�� ���̸� ��Ÿ���� ���� len = (b + d) - (a + c) + 1�� �ȴ�.
% first�� a�� c�� ����, last�� b�� d�� ���� ��Ÿ����.
% ���������� n�� ������� ������ ���̸� ���� ����� �ȴ�.

%% ��������� ���� ���� �ʱ� ����
x = zeros(1, length(n));
l = zeros(1, length(n1)-1);
h = [l, x2, l];
% x�� n�� ũ�⸸ŭ�� ����� ������ ������.
% ������� ���� ��, x2(1)�� sliding method�� ���� ���� �ڿ� ���ȴٴ� �����Ͽ�
% ���� �� ��Ȱ�� ������ �Ϸ���, n1�� ���̸� �����ϱ� ���ؼ� x2 �տ� (n1-1)�� ���̸�ŭ�� ������� �����Ѵ�.
% ������� ���� ��, x2(n1)�� sliding method�� ���� ���� �տ� ���ȴٴ� �����Ͽ�
% ���� �� ��Ȱ�� ������ �Ϸ���, n1�� ���̸� �����ϱ� ���ؼ� x2 �ڿ� (n1-1)�� ���̸�ŭ�� ������� �����Ѵ�.
% h�� x1���� ������� ������ ���� ������� �Ű������̴�.

%% ������� ����
z = 1; % h(1)�� ����Ŵ
len = length(n1); % n1�� ���̸� ���³���.
index = 1; % ��İ� ������ ���� �ε���
for i = 1:1:length(n) % ��������� ��ü ���̸�ŭ ���� ����
    for j = z:1:len % z���� len���� ���� ����
        h2(i, index) = h(j) % h(j)�� ����� ���� �ӽ÷� ���� h2�� i�� index���� �߰��Ѵ�.
        index = index + 1; % �ε��� ���� 1�� �÷� ���� ���� ���� �߰��ϰ� �Ѵ�.
    end
    t = [x1;fliplr(h2(i,:))]; % 1���� x1 �ؿ� h2�� i���� �����Ѵ�.
    p = prod(t); % t�� �� ���ҵ��� ����
    s = sum(p); % ���� ��
    x(i) = s; % ��������� ���� �����Ѵ�.
    z = z + 1;
    len = len + 1;
    % h[n]�� 1��ŭ right-shift ��Ű�� �����̴�.
    index = 1; % �ε����� 1�� �ʱ�ȭ�Ѵ�. 
end
