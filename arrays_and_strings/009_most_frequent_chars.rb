=begin
Write a function, most_frequent_char, that takes in a string as an argument. The function should return the most frequent character of the string. If there are ties, return the character that appears earlier in the string.

You can assume that the input string is non-empty.
=end

def most_frequent_char(string)
  count = Hash.new do |h, k|
    h[k] = 0
  end

  string.each_char do |char|
    count[char] += 1
  end

  best = nil
  max_count = 0

  count.each do |k, v|
    if v > max_count
      max_count = v
      best = k.to_s
    end
  end

  best
end

puts most_frequent_char('bookeeper') == 'e'
puts most_frequent_char('david') == 'd'
