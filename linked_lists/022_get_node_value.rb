=begin
Write a function, get_node_value, that takes in the head of a linked list and an index. The function should return the value of the linked list at the specified index.

If there is no node at the given index, then return None.
=end

def get_node_value(head, index)
  current = head
  count = 0

  while !current.nil?
    return current.val if count == index
    current = current.next
    count += 1
  end
  return nil
end