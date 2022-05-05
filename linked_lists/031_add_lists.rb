=begin
Write a function, add_lists, that takes in the head of two linked lists, each representing a number.
The nodes of the linked lists contain digits as values. The nodes in the input lists are reversed; this means that the least significant digit of the number is the head. The function should return the head of a new linked listed representing the sum of the input lists.
The output list should have its digits reversed as well.
=end

def add_lists(head_1, head_2)
  current_1 = head_1
  current_2 = head_2

  carry = 0
  value_1 = 0
  value_2 = 0
  final_list = Node.new(nil)
  current_3 = final_list

  while !current_1.nil? && !current_2.nil?
    value_1 = current_1.val if !current_1.nil?  
    value_2 = current_2.val if !current_2.nil?

    result = value_1 + value_2 + carry
    carry = 0
    if result >= 10
      carry = 1
      result = result % 10
    end

    current_3.next = Node.new(result)
    current_3 = current_3.next

    current_1 = current_1.next if !current_1.nil?
    current_2 = current_2.next if !current_2.nil?

    value_1 = 0
    value_2 = 0
  end

  current_3.next = Node.new(1) if carry == 1

  final_list.next
end