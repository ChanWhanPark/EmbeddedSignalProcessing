n1 = linspace(0, 3, 4);
n2 = linspace(-2, 2, 5);

x1 = [4, 3, 2, 1];
x2 = [1, -1, 0, 1, -1];

[n, x] = convolution(n1, x1, n2, x2);

figure(1)
subplot(211);
stem(n, x, 'ro');

subplot(212);
stem(n, conv(x1, x2), 'bx');
