=begin
Write a function min_change that takes in an amount and a list of coins. The function should return the minimum number of coins required to create the amount. You may use each coin as many times as necessary.

If it is not possible to create the amount, then return -1.
=end

def min_change(amount, coins)
  ans = _min_change(amount, coins, {})
  if ans == Float::INFINITY
    return -1
  else
    return ans
  end
end

def _min_change(amount, coins, memo)
  return memo[amount] if !memo[amount].nil?
  return 0 if amount == 0
  return Float::INFINITY if amount < 0

  min_coins = Float::INFINITY

  coins.each do |coin|
    num_coins = 1 + _min_change(amount - coin, coins, memo)
    min_coins = [num_coins, min_coins].min
  end

  memo[amount] = min_coins
  min_coins
end

puts min_change(8, [1, 5, 4, 12])
puts min_change(13, [1, 9, 5, 14, 30])
puts min_change(23, [2, 5, 7])