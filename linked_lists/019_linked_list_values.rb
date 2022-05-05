=begin
Write a function, linked_list_values, that takes in the head of a linked list as an argument. 
The function should return a list containing all values of the nodes in the linked list.
=end

class Node
  attr_accessor :next, :val
  def initialize(val)
    @val = val
    @next = nil
  end
end

def linked_list_values(head)
  node = head
  values = []

  while !node.nil?
    values << node.val
    node = node.next
  end

  values
end

a = Node.new('a')
b = Node.new('b')
c = Node.new('c')
d = Node.new('d')

a.next = b
b.next = c
c.next = d

puts linked_list_values(a)