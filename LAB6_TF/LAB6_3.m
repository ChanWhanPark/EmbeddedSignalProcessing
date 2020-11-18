zero = roots([1 -0.3]);
pole = roots([1 0.3 0.36 0.108]);

figure(4)
hold on;
grid on;
n = linspace(-pi, pi, 360);
plot(exp(1i * n), 'b--');
plot(real(zero), imag(zero), 'ro', 'MarkerSize', 10);
plot(real(pole), imag(pole), 'kx', 'MarkerSize', 10);
xlabel("실수부 real");
ylabel("허수부 imag");

[r, p, k] = residue([1 -0.3], [1 0.3 0.36 0.108 0]);
% 양변에 z를 나눈 것과 동일한 것이기 때문에
% 나오는 식은 a/s-b 꼴이어서 마지막에 0을 붙임
t = linspace(0, 20, 21);
s = h(r, p, t, 'd');
figure(5)
subplot(211)
stem(t, s);
grid on;
xlabel('t[sec]');
ylabel('h(t)'); 

wd = linspace(-pi, pi, 100);
fq = freqz([1 -0.3], [1 0.3 0.36 0.108], wd);
subplot(212)
plot(wd, abs(fq));
grid on;
xlabel('w');
ylabel('H|w|');
xlim([-pi, pi]);
ylim([0.2, 1.8]);
