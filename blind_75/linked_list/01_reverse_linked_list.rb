=begin
Given the head of a singly linked list, reverse the list, and return the reversed list.

Input: head = [1,2,3,4,5]
Output: [5,4,3,2,1]
=end

class ListNode
  attr_accessor :val, :next
  def initialize(val = 0, _next = nil)
    @val = val
    @next = _next
  end
end

def reverse_list(head)
  current = head
  prev = nil
  
  while !current.nil?
    _next = current.next
    current.next = prev
    prev = current
    current = _next
  end
  prev
end