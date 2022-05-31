=begin
Write a function, lowest_common_ancestor, that takes in the root of a binary tree and two values. The function should return the value of the lowest common ancestor of the two values in the tree.

You may assume that the tree values are unique and the tree is non-empty.

Note that a node may be considered an ancestor of itself.

#      a
#    /    \
#   b      c
#  / \      \
# d   e      f
#    / \
#    g  h

lowest_common_ancestor(a, 'd', 'h') #=> b
=end

require 'set'

class Node
  attr_accessor :val, :left, :right
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def find_path(root, val)
  return nil if root.nil?
  return [root.val] if root.val == val

  left_path = find_path(root.left, val)
  return left_path << root.val if !left_path.nil?

  right_path = find_path(root.right, val)
  return right_path << root.val if !right_path.nil?

  nil
end

def lowest_common_ancestor(root, val_1, val_2)
  path_1 = find_path(root, val_1)
  path_2 = find_path(root, val_2)

  set_2 = Set.new(path_2)

  path_1.each do |p1|
    return p1 if set_2.include?(p1)
  end
end

a = Node.new('a')
b = Node.new('b')
c = Node.new('c')
d = Node.new('d')
e = Node.new('e')
f = Node.new('f')
g = Node.new('g')
h = Node.new('h')

a.left = b
a.right = c
b.left = d
b.right = e
c.right = f
e.left = g
e.right = h

p lowest_common_ancestor(a, 'd', 'h') # b
p lowest_common_ancestor(a, 'd', 'g') # b
p lowest_common_ancestor(a, 'g', 'c') # a
p lowest_common_ancestor(a, 'b', 'g') # b
p lowest_common_ancestor(a, 'f', 'c') # c