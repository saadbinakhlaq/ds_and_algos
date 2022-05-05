=begin
Write a function, merge_lists, that takes in the head of two sorted linked lists as arguments. The function should merge the two lists together into single sorted linked list. The function should return the head of the merged linked list.

Do this in-place, by mutating the original Nodes.

You may assume that both input lists are non-empty and contain increasing sorted numbers.
=end

def merge_lists(head_1, head_2)
  tail = nil
  current_1 = head_1
  current_2 = head_2
  head_merged = nil

  if head_1.val > head_2.val
    tail = head_2
    current_2 = current_2.next
    head_merged = tail
  else
    tail = head_1
    current_1 = current_1.next
    head_merged = tail
  end

  while !current_1.nil? && !current_2.nil?
    if current_1.val < current_2.val
      tail.next = current_1
      current_1 = current_1.next
      tail = tail.next
    else
      tail.next = current_2
      current_2 = current_2.next
      tail = tail.next
    end
  end

  tail.next = current_1 if !current_1.nil?
  tail.next = current_2 if !current_2.nil?

  head_merged
end