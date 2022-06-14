=begin
Given the root of a binary tree, return its maximum depth.

A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
=end

def max_depth(root)
  return 0 if root.nil?
  return 1 if root.left.nil? && root.right.nil?

  left_depth = max_depth(root.left)
  right_depth = max_depth(root.right)

  1 + [left_depth, right_depth].max
end