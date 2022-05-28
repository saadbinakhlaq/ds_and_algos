=begin
Write a function, permutations, that takes in a list an argument. The function should return a 2D list where each sublist represents one of the possible permutations of the list.

The sublists may be returned in any order.

You may assume that the input list contains unique items.
=end

def permutations(items)
  return [[]] if items.size == 0
  first = items[0]
  full_permutations = []

  permutations(items[1...items.size]).each do |perm|
    (0..perm.size).each do |i|
      full_permutations << perm[0...i] + [first] + perm[i...perm.size]
    end
  end

  full_permutations
end

p permutations(['a', 'b', 'c']) # -> 
# [ 
#   [ 'a', 'b', 'c' ], 
#   [ 'b', 'a', 'c' ], 
#   [ 'b', 'c', 'a' ], 
#   [ 'a', 'c', 'b' ], 
#   [ 'c', 'a', 'b' ], 
#   [ 'c', 'b', 'a' ] 
# ] 

p permutations(['red', 'blue'])
# [ 
#   [ 'red', 'blue' ], 
#   [ 'blue', 'red' ] 
# ]