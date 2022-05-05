=begin
Write a function, is_univalue_list, that takes in the head of a linked list as an argument. The function should return a boolean indicating whether or not the linked list contains exactly one unique value.

You may assume that the input list is non-empty.
=end

def univalue_list(head)
  val = head.val

  current = head

  while !current.nil?
    return false if current.val != val
    current = current.next
  end

  true
end