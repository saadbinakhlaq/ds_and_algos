=begin
Write a function, tree_levels, that takes in the root of a binary tree.
The function should return a 2-Dimensional list where each sublist represents a level of the tree.
=end

#      a
#    /   \
#   b     c
#  / \     \
# d   e     f
# ->
# [
#   ['a'],
#   ['b', 'c'],
#   ['d', 'e', 'f']
# ]
class Node
  attr_accessor :left, :right, :val
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def tree_levels(root)
  return [] if root.nil?
  return [root.val] if root.left.nil? && root.right.nil?

  queue = [[root, 0]]
  levels = []

  while queue.size > 0
    node, level = queue.shift

    if queue.size == level
      levels.append([node.val])
    else
      levels[level].append(node.val)
    end
    queue.append([node.left, level + 1]) if !node.left.nil?
    queue.append([node.right, level + 1]) if !node.right.nil?
  end

  levels
end

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

p tree_levels(a)