=begin
Write a function, merge_sort, that takes in a list of numbers as an argument. The function should return a new list containing elements of the original list sorted in ascending order. Your function must implement the merge sort algorithm.
=end

def merge(left, right)
  final = []

  index_left = 0
  index_right = 0
  
  while index_left < left.size && index_right < right.size
    if left[index_left] > right[index_right]
      final << right[index_right]
      index_right += 1
    elsif left[index_left] < right[index_right]
      final << left[index_left]
      index_left += 1
    else
      final << left[index_left]
      final << right[index_right]
      index_left += 1
      index_right += 1
    end
  end

  while index_left < left.size
    final << left[index_left]
    index_left += 1
  end
  while index_right < right.size
    final << right[index_right]
    index_right += 1
  end
  final
end

def merge_sort(numbers)
  
  return [] if numbers == []
  return numbers if numbers.size == 1

  mid = (numbers.size/2).floor
  

  left = merge_sort(numbers[...mid])
  right = merge_sort(numbers[mid..])
  merge(left, right)
end

# p merge_sort([1, 2, 3, 0, 1, 2, 14])

p merge([1, 2, 3], [0, 1, 2, 14])