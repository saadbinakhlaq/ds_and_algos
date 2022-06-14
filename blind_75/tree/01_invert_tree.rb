=begin
Given the root of a binary tree, invert the tree, and return its root.
=end

def invert_tree(root)
  return root if root.nil? || (root.left.nil? && root.right.nil?)

  root.left, root.right = root.right, root.left
  invert_tree(root.left)
  invert_tree(root.right)
  root
end