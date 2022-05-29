=begin
Write a function, array_stepper, that takes in a list of numbers as an argument.
You start at the first position of the list. The function should return a boolean indicating whether or not it is possible to reach the last position of the list.
When situated at some position of the list, you may take a maximum number of steps based on the number at that position.
=end

def array_stepper(numbers)
  _array_stepper(numbers, 0, {})
end

def _array_stepper(numbers, idx, memo)
  return memo[idx] if !memo[idx].nil?

  return true if idx >= numbers.size - 1

  max_step = numbers[idx]
  (1..max_step).each do |step|
    if _array_stepper(numbers, idx + step, memo) == true
      memo[idx] = true
      return true
    end
  end

  memo[idx] = false
  memo[idx]
end

p array_stepper([2, 4, 2, 0, 0, 1])
p array_stepper([4, 1, 5, 1, 1, 1, 0, 4])