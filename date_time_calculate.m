function date_time = date_time_calculate (days)

   shift_time_str = sprintf("이동할 시간을 입력해주세요 ");
   shift_time = input(shift_time_str);

   days(1,4) = days(1,4)+shift_time;
   if days(1,4) >= 24
       k = floor(days(1,4) / 24);
       days(1,4) = mod(days(1,4), 24);
       days(1,3) = days(1,3) + k;
   end

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

   end

   if days(1,2) > 12
       y = floor(days(1,2) / 12);
       days(1,2) = mod(days(1,2), 12);
       days(1,1) = days(1,1) + y;
   end

   date_time = days;


end
