# frozen_string_literal: true

require 'polar_grid'

now = Time.new
n = 1
grid = PolarGrid.new(8, 8)

puts ''
puts 'Polar Grid %02d - png' % n

img = grid.to_png
ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
img.save "../img/polar_grid_%02d-#{ts}.png" % n
