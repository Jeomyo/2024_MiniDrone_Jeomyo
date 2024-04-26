date = {'year', 'month', 'day', 'Hours', 'minutes', 'seconds'};
days=zeros(1,6);

for i=1:6

input_str = sprintf("날짜/시간을 입력해주세요 (%s) ",date{i});
value=input(input_str);

while true
if i==2 && (value < 1 || value > 12)
    replay=sprintf("1~12 사이의 숫자를 입력해주세요 ");
    value=input(replay);
    
elseif i==3 && (value < 1 || value > 31)
    replay=sprintf("1~31 사이의 숫자를 입력해주세요 ");
    value=input(replay);
elseif i==4 && (value < 0 || value > 24)
    replay=sprintf("0~24 사이의 숫자를 입력해주세요 ");
    value=input(replay);
elseif (i==5 || i==6) && (value < 0 || value > 60)
    replay=sprintf("0~60 사이의 숫자를 입력해주세요 ");
    value=input(replay);
else
    break;
end
end

days(1,i)=value;
end

disp(days);
D=datetime(days);

disp(D);

shift_time_str = sprintf("이동할 시간을 입력해주세요 ");
shift_time = input(shift_time_str);


shift_datetime = D + hours(shift_time);

fprintf("이동된 시간은 %s\n", shift_datetime);
