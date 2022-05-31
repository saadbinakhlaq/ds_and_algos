=begin
Write a function, tolerant_teams, that takes in a list of rivalries as an argument.
A rivalry is a pair of people who should not be placed on the same team.
The function should return a boolean indicating whether or not it is possible to separate people into two teams, without rivals being on the same team.
The two teams formed do not have to be the same size.

philip --- seb
raj ----- nader

philip ---    seb
  |          /
  |         /
  |       /
  |     /
  |   /
 raj  --- nader



 cindy --- anj
   |       |
 alex --- matt
           |
         brando


  cindy
    |  
  alex --- anj
    |    /
    |  /
  matt --- brando

=end

def build_graph(rivalries)
  hash = Hash.new do |h, k|
    h[k] = []
  end

  rivalries.each do |rivalry|
    hash[rivalry[0]] << rivalry[1]
    hash[rivalry[1]] << rivalry[0]
  end
  hash
end

def bipartite(graph, node, coloring, current_color)
  return coloring[node] == current_color if !coloring[node].nil?

  coloring[node] = current_color

  graph[node].each do |neighbor|
    if bipartite(graph, neighbor, coloring, !current_color) == false
      return false
    end
  end
  true
end

def tolerant_teams(rivalries)
  graph = build_graph(rivalries)

  coloring = {}

  graph.keys.each do |node|
    if coloring[node].nil? && bipartite(graph, node, coloring, false) == false
      return false
    end
  end
  return true
end

p tolerant_teams([
  ['philip', 'seb'],
  ['raj', 'nader']
]) # -> True

p tolerant_teams([
  ['philip', 'seb'],
  ['raj', 'nader'],
  ['raj', 'philip'],
  ['seb', 'raj']
]) # -> False