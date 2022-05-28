=begin
Write a function, prereqs_possible, that takes in a number of courses [n] and prerequisites as arguments.
Courses have ids ranging from 0 through n - 1. A single prerequisite of [A, B] means that course A must be taken before course B.
The function should return a boolean indicating whether or not it is possible to complete all courses.
=end
require 'set'

def build_graph(num_courses, prereqs)
  courses = {}
  (0...num_courses).each do |i|
    courses[i] = []
  end

  prereqs.each do |prereq|
    courses[prereq[0]] << prereq[1]
  end

  courses
end

def cycle_detect(graph, node, visited, visiting)
  return false if visited.include?(node)
  return true if visiting.include?(node)

  visiting.add(node)
  graph[node].each do |neighbor|
    if cycle_detect(graph, neighbor, visited, visiting) == true
      return true
    end
  end

  visiting.delete(node)
  visited.add(node)

  return false
end

def prereqs_possible(num_courses, prereqs)
  graph = build_graph(num_courses, prereqs)

  visited = Set.new
  visiting = Set.new

  graph.keys.each do |node|
    if cycle_detect(graph, node, visited, visiting) == true
      return false
    end
  end

  visited.size == num_courses
end
num_courses = 6
prereqs = [
  [0, 1],
  [2, 3],
  [0, 2],
  [1, 3],
  [4, 5],
]
puts prereqs_possible(num_courses, prereqs)

num_courses = 6
prereqs = [
  [0, 1],
  [2, 3],
  [0, 2],
  [1, 3],
  [4, 5],
  [3, 0],
]

puts prereqs_possible(num_courses, prereqs)

