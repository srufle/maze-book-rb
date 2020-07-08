# frozen_string_literal: true

require 'polar_grid'
require 'recursive_backtracker'

now = Time.new
n = 1
grid = PolarGrid.new(8)

puts ''
puts 'Polar Grid %02d - png' % n

img = grid.to_png
ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
img.save "../img/polar_grid_%02d-#{ts}.png" % n

n = 2
grid = PolarGrid.new(8)

RecursiveBacktracker.on(grid)

puts ''
puts 'Polar Grid %02d - Recursive Backtracker - png' % n

img = grid.to_png
ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
img.save "../img/circle_maze_%02d-#{ts}.png" % n
