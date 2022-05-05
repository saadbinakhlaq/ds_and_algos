=begin
Write a function, depth_first_values, that takes in the root of a binary tree.
The function should return a list containing all values of the tree in depth-first order.
=end

class Node
  attr_accessor :left, :right, :val
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def depth_first(root, result = [])
  return [] if root.nil?

  left_values = depth_first(root.left)
  right_values = depth_first(root.right)
  [root.val] + left_values + right_values
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

puts depth_first(a)