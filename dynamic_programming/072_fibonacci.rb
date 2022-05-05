=begin
Write a function fib that takes in a number argument, n, and returns the n-th number of the Fibonacci sequence.

The 0-th number of the sequence is 0.

The 1-st number of the sequence is 1.

To generate further numbers of the sequence, calculate the sum of previous two numbers.

Solve this recursively.
=end

def fib(n)
  memo = {}
  _fib(n, memo)
end

def _fib(n, memo)
  return 0 if n == 0
  return 1 if n == 1
  return memo[n] if !memo[n].nil?
  memo[n] = _fib(n - 1, memo) + _fib(n - 2, memo)
  memo[n]
end

puts(fib(0))
puts(fib(1))
puts(fib(2))
puts(fib(8))
puts(fib(35))