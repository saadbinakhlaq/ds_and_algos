=begin
Write a function, breadth_first_values, that takes in the root of a binary tree. 
The function should return a list containing all values of the tree in breadth-first order.
=end

class Node
  attr_accessor :left, :right, :val
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def breadth_first(root)
  return [] if root.nil?
  
  queue = [root]
  res = []

  while queue.size > 0
    node = queue.shift
    res << node.val
    queue << node.left if !node.left.nil?
    queue << node.right if !node.right.nil?
  end

  res
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

puts breadth_first(a)