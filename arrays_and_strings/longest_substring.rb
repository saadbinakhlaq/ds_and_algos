=begin
Given a string s, find the length of the longest substring without repeating characters.
Input: s = "abcabcbb"
Output: 3
Explanation: The answer is "abc", with the length of 3.

Input: s = "bbbbb"
Output: 1
Explanation: The answer is "b", with the length of 1.

Input: s = "pwwkew"
Output: 3
Explanation: The answer is "wke", with the length of 3.
Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
=end

def longest_substring(string)
  return 0 if string.nil? || string.size == 0

  window = []
  max = 0
  i = 0
  j = 0
  while i < string.size
    c = string[i]
    while window.include?(c)
      window.shift
      j += 1
    end

    window << c
    max = [max, window.size].max
    i += 1
  end
  max
end

puts longest_substring("pwwkew")
puts longest_substring("bbbbbb")
puts longest_substring("abcbec")
