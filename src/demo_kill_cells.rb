# frozen_string_literal: true

require 'grid'
require 'recursive_backtracker'
require 'distance_grid'
require 'colored_grid'

now = Time.new
3.times do |n|
  grid = ColoredGrid.new(20, 20)
  grid[0, 0].east.west = nil
  grid[0, 0].south.north = nil

  grid[19, 19].west.east = nil
  grid[19, 19].north.south = nil
  start = grid[1, 1]
  RecursiveBacktracker.on(grid, start_at: start)

  puts ''
  puts 'Recursive Backtracker %02d - kill cells' % n

  distances = start.distances
  grid.distances = distances

  img = grid.to_png
  ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
  img.save "../img/recursive_backtracker_kill_cells_%02d-#{ts}.png" % n
end
