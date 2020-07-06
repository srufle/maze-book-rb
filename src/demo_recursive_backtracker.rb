# frozen_string_literal: true

require 'grid'
require 'recursive_backtracker'
require 'distance_grid'
require 'colored_grid'

now = Time.new
6.times do |n|
  grid = ColoredGrid.new(20, 20)

  start = grid.random_cell
  RecursiveBacktracker.on(grid, start_at: start)

  puts ''
  puts 'Recursive Backtracker %02d' % n

  distances = start.distances
  grid.distances = distances

  img = grid.to_png
  ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
  img.save "../img/recursive_backtracker_%02d-#{ts}.png" % n
end
