=begin
Write a function, bottom_right_value, that takes in the root of a binary tree.
The function should return the right-most value in the bottom-most level of the tree.

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

def bottom_right_value(root)
  return nil if root.nil?

  if root.right.nil? && root.left.nil?
    return root.val
  end

  queue = [root]

  while queue.size > 0
    node = queue.shift

    queue.append(node.left) if !node.left.nil?
      
    queue.append(node.right) if !node.right.nil?

    return node.val if queue.size == 0
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
# 4   -2     1 -> 1

puts(bottom_right_value(a))