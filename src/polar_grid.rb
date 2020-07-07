# frozen_string_literal: true

require 'grid'
require 'chunky_png'

# Polar Grid class used for circular Maze
class PolarGrid < Grid
  def to_png(cell_size: 50)
    img_size = 2 * @rows * cell_size

    background = ChunkyPNG::Color::WHITE
    wall = ChunkyPNG::Color::BLACK
    img = ChunkyPNG::Image.new(img_size + 1, img_size + 1, background)
    center = img_size / 2

    each_cell do |cell|
      theta = 2 * Math::PI / @grid[cell.row].length
      inner_radius = cell.row * cell_size
      outer_radius = (cell.row + 1) * cell_size
      theta_ccw = cell.column * theta
      theta_cw = (cell.column + 1) * theta

      ax = center + (inner_radius * Math.cos(theta_ccw)).to_i
      ay = center + (inner_radius * Math.sin(theta_ccw)).to_i
      # bx = center + (outer_radius * Math.cos(theta_ccw)).to_i
      # by = center + (outer_radius * Math.sin(theta_ccw)).to_i
      cx = center + (inner_radius * Math.cos(theta_cw)).to_i
      cy = center + (inner_radius * Math.sin(theta_cw)).to_i
      dx = center + (outer_radius * Math.cos(theta_cw)).to_i
      dy = center + (outer_radius * Math.sin(theta_cw)).to_i

      img.line(ax, ay, cx, cy, wall) unless cell.linked?(cell.north)
      img.line(cx, cy, dx, dy, wall) unless cell.linked?(cell.east)
    end

    img.circle(center, center, @rows * cell_size, wall)
    img
  end
end
