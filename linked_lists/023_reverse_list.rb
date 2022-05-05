=begin
Write a function, reverse_list, that takes in the head of a linked list as an argument.
The function should reverse the order of the nodes in the linked list in-place and return the new head of the reversed linked list.
=end

def reverse_list(head)
  prev = nil
  current = head

  while !current.nil?
    _next = current.next
    current.next = prev
    prev = current
    current = _next 
  end

  prev
end