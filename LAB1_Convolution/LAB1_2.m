%% 1.3
n1 = linspace(0, 15, 16);
n2 = linspace(-5, 5, 11);

A = 1;
f = 0.1;
theta = 0;
x1 = A * cos(2*pi*f*n1 + theta);
x2 = [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0];

[n, x] = convolution(n1, x1, n2, x2);
figure(1);

subplot(311);
stem(n1, x1);
xlabel('n1')
ylabel('x1')

subplot(312);
stem(n2, x2);
xlabel('n2')
ylabel('x2')

subplot(313);
stem(n, x, 'bx')
hold on;
stem(n, conv(x1, x2), 'ro');
xlabel('n')
ylabel('y')