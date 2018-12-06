require_relative 'neighbours_module'

class Grid
  attr_reader :live_cells

  def initialize(live_cells)
    @live_cells = live_cells
  end

  def dead_neighbours_of_living_cells
    live_cell_neighbours = []
    @live_cells.each do |cell|
      live_cell_neighbours += Neighbours.find_neighbours(cell)
    end
    live_cell_neighbours.uniq.reject { |cell| @live_cells.include?(cell) }.sort
  end
end
#
# grid = Grid.new([[0, 0], [0, 1], [1, 0], [1, 1]])
# p grid.dead_neighbours_of_living_cells
