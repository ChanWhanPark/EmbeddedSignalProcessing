%% 2.3
n1 = linspace(0, 15, 16);
n2 = linspace(0, 5, 6);

A = 1;
f = 0.1;
theta = 0;
x = A * cos(2*pi*f*n1 + theta);
h = 0.5.^n2;



%% x1을 shift하는 연산
xx = zeros(1, length(n1));
for i = 1:1:length(x) % x1만큼의 길이에서 연산
    if (i + 5) > length(x) % 예시와 같이 x[n-5] 수행, 범위를 벗어나면
        xx(i) = 0; % 그 부분을 0으로 처리
    else
        xx(i) = x(i + 5); % 그 외에는 x[n-5] 연산 수행
    end
end

[n, x1] = convolution(n1, x, n2, h)
[nn, x2] = convolution(n1, xx, n2, h)

%% 출력
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