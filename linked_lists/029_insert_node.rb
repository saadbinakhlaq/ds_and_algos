=begin
Write a function, insert_node, that takes in the head of a linked list, a value, and an index. The function should insert a new node with the value into the list at the specified index. Consider the head of the linked list as index 0. The function should return the head of the resulting linked list.

Do this in-place.

You may assume that the input list is non-empty and the index is not greater than the length of the input list.
=end

class Node
  def initialize(val)
    @val = val
    @next = nil
  end
end

def insert_node(head, value, index)
  new_node = Node.new(val)
  if index == 0
    new_node.next = head
    head = new_node
    return head
  end

  current = head
  count = 0
  prev = nil

  while !current.nil?
    if count == index
      prev.next = new_node
      new_node.next = current
    end
    prev = current
    current = current.next
    count += 1
  end

  prev.next = new_node if count == index

  head
end