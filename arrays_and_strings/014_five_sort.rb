=begin
Write a function, five_sort, that takes in a list of numbers as an argument. The function should rearrange elements of the list such that all 5s appear at the end. Your function should perform this operation in-place by mutating the original list. The function should return the list.

Elements that are not 5 can appear in any order in the output, as long as all 5s are at the end of the list.
=end

def five_sort(numbers)
  i = 0
  j = numbers.size - 1

  while i < j
    if numbers[j] == 5
      j -= 1
    elsif numbers[i] == 5
      numbers[i], numbers[j] = numbers[j], numbers[i]
      i += 1
    else
      i += 1
    end
  end
  numbers
end

puts five_sort([12, 5, 1, 5, 12, 7]) == [12, 7, 1, 12, 5, 5]
puts five_sort([5, 2, 5, 6, 5, 1, 10, 2, 5, 5]) == [2, 2, 10, 6, 1, 5, 5, 5, 5, 5]