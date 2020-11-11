Z = LoadImage('lena.raw', 256, 256); % 256*256�ȼ��� �̹�������

Zf = fft2(Z);
Z_fn = uint8(abs(Zf) / 255); % 0~255�� uint8�� �������� �������� ����ȭ
Z_if = ifft2(Zf);
Z_ifn = uint8(Z_if); % uint8�� �������� �������� �� ��ȯ

figure(1)
subplot(131)
imshow(Z);
subplot(132)
imshow(abs(Z_fn));
subplot(133)
imshow(Z_ifn);