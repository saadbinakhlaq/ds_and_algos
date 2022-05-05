=begin
Write a function, leaf_list, that takes in the root of a binary tree and returns
a list containing the values of all leaf nodes in left-to-right order.
=end
class Node
  attr_accessor :left, :right, :val
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def leaf_list(root)
  return [] if root.nil?

  return [root.val] if root.left.nil? && root.right.nil?

  stack = [root]
  list_of_leaves = []

  while stack.size > 0
    node = stack.pop

    list_of_leaves.append(node.val) if node.left.nil? && node.right.nil?

    stack.append(node.right) if !node.right.nil?
    stack.append(node.left) if !node.left.nil?
  end

  list_of_leaves
end

#      a
#    /   \
#   b     c
#  / \     \
# d   e     f



a = Node.new('a')
b = Node.new('b')
c = Node.new('c')
d = Node.new('d')
e = Node.new('e')
f = Node.new('f')

a.left = b
a.right = c
b.left = d
b.right = e
c.right = f

p leaf_list(a)