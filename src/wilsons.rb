# frozen_string_literal: true

# Wilsons is an algorithm to print a Grid
class Wilsons
  def self.on(grid)
    unvisted = []
    grid.each_cell { |cell| unvisted << cell }

    first = unvisted.sample
    unvisted.delete(first)

    while unvisted.any?
      cell = unvisted.sample
      path = [cell]

      while unvisted.include?(cell)
        cell = cell.neighbors.sample
        position = path.index(cell)
        if position
          path = path[0..position]
        else
          path << cell
        end
      end
      0.upto(path.length - 2) do |index|
        path[index].link(path[index + 1])
        unvisted.delete(path[index])
      end
    end

    grid
  end
end
