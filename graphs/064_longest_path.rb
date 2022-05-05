=begin
Write a function, longest_path, that takes in an adjacency list for a directed acyclic graph.
The function should return the length of the longest path within the graph.
A path may start and end at any two nodes. The length of a path is considered the number of edges in the path, not the number of nodes.
=end

def longest_path(graph)
  distance = {}
  graph.keys.each do |node|
    if graph[node].size == 0
      distance[node] = 0
    end
  end

  graph.keys.each do |node|
    traverse_distance(graph, node, distance)
  end

  return distance.values.max
end

def traverse_distance(graph, node, distance)
  return distance[node] if distance.keys.include?(node)

  max_length = 0

  graph[node]&.each do |neighbor|
    attempt = traverse_distance(graph, neighbor, distance)
    max_length = attempt if attempt > max_length
  end

  distance[node] = 1 + max_length
  distance[node]
end

graph = {
  'a' => ['c', 'b'],
  'b' => ['c'],
  'c' => [],
  'q' => ['r'],
  'r' => ['s', 'u', 't'],
  's' => ['t'],
  't' => ['u'],
  'u' => []
}

puts longest_path(graph)
