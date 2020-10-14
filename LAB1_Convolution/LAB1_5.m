%% 2.2
n1 = linspace(0, 15, 16);
n2 = linspace(-5, 5, 11);
n3 = linspace(0, 10, 11);

A1 = 1;
f1 = 0.1;
theta1 = 0;
x1 = A1 * cos(2*pi*f1*n1 + theta1);

A2 = 1;
f2 = 0.05;
theta2 = 0;
x2 = A2 * cos(2*pi*f2*n2 + theta2);

x3 = (-1).^n3;

%% (x1 * x2) * x3
[nn, xx] = convolution(n1, x1, n2, x2);
[nn1, xx1] = convolution(nn, xx, n3, x3);
%% x1 * (x2 * x3)
[nnn, xxx] = convolution(n2, x2, n3, x3);
[nn2, xx2] = convolution(n1, x1, nnn, xxx);

%% Ãâ·Â
figure(1)
subplot(311);
stem(n1, x1);
xlabel('n')
ylabel('x1')

subplot(312);
stem(n2, x2);
xlabel('n')
ylabel('x2')

subplot(313);
stem(n3, x3);
xlabel('n')
ylabel('x2')

figure(2)
subplot(211);
stem(nn1, xx1);
xlabel('n')
ylabel('(x1*x2)*x3')

subplot(212);
stem(nn2, xx2);
xlabel('n')
ylabel('x1*(x2*x3)')