# frozen_string_literal: true

require 'grid'
require 'sidewinder'

grid = Grid.new(10, 10)
SideWinder.on(grid)
puts 'Side Winder'
puts grid

now = Time.new
img = grid.to_png
ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
img.save "../img/side_winder-#{ts}.png"
