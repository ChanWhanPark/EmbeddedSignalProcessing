function [f_hat,Xk] = DTFT_1024(x)
%DTFT_1024 이 함수의 요약 설명 위치
%   자세한 설명 위치
N = 1024;
f_hat = linspace(-0.5, 0.5 - (1/N), N);
x_len = length(x);
x0 = zeros(1, N);
Xk = zeros(1, N);

for k = 1:1:N % k연산, N이 총 1024개이다.
    for n = 1:1:x_len % n연산
        e = exp(-1i*2*pi*((k-1)/N)*n);
        x0(n) = x(n).* e;
    end
    if (k+(N/2) <= N)
        Xk(k+(N/2)) = sum(x0);
    else 
        Xk(k-(N/2)) = sum(x0);
    end
end