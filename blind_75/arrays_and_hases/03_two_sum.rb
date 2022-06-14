=begin
Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.
=end

def two_sum(nums, target)
  complementaries = {}
  
  (0...nums.size).each do |index|
      complementary = target - nums[index]
      
      if complementaries[complementary].nil?
          complementaries[nums[index]] = index
      else
          return [complementaries[complementary], index]
      end
  end
end