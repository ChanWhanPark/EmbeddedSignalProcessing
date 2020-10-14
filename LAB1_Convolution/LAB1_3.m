%% 1.4
n1 = linspace(0, 15, 16);
n2 = linspace(-5, 5, 11);

A1 = 1;
f1 = 0.1;
theta1 = 0;
x1 = A1 * cos(2*pi*f1*n1 + theta1);

A2 = 1;
f2 = 0.05;
theta2 = 0;
x2 = A2 * cos(2*pi*f2*n2 + theta2);

[n, x] = convolution(n1, x1, n2, x2);

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