function date_time = date_time_calculate (days)

   shift_time_str = sprintf("이동할 시간을 입력해주세요 ");
   shift_time = input(shift_time_str);

   days(1,4) = days(1,4)+shift_time;
   if days(1,4) >= 24
       k = floor(days(1,4) / 24);
       days(1,4) = mod(days(1,4), 24);
       days(1,3) = days(1,3) + k;
   end
