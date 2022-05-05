=begin
Write a function, compress, that takes in a string as an argument. The function should return a compressed version of the string where consecutive occurrences of the same characters are compressed into the number of occurrences followed by the character. Single character occurrences should not be changed.
'aaa' compresses to '3a'
'cc' compresses to '2c'
't' should remain as 't'
You can assume that the input only contains alphabetic characters.
=end

def compress(string)
  string += "!"
  result = []
  i = 0
  j = 0

  while j < string.size
    if string[i] == string[j]
      j += 1
    else
      count = j - i
      if count == 1
        result << string[i]
      else
        result << count.to_s + string[i]
      end
      i = j
    end
  end
  result.join
end

puts compress "compress"