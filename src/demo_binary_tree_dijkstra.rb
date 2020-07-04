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
