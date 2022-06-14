=begin
Write a function, has_cycle, that takes in an object representing the adjacency list of a directed graph.
The function should return a boolean indicating whether or not the graph contains a cycle.
=end

def has_cycle(graph)
  visiting = Set.new
  visited = Set.new

  graph.keys.each do |node|
    if cycle_detect(graph, node, visiting, visited) == true
      return true
    end
  end

  false
end

def cycle_detect(graph, node, visiting, visited)
  if visiting.include?(node)
    return true
  end
  if visited.include?(node)
    return false
  end

  visiting << node
  graph[node].each do |neighbor|
    if cycle_detect(graph, node, visiting, visited) == true
      return true
    end
  end

  visiting.delete(node)
  visited.add(node)
  return false
end

has_cycle({
  "a" => ["b"],
  "b" => ["c"],
  "c" => ["a"],
}) # true

