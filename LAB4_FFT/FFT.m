function [f_hat, Xk, N_mult] = FFT(x)
% 초기값 설정
N_mult = 0;
N = length(x);
f_hat = linspace(-0.5, 0.5-(1/N), N);
Xk = zeros(1, N);

% 시분할 알고리즘을 위한 초기 설정
h = log2(N); % 이진수의 비트수를 표현하기 위함
for k = 1:1:N % x의 길이만큼 연산 수행
    bit(k, :) = dec2bin(k-1, h); % 10진수를 2진수로 변환하는 과정
    % k-1의 숫자를 h비트로 바꿔준다.
    flip_bit = fliplr(bit); % 만든 bit 행렬을 뒤집는다.
    decbit = bin2dec(flip_bit) + 1; % 2진수 비트를 10진수로 변환하여 순서를 재배열한다.
    W(k) = cos((2*(k-1)*pi)/N) - 1i*sin((2*(k-1)*pi)/N); % 회전 인자 (N분할)
end

% 시분할 FFT 선도
f = 0; % 1단계에서 사용하는 f의 초깃값
for i = 1:1:N
    if (mod(i, 2) == 1) % i가 홀수일때
        f = f + 2; % f값을 2 증가, 다음 위치 가리킴
        Xf(i) = W(1) * x(decbit(f)); % 회전인자와 재배열한 입력신호를 곱함
        N_mult = N_mult + 1; % 곱셈 횟수 1 증가
        x1(i) = x(decbit(i)) + Xf(i); % i가 홀수일 때는 윗선에서 아랫선을 더해줌
    else % i가 짝수일 때
        Xf(i) = Xf(i-1);
        x1(i) = x(decbit(i-1)) - Xf(i); % i가 짝수일 때는 윗선에서 아랫선을 빼줌
    end
end

t = 2; % 2단계에서 만들어져야 할 회전인자 크기 지정
s = 0; % 2단계에서 사용하는 s의 초깃값

for i = 1:1:h-1 %2단계부터 h단계까지 진행
    if (i>1)
        x1= x2;
        x2 = zeros(1, N);
    end
    p = N / t;
    for j = 1:1:t
        W2(j) = W(1 + s/2);
        s = s + p;
        % 회전인자의 크기가 N만큼 분할되어 있어서
        % s에 p를 더해 원하는 회전인자값을 만들어주고자 함
    end
    key = length(W2) * 2;
    for k = 1:1:N/key
        re = k * key - key;
        for l = 1:1:key
            if (l <= key / 2)
               Xs(l) = W2(l)*x1(re+key/2+l);
               N_mult = N_mult + 1;
               x2(l+re) = x1(l + re) + Xs(l);
            else
               Xs(l) = Xs(l-key/2);
               x2(l+re) = x1(l-(key/2)+re) - Xs(l);
            end
        end
    end
    t = 2*t;
    s = 0;
end

% 이산주파수가 -0.5부터 0.5 사이로 정의되었기 때문에
% 0.5에서 1인 구간을 -0.5에서 0.5로 옮기는 작업을 수행한다.
% 이는 이산 주파수 스펙트럼이 주기성을 가지고 있기 때문에 가능하다.
for i = 1:1:N
    if (i+(N/2) <= N)
        Xk(i+(N/2)) = x2(i);
    else
        Xk(i-(N/2)) = x2(i);
    end
end
end

                