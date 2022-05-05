=begin
Write a function, count_paths, that takes in a grid as an argument. 
In the grid, 'X' represents walls and 'O' represents open spaces. 
You may only move down or to the right and cannot pass through walls. 
The function should return the number of ways possible to travel 
from the top-left corner of the grid to the bottom-right corner.
=end

def count_paths(grid)
  return _count_paths(grid, 0, 0, {})
end

def _count_paths(grid, r, c, memo)
  pos = [r, c]
  return memo[pos] if !memo[pos].nil?
  return 0 if grid.size == r || grid[0].size == c || grid[r][c] == 'X'
  return 1 if grid.size - 1 == r && grid[0].size - 1 == c

  memo[pos] = _count_paths(grid, r + 1, c, memo) + _count_paths(grid, r, c + 1, memo)
  memo[pos]
end

grid = [
  ["O", "O"],
  ["O", "O"],
]

puts count_paths(grid) == 2

grid = [
  ["O", "O", "X"],
  ["O", "O", "O"],
  ["O", "O", "O"],
]
puts count_paths(grid) == 5