function [f0,X] = myfun_SA(t,x)
%MYFUN_SA 이 함수의 요약 설명 위치
%   자세한 설명 위치
N = length(x); %x에 대한 신호값만큼의 길이
fs = 1 / (abs(t(2) - t(1)));
X = fftshift(fft(x)) / fs; % x의 복소 스펙트럼
f = [0:N-1] / N;
f_0 = f(find(f<0.5));
f_1 = f(find(f>=0.5));
f0 = [f_1-1 f_0] * fs;
end

