function rmse = RMSE(img,img_d)
[r, c] = size(img);
pixel = r * c;

for i = 1:1:r
    h = [img(i, :);img_d(i, :)]; % 행렬 n1, n2를 붙임
    t = diff(h);
    z(i) = sum(t.^2);
end

z0 = sum(z);
rmse = sqrt((1/pixel)*z0);
end