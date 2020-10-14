%% 2.1
n1 = linspace(-5, 5, 11);
n2 = linspace(0, 5, 6);

A = 1;
f = 0.1;
theta = 0;
x1 = A * cos(2*pi*f*n1 + theta);

x2 = [1, 2, 3, 4, 5, 6];

[n, x] = convolution(n1, x1, n2, x2);
[nn, xx] = convolution(n2, x2, n1, x1);

figure(1)
subplot(211);
stem(n1, x1);
xlabel("n1");
ylabel("x1");
subplot(212);
stem(n2, x2);
xlabel("n2");
ylabel("x2");

figure(2)
subplot(211);
stem(n, x);
xlabel("n");
ylabel("x1*x2");
subplot(212)
stem(nn, xx);
xlabel("n");
ylabel("x2*x1");