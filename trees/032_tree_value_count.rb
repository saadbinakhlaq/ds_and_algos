=begin  
Write a function, tree_value_count, that takes in the root of a binary tree and a target value.
The function should return the number of times that the target occurs in the tree.
  
=end

class Node
  attr_accessor :left, :right, :val
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

a = Node.new(12)
b = Node.new(6)
c = Node.new(6)
d = Node.new(4)
e = Node.new(6)
f = Node.new(12)

a.left = b
a.right = c
b.left = d
b.right = e
c.right = f

#      12
#    /   \
#   6     6
#  / \     \
# 4   6     12

def tree_value_count(root, target)
  count = 0
  return 0 if root.nil?

  count += 1 if root.val == target

  count + tree_value_count(root.left, target) + tree_value_count(root.right, target)
end

p tree_value_count(a, 6)