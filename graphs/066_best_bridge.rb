=begin
Write a function, best_bridge, that takes in a grid as an argument. The grid contains water (W) and land (L).
There are exactly two islands in the grid. An island is a vertically or horizontally connected region of land.
Return the minimum length bridge needed to connect the two islands. A bridge does not need to form a straight line.
=end

def is_inbounds(grid, row, col)
  row_inbounds = row >= 0 && row < grid.size - 1
  col_inbounds = col >= 0 && col < grid[0].size - 1

  row_inbounds && col_inbounds
end

def traverse_island(grid, row, col, visited)
  return visited if grid[row][col] == 'W' && !is_inbounds(row, col, visited)
  pos = [row, col]
  return visited if visited.include?(pos)

  visited << pos

  traverse_island(grid, row, col + 1, visited)
  traverse_island(grid, row, col - 1, visited)
  traverse_island(grid, row + 1, col, visited)
  traverse_island(grid, row - 1, col, visited)
  visited
end

def best_bridge(grid)
  main_island = nil
  (0...grid.size).each do |r|
    (0...grid[0].size).each do |c|
      potential_island = traverse_island(grid, r, c, Set.new)

      if potential_island.size > 0
        main_island = potential_island
        break
      end
    end
  end

  distance = 0
  visited = Set.new(main_island)
  queue = []
  main_island.each do |land|
    queue << [land, distance]
  end

  while queue.size > 0
    row, col, distance = queue.shift

    if grid[row][col] == 'L' && !main_island.include?([row, col])
      return distance - 1
    end

    # going through all the neighbors of a land
    # below logic is for traversing through a grid in queue
    deltas [[1, 0], [-1, 0], [0, 1], [-1, 0]]

    deltas.each do |delta|
      delta_row, delta_col = delta
      neighbor_row = row + delta_row
      neighbor_col = col + delta_col

      neighbor_pos = [neighbor_row, neighbor_col]
      if is_inbounds(grid, neighbor_row, neighbor_col) && !visited.include?(neighbor_pos)
        visited << neighbor_pos
        queue << [neighbor_row, neighbor_col, distance + 1]
      end
    end
  end
end

grid = [
  ["W", "W", "W", "L", "L"],
  ["L", "L", "W", "W", "L"],
  ["L", "L", "L", "W", "L"],
  ["W", "L", "W", "W", "W"],
  ["W", "W", "W", "W", "W"],
  ["W", "W", "W", "W", "W"],
]
best_bridge(grid) # -> 1

grid = [
  ["W", "W", "W", "W", "W"],
  ["W", "W", "W", "W", "W"],
  ["L", "L", "W", "W", "L"],
  ["W", "L", "W", "W", "L"],
  ["W", "W", "W", "L", "L"],
  ["W", "W", "W", "W", "W"],
]
best_bridge(grid) # -> 2