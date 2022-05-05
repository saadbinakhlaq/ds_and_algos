def merge_sort(array)
  if array.size <= 1
    array
  else
    mid = (array.size / 2).floor
    left = merge_sort(array[0...mid])
    right = merge_sort(array[mid..array.size])
    merge(left, right)
  end
end

def merge(left, right)
  if left.empty?
    right
  elsif right.empty?
    left
  elsif left.first < right.first
    [left.first] + merge(left[1..left.size], right)
  else
    [right.first] + merge(left, right[1..right.size])
  end
end


puts merge_sort [10, 9, 8, 8, 7, 6, 11]