# frozen_string_literal: true

require 'grid'
require 'aldous_broder'
require 'distance_grid'
require 'colored_grid'

now = Time.new
6.times do |n|
  grid = ColoredGrid.new(20, 20)
  AldousBroder.on(grid)

  puts ''
  puts 'Aldous Broder %02d' % n
  start = grid[grid.rows / 2, grid.columns / 2]
  distances = start.distances
  grid.distances = distances

  img = grid.to_png
  ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
  img.save "../img/aldous_broder_%02d-#{ts}.png" % n
end
