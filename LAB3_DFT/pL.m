function [p] = pL(N, L)
%PL �� �Լ��� ��� ���� ��ġ
%   �ڼ��� ���� ��ġ
y = linspace(0, N-1, N);
p(find(y<L)) = 1;
p(find(y>=L)) = 0;
end

