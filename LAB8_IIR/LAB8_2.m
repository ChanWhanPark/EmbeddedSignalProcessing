clear;
clc;
two_pi = 2 * pi;
[zb, pb, kb] = buttap(7);
[t, f] = zp2tf(zb, pb, kb);
w = linspace(0, 6000*two_pi, 6000);

[t1, f1] = lp2bp(t, f, 3000*two_pi, 2000*two_pi); 
% 주파수를 초당 라디안값으로 변환
hc1 = freqs(t1, f1, w);
[td1, fd1] = bilinear(t1, f1, 50000); 
hd1 = freqz(td1, fd1, w/50000);
[t2, f2] = lp2hp(t, f, 4000*two_pi);
hc2 = freqs(t2, f2, w);
[td2, fd2] = bilinear(t2, f2, 50000);
hd2 = freqz(td2, fd2, w/50000);

figure(4)
hold on;
grid on;
plot(w/two_pi, abs(hc1), 'b-', w/two_pi, abs(hd1), 'g-');
plot(w/two_pi, abs(hc2), 'r-', w/two_pi, abs(hd2), 'm-');
xlim([1500, 5500])
xlabel('Frequency, f[Hz]');
ylabel('|H(w)|');
legend('Analog BPF', 'Digital BPF', 'Analog HPF', 'Digital HPF');