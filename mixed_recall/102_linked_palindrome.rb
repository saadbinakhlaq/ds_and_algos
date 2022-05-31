=begin
Write a function, linked_palindrome, that takes in the head of a linked list as an argument.
The function should return a boolean indicating whether or not the linked list is a palindrome.
A palindrome is a sequence that is the same both forwards and backwards.
=end

class Node
  attr_accessor :next, :val
  def initialize(val)
    @val = val
    @next = nil
  end
end

def linked_palindrome(head)
  if head.nil? || head.next.nil?
    return true
  end

  current = head
  array = []

  while !current.nil?
    array << current.val
    current = current.next
  end

  array == array.reverse
end

a = Node.new 'a'
b = Node.new 'b'
c = Node.new 'c'
d = Node.new 'c'
e = Node.new 'b'
f = Node.new 'a'

a.next = b
b.next = c
c.next = d
d.next = e
e.next = f

p linked_palindrome(a)