=begin
Write a function, max_palin_subsequence, that takes in a string as an argument.
The function should return the length of the longest subsequence of the string that is also a palindrome.

A subsequence of a string can be created by deleting any characters of the string, while maintaining the relative order of characters.
=end

def max_palin_subsequence(string)
  _max_palin_subsequence(string, 0, string.size - 1, {})
end

def _max_palin_subsequence(string, st, last, memo)
  return memo[string[st..last]] if !memo[string[st..last]].nil?
  return 0 if st > last
  return 0 if st > string.size
  return 0 if last < 0
  return 0 if string[st..last].size == 0
  return 1 if string[st..last].size == 1

  length = 0
  if string[st] == string[last]
    length = 2 + _max_palin_subsequence(string, st + 1, last - 1, memo)
  else
    length = [_max_palin_subsequence(string, st + 1, last, memo), _max_palin_subsequence(string, st, last - 1, memo)].max
  end

  memo[string[st..last]] = length
  length
end

p max_palin_subsequence("luwxult")
p max_palin_subsequence("xyzaxxzy")
p max_palin_subsequence("qwueoiuahsdjnweuueueunasdnmnqweuzqwerty")
p max_palin_subsequence("enamelpinportlandtildecoldpressedironyflannelsemioticsedisonbulbfashionaxe")