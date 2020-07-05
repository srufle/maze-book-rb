# frozen_string_literal: true

require 'grid'
require 'chunky_png'

# Colored Grid class used for Maze
class ColoredGrid < Grid
  def distances=(distances)
    @distances = distances
    _farthest, @maximum = distances.max
  end

  def background_color_for(cell)
    distance = @distances[cell] or return nil
    intensity = (@maximum - distance).to_f / @maximum
    dark = (255 * intensity).round
    bright = 128 + (127 * intensity).round
    # Dark Mode:  ChunkyPNG::Color.rgb(0, dark, 0)
    ChunkyPNG::Color.rgb(dark, bright, dark)
  end
end
