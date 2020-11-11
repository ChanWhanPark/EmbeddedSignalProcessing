function [Z] = LoadImage(fname, row, col)
%LOADIMAGE 이 함수의 요약 설명 위치
%   자세한 설명 위치
fin = fopen(fname, 'r');
I = fread(fin, row*col, 'uint8=>uint8');
Z = reshape(I, row, col);
Z = Z';
end

