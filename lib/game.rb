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
    return_live_cells(@live_cells)
  end

  def generated_dead_cells
    return_live_cells(@dead_cells,live_cells = false)
  end

  def return_live_cells(cell_array, live_cells = true)
    return cell_array.select do |cell|
      alive_neighbours = (find_neighbours(cell) & @live_cells).length
      if live_cells
        survival_rule(cell, alive_neighbours)
      else
        generation_rule(cell, alive_neighbours)
      end
    end
  end

  private
  def find_neighbours(cell)
    neighbours = []
    movements.each { |move| neighbours << move.zip(cell).map { |x, y| x + y } }
    neighbours
  end

  def generation_rule(cell, alive_neighbours)
    cell if GENERATION_THRESH == alive_neighbours
  end

  def survival_rule(cell, alive_nbours)
    cell if (MIN_SURV_THRESH...MAX_SURV_THRESH).include?(alive_nbours)
  end

  def movements
    [[-1,-1], [-1, 0], [-1, 1], [0, -1],
    [0, 1], [1, -1], [1, 0], [1, 1]]
  end

end
