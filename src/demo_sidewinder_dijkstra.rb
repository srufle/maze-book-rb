# frozen_string_literal: true

require 'distance_grid'
require 'sidewinder'

grid = DistanceGrid.new(10, 10)
SideWinder.on(grid)
puts 'Side Winder - dijkstra'
start = grid[0, 0]
distances = start.distances

grid.distances = distances

puts grid
