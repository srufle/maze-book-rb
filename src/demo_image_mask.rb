# frozen_string_literal: true

require 'mask'
require 'masked_grid'
require 'recursive_backtracker'

n = 1
now = Time.new
filename = 'mask_image_demo_%02d.png' % n

# abort 'Please specify a text file to use as a template' if ARGV.empty?
puts filename
mask = Mask.from_png(filename)
grid = MaskedGrid.new(mask)
RecursiveBacktracker.on(grid)

puts ''
puts 'Recursive Backtracker %02d - masked grid - image mask' % n
puts grid

img = grid.to_png
ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
img.save "../img/image_mask_%02d-#{ts}.png" % n

n = 2
filename = 'mask_image_demo_%02d.png' % n

# abort 'Please specify a text file to use as a template' if ARGV.empty?
puts filename
mask = Mask.from_png(filename)
grid = MaskedGrid.new(mask)
RecursiveBacktracker.on(grid)

puts ''
puts 'Recursive Backtracker %02d - masked grid - image mask' % n
puts grid

img = grid.to_png
ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
img.save "../img/image_mask_%02d-#{ts}.png" % n
