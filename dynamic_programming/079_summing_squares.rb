=begin
Write a function, summing_squares, that takes a target number as an argument.
The function should return the minimum number of perfect squares that sum to the target.
A perfect square is a number of the form (i*i) where i >= 1.

For example: 1, 4, 9, 16 are perfect squares, but 8 is not perfect square.
=end

def summing_squares(number)
  memo = {}
  final = _summing_squares(number, memo)
  final
end

def _summing_squares(number, memo)
  return memo[number] if !memo[number].nil?
  return 0 if number == 0

  min_squares = Float::INFINITY
  
  (1..(Math.sqrt(number)).floor).each do |n|
    square = n * n

    remainder = number - square
    num_squares = 1 + _summing_squares(remainder, memo)
    min_squares = [min_squares, num_squares].min
  end

  memo[number] = min_squares
  min_squares
end

p summing_squares(12)
p summing_squares(10)