=begin
Write a function, binary_search, that takes in a sorted list of numbers and a target. The function should return the index where the target can be found within the list. If the target is not found in the list, then return -1.

You may assume that the input array contains unique numbers sorted in increasing order.

Your function must implement the binary search algorithm.
=end

def binary_search(numbers, target)
  low = 0
  high = numbers.size - 1

  while low <= high
    mid = ((low + high) / 2).floor

    if target > numbers[mid]
      low = mid + 1
    elsif target < numbers[mid]
      high = mid - 1
    else
      return mid
    end
  end
  
  -1
end

p binary_search([0, 6, 8, 12, 19, 20, 29], 29) # -> 6
p binary_search([0, 6, 8, 12, 16, 19, 20, 24, 28], 27) # -> -1
p binary_search([0, 6, 8, 12, 16, 19, 20, 28], 8) # -> 2
p binary_search([], 7) # -> -1
p binary_search([7], 7) # -> 0
