=begin
A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.

Given a string s, return true if it is a palindrome, or false otherwise.

Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.

Input: s = "race a car"
Output: false
Explanation: "raceacar" is not a palindrome.
=end

def is_palindrome(sentence)
  alphabets = "abcdefghijklmnopqrstuvwxyz0123456789"
  index_1 = 0
  index_2 = sentence.size - 1
  sentence = sentence.chars.to_a
  while index_1 < index_2
      if sentence[index_1].downcase == sentence[index_2].downcase
        index_1 += 1
        index_2 -= 1
      elsif !alphabets.include?(sentence[index_1].downcase)
        index_1 += 1
      elsif !alphabets.include?(sentence[index_2].downcase)
        index_2 -= 1
      else
          return false
      end
  end
  
  true
end