def insertion_sort(array)
  size = array.size

  (0...size).each do |index|
    reverse_index = index
    while reverse_index > 0
      if array[reverse_index - 1] > array[reverse_index]
        array[reverse_index - 1], array[reverse_index] = array[reverse_index], array[reverse_index - 1]
      end

      reverse_index -= 1
    end
  end

  array
end

puts insertion_sort [10, 9, 8, 8, 7, 6, 11]