%% 3.1 임펄스열 발생
t1 = -5;
t2 = 5;
N = 4096;
%fs = 20;
% fs = 15;
fs = 10;

[t, p] = impulse(t1, t2, N, fs);
[f_1, x_1] = myfun_SA(t, p);
figure(1);
subplot(211);
plot(t, p);
xlim([-1, 1])
xlabel("시간 t sec")
ylabel("임펄스 p(t)")

subplot(212);
plot(f_1, abs(x_1));
xlim([-30, 30]);
xlabel("주파수 fHz");
ylabel("스펙트럼 X");

%% 3.2 Sinc 함수 발생
x = 20*pi*sinc((20*pi*t)/(2*pi));
[f_2, x_2] = myfun_SA(t, x);
figure(2)
subplot(211);
plot(t, x);
xlim([-1, 1])
xlabel("시간 t sec")
ylabel("x(t)")

subplot(212);
plot(f_2, abs(x_2));
xlim([-30, 30]);
xlabel("주파수 fHz");
ylabel("스펙트럼 X");

%% 3.3 표본화
y = x .* p;
[f_3, x_3] = myfun_SA(t, y);
figure(3)
subplot(211);
plot(t, y);
xlim([-1, 1])
xlabel("시간 t sec")
ylabel("y(t)")

subplot(212);
plot(f_3, abs(x_3));
xlim([-30, 30]);
xlabel("주파수 fHz");
ylabel("스펙트럼 X");

save('LAB2_1_variables', 't', 'y', 'f_3', 'x_3');