=begin
Write a function, linked_list_cycle, that takes in the head of a linked list as an argument.
The function should return a boolean indicating whether or not the linked list contains a cycle.
=end

require 'set'

class Node
  attr_accessor :next, :val
  def initialize(val)
    @val = val
    @next = nil
  end
end

def linked_list_cycle(head)
  return false if head.nil?

  visited = Set.new

  current = head
  while !current.nil?
    return true if visited.include?(current)
    visited << current
    current = current.next
  end

  false
end

a = Node.new 'a'
b = Node.new 'b'
c = Node.new 'c'
d = Node.new 'b'
e = Node.new 'a'

a.next = b
b.next = c
c.next = d
d.next = b

p linked_list_cycle(a)