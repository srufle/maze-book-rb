# frozen_string_literal: true

require 'distance_grid'
require 'colored_grid'
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

grid = ColoredGrid.new(25, 25)
SideWinder.on(grid)
puts ''
puts 'Side Winder - dijkstra longest path png'
start = grid[grid.rows / 2, grid.columns / 2]
distances = start.distances
new_start, _distance = distances.max

new_distances = new_start.distances
goal, _distance = new_distances.max

grid.distances = new_distances.path_to(goal)

now = Time.new
img = grid.to_png
ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
img.save "../img/sidewinder_colored-#{ts}.png"

grid = ColoredGrid.new(25, 25)
SideWinder.on(grid)
puts ''
puts 'Side Winder - dijkstra heatmap png'
start = grid[grid.rows / 2, grid.columns / 2]
distances = start.distances

grid.distances = distances

now = Time.new
img = grid.to_png
ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
img.save "../img/sidewinder_colored_heatmap-#{ts}.png"
