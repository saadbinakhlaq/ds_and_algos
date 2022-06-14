=begin
https://leetcode.com/problems/longest-consecutive-sequence/
=end

require 'set'

def longest_consecutive(nums)
  number_set = Set.new(nums)
  
  longest = 0
  
  nums.each do |num|
    if !number_set.include?(num - 1)
      length = 0
      while number_set.include?(num + length) 
        length += 1
      end
      longest = [length, longest].max
    end
  end
  longest
end