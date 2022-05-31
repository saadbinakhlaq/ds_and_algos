=begin
Write a function, middle_value, that takes in the head of a linked list as an argument.
The function should return the value of the middle node in the linked list.
If the linked list has an even number of nodes, then return the value of the second middle node.

You may assume that the input list is non-empty.
=end

class Node
  attr_accessor :next, :val
  def initialize(val)
    @val = val
    @next = nil
  end
end

def middle_value(head)
  if head.nil?
    return nil
  end

  current = head
  array = []

  while !current.nil?
    array << current.val
    current = current.next
  end

  array[(array.size/2).floor]
end

a = Node.new 'a'
b = Node.new 'b'
c = Node.new 'c'
d = Node.new 'b'
e = Node.new 'a'

a.next = b
b.next = c
c.next = d
d.next = e

p middle_value(a)