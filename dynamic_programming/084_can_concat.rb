=begin
Write a function, can_concat, that takes in a string and a list of words as arguments.
The function should return boolean indicating whether or not it is possible to concatenate words of the list together to form the string.

You may reuse words of the list as many times as needed.
=end

def can_concat(s, words)
  _can_concat(s, words, {})
end

def _can_concat(s, words, memo)
  return memo[s] if !memo[s].nil?
  return true if s == ""

  words.each do |word|
    if s.start_with?(word)
      suffix = s[word.size..]
      if _can_concat(suffix, words, memo) == true
        memo[s] = true
        return true
      end
    end
  end

  memo[s] = false
  false
end

p can_concat("oneisnone", ["one", "none", "is"]) #  -> True
p can_concat("oneisnone", ["on", "e", "is"]) #  -> False
p can_concat("foodisgood", ["is", "g", "ood", "f"]) #  -> True
p can_concat("santahat", ["santah", "san", "hat", "tahat"]) #  -> True
p can_concat("rrrrrrrrrrrrrrrrrrrrrrrrrrx", ["r", "rr", "rrr", "rrrr", "rrrrr", "rrrrrr"]) #  -> False