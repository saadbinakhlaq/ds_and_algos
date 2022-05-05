=begin
Write a function, closest_carrot, that takes in a grid, a starting row, and a starting column. In the grid, 'X's are walls, 'O's are open spaces, and 'C's are carrots.
The function should return a number representing the length of the shortest path from the starting position to a carrot.
You may move up, down, left, or right, but cannot pass through walls (X). If there is no possible path to a carrot, then return -1.
=end
require 'set'

def closest_carrot(grid, starting_row, starting_col)
  visited = Set.new
  queue = [[starting_row, starting_col, 0]]

  while queue.size > 0
    row, col, dist = queue.shift
    pos = [row, col]
    next if visited.include?(pos)

    visited << pos

    next if grid[row][col] == 'X'
    return dist if grid[row][col] == 'C'
    
    queue << [row + 1, col, dist + 1] if row + 1 >= 0 && row + 1 < grid.size
    queue << [row - 1, col, dist + 1] if row - 1 >= 0 && row - 1 < grid.size
    queue << [row, col + 1, dist + 1] if col + 1 >= 0 &&  col + 1 < grid[0].size
    queue << [row, col - 1, dist + 1] if col - 1 >= 0 && col - 1 < grid[0].size
  end
  return -1
end

grid = [
  ['O', 'O', 'O', 'O', 'O'],
  ['O', 'X', 'O', 'O', 'O'],
  ['O', 'X', 'X', 'O', 'O'],
  ['O', 'X', 'C', 'O', 'O'],
  ['O', 'X', 'X', 'O', 'O'],
  ['C', 'O', 'O', 'O', 'O'],
]

puts closest_carrot(grid, 0, 0) 