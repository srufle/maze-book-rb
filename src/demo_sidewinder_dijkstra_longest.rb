# frozen_string_literal: true

require 'distance_grid'
require 'sidewinder'

grid = DistanceGrid.new(10, 10)
SideWinder.on(grid)
puts 'Side Winder - dijkstra longest path'
start = grid[0, 0]
distances = start.distances
new_start, _distance = distances.max

new_distances = new_start.distances
goal, _distance = new_distances.max

grid.distances = new_distances.path_to(goal)
puts grid
