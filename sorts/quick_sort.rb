def quick_sort(array)
  return [] if array.empty?
  pivot = array.delete_at(rand(array.size))
  left, right = array.partition { |num| num < pivot }
  return quick_sort(left), pivot, quick_sort(right)
end

puts  quick_sort [10, 9, 8, 8, 7, 6, 11]