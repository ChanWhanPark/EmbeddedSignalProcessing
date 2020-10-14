%% 1.2
n1 = linspace(-5, 5, 11);
n2 = linspace(-5, 5, 11);
% n1, n2는 -5부터 5까지 11개의 점을 가지고 있음
x1 = [0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0]; % x1[n]
x2 = [0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0]; % x2[n]

[n, x] = convolution(n1, x1, n2, x2);
figure(1);

subplot(311);
stem(n1, x1);
xlabel('n')
ylabel('x1')

subplot(312);
stem(n2, x2);
xlabel('n')
ylabel('x2')

subplot(313);
stem(n, x, 'bx')
hold on;
stem(n, conv(x1, x2), 'ro');
xlabel('n')
ylabel('y')
