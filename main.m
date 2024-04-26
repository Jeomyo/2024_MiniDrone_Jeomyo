% 날짜와 시간 항목을 정의한 배열
date = {'year', 'month', 'day', 'Hours', 'minutes', 'seconds'};
days = zeros(1,6);

% 날짜와 시간을 저장할 배열을 초기화
for i = 1:6

% 각 항목(연, 월, 일, 시, 분, 초)에 대해 사용자로부터 입력을 받음
input_str = sprintf("날짜/시간을 입력해주세요 (%s) ",date{i});
value = input(input_str);
     
% 입력 값이 유효한 범위 내에 있는지 확인
while true
if i == 2 && (value < 1 || value > 12) % 월의 유효성 검사
    replay = sprintf("1~12 사이의 숫자를 입력해주세요 ");
    value = input(replay);
elseif i == 3 && (value < 1 || value > 31)  % 일의 유효성 검사
    replay = sprintf("1~31 사이의 숫자를 입력해주세요 ");
    value = input(replay);
elseif i == 4 && (value < 0 || value > 23) % 시의 유효성 검사
    replay = sprintf("0~23 사이의 숫자를 입력해주세요 ");
    value = input(replay);
elseif (i == 5 || i == 6) && (value < 0 || value > 59) % 분과 초의 유효성 검사
    replay = sprintf("0~59 사이의 숫자를 입력해주세요 ");
    value = input(replay);
else
    % 유효한 값이 입력되면 반복문 종료
    break;
end
end

% 유효한 입력 값을 배열에 저장
days(1,i) = value;
end

% 입력된 날짜와 시간을 기반으로 시간을 이동시키고, 함수를 통해 이동된 날짜와 시간을 계산
date_time = date_time_calculate (days);

D = zeros(1,6);
D = date_time;

% datetime 형식으로 변환하여 이동된 날짜와 시간을 출력
shift_date_time = datetime(D);

fprintf("이동된 시간은 %s\n",shift_date_time);
