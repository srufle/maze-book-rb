# frozen_string_literal: true

require 'mask'
require 'masked_grid'
require 'recursive_backtracker'

filename = 'mask_ascii_demo.txt'

# abort 'Please specify a text file to use as a template' if ARGV.empty?
puts filename
mask = Mask.from_txt(filename)
grid = MaskedGrid.new(mask)
RecursiveBacktracker.on(grid)
n = 0
now = Time.new
puts ''
puts 'Recursive Backtracker %02d - masked grid - ascii mask' % n
puts grid

img = grid.to_png
ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
img.save "../img/ascii_mask_%02d-#{ts}.png" % n
