function s = h(r, p, t, mode)

s = 0;
if mode == 'c'
    for i = 1:1:length(p)
        s = s + r(i) * exp(p(i)*t);
        % ���ö� ����ȯ��
    end
end

if mode == 'd'
    for i = 1:1:length(p)
        s = s + r(i)*p(i).^t;
        % z��ȯ ����ȯ��
    end
end
end

