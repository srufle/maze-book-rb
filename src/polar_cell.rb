# frozen_string_literal: true

require 'cell'

# PolarCell class used as section Polar Maze
class PolarCell < Cell
  attr_accessor :cw, :ccw, :inward
  attr_reader :outward

  def initialize(row, column)
    super(row, column)
    @outward = []
  end

  def neighbors
    list = []
    list << cw if cw
    list << ccw if ccw
    list << inward if inward
    list += outward
    list
  end
end
