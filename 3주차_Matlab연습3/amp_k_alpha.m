function [a] = amp_k_alpha(alpha, K, Amp_in)
y = Amp_in(1, :);
a = alpha * y;

id1 = find(a > K);
a(id1) = K;
id2 = find(a < -K);
a(id2) = -K;
