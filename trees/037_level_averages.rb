=begin
Write a function, level_averages, that takes in the root of a binary tree that contains number values.
The function should return a list containing the average value of each level.
=end
class Node
  attr_accessor :left, :right, :val
  def initialize(val)
    @val = val
    @left = nil
    @right = nil
  end
end

def level_averages(root)
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

  levels.map do |each_level|
    each_level.sum.to_f/each_level.size
  end
end

a = Node.new(3)
b = Node.new(11)
c = Node.new(4)
d = Node.new(4)
e = Node.new(-2)
f = Node.new(1)

a.left = b
a.right = c
b.left = d
b.right = e
c.right = f

#       3
#    /    \
#   11     4
#  / \      \
# 4   -2     1 -> [ 3, 7.5, 1 ]

p level_averages(a)