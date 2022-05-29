=begin
Write a function, overlap_subsequence, that takes in two strings as arguments.
The function should return the length of the longest overlapping subsequence.

A subsequence of a string can be created by deleting any characters of the string, while maintaining the relative order of characters.
=end

def overlap_subsequence(string_1, string_2)
  _overlap_subsequence(string_1, string_2, 0, 0, {})
end

def _overlap_subsequence(string_1, string_2, i, j, memo)
  key = [i, j]
  return memo[key] if !memo[key].nil?

  return 0 if i == string_1.size || j == string_2.size
  
  if string_1[i] == string_2[j]
    length = 1 + _overlap_subsequence(string_1, string_2, i + 1, j + 1, memo)
  else
    length = [_overlap_subsequence(string_1, string_2, i + 1, j, memo), _overlap_subsequence(string_1, string_2, i, j + 1, memo)].max
  end

  memo[key] = length
  length
end

p overlap_subsequence("dogs", "daogt")
p overlap_subsequence("kinfolklivemustache", "bespokekinfolksnackwave")
p overlap_subsequence(
  "mumblecorebeardleggingsauthenticunicorn",
  "succulentspughumblemeditationlocavore"
)