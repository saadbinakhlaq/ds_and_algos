=begin
Write a function, subsets, that takes in a list as an argument. The function should return a 2D list where each sublist represents one of the possible subsets of the list.

The elements within the subsets and the subsets themselves may be returned in any order.

You may assume that the input list contains unique elements.
=end

def subsets(elements)
  return [[]]if elements.size == 0
  
  first = elements[0]
  subsets_without_first = subsets(elements[1...elements.size])
  subsets_with_first = []

  subsets_without_first.each do |subs|
    subsets_with_first << [first, *subs]
  end

  subsets_without_first + subsets_with_first
end

p subsets(['a', 'b', 'c'])