# frozen_string_literal: true

require 'grid'
require 'hunt_and_kill'
require 'distance_grid'
require 'colored_grid'

now = Time.new
6.times do |n|
  grid = ColoredGrid.new(20, 20)

  HuntAndKill.on(grid)

  puts ''
  puts 'Hunt And Kill %02d' % n
  start = grid[grid.rows / 2, grid.columns / 2]
  distances = start.distances
  grid.distances = distances

  img = grid.to_png
  ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
  img.save "../img/hunt_and_kill_%02d-#{ts}.png" % n
end
