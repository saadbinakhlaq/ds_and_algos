=begin
Given the roots of two binary trees p and q, write a function to check if they are the same or not.

Two binary trees are considered the same if they are structurally identical, and the nodes have the same value.
=end

class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
      @val = val
      @left = left
      @right = right
  end
end

def is_same_tree(root_1, root_2)
  return true if root_1.nil? && root_2.nil?

  if !root_1.nil? && !root_2.nil?
    return root_1.val == root_2.val && (is_same_tree(root.left)) && (is_same_tree(root.right))
  end
  
  return false
end