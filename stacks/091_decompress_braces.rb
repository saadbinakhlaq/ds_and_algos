=begin
Write a function, decompress_braces, that takes in a compressed string as an argument. The function should return the string decompressed.

The compression format of the input string is 'n{sub_string}', where the sub_string within braces should be repeated n times.

You may assume that every number n is guaranteed to be an integer between 1 through 9.

You may assume that the input is valid and the decompressed string will only contain alphabetic characters.
=end

def decompress_braces(string)
  numbers = "0123456789"
  stack = []

  string.each_char do |char|
    if numbers.include?(char)
      stack << char.to_i
    else
      if char == "}" # do nothing when char == "{" and if char is a alphabet then add it to the stack and if char is } then create a new segment
        # segment logic
        # create a segment by popping and adding the popped number in front of segment
        # then popping the number and multiple the segment with the popped number
        # then putting everything in the stack
        segment = ""
        while stack.last.is_a?(String)
          popped = stack.pop
          segment = popped + segment
        end
        number = stack.pop
        stack << segment * number
      elsif char != "{"
        stack << char
      end
    end
  end
  stack.join
end

puts decompress_braces("2{q}3{tu}v") == 'qqtututuv'
puts decompress_braces("ch3{ao}") == 'chaoaoao'
puts decompress_braces("2{y3{o}}s") == 'yoooyooos'
puts decompress_braces("z3{a2{xy}b}") == 'zaxyxybaxyxybaxyxyb'
puts decompress_braces("2{3{r4{e}r}io}") == 'reeeerreeeerreeeerioreeeerreeeerreeeerio'