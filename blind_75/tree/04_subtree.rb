=begin
Given the roots of two binary trees root and subRoot, return true if there is a subtree of root with the same structure and node values of subRoot and false otherwise.

A subtree of a binary tree tree is a tree that consists of a node in tree and all of this node's descendants. The tree tree could also be considered as a subtree of itself.
=end

def is_same_tree(root_1, root_2)
  return true if root_1.nil? && root_2.nil?
  
  if !root_1.nil? && !root_2.nil?
    return root_1.val == root_2.val && is_same_tree(root_1.left, root_2.left) && is_same_tree(root_1.right, root_2.right)
  end

  false
end

def is_subtree(root, sub_root)
  return true if root.nil? && sub_root.nil?

  return false if root.nil?

  return true if is_same_tree(root, sub_root) == true

  is_subtree(root.left, sub_root) || is_subtree(root.right, sub_root)
end