=begin
Write a function, linked_list_find, that takes in the head of a linked list and a target value.
The function should return a boolean indicating whether or not the linked list contains the target.
=end

class Node
  attr_accessor :next, :val
  def initialize(val)
    @val = val
    @next = nil
  end
end

a = Node.new(2)
b = Node.new(8)
c = Node.new(3)
d = Node.new(-1)
e = Node.new(7)
a.next = b
b.next = c
c.next = d
d.next = e

def linked_list_find(head, target)
  current = head

  while !current.nil?
    return true if current.val == target
    current = current.next
  end

  return false
end

puts linked_list_find(a, '7')
puts linked_list_find(a, 7)