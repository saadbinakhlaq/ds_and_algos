=begin
https://leetcode.com/problems/valid-anagram/
=end

def is_anagram(s, t)
  hash_1 = Hash.new do |h, k|
      h[k] = 0
  end
  hash_2 = Hash.new do |h, k|
      h[k] = 0
  end    
  s.chars.each do |char|
      hash_1[char] += 1
  end
  
  t.chars.each do |char|
      hash_2[char] += 1
  end
  
  hash_1 == hash_2
end

