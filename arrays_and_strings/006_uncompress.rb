=begin
Write a function, uncompress, that takes in a string as an argument. The input string will be formatted into multiple groups according to the following pattern:
<number><char>

for example, '2c' or '3a'.

  The function should return an uncompressed version of the string where each 'char' of a group is repeated 'number' times consecutively. You may assume that the input string is well-formed according to the previously mentioned pattern.
=end
0
def uncompress(string)
  numbers = "0123456789"
  result = ""
  i = 0
  j = 0
  while j < string.size
    if numbers.include?(string[j])
      j += 1
    else
      number = string[i...j].to_i
      result += string[j] * number
      j += 1
      i = j
    end
  end
  result
end

puts uncompress("2c3a1t")