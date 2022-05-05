=begin
Write a function, zipper_lists, that takes in the head of two linked lists as arguments. The function should zipper the two lists together into single linked list by alternating nodes. If one of the linked lists is longer than the other, the resulting list should terminate with the remaining nodes. The function should return the head of the zippered linked list.

Do this in-place, by mutating the original Nodes.

You may assume that both input lists are non-empty.
=end

def zipper_lists(head_1, head_2)
  tail = head_1
  current_1 = head_1.next
  current_2 = head_2

  count = 0

  while !current_1.nil? && !current_2.nil?
    if count % 2 == 0
      tail.next = current_2
      current_2 = current_2.next
    else
      tail.next = current_1
      current_1 = current_1.next
    end

    tail = tail.next
    count += 1
  end

  tail.next = current_1 if !current_1.nil?
  tail.next = current_2 if !current_2.nil?

  return head_1
end