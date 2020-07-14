# frozen_string_literal: true

require 'weighted_grid'
require 'aldous_broder'
require 'wilsons'
require 'hunt_and_kill'
require 'recursive_backtracker'

now = Time.new
n = 1

algorithms = [AldousBroder, Wilsons, HuntAndKill, RecursiveBacktracker]

algorithms.each do |algorithm|
  puts ''
  puts "#{algorithm} %02d - Weighted Grid - no lava" % n
  grid = WeightedGrid.new(20, 20)

  algorithm.on(grid)
  grid.braid(0.5)
  start = grid[0, 0]
  finish = grid[grid.rows - 1, grid.columns - 1]
  grid.distances = start.distances.path_to(finish)

  img = grid.to_png
  ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
  img.save "../img/#{algorithm}_no_lava_%02d-#{ts}.png" % n

  lava = grid.distances.cells.sample
  lava.weight = 50
  grid.distances = start.distances.path_to(finish)

  puts ''
  puts "#{algorithm} %02d - Weighted Grid - with lava" % n

  img = grid.to_png
  ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
  img.save "../img/#{algorithm}_with_lava_%02d-#{ts}.png" % n
  n += 1
end
