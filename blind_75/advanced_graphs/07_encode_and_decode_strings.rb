def create_new_string(str)
  "#{str.size}##{str}"
end

=begin
https://leetcode.com/problems/encode-and-decode-strings/
=end

def encode(strs)
  final_string = ""
  strs.each do |str|
    final_string += create_new_string(str)
  end
  final_string
end

# Decodes a single string to a list of strings.
#
# @param {string} s
# @return {string[]}
def decode(str)
  res = []
  index = 0
  while index < str.size
    j = index
    while str[j] != "#"
      j += 1
    end

    length = Integer(str[index...j])
    res << str[(j + 1)...(j + 1 + length)]
    index = j + 1 + length
  end

  res
end