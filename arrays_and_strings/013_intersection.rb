=begin
Write a function, intersection, that takes in two lists, a,b, as arguments. The function should return a new list containing elements that are in both of the two lists.

You may assume that each input list does not contain duplicate elements.
=end
require 'set'

def intersection(list_1, list_2)
  set_1 = Set.new list_1
  final_list = []
  list_2.each do |each_list_2_item|
    final_list << each_list_2_item if set_1.include?(each_list_2_item)
  end
  final_list
end

puts intersection([4,2,1,6], [3,6,9,2,10]).sort == [2,6].sort
puts intersection([2,4,6], [4,2]).sort == [2,4].sort