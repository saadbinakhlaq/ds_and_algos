=begin
Write a function, rare_routing, that takes in a number of cities (n) and a list of tuples where each tuple represents a direct road that connects a pair of cities. The function should return a boolean indicating whether or not there exists a unique route for every pair of cities. A route is a sequence of roads that does not visit a city more than once.

Cities will be numbered 0 to n - 1.

You can assume that all roads are two-way roads. This means if there is a road between A and B, then you can use that road to go from A to B or go from B to A.

Note: 
     1 ------ 2
     |        |
     |        |
     3 ------ 4

     to go to 4 there are 2 paths so this is false

     1 ----- 2
     |
     |
     3        4 ----- 5
     there is no way to go from 1 to 4 so this is false

     0
     |
     |
     1 ----- 2
     |       |
     |       |
     3       4

     this is true because to reach any city there is only 1 unique path

     so a valid case would be that there are no separated component and there is only 1 unique path to any city
     so that means the graph should be connected and has no cycle, which means if we start from any city then it 
     is possible to traverse the whole graph
     Since this is an undirected graph that means there will be connection from e.g. 1 to 2 and 2 to 1 so that could 
     lead to infinite loop so to handle this we need to make sure that we don't visit a node that we have previously visited
=end

require 'set'

def make_graph(number_of_cities, roads)
  graph = {}

  (0...number_of_cities).each do |city|
    graph[city] = []
  end

  roads.each do |road|
    city_source, city_dest = road
    graph[city_source] << city_dest
    graph[city_dest] << city_source
  end

  graph
end

def validate(graph, node, visited, last_node)
  return false if visited.include?(node)
  visited.add(node)

  graph[node].each do |neighbor|
    if neighbor != last_node && validate(graph, neighbor, visited, node) == false
      return false
    end
  end

  true
end

def rare_routing(number_of_cities, roads)
  graph = make_graph(number_of_cities, roads)
  visited = Set.new
  last_node = None
  first_city = 0
  valid = validate(graph, first_city, visited, last_node)
  return valid and visited.size == number_of_cities
end

rare_routing(4, [
  [0, 1],
  [0, 2],
  [0, 3]
]) # -> True

rare_routing(4, [
  [0, 1],
  [0, 2],
  [0, 3],
  [3, 2]
]) # -> False