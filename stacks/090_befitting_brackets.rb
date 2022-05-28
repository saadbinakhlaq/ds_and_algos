=begin
Write a function, befitting_brackets, that takes in a string as an argument. The function should return a boolean indicating whether or not the string contains correctly matched brackets.

You may assume the string contains only characters: ( ) [ ] { }
=end

def befitting_brackets(string)
  open_brackets = "({["
  closed_brackets = ")}]"
  brackets = {
    "(" => ")",
    "{" => "}",
    "[" => "]"
  }

  stack = []

  string.each_char do |char|
    if open_brackets.include?(char)
      stack << char
    else
      if stack.size > 0 && brackets[stack.last] == char
        stack.pop
      else
        return false
      end
    end
  end

  stack.size == 0
end

puts befitting_brackets('(){}[](())') == true
puts befitting_brackets('({[]})') == true
puts befitting_brackets('[][}') == false