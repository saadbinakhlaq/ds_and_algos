=begin
Write a function, max_path_sum, that takes in the root of a binary tree that contains number values.
The function should return the maximum sum of any root to leaf path within the tree.

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

def max_path_sum(root)
  return 0 if root.nil?

  max_sum = root.val
  return max_sum if root.left.nil? && root.right.nil?

  max_sum + [max_path_sum(root.left), max_path_sum(root.right)].max
end

p max_path_sum(a)