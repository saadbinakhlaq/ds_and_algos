=begin
Write a function, sum_list, that takes in the head of a linked list containing numbers as an argument.
The function should return the total sum of all values in the linked list.
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

def sum_list(head)
  current = head
  sum = 0

  while !current.nil?
    sum += current.val
    current = current.next
  end
  sum
end

puts sum_list(a)