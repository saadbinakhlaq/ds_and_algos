=begin
Write a function, substituting_synonyms, that takes in a sentence and a dictionary as arguments.
The dictionary contains words as keys whose values are arrays containing synonyms.
The function should return an array containing all possible sentences that can be formed by substituting words of the sentence with their synonyms.

You may return the possible sentences in any order, as long as you return all of them.
=end

def substitute_synonyms(sentence, synonyms)
  words = sentence.split(' ')
  return generate(words, synonyms)
end

def generate(words, synonyms)
  return [[]] if words.size == 0

  first_word = words.first
  remaining = words[1...]
  subarrays = generate(remaining, synonyms)

  if synonyms.keys.include?(first_word)
    result = []

    synonyms[first_word].each do |synonym|
      subarrays.each do |subarray|
        result << [synonym, *subarray].join(" ")
      end
    end
  else
    result = []

    subarrays.each do |subarray|
      result << [first_word, *subarray].join(" ")
    end
  end

  result
end