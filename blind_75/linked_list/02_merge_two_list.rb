=begin
You are given the heads of two sorted linked lists list1 and list2.

Merge the two lists in a one sorted list. The list should be made by splicing together the nodes of the first two lists.

Return the head of the merged linked list.
=end

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
      @val = val
      @next = _next
  end
end

def merge_two_lists(list1, list2)
  dummy_head = ListNode.new
  current_1 = list1
  current_2 = list2
  tail = dummy_head
  
  while !current_1.nil? && !current_2.nil?
    if current_1.val > current_2.val
      tail.next = current_2
      current_2 = current_2.next
    else
      tail.next = current_1
      current_1 = current_1.next
    end
    tail = tail.next
  end

  tail.next = current_1 if !current_1.nil? 
  tail.next = current_2 if !current_2.nil?

  dummy_head.next
end