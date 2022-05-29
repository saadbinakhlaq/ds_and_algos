=begin
Write a function, counting_change, that takes in an amount and a list of coins. 
The function should return the number of different ways it is possible to make change for the given amount using the coins.

You may reuse a coin as many times as necessary.
=end

def counting_change(amount, coins)
  _counting_change(amount, coins, 0, {})
end

def _counting_change(amount, coins, idx, memo)
  key = [amount, idx]

  return memo[key] if !memo[key].nil?
  return 1 if amount == 0
  return 0 if idx == coins.size

  coin = coins[idx]
  total_count = 0

  (0..(amount / coin)).each do |qty|
    remainder = amount - (qty * coin)
    total_count += _counting_change(remainder, coins, idx + 1, memo)
  end

  memo[key] = total_count
  total_count
end

p counting_change(4, [1, 2, 3])
p counting_change(8, [1, 2, 3])