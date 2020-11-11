function [Z,rat] = Press(img,th)
% DCT한 행렬과 문턱값을 입력으로 받아 압축한 행렬과 압축률을 출력
x = abs(img);
[r, c] = size(x); % x의 크기, r*c 행렬임을 나타냄
pixel = r * c; % 전체 화소

% 압축 전
[row, col] = find(x < 0.001); % 원소값이 0인 구간 찾음
Mb = length(col);
Mb = pixel - Mb; % 전체 화소 수 - 값이 0인 화수 수 = 0이 아닌 화소 수(압축 전)

% 압축 후
[row, col] = find(x < 255 * th); % 문턱값을 넘지 못하는 구간 찾음
Ma = length(col);
Ma = pixel - Ma;

rat = Ma / Mb; % 압축률 = 압축 후 0이 아닌 화소수 / 압축 전 0이 아닌 화소수

index = 1;
% 행이 먼저 증가 후 255까지 증가하면 열이 증가
for j = 1:1:c
    for i=1:1:r
        if (i == row(index) && j == col(index)) % 행과 열이 모두 문턱값보다 낮으면
            Z(i, j) = 0; % 그 부분을 0으로 바꿈
            index = index + 1;
            if (index > length(col)) % index가 문턱값을 넘지 못하는 열보다 커지면
                index = index - 1; % 제일 마지막 줄 수행할 때 하나를 뺌
            end
        else
            Z(i, j) = img(i, j); % 그 부분이 아니면, 그대로 표현
        end
    end
end

end

