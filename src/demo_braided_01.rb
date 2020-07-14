# frozen_string_literal: true

require 'grid'
require 'aldous_broder'
require 'wilsons'
require 'hunt_and_kill'
require 'recursive_backtracker'
require 'distance_grid'

now = Time.new
n = 1

algorithms = [AldousBroder, Wilsons, HuntAndKill, RecursiveBacktracker]

algorithms.each do |algorithm|
  grid = Grid.new(20, 20)

  algorithm.on(grid)

  puts ''
  puts "#{algorithm} %02d" % n

  # distances = start.distances
  # grid.distances = distances

  img = grid.to_png
  ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
  img.save "../img/#{algorithm}_%02d-#{ts}.png" % n

  puts ''
  puts "#{algorithm} - Braided %02d" % n

  grid.braid(0.5)
  img = grid.to_png
  ts = "#{now.year}-#{now.month}-#{now.day}-#{now.hour}-#{now.min}-#{now.sec}"
  img.save "../img/#{algorithm}_braided_%02d-#{ts}.png" % n
  n += 1
end
