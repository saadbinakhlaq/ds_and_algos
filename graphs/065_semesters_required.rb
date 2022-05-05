=begin
Write a function, semesters_required, that takes in a number of courses (n) and a list of prerequisites as arguments.
Courses have ids ranging from 0 through n - 1. A single prerequisite of (A, B) means that course A must be taken before course B. 
Return the minimum number of semesters required to complete all n courses. 
There is no limit on how many courses you can take in a single semester, as long the prerequisites of a course are satisfied before taking it.
Note that given prerequisite (A, B), you cannot take course A and course B concurrently in the same semester. You must take A in some semester before B.
You can assume that it is possible to eventually complete all courses.
=end

def build_graph(courses, prereqs)
  graph = {}

  (0...courses).each do |course|
    graph[course] = []
  end

  prereqs.each do |prereq|
    a, b = prereq
    graph[a] << b
  end

  graph
end

def traverse_distance(graph, node, distance)
  return distance[node] if distance.keys.include?(node)

  max_distance = 0
  graph[node].each do |neighbor|
    neighbor_distance = traverse_distance(graph, neighbor, distance)
    max_distance = neighbor_distance if neighbor_distance > max_distance
  end

  distance[node] = 1 + max_distance
  distance[node]
end

def semesters_required(courses, prereqs)
  graph = build_graph(courses, prereqs)
  distance = {}

  graph.keys.each do |node|
    distance[node] = 1 if graph[node].size == 0
  end

  graph.keys.each do |course|
    traverse_distance(graph, course, distance)
  end

  distance.values.max
end

num_courses = 7
prereqs = [
  [4, 3],
  [3, 2],
  [2, 1],
  [1, 0],
  [5, 2],
  [5, 6],
]

puts semesters_required(num_courses, prereqs)

