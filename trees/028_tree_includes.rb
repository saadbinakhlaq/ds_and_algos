=begin
  Write a function, tree_includes, that takes in the root of a binary tree and a target value.
  The function should return a boolean indicating whether or not the value is contained in the tree.
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

def tree_includes(root, target)
  return nil if root.nil?

  return true if root.val == target

  tree_includes(root.left, target) || tree_includes(root.right, target)
end

p tree_includes(a, 'a')