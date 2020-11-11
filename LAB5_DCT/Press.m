function [Z,rat] = Press(img,th)
% DCT�� ��İ� ���ΰ��� �Է����� �޾� ������ ��İ� ������� ���
x = abs(img);
[r, c] = size(x); % x�� ũ��, r*c ������� ��Ÿ��
pixel = r * c; % ��ü ȭ��

% ���� ��
[row, col] = find(x < 0.001); % ���Ұ��� 0�� ���� ã��
Mb = length(col);
Mb = pixel - Mb; % ��ü ȭ�� �� - ���� 0�� ȭ�� �� = 0�� �ƴ� ȭ�� ��(���� ��)

% ���� ��
[row, col] = find(x < 255 * th); % ���ΰ��� ���� ���ϴ� ���� ã��
Ma = length(col);
Ma = pixel - Ma;

rat = Ma / Mb; % ����� = ���� �� 0�� �ƴ� ȭ�Ҽ� / ���� �� 0�� �ƴ� ȭ�Ҽ�

index = 1;
% ���� ���� ���� �� 255���� �����ϸ� ���� ����
for j = 1:1:c
    for i=1:1:r
        if (i == row(index) && j == col(index)) % ��� ���� ��� ���ΰ����� ������
            Z(i, j) = 0; % �� �κ��� 0���� �ٲ�
            index = index + 1;
            if (index > length(col)) % index�� ���ΰ��� ���� ���ϴ� ������ Ŀ����
                index = index - 1; % ���� ������ �� ������ �� �ϳ��� ��
            end
        else
            Z(i, j) = img(i, j); % �� �κ��� �ƴϸ�, �״�� ǥ��
        end
    end
end

end

