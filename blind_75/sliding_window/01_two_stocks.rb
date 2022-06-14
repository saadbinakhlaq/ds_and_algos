=begin
You are given an array prices where prices[i] is the price of a given stock on the ith day.

You want to maximize your profit by choosing a single day to buy one stock and choosing a different day in the future to sell that stock.

Return the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0.

Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
=end

def max_profit(prices)
  _max_profit = 0
  least_value = prices[0]
  
  prices.each do |price|
      current_profit = price - least_value
      _max_profit = [_max_profit, current_profit].max
      least_value = [least_value, price].min
  end
  _max_profit
end