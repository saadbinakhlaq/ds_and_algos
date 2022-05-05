=begin
Write a function tribonacci that takes in a number argument, n, and returns the n-th number of the Tribonacci sequence.

The 0-th and 1-st numbers of the sequence are both 0.

The 2-nd number of the sequence is 1.

To generate further numbers of the sequence, calculate the sum of previous three numbers.

Solve this recursively.
=end

def tribonacci(n)
  memo = {}
  _tribonacci(n, memo)
end

def _tribonacci(n, memo)
  return 0 if n == 0
  return 0 if n == 1
  return 1 if n == 2
  return memo[n] if !memo[n].nil?
    
  memo[n] = _tribonacci(n - 1, memo) + _tribonacci(n - 2, memo) + _tribonacci(n - 3, memo)
  memo[n]
end

puts(tribonacci(1))
puts(tribonacci(2))
puts(tribonacci(3))
puts(tribonacci(5))
puts(tribonacci(7))
puts(tribonacci(14))