=begin
You've been hired to plant flowers in a garden with n different positions. There are m different flower types. The prices of flowers types vary depending on which position they are planted. Your bosses are picky, they tell you to never plant two of the same flower type right next to each other. What is the minimum cost we need to plant a flower in each position of the garden?

Write a function, positioningPlants, that takes in a 2D list with dimensions n * m. Each row of the list represents the costs of the flower types at that position. This means that costs[i][j] represents the cost of planting flower type j at position i. For example:
=end


def breaking_boundaries(row_size, col_size, k_most_moves, row, col)
  _breaking_boundaries(row_size, col_size, k_most_moves, row, col, {})
end

def _breaking_boundaries(row_size, col_size, k_most_moves, row, col, memo)
  key = [k_most_moves, row, col]

  return memo[key] if !memo[key].nil?

  row_inbounds = row >= 0 && row < row_size
  col_inbounds = col >= 0 && col < col_size
  return 1 if !row_inbounds || !col_inbounds
  return 0 if k_most_moves == 0

  deltas = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  count = 0

  deltas.each do |delta|
    row_delta, col_delta = delta
    count += _breaking_boundaries(row_size, col_size, k_most_moves - 1, row + row_delta, col + col_delta, memo)
  end

  memo[key] = count
  memo[key]
end

p breaking_boundaries(3, 4, 2, 0, 0) # -> 4
p breaking_boundaries(2, 2, 2, 1, 1) # -> 6
p breaking_boundaries(3, 4, 3, 0, 0) # -> 11
p breaking_boundaries(4, 4, 5, 2, 1) # -> 160
p breaking_boundaries(5, 6, 9, 2, 5) # -> 11635
p breaking_boundaries(6, 6, 12, 3, 4) # -> 871065
p breaking_boundaries(6, 6, 15, 3, 4) # -> 40787896
p breaking_boundaries(6, 8, 16, 2, 1) # -> 137495089
