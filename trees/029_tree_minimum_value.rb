=begin
Write a function, tree_min_value, that takes in the root of a binary tree that contains number values.
The function should return the minimum value within the tree.

You may assume that the input tree is non-empty.
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

def tree_min_value(root)
  min_value = root.val
  if root.left.nil? && root.right.nil?
    return min_value
  else
    queue = [root]
    while queue.size > 0
      node = queue.shift
      queue << node.left if !node.left.nil?
      queue << node.right if !node.left.nil?
      min_value = node.val if node.val < min_value
    end
  end
  min_value
end

p tree_min_value(a)