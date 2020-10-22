clear;
load('LAB2_1_variables.mat')

fc = 8;
[z, p, k] = buttap(5); % ���Ϳ��� ���� ������Ÿ��
[num, den] = zp2tf(z, p, k); % ���� �Լ� ���·� ��ȯ
[num, den] = lp2lp(num, den, 2*pi*fc); % LPF�� ���� �ƿ��� ���ļ� ����
[num_d, den_d] = bilinear(num, den, 1/abs(t(2)-t(1)) ); % A->D�� ���� ��ȯ

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