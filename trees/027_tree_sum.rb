=begin
Write a function, tree_sum, that takes in the root of a binary tree that contains number values. 
The function should return the total sum of all values in the tree.
  
=end

class Node
  attr_accessor :left, :right, :val
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

a = Node.new(3)
b = Node.new(11)
c = Node.new(4)
d = Node.new(4)
e = Node.new(-2)
f = Node.new(1)

a.left = b
a.right = c
b.left = d
b.right = e
c.right = f

#       3
#    /    \
#   11     4
#  / \      \
# 4   -2     1

def tree_sum(root)
  return 0 if root.nil?

  left_sum = tree_sum(root.left)
  right_sum = tree_sum(root.right)

  root.val + left_sum + right_sum
end

p tree_sum(a)