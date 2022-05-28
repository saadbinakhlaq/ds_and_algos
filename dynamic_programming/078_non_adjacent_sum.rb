=begin
Write a function, non_adjacent_sum, that takes in a list of numbers as an argument.
The function should return the maximum sum of non-adjacent items in the list.
There is no limit on how many items can be taken into the sum as long as they are not adjacent.
=end

def non_adjacent_sum(nums)
  _non_adjacent_sum(nums, 0, {})
end

def _non_adjacent_sum(nums, idx_of_nums, memo)
  return memo[idx_of_nums] if !memo[idx_of_nums].nil?
  return 0 if idx_of_nums >= nums.size

  include_first = nums[idx_of_nums] + _non_adjacent_sum(nums, idx_of_nums + 2, memo)
  exclude_first = _non_adjacent_sum(nums, idx_of_nums + 1, memo)

  memo[idx_of_nums] = [include_first, exclude_first].max
  memo[idx_of_nums]
end