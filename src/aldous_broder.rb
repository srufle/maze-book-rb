# frozen_string_literal: true

# Aldous Broder is an algorithm to print a Grid
class AldousBroder
  def self.on(grid)
    cell = grid .random_cell
    unvisted = grid.size - 1

    while unvisted > 0
      neighbor = cell.neighbors.sample

      if neighbor.links.empty?
        cell.link(neighbor)
        unvisted -= 1
      end

      cell = neighbor
    end

    grid
  end
end
