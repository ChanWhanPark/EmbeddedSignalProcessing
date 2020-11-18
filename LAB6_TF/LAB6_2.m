t = linspace(0, 10, 100);

zero1 = -5;
pole1 = [-1+2i, -1-2i];
[b1, a1] = zp2tf(zero1, pole1, 1);
[r1, p1, k1] = residue(b1, a1);
s1 = h(r1, p1, t, 'c');

zero2 = -5;
pole2 = [2i, -2i];
[b2, a2] = zp2tf(zero2, pole2, 1);
[r2, p2, k2] = residue(b2, a2);
s2 = h(r2, p2, t, 'c');

zero3 = -5;
pole3 = [1+2i, 1-2i];
[b3, a3] = zp2tf(zero3, pole3, 1);
[r3, p3, k3] = residue(b3, a3);
s3 = h(r3, p3, t, 'c');

figure(3)
subplot(311)
plot(t, s1);
grid on;
xlabel('t[sec]');
ylabel('h(t)');

subplot(312)
plot(t, s2);
grid on;
xlabel('t[sec]');
ylabel('h(t)');

subplot(313)
plot(t, s3);
grid on;
xlabel('t[sec]');
ylabel('h(t)');
