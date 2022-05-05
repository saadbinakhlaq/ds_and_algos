=begin
Write a function sum_possible that takes in an amount and a list of positive numbers. 
The function should return a boolean indicating whether or not it is possible to create the amount
by summing numbers of the list. You may reuse numbers of the list as many times as necessary.

You may assume that the target amount is non-negative.
=end

def sum_possible(amount, numbers)
  _sum_possible(amount, numbers, {})
end

def _sum_possible(amount, numbers, memo)
  return memo[amount] if !memo[amount].nil?
  return false if amount < 0
  return true if amount == 0

  numbers.each do |num|
    if _sum_possible(amount - num, numbers, memo) == true
      memo[amount] = true
      return true
    end
  end

  memo[amount] = false
  false
end

puts sum_possible(8, [5, 12, 4])
puts sum_possible(15, [6, 2, 10, 19])
puts sum_possible(12, [])
puts sum_possible(2017, [4, 2, 10])
puts sum_possible(271, [10, 8, 265, 24])
puts sum_possible(103, [6, 20, 1])