%% 3.2.2
N = 50;
n = linspace(0, N-1, N);

L1 = 1;
L2 = 10;
L3 = 30;
L4 = 50;

p1 = pL(N, L1);
p2 = pL(N, L2);
p3 = pL(N, L3);
p4 = pL(N, L4);

[f_1, x1] = DFT(p1);
[fd_1, xd1] = DTFT_1024(p1);
[f_2, x2] = DFT(p2);
[fd_2, xd2] = DTFT_1024(p2);
[f_3, x3] = DFT(p3);
[fd_3, xd3] = DTFT_1024(p3);
[f_4, x4] = DFT(p4);
[fd_4, xd4] = DTFT_1024(p4);

figure(3)
subplot(221)
stem(n, p1);
xlabel('n');
ylabel('x1');
subplot(222)
stem(n, p2);
xlabel('n');
ylabel('x2');
subplot(223)
stem(n, p3);
xlabel('n');
ylabel('x3');
subplot(224)
stem(n, p4);
xlabel('n');
ylabel('x4');

figure(4)
subplot(221)
plot(f_1, abs(x1), 'or');
hold on;
plot(fd_1, abs(xd1), 'k');
xlabel("f_hat");
ylabel("|Xk|");
ylim([0.9, 1.1]);
legend("DFT", "DTFT");

subplot(222)
plot(f_2, abs(x2), 'or');
hold on;
plot(fd_2, abs(xd2), 'k');
xlabel("f_hat");
ylabel("|Xk|");
legend("DFT", "DTFT");

subplot(223)
plot(f_3, abs(x3), 'or');
hold on;
plot(fd_3, abs(xd3), 'k');
xlabel("f_hat");
ylabel("|Xk|");
legend("DFT", "DTFT");

subplot(224)
plot(f_4, abs(x4), 'or');
hold on;
plot(fd_4, abs(xd4), 'k');
xlabel("f_hat");
ylabel("|Xk|");
legend("DFT", "DTFT");

% 의의
% DTFT는 한 주기의 주파수에 해당하는 모든 값을 가짐
% N-point DFT를 이용하면 시간영역과 주파수영역에서 모두 이산인 신호를 얻을 수 있음
% 이로써 DTFT의 한계 극복 가능