=begin
Write a function, has_path, that takes in a dictionary representing the adjacency list of a directed acyclic graph and two nodes (src, dst). 
The function should return a boolean indicating whether or not there exists a directed path between the source and destination nodes.
=end

graph = {
  'f' => ['g', 'i'],
  'g' => ['h'],
  'h' => [],
  'i' => ['g', 'k'],
  'j' => ['i'],
  'k' => []
}

def has_path_rec(graph, src, dst)
  return true if src == dst

  graph[src].each do |neighbor|
    return true if has_path_rec(graph, neighbor, dst) == true
  end

  return false
end

def has_path_stack(graph, src, dst)
  return true if src == dst

  stack = [src]
  while stack.length > 0
    current = stack.pop
    return true if current == dst
    graph[current].each do |neighbor|
      stack.push(neighbor)
    end
  end
  return false
end

def has_path_queue(graph, src, dst)
  return true if src == dst

  queue = [src]

  while queue.length > 0
    current = queue.shift
    return true if neighbor == dst

    graph[current].each do |neighbor|
      queue.push(neighbor)
    end
  end
  return false
end