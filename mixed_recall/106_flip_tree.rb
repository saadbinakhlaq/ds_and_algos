=begin
Write a function, flip_tree, that takes in the root of a binary tree. 
The function should flip the binary tree, turning left subtrees into right subtrees and vice-versa. 
This flipping should occur in-place by modifying the original tree. The function should return the root of the tree.
          a
        /  \
      b     c
=end

class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

a = Node.new('a')
b = Node.new('b')
c = Node.new('c')

def flip_tree(root)
  return nil if root.nil?

  root.left, root.right = root.right, root.left
  flip_tree(root.left)
  flip_tree(root.right)

  root
end

# a.right = b
# a.left = c