class TrieNode
  attr_accessor :children, :end_of_word
  def initialize
    @children = {}
    @end_of_word = false
  end
end

class Trie
  attr_reader :root

  def initialize
    @root = TrieNode.new
  end

  def insert(word)
    current = root

    word.chars.each do |char|
      if current.children[char].nil?
        current.children[char] = TrieNode.new
      end
      current = current.children[char]
    end
    current.end_of_word = true
  end

  def search(word)
    current = root

    word.chars.each do |char|
      if current.children[char].nil?
        return false
      else
        current = current.children[char]
      end
    end

    current.end_of_word
  end
end

trie = Trie.new
trie.insert("apple")
p trie.search("apple")
p trie.search("app")
p trie.search("source")
