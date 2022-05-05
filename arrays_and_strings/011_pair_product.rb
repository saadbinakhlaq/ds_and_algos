=begin
Write a function, pair_product, that takes in a list and a target product as arguments. The function should return a tuple containing a pair of indices whose elements multiply to the given target. The indices returned must be unique.

Be sure to return the indices, not the elements themselves.

There is guaranteed to be one such pair whose product is the target.
=end

def pair_product(numbers, target)
  previous = {}

  (0...numbers.size).each do |index|
    complement = target / numbers[index]

    if previous[complement].nil?
      previous[numbers[index]] = index
    else
      return [previous[complement], index]
    end
  end
end


puts pair_product([3, 2, 5, 4, 1], 8) == [1, 3]

puts pair_product([3, 2, 5, 4, 1], 10) == [1, 2]