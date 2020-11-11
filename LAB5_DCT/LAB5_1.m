Z = LoadImage('lena.raw', 256, 256); % 256*256픽셀의 이미지파일

Zf = fft2(Z);
Z_fn = uint8(abs(Zf) / 255); % 0~255의 uint8형 정수값이 나오도록 정규화
Z_if = ifft2(Zf);
Z_ifn = uint8(Z_if); % uint8형 정수값이 나오도록 형 변환

figure(1)
subplot(131)
imshow(Z);
subplot(132)
imshow(abs(Z_fn));
subplot(133)
imshow(Z_ifn);