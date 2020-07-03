# frozen_string_literal: true

require 'grid'
require 'binary_tree'

grid = Grid.new(4, 4)
BinaryTree.on(grid)
puts 'Binary Tree'
puts grid

now = Time.new
img = grid.to_png
ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
img.save "../img/binary_tree-#{ts}.png"
