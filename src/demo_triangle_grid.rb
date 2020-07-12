# frozen_string_literal: true

require 'triangle_grid'
require 'aldous_broder'
require 'wilsons'
require 'hunt_and_kill'
require 'recursive_backtracker'

now = Time.new
n = 1

algorithms = [AldousBroder, Wilsons, HuntAndKill, RecursiveBacktracker]
# algorithms = [RecursiveBacktracker]

algorithms.each do |algorithm|
  puts "Running #{algorithm} - Triangle Grid %02d - png ..." % n

  grid = TriangleGrid.new(20, 34)
  algorithm.on(grid)

  img = grid.to_png
  ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
  img.save "../img/triangle_maze_%02d-#{algorithm}-#{ts}.png" % n

  n += 1
end
