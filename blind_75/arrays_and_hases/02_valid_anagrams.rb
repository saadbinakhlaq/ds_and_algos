=begin
Given two strings s and t, return true if t is an anagram of s, and false otherwise.

An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase,
typically using all the original letters exactly once.
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