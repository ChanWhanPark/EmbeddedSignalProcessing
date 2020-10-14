function [n, x] = convolution(n1,x1, n2, x2)

%% n의 길이 설정
first = n1(1) + n2(1);
last = n1(length(n1)) + n2(length(n2));
len = last - first + 1;
n = linspace(first, last, len);
% 이산신호 x1이 a <= n <= b에 정의되고 x2가 c <= n <= d에 정의되면
% 컨볼루션 신호의 구간은 a+c <= n <= b+d가 되고
% 컨볼루션 신호의 길이를 나타내는 변수 len = (b + d) - (a + c) + 1이 된다.
% first는 a과 c의 합을, last는 b와 d의 합을 나타낸다.
% 최종적으로 n은 컨볼루션 연산의 길이를 가진 행렬이 된다.

%% 컨볼루션을 위한 공간 초기 설정
x = zeros(1, length(n));
l = zeros(1, length(n1)-1);
h = [l, x2, l];
% x는 n의 크기만큼의 영행렬 공간을 가진다.
% 컨볼루션 연산 시, x2(1)이 sliding method에 의해 가장 뒤에 계산된다는 가정하에
% 원소 간 원활한 곱셈을 하려면, n1의 길이를 유지하기 위해서 x2 앞에 (n1-1)의 길이만큼의 영행렬을 삽입한다.
% 컨볼루션 연산 시, x2(n1)이 sliding method에 의해 가장 앞에 계산된다는 가정하에
% 원소 간 원활한 곱셈을 하려면, n1의 길이를 유지하기 위해서 x2 뒤에 (n1-1)의 길이만큼의 영행렬을 삽입한다.
% h는 x1과의 컨볼루션 연산을 위해 만들어진 매개변수이다.

%% 컨볼루션 연산
z = 1; % h(1)을 가리킴
len = length(n1); % n1의 길이를 나태난다.
index = 1; % 행렬값 저장을 위한 인덱스
for i = 1:1:length(n) % 컨볼루션의 전체 길이만큼 연산 실행
    for j = z:1:len % z부터 len까지 연산 수행
        h2(i, index) = h(j) % h(j)에 저장된 값을 임시로 만든 h2의 i행 index열에 추가한다.
        index = index + 1; % 인덱스 값을 1을 늘려 다음 열에 값을 추가하게 한다.
    end
    t = [x1;fliplr(h2(i,:))]; % 1열의 x1 밑에 h2의 i열을 삽입한다.
    p = prod(t); % t의 각 원소들을 곱해
    s = sum(p); % 더한 후
    x(i) = s; % 컨볼루션한 값을 삽입한다.
    z = z + 1;
    len = len + 1;
    % h[n]을 1만큼 right-shift 시키는 과정이다.
    index = 1; % 인덱스는 1로 초기화한다. 
end

