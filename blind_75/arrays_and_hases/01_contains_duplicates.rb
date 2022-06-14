=begin
Given an integer array nums,return true if any value appears at least twice in the array,
and return false if every element is distinct.
=end

def contains_duplicate(nums)
  hash = Hash.new do |h, k|
     h[k] = 0
  end
  nums.each do |num|
      hash[num] += 1
  end
  
  hash.values.any? { |value| value >= 2 }
end