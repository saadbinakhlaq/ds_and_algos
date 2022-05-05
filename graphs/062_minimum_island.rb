=begin
Write a function, minimum_island, that takes in a grid containing Ws and Ls. W represents water and L represents land.
The function should return the size of the smallest island. An island is a vertically or horizontally connected region of land.
You may assume that the grid contains at least one island.
=end

def explore_size(grid, r, c, visited)
  row_inbounds = 0 <= r && r < grid.size
  col_inbounds = 0 <= c && c < grid[0].size
  return 0 if (!row_inbounds || !col_inbounds)

  return 0 if grid[r][c] == 'W'
  pos = [r, c]
  return 0 if visited.include?(pos)

  visited << pos
  size = 1
  size += explore_size(grid, r - 1, c, visited)
  size += explore_size(grid, r + 1, c, visited)
  size += explore_size(grid, r, c - 1, visited)
  size += explore_size(grid, r, c + 1, visited)
  size
end

def minimum_island(grid)
  visited = Set.new
  minimum_island_size = grid.size * grid[0].size

  (0...grid.size).each do |r|
    (0...grid[0].size).each do |c|
      size = explore_size(grid, r, c, visited)

      minimum_island_size = size if size < minimum_island_size && size > 0
    end
  end

  minimum_island_size
end