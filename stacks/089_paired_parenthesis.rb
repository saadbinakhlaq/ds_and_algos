=begin
Write a function, paired_parentheses, that takes in a string as an argument. The function should return a boolean indicating whether or not the string has well-formed parentheses.

You may assume the string contains only alphabetic characters, '(', or ')'
=end

puts paired_parentheses("(david)((abby))") == true
puts paired_parentheses("()rose(jeff") == false