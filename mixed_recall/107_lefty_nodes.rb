=begin
Write a function, lefty_nodes, that takes in the root of a binary tree. 
The function should return a list containing the left-most value on every level of the tree. 
The list must be ordered in a top-down fashion where the root is the first item.
=end

class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def lefty_nodes(root)
  array_of_left_nodes = []

  levels = []
  queue = [[root, 0]]

  while queue.size != 0
    current, current_level = queue.shift
    if current_level == levels.size
      levels[current_level] = [current.val]
      array_of_left_nodes << current.val
    else
      levels[current_level] << current.val
    end
    queue << [current.left, current_level + 1] if !current.left.nil?
    queue << [current.right, current_level + 1] if !current.right.nil?
  end

  array_of_left_nodes
end

a = Node.new('a')
b = Node.new('b')
c = Node.new('c')
d = Node.new('d')
e = Node.new('e')
f = Node.new('f')
g = Node.new('g')
h = Node.new('h')

a.left = b
a.right = c
b.left = d
b.right = e
c.right = f
e.left = g
e.right = h

p lefty_nodes(a) 