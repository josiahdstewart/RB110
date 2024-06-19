=begin
Write a method that takes an Array of numbers, and returns an Array with the same number of elements, and each element has the running total from the original Array.
=end
#exapmles
running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
#A running total is the sum of all values in a list up to and including the current element. Thus, the running total when looking at index 2 of the array [14, 11, 7, 15, 20] is 32 (14 + 11 + 7), while the running total at index 3 is 47 (14 + 11 + 7 + 15).

