=begin
Write a function, pair_sum, that takes in a list and a target sum as arguments. The function should return a tuple containing a pair of indices whose elements sum to the given target. The indices returned must be unique.

Be sure to return the indices, not the elements themselves.

There is guaranteed to be one such pair that sums to the target.
=end

def pair_sum(numbers, target)
  previous = {}

  (0...numbers.size).each do |index|
    complement = target - numbers[index]
    if previous[complement].nil?
      previous[numbers[index]] = index
    else
      return [previous[complement], index]
    end
  end
end

puts pair_sum([3, 2, 5, 4, 1], 8) == [0, 2]
puts pair_sum([4, 7, 9, 2, 5, 1], 5) == [0, 5]