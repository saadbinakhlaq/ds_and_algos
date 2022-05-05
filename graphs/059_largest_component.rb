=begin
Write a function, largest_component, that takes in the adjacency list of an undirected graph.
The function should return the size of the largest connected component in the graph.
     5
     | \
     |  \
 1-- 0 -- 8

 4 -- 2
 \   /
  \ /
   3
=end

graph = {
  0 => [8, 1, 5],
  1 => [0],
  5 => [0, 8],
  8 => [0, 5],
  2 => [3, 4],
  3 => [2, 4],
  4 => [3, 2]
}

def explore_size(graph, node, visited)
  return 0 if visited.include?(node)
  visited << node
  size = 1

  graph[node].each do |neighbor|
    size += explore_size(graph, neighbor, visited)
  end

  size
end

def largest_component(graph)
  largest = 0
  visited = Set.new
  graph.keys.each do |node|
    size = explore_size(graph, node, visited)
    largest = [size, largest].max
  end
  largest 
end