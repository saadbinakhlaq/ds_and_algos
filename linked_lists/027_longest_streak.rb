=begin
Write a function, longest_streak, that takes in the head of a linked list as an argument.
The function should return the length of the longest consecutive streak of the same value within the list.
=end

def longest_streak(head)
  return 0 if head.nil?

  current_val = head.val
  current = head
  max_count = 1
  current_count = 1
  current = current.next

  while !current.nil?
    if current.val = current_val
      current_count += 1
      max_count = [current_count, max_count].max
    else
      current_val = current.val
      current_count = 1
    end
    current = current.next
  end
  max_count
end