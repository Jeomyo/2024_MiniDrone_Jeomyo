date = {'year', 'month', 'day', 'Hours', 'minutes', 'seconds'};
days = zeros(1,6);

for i = 1:6

input_str = sprintf("날짜/시간을 입력해주세요 (%s) ",date{i});
value = input(input_str);
     
while true
if i == 2 && (value < 1 || value > 12)
    replay = sprintf("1~12 사이의 숫자를 입력해주세요 ");
    value = input(replay);
elseif i == 3 && (value < 1 || value > 31)
    replay = sprintf("1~31 사이의 숫자를 입력해주세요 ");
    value = input(replay);
elseif i == 4 && (value < 0 || value > 23)
    replay = sprintf("0~23 사이의 숫자를 입력해주세요 ");
    value = input(replay);
elseif (i == 5 || i == 6) && (value < 0 || value > 59)
    replay = sprintf("0~59 사이의 숫자를 입력해주세요 ");
    value = input(replay);
else
    break;
end
end

days(1,i) = value;
end


date_time = date_time_calculate (days);

D = zeros(1,6);
D = date_time;

shift_date_time = datetime(D);

fprintf("이동된 시간은 %s\n",shift_date_time);
