=begin
Given a string s, find the length of the longest substring without repeating characters.
https://leetcode.com/problems/longest-substring-without-repeating-characters/
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

def length_of_longest_substring(str)
  return 0 if s == ''
  window = []

  index = 0
  max_length = 0

  while index < str.size
    current_char = str[index]

    while window.include?(current_char)
      window.pop
    end

    window << current_char
    max_length = [max_length, window.size].max
  end

  max_length
end