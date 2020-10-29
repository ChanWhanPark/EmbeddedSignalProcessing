function [p] = pL(N, L)
%PL 이 함수의 요약 설명 위치
%   자세한 설명 위치
y = linspace(0, N-1, N);
p(find(y<L)) = 1;
p(find(y>=L)) = 0;
end

