=begin
Write a function, paired_parentheses, that takes in a string as an argument. The function should return a boolean indicating whether or not the string has well-formed parentheses.

You may assume the string contains only alphabetic characters, '(', or ')'
=end

def paired_parentheses(string)
  total = 0
  string.each_char do |char|
    if total == 0 && char == ')'
      return false
    else
      total -= 1 if char == ")"
      total += 1 if char == "("
    end
  end

  total == 0
end

puts paired_parentheses("(david)((abby))") == true
puts paired_parentheses("()rose(jeff") == false
puts paired_parentheses(")(") == false
puts paired_parentheses("())(") == false