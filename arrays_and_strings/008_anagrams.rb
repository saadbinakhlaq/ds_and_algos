=begin
Write a function, anagrams, that takes in two strings as arguments. The function should return a boolean indicating whether or not the strings are anagrams. Anagrams are strings that contain the same characters, but in any order.
=end

def anagrams(string_1, string_2)
  char_count(string_1) == char_count(string_2)
end

def char_count(string)
  char_hash = Hash.new do |h, k|
    h[k] = 0
  end

  string.each_char do |char|
    char_hash[char] += 1
  end

  char_hash
end

puts anagrams('restful', 'fluster')
puts anagrams('cats', 'tocs')
puts anagrams('monkeyswrite', 'newyorktimes')