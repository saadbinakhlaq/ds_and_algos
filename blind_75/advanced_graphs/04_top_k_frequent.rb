=begin
https://leetcode.com/problems/top-k-frequent-elements/
=end

def top_k_frequent(nums, k)
  hash = Hash.new do |h, k|
    hash[h] = 0
  end
  
  nums.each do |num|
    hash[num] += 1
  end

  hash.to_a.sort_by { |a| a[1] }.reverse.map { |a| a[0] }[...k]
end