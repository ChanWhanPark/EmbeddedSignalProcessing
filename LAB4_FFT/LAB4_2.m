N1 = 16;
N2 = 32;
N3 = 64;
N4 = 128;

n16 = linspace(0, N1-1, N1);
n32 = linspace(0, N2-1, N2);
n64 = linspace(0, N3-1, N3);
n128 = linspace(0, N4-1, N4);

f1 = 0.1;
f2 = 0.3;

x16 = 0.3*cos(2*pi*f1*n16) + 0.8*sin(2*pi*f2*n16);
x32 = 0.3*cos(2*pi*f1*n32) + 0.8*sin(2*pi*f2*n32);
x64 = 0.3*cos(2*pi*f1*n64) + 0.8*sin(2*pi*f2*n64);
x128 = 0.3*cos(2*pi*f1*n128) + 0.8*sin(2*pi*f2*n128);

[ff_16, Xf_16, Nf16] = FFT(x16);
[ff_32, Xf_32, Nf32] = FFT(x32);
[ff_64, Xf_64, Nf64] = FFT(x64);
[ff_128, Xf_128, Nf128] = FFT(x128);

[fd_16, Xd_16, Nd16] = DFT(x16);
[fd_32, Xd_32, Nd32] = DFT(x32);
[fd_64, Xd_64, Nd64] = DFT(x64);
[fd_128, Xd_128, Nd128] = DFT(x128);

figure(2)
subplot(211);
stem(n16, x16);
xlabel('n');
ylabel('x[n]');
subplot(212)
plot(fd_16, abs(Xd_16), 'ko');
hold on;
plot(ff_16, abs(Xf_16), 'rx-');
xlabel('fhat, N=16');
ylabel('X|k|');
legend("DFT", "FFT");

figure(3)
subplot(211);
stem(n32, x32);
xlabel('n');
ylabel('x[n]');
subplot(212)
plot(fd_32, abs(Xd_32), 'ko');
hold on;
plot(ff_32, abs(Xf_32), 'rx-');
xlabel('fhat, N=32');
ylabel('X|k|');
legend("DFT", "FFT");

figure(4)
subplot(211);
stem(n64, x64);
xlabel('n');
ylabel('x[n]');
subplot(212)
plot(fd_64, abs(Xd_64), 'ko');
hold on;
plot(ff_64, abs(Xf_64), 'rx-');
xlabel('fhat, N=64');
ylabel('X|k|');
legend("DFT", "FFT");

figure(5)
subplot(211);
stem(n128, x128);
xlabel('n');
ylabel('x[n]');
subplot(212)
plot(fd_128, abs(Xd_128), 'ko');
hold on;
plot(ff_128, abs(Xf_128), 'rx-');
xlabel('fhat, N=128');
ylabel('X|k|');
legend("DFT", "FFT");

DFT_matrix = [Nd16, Nd32, Nd64, Nd128]
FFT_matrix = [Nf16, Nf32, Nf64, Nf128]
len_matrix = [length(n16), length(n32), length(n64), length(n128)];
for i = 1:1:length(len_matrix)
    rat(i) = FFT_matrix(i) / DFT_matrix(i);
    % FFT¿Í DFTÀÇ °ö¼À ¿¬»ê È½¼öÀÇ ºñÀ²
end

figure(6)
subplot(211)
semilogy(len_matrix, DFT_matrix, 'ko-');
hold on;
semilogy(len_matrix, FFT_matrix, 'rx-');
xlabel('¿¬»ê·®');
ylabel('°ö¼À È½¼ö');
legend("DFT", "FFT");

subplot(212)
plot(len_matrix, rat, 'bo-');
xlabel('¿¬»ê·®');
ylabel('FFT/DFT');