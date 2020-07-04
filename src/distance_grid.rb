# frozen_string_literal: true

require 'grid'

# DistanceGrid class used for Maze that also shows distances
class DistanceGrid < Grid
  attr_accessor :distances

  def contents_of(cell)
    if distances && distances[cell]
      distances[cell].to_s(36)
    else
      super
    end
  end
end
