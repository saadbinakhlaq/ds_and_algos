=begin
Write a function, max_path_sum, that takes in a grid as an argument. The function should return the maximum sum possible by traveling a path from the top-left corner to the bottom-right corner. You may only travel through the grid by moving down or right.

You can assume that all numbers are non-negative.
=end

def max_path_sum(grid, 0, 0)
  _max_path_sum(grid, 0, 0, {})
end

def _max_path_sum(grid, r, c, memo)
  pos = [r, c]

  return memo[pos] if !memo[pos].nil?
  return 0 if r == grid.size || c == grid[0].size
  return grid[r][c] if r == grid.size - 1 && c == grid[0].size - 1

  max_sum = grid[r][c] + [_max_path_sum(grid, r + 1, c, memo), _max_path_sum(grid, r, c + 1, memo)].max
  memo[pos] = max_sum
  memo[pos]
end