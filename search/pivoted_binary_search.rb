def pivoted_binary_search(array, key)
  size = array.size
  pivot = find_pivot(array, 0, size - 1)

  return binary_search(array, 0, size - 1, key) if pivot == -1

  return pivot if array[pivot] == key
  return binary_search(array, 0, pivot - 1, key) if array[0] <= key

  binary_search(array, pivot + 1, size - 1, key)
end

def find_pivot(array, low, high)
  if high < low
    return -1
  end
  if high == low
    return low
  end

  mid = (low + high)/ 2
  return mid if mid < high && array[mid] > array[mid + 1]
  return mid - 1 if mid > low && array[mid] < array[mid - 1]
  return find_pivot(array, low, mid - 1) if array[low] >= array[mid]

  find_pivot(array, mid + 1, high)
end

def binary_search(array, low, high, key)
  return -1 if high < low

  mid = (low + high)/2
  return mid if key == array[mid]

  return binary_search(array, mid + 1, high, key) if key > array[mid]
  return binary_search(array, low, mid - 1, key)
end

puts pivoted_binary_search([6, 7, 0, 1, 2, 3, 4, 5], 1)