=begin
Write a function, remove_node, that takes in the head of a linked list and a target value as arguments. The function should delete the node containing the target value from the linked list and return the head of the resulting linked list. If the target appears multiple times in the linked list, only remove the first instance of the target in the list.

Do this in-place.

You may assume that the input list is non-empty.

You may assume that the input list contains the target.
=end

def remove_node(head, target_value)
  return head.next if head.val == target.val
  current = head
  prev = nil
  
  while !current.nil?
    if current.val == target
      prev.next = current.next
      break
    end
    prev = current
    current = current.next
  end

  head
end