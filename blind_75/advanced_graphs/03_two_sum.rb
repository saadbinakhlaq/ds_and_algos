=begin
https://leetcode.com/problems/two-sum/
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