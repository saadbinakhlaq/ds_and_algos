=begin
Write a function, create_linked_list, that takes in a list of values as an argument. The function should create a linked list containing each item of the list as the values of the nodes.
The function should return the head of the linked list.
=end

def create_linked_list(values)
  return nil if values.size == 0

  new_node = Node.new(values.first)
  head = new_node
  current = new_node

  values.each_with_index do |value, index|
    next if index == 0
    node = Node.new(value)
    current.next = node
    current = current.next
  end

  head
end