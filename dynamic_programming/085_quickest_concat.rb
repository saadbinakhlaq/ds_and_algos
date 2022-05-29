=begin
Write a function, quickest_concat, that takes in a string and a list of words as arguments.
The function should return the minimum number of words needed to build the string by concatenating words of the list.

You may use words of the list as many times as needed.
=end

def quickest_concat(s, words)
  length = _quickest_concat(s, words, {})

  if length == Float::INFINITY
    return -1
  else
    return length
  end
end

def _quickest_concat(s, words, memo)
  return memo[s] if !memo[s].nil?
  return 1 if words.include?(s)

  min_length = Float::INFINITY
  length = 0

  words.each do |word|
    if s.start_with?(word)
      suffix = s[word.size...]
      current_length = 1 + _quickest_concat(suffix, words, memo)
      min_length = [current_length, min_length].min

    end
  end

  memo[s] = min_length
  return min_length
end

p quickest_concat('caution', ['ca', 'ion', 'caut', 'ut']) # -> 2
p quickest_concat('caution', ['ion', 'caut', 'caution']) # -> 1
p quickest_concat('respondorreact', ['re', 'or', 'spond', 'act', 'respond']) # -> 4
p quickest_concat('simchacindy', ['sim', 'simcha', 'acindy', 'ch']) # -> 3
p quickest_concat('simchacindy', ['sim', 'simcha', 'acindy']) # -> -1
p quickest_concat('rongbetty', ['wrong', 'bet']) # -> -1
p quickest_concat('uuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu', ['u', 'uu', 'uuu', 'uuuu', 'uuuuu']) # -> 7