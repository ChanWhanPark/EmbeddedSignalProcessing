clear;
load('LAB2_1_variables.mat')

fc = 8;
[z, p, k] = buttap(5); % 버터워스 필터 프로토타입
[num, den] = zp2tf(z, p, k); % 전달 함수 형태로 변환
[num, den] = lp2lp(num, den, 2*pi*fc); % LPF를 위한 컷오프 주파수 변경
[num_d, den_d] = bilinear(num, den, 1/abs(t(2)-t(1)) ); % A->D의 필터 변환

y_out = filter(num_d, den_d, y);
[f_3, x_3out] = myfun_SA(t, y_out);
subplot(221)
plot(t, y);
xlim([-1, 1]);
xlabel("t[sec]");
ylabel("Before reconstruction y(t)");
subplot(222)
plot(t, y_out);
xlim([-1, 1]);
xlabel("t[sec]");
ylabel("After reconstruction y(t)");

subplot(223)
plot(f_3, abs(x_3));
xlim([-30, 30]);
xlabel("f[Hz]");
ylabel("Before reconstruction |Y(f)|");
subplot(224)
plot(f_3, abs(x_3out));
xlim([-30, 30]);
xlabel("f[Hz]");
ylabel("After reconstruction |Y(f)|");