=begin
Write a function, how_high, that takes in the root of a binary tree.
The function should return a number representing the height of the tree.
The height of a binary tree is defined as the maximal number of edges from the root node to any leaf node.
If the tree is empty, return -1. 

=end

class Node
  attr_accessor :left, :right, :val
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def how_high(root)
  return -1 if root.nil?

  return 0 if root.left.nil? && root.right.nil?

  left_height = how_high(root.left)
  right_height = how_high(root.right)

  1 + [left_height, right_height].max
end

a = Node.new('a')
b = Node.new('b')
c = Node.new('c')
d = Node.new('d')
e = Node.new('e')
f = Node.new('f')

=begin
          a
        /   \
       b    c
     /  \    \
    d   e     f
=end

a.left = b
a.right = c
b.left = d
b.right = e
c.right = f

puts how_high(a)