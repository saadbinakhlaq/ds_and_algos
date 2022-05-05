=begin
Write a function, undirected_path, that takes in a list of edges for an undirected graph and two nodes (node_A, node_B). 
The function should return a boolean indicating whether or not there exists a path between node_A and node_B.
=end

edges = [
  ['i', 'j'],
  ['k', 'i'],
  ['m', 'k'],
  ['k', 'l'],
  ['o', 'n'],
  # ['k', 'j']
]

def convert_to_adjacency_list(edges)
  adjacency = Hash.new do |h, k|
    h[k] = []
  end
  edges.each do |edge|
    adjacency[edge[0]] << edge[1] 
    adjacency[edge[1]] << edge[0] 
  end
  adjacency
end

def has_path(graph, src, dst, visited)
  return true if src == dst
  return false if visited.include?(src)
  visited << src

  graph[src].each do |neighbor|
    return true if has_path(graph, neighbor, dst, visited) == true
  end

  false
end

def undirected_graph(edges, node_a, node_b)
  graph = convert_to_adjacency_list(edges)
  return has_path(graph, node_a, node_b, Set.new)
end
