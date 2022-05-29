=begin
Write a function, nesting_score, that takes in a string of brackets as an argument. The function should return the score of the string according to the following rules:

[] is worth 1 point
XY is worth m + n points where X, Y are substrings of well-formed brackets and m, n are their respective scores
[S] is worth 2 * k points where S is a substring of well-formed brackets and k is the score of that substring
You may assume that the input only contains well-formed square brackets.
=end

def nesting_score(string)
  stack = [0]
  string.each_char do |c|
    if c == "["
      stack.append(0)
    elsif c == ']'
      last_value = stack.pop
      if last_value == 0
        stack[-1] += 1
      else
        stack[-1] += last_value * 2
      end
    end
  end
  stack[-1]
end

puts nesting_score("[]") == 1
puts nesting_score("[][][]") == 3
puts nesting_score("[[]]") == 2
puts nesting_score("[[][]]") == 4
puts nesting_score("[[][][]]")  == 6
puts nesting_score("[[][]][]") == 5
puts nesting_score("[[[[[[[][]]]]]]][]") == 129
