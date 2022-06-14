=begin
https://leetcode.com/problems/contains-duplicate/
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