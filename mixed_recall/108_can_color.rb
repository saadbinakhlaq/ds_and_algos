=begin
Write a function, can_color, that takes in a dictionary representing the adjacency list of an undirected graph.
The function should return a boolean indicating whether or not it is possible to color nodes of the graph using two colors in such a way that adjacent nodes are always different colors.
=end

def validate(graph, node, current_color, color_hash)
  if color_hash[node].nil?
    color_hash[node] = current_color
    graph[node].each do |neighbor|
      if validate(graph, neighbor, !current_color, color_hash) == false
        return false
      end
    end
    return true
  else
    return color_hash[node] == current_color
  end
end

def can_color(graph)
  color_hash = {}
  red = true
  blue = false
  current_color = red

  graph.keys.each do |node|
    if !color_hash.keys.include?(node) && validate(graph, node, current_color, color_hash) == false
      return false
    end
  end

  true
end

p can_color({
  "x" => ["y"],
  "y" => ["x","z"],
  "z" => ["y"]
}) # true

p can_color({
  "a" => ["b", "c", "d"],
  "b" => ["a"],
  "c" => ["a"],
  "d" => ["a"],
}) # -> True

p can_color({
  "a" => ["b", "c", "d"],
  "b" => ["a"],
  "c" => ["a", "d"],
  "d" => ["a", "c"],
}) # -> False