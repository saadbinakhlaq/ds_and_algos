=begin
Write a function, path_finder, that takes in the root of a binary tree and a target value.
The function should return an array representing a path to the target value. If the target value is not found in the tree, then return None.

You may assume that the tree contains unique values.
=end

class Node
  attr_accessor :left, :right, :val
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
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

=begin
          a
        /   \
       b    c
     /  \    \
    d   e     f
=end

def path_finder(root, target)
  return nil if root.nil?
  return [root.val] if root.val == target
    
  left_path = path_finder(root.left, target)
  return [root.val, *left_path] if !left_path.nil?

  right_path = path_finder(root.right, target)
  return [root.val, *right_path] if !right_path.nil?
  return nil
end

p path_finder(a, 'e')