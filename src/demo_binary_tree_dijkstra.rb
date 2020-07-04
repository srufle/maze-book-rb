# frozen_string_literal: true

require 'distance_grid'
require 'binary_tree'

grid = DistanceGrid.new(5, 5)
BinaryTree.on(grid)
puts 'Binary Tree - dijkstra'
start = grid[0, 0]
distances = start.distances

grid.distances = distances

puts grid

puts ''
puts 'Path to southwest corner'

grid.distances = distances.path_to(grid[grid.rows - 1, 0])
puts grid.to_s
