class Game

  TOTAL_NEIGHBOURS = 8
  MIN_SURV_THRESH = 2
  MAX_SURV_THRESH = 3
  GENERATION_THRESH = 3

  def initialize(live_cells, dead_cells)
    @live_cells = live_cells
    @dead_cells = dead_cells
  end

  def surviving_live_cells
    return @live_cells.select do |living_cell|
      cell_neighbours = find_neighbours(living_cell)
      alive_nbours = (cell_neighbours - @dead_cells).length
      living_cell if (MIN_SURV_THRESH...MAX_SURV_THRESH).include?(alive_nbours)
    end
  end

  def generated_dead_cells
    return @dead_cells.select do |dead_cell|
      cell_neighbours = find_neighbours(dead_cell)
      alive_neighbours = (cell_neighbours & @live_cells).length
      dead_cell if GENERATION_THRESH == alive_neighbours
    end
  end

  private
  def find_neighbours(cell)
    neighbours = []
    movements.each do |movement|
      neighbours << movement.zip(cell).map { |x, y| x + y }
    end
    neighbours
  end

  def movements
    [[-1,-1], [-1, 0], [-1, 1], [0, -1],
    [0, 1], [1, -1], [1, 0], [1, 1]]
  end

end
