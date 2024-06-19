=begin
The time of day can be represented as the number of minutes before or after midnight. If the number of minutes is positive, the time is after midnight. If the number of minutes is negative, the time is before midnight.

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm). Your method should work with any integer input.

You may not use ruby's Date and Time classes.

=end
#Examples
time_of_day(0) == "00:00"
time_of_day(-3) == "23:57"
time_of_day(35) == "00:35"
time_of_day(-1437) == "00:03"
time_of_day(3000) == "02:00"
time_of_day(800) == "13:20"
time_of_day(-4231) == "01:29"
#Disregard Daylight Savings and Standard Time and other complications.

#HINT DOWN 10 LINES









=begin
The Integer#divmod method and the % (modulo) operator may prove useful in your solution. You may also find Kernel#format handy for formatting your results.

You may want to solve this problem for non-negative arguments that are between 0 and 1439 first. Once you've done that, try handling arguments that are greater than 1439. Finally, solve it for negative values. Think about how you might be able to simplify the final two parts. (Hint: one day is 1440 minutes)
=end

