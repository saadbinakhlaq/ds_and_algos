=begin
Write a function, all_tree_paths, that takes in the root of a binary tree.
The function should return a 2-Dimensional list where each subarray represents a root-to-leaf path in the tree.
The order within an individual path must start at the root and end at the leaf, but the relative order among paths in the outer list does not matter.
You may assume that the input tree is non-empty.  
=end

#      a
#    /   \
#   b     c
#  / \     \
# d   e     f
# ->
# [ 
#   [ 'a', 'b', 'd' ], 
#   [ 'a', 'b', 'e' ], 
#   [ 'a', 'c', 'f' ] 
# ]

class Node
  attr_accessor :left, :right, :val
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def all_tree_paths(root)
  return [] if root.nil?
  return [root.val] if root.left.nil? && root.right.nil?

  paths = []
  left_sub_path = all_tree_paths(root.left)
  left_sub_path.each do |path|
    paths.append([root.val, *path])
  end

  right_sub_path = all_tree_paths(root.right)
  right_sub_path.each do |path|
    paths.append([root.val, *path])
  end

  return paths
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


p(all_tree_paths(a))