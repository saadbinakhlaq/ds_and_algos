=begin
https://leetcode.com/problems/product-of-array-except-self/
=end

def product_except_self(nums)
  result = [1] * nums.size
  prefix = 1
  i = 0
  while i < nums.size
    result[i] = prefix
    prefix *= nums[i]
    i += 1
  end
  i = nums.size - 1

  postfix = 1
  while i >= 0
    result[i] *= postfix
    postfix *= nums[i]
    i -= 1
  end
  result
end