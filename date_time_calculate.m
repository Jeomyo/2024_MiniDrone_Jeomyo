function date_time = date_time_calculate (days) % 사용자로부터 날짜와 시간을 입력받아서 이동된 시간을 계산하는 함수

   shift_time_str = sprintf("이동할 시간을 입력해주세요 "); % 사용자로부터 이동할 시간을 입력 받음
   shift_time = input(shift_time_str);

   days(1,4) = days(1,4)+shift_time; % 입력된 이동 시간을 현재 시간에 더함

   % 만약 더해진 시간이 24시간을 초과하면 일(day)과 시간(hour)으로 분리
   if days(1,4) >= 24
       k = floor(days(1,4) / 24);
       days(1,4) = mod(days(1,4), 24);
       days(1,3) = days(1,3) + k;
   end
   
   % 월에 따라 일을 조정하여 유효한 날짜로 만듦
   while 1
   if (days(1,2)== 1 || days(1,2)== 3 || days(1,2)== 5 || days(1,2)== 7 || days(1,2)== 8 || days(1,2)== 10 || days(1,2)== 12)
       if days(1,3) > 31
           days(1,3) = days(1,3) - 31;
           days(1,2) = days(1,2) + 1;
       else
           break;
       end

   elseif (days(1,2)== 4 || days(1,2)== 6 || days(1,2)== 9 || days(1,2)== 11)
       if days(1,3) > 30
           days(1,3) = days(1,3) - 30;
           days(1,2) = days(1,2) + 1;
       else
           break;
       end
       
   elseif (days(1,2) == 2)
       if days(1,3) > 28
          days(1,3) = days(1,3) - 28;
          days(1,2) = days(1,2) + 1;
       else
           break;
       end

   else 
       break;
   end
   
   % 월이 12를 초과할 경우 연도를 증가시킴
   if days(1,2) > 12
       y = floor(days(1,2) / 12);
       days(1,2) = mod(days(1,2), 12);
       days(1,1) = days(1,1) + y;
   end

   end

   
   % 계산된 날짜/시간을 반환
   date_time = days;


end
