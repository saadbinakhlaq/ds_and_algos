=begin
Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.

Input: s = "()"
Output: true


Input: s = "()[]{}"
Output: true
=end

def is_valid(string)
  string_a = string.chars.to_a
  stack = []
  
  open_brackets = "({["
  hash = {
      "(" => ")",
      "{" => "}",
      "[" => "]"
  }
  
  string_a.each do |char|
      if open_brackets.include?(char)
          stack.append(char)
      else
          popped_char = stack.pop
          if char != hash[popped_char]
              return false
          end
      end
  end
  stack.empty?
end

