clear;
clc;
%% for문 미사용
t = linspace( 0, 5, 1000 ) ;
tau = 0.3 ; % 폭을 0.3으로 설정
y1 = zeros( 1, length(t)) ; % t의 길이만큼의 영행렬 생성
y1(find(abs(t - round(t))<=tau)) = 1;
% t와 t를 반올림한 구간의 차가 0.3보다 작거나 같은 구간을 찾아 그 구간에 1을 대입한다.

figure(1)
plot(t, y1)
grid on;

%% for문 사용
y2 = zeros( 1, length(t)) ; % t의 길이만큼의 영행렬 생성
for k=1:length(t) % t의 길이동안
    val = round(t(k)); % t를 반올림한 값
    dist = abs( t(k) - val ); % t와 t의 반올림한 값의 차
    if dist<=tau % 차가 폭보다 작거나 같을때
        y2(k) = 1 ; % 1로 출력
    else
    y2(k) = 0 ;
    end
end

figure(2)
plot(t, y2)
grid on;