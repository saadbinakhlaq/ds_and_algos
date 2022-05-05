def selection_sort(array)
  size = array.size
  (0...size).each do |index|
    min = array[index]
    min_index = index
    ((index + 1)...size).each do |index_2|
      if array[index_2] < min
        min_index = index_2
      end
    end

    array[index], array[min_index] = array[min_index], array[index]
  end

  array
end

puts selection_sort [10, 9, 8, 8, 7, 6, 11]