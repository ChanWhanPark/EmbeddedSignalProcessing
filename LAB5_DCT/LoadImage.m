function [Z] = LoadImage(fname, row, col)
%LOADIMAGE �� �Լ��� ��� ���� ��ġ
%   �ڼ��� ���� ��ġ
fin = fopen(fname, 'r');
I = fread(fin, row*col, 'uint8=>uint8');
Z = reshape(I, row, col);
Z = Z';
end

