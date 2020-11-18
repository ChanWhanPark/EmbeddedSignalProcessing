function s = h(r, p, t, mode)

s = 0;
if mode == 'c'
    for i = 1:1:length(p)
        s = s + r(i) * exp(p(i)*t);
        % 라플라스 역변환식
    end
end

if mode == 'd'
    for i = 1:1:length(p)
        s = s + r(i)*p(i).^t;
        % z변환 역변환식
    end
end
end

