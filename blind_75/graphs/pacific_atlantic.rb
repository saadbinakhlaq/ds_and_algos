=begin
https://leetcode.com/problems/pacific-atlantic-water-flow/

The idea here is to go from the ocean and see which all nodes you can visit
also important is that since we are going from the ocean, we can only to a 
height greater than the current node
=end

require 'set'

def depth_first_search(heights, row, col, visited, prev_height)
  return nil if visited.include?([row, col])
  row_inbounds = row >=0 && row < heights.size
  col_inbounds = col >= 0 && col < heights[0].size
  return nil if !row_inbounds || !col_inbounds # since we are going inside we should be inbounds

  return nil if prev_height > heights[row][col] # since previous height should be less than current height going inwards
  visited.add([row, col])

  deltas = [[0, 1], [0, -1], [1, 0], [-1, 0]]

  deltas.each do |delta|
    row_delta, col_delta = delta
    depth_first_search(heights, row + row_delta, col + col_delta, visited, heights[row][col])
  end
end

def pacific_atlantic(heights)
  pacific = Set.new
  atlantic = Set.new
  total_rows = heights.size
  total_cols = heights[0].size

  # going from pacific top side and atlantic bottom side
  (0...total_cols).each do |col|
    depth_first_search(heights, 0, col, pacific, heights[0][col])
    depth_first_search(heights, total_rows - 1, col, atlantic, heights[total_rows - 1][col])
  end

  # going from pacific left and atlantic right
  (0...total_rows).each do |row|
    depth_first_search(heights, row, 0, pacific, heights[row][0])
    depth_first_search(heights, row, total_cols - 1, atlantic, heights[row][total_cols - 1])
  end

  paicific.intersection(atlantic).to_a
end

