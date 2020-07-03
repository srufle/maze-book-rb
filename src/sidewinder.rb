# frozen_string_literal: true

# Side Winder is an algorithm to print a Grid
class SideWinder
  def self.on(grid)
    grid.each_row do |row|
      run = []

      row.each do |cell|
        run << cell

        at_eastern_boundary = cell.east.nil?
        at_northern_boundary = cell.north.nil?

        should_close_out = at_eastern_boundary || (!at_northern_boundary && rand(2).zero?)
        if should_close_out
          member = run.sample
          member.link(member.north) if member.north
          run.clear
        else
          cell.link(cell.east)
        end
      end
    end

    grid
  end
end
