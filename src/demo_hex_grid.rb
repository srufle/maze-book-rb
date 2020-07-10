# frozen_string_literal: true

require 'hex_grid'
require 'aldous_broder'
require 'wilsons'
require 'hunt_and_kill'
require 'recursive_backtracker'

now = Time.new
n = 1

algorithms = [AldousBroder, Wilsons, HuntAndKill, RecursiveBacktracker]

algorithms.each do |algorithm|
  puts "Running #{algorithm} - Hex Grid %02d - png ..." % n

  grid = HexGrid.new(16, 16)
  algorithm.on(grid)

  img = grid.to_png
  ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
  img.save "../img/hex_maze_%02d-#{algorithm}-#{ts}.png" % n

  n += 1
end
