Z = LoadImage('lena.raw', 256, 256);
Zd = dct2(Z);
threshold = [0.001, 0.01, 0.05, 0.1, 0.25, 0.5];
% 0.001, 0.05는 차후에 사용
[z1, r1] = Press(Zd, threshold(2));
[z2, r2] = Press(Zd, threshold(4));
[z3, r3] = Press(Zd, threshold(5));
[z4, r4] = Press(Zd, threshold(6));

% (1) 복원한 이미지 출력
figure(3)
subplot(221)
imshow(uint8(z1));
subplot(222)
imshow(uint8(z2));
subplot(223)
imshow(uint8(z3));
subplot(224)
imshow(uint8(z4));

Z1 = uint8(idct2(z1));
Z2 = uint8(idct2(z2));
Z3 = uint8(idct2(z3));
Z4 = uint8(idct2(z4));

figure(4)
subplot(221)
imshow(Z1);
subplot(222)
imshow(Z2);
subplot(223)
imshow(Z3);
subplot(224)
imshow(Z4)

% (2) 문턱값 대비 압축률 관계
[z5, r5] = Press(Zd, threshold(1));
[z6, r6] = Press(Zd, threshold(3));
Z5 = uint8(idct2(z5));
Z6 = uint8(idct2(z6));

ratio = [r5, r1, r6, r2, r3, r4];
figure(5)
subplot(211);
semilogy(threshold, ratio, 'ro-');
grid on;
xlabel('Threshold');
ylabel('압축률');

% (3) RMSE 값
rm1 = RMSE(Z, Z1);
rm2 = RMSE(Z, Z2);
rm3 = RMSE(Z, Z3);
rm4 = RMSE(Z, Z4);
rm5 = RMSE(Z, Z5);
rm6 = RMSE(Z, Z6);

rmse = [rm5, rm1, rm6, rm2, rm3, rm4];
subplot(212);
plot(threshold, rmse, 'bo-');
grid on;
xlabel('Threshold');
ylabel('RMSE');