=begin
Write a function, max_increasing_subseq, that takes in a list of numbers as an argument. The function should return the length of the longest subsequence of strictly increasing numbers.

A subsequence of a list can be created by deleting any items of the list, while maintaining the relative order of items.
=end

def max_increasing_subseq(numbers)
  _max_increasing_subsequence(numbers, 0, -Float::INFINITY, {})
end

def _max_increasing_subsequence(numbers, index, previous, memo)
  key = [index, previous]
  return memo[key] if !memo[key].nil?

  return 0 if numbers.size == index

  current = numbers[index]
  options = []

  dont_take_current = _max_increasing_subsequence(numbers, index + 1, previous, memo)
  options << dont_take_current

  if current > previous
    take_current = 1 + _max_increasing_subsequence(numbers, index + 1, current, memo)
    options << take_current
  end

  memo[key] = options.max
  memo[key]
end

p numbers = [4, 18, 20, 10, 12, 15, 19]
p max_increasing_subseq(numbers)