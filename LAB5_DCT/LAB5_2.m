Z = LoadImage('lena.raw', 256, 256); % 256*256�ȼ��� �̹�������

Zd = dct2(Z);
Z_dn = uint8(abs(Zd));
Z_id = idct2(Zd);
Z_idn = uint8(Z_id); % uint8�� �������� �������� �� ��ȯ

figure(2)
subplot(131)
imshow(Z);
subplot(132)
imshow(abs(Z_dn));
subplot(133)
imshow(Z_idn);