Z = LoadImage('lena.raw', 256, 256); % 256*256픽셀의 이미지파일

Zd = dct2(Z);
Z_dn = uint8(abs(Zd));
Z_id = idct2(Zd);
Z_idn = uint8(Z_id); % uint8형 정수값이 나오도록 형 변환

figure(2)
subplot(131)
imshow(Z);
subplot(132)
imshow(abs(Z_dn));
subplot(133)
imshow(Z_idn);