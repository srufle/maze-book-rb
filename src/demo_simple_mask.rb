# frozen_string_literal: true

require 'mask'
require 'masked_grid'
require 'masked_colored_grid'
require 'recursive_backtracker'

now = Time.new
3.times do |n|
  mask = Mask.new(5, 5)
  mask[0, 0] = false
  mask[2, 2] = false
  mask[4, 4] = false

  grid = MaskedGrid.new(mask)

  RecursiveBacktracker.on(grid)
  puts ''
  puts 'Recursive Backtracker %02d - masked grid - txt' % n

  puts grid
end

now = Time.new
3.times do |n|
  mask = Mask.new(5, 5)
  mask[0, 0] = false
  mask[2, 2] = false
  mask[4, 4] = false

  grid = MaskedColoredGrid.new(mask)
  RecursiveBacktracker.on(grid)

  puts ''
  puts 'Recursive Backtracker %02d - masked grid - png' % n
  start = grid[1, 1]
  distances = start.distances
  grid.distances = distances

  img = grid.to_png
  ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
  img.save "../img/simple_masked_%02d-#{ts}.png" % n
end
