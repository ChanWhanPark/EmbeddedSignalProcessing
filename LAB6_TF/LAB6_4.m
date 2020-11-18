t = linspace(0, 20, 21);

z1 = -5;
p1 = [0.5*(1+1i)*cos(pi/4), 0.5*(1-1i)*cos(pi/4)];
[b1, a1] = zp2tf(z1, p1, 1);
[r1, p1, k1] = residue(b1, a1);
s1 = h(r1, p1, t, 'd');

z2 = -5;
p2 = [1*(1+1i)*cos(pi/4), 1*(1-1i)*cos(pi/4)];
[b2, a2] = zp2tf(z2, p2, 1);
[r2, p2, k2] = residue(b2, a2);
s2 = h(r2, p2, t, 'd');

z3 = -5;
p3 = [1.5*(1+1i)*cos(pi/4), 1.5*(1-1i)*cos(pi/4)];
[b3, a3] = zp2tf(z3, p3, 1);
[r3, p3, k3] = residue(b3, a3);
s3 = h(r3, p3, t, 'd');

figure(6)
subplot(311);
stem(t, s1);
grid on;
xlabel("n");
ylabel("h[n]");

subplot(312);
stem(t, s2);
grid on;
xlabel("n");
ylabel("h[n]");

subplot(313);
stem(t, s3);
grid on;
xlabel("n");
ylabel("h[n]");