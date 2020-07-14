# frozen_string_literal: true

require 'distances'
require 'cell'

# WeightedCell class used as section Grid
class WeightedCell < Cell
  attr_accessor :weight

  def initialize(row, column)
    super(row, column)
    @weight = 1
  end

  def distances
    weights = Distances.new(self)
    pending = [self]

    while pending.any?
      cell = pending.min_by { |c| weights[c] }
      pending.delete(cell)

      cell.links.each do |neighbor|
        total_weight = weights[cell] + neighbor.weight
        if !weights[neighbor] || total_weight < weights[neighbor]
          pending << neighbor
          weights[neighbor] = total_weight
        end
      end
    end

    weights
  end
end
