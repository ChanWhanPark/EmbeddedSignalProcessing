%% 2.3
n1 = linspace(0, 15, 16);
n2 = linspace(0, 5, 6);

A = 1;
f = 0.1;
theta = 0;
x = A * cos(2*pi*f*n1 + theta);
h = 0.5.^n2;



%% x1�� shift�ϴ� ����
xx = zeros(1, length(n1));
for i = 1:1:length(x) % x1��ŭ�� ���̿��� ����
    if (i + 5) > length(x) % ���ÿ� ���� x[n-5] ����, ������ �����
        xx(i) = 0; % �� �κ��� 0���� ó��
    else
        xx(i) = x(i + 5); % �� �ܿ��� x[n-5] ���� ����
    end
end

[n, x1] = convolution(n1, x, n2, h)
[nn, x2] = convolution(n1, xx, n2, h)

%% ���
figure(1)
subplot(311)
stem(n1, x);
xlabel("n1");
ylabel("x");
subplot(312)
stem(n2, h);
xlabel("n2");
ylabel("h");
subplot(313)
stem(n, x1);
xlabel("n");
ylabel("x*h");

figure(2)
subplot(311)
stem(n1, xx);
xlabel("n1");
ylabel("x[n-5]");
subplot(312)
stem(n2, h);
xlabel("n2");
ylabel("h");
subplot(313)
stem(nn, x2);
xlabel("n1");
ylabel("x[n-5]*h");