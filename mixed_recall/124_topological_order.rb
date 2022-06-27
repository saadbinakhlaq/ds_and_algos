=begin
Write a function, topological_order, that takes in a dictionary representing the adjacency list for a directed-acyclic graph. The function should return a list containing the topological-order of the graph.

The topological ordering of a graph is a sequence where "parent nodes" appear before their "children" within the sequence.

from the DAG create a num_parent with nodes pointing to the number of parents
then loop over the num_parent and get node with 0 parent
then put this in ready list

and create an order list

then pop from ready list 
then visit node of the ready list and decrement the num_parent hash by 1

=end
require 'byebug'

def topological_order(graph)
  num_parents = {}
  byebug

  graph.keys.each do |node|
    num_parents[node] = 0
  end

  num_parents.keys.each do |node|
    graph[node].each do |key|
      if graph[key].include?(node)
        num_parent[node] += 1
      end
    end
  end

  ready = []
  num_parents.keys.each do |node|
    if num_parents[node] == 0
      ready << node
    end
  end

  order = []
  while ready.size > 0
    value = ready.pop
    order << value

    graph[value].each do |node|
      num_parents[node] -= 1

      if num_parents[node] == 0 && !ready.include?(node)
        ready << node
      end
    end
  end

  order
end

p topological_order({
  "a": ["f"],
  "b": ["d"],
  "c": ["a", "f"],
  "d": ["e"],
  "e": [],
  "f": ["b", "e"],
})