def binary_search(seq, t)
  min = 0
  max = seq.length - 1

  while true
    return -1 if max < min

    middle = (min + max) / 2
    if seq[middle] < t
      min = middle + 1
    elsif seq[middle] > t
      max = middle - 1
    else
      return middle
    end
  end
end

def binary_search_rec(array, low = 0, high = array.size - 1, target)
  return -1 if high < low
  mid = (high + low) / 2
  return mid if array[mid] == target

  if array[mid] >= target
    binary_search_rec(array, low, mid - 1, target)
  else
    binary_search_rec(array, mid + 1, high, target)
  end
end

# puts binary_search([1, 2, 3, 4, 5, 10, 14, 28], 28)

puts binary_search_rec([1, 2, 3, 4, 5, 10, 14, 28], -130)