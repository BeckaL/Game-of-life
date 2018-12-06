require_relative 'neighbours_module'
class Game
  TOTAL_NEIGHBOURS = 8
  MIN_SURV_THRESH = 2
  MAX_SURV_THRESH = 3
  GENERATION_THRESH = 3

  def initialize(live_cells, dead_cells)
    @live_cells = live_cells
    @dead_cells = dead_cells
  end

  def live_cells_for_next_tick
    (surviving_live_cells + generated_dead_cells).sort
  end

  def surviving_live_cells
    return_live_cells(@live_cells)
  end

  def generated_dead_cells
    return_live_cells(@dead_cells, alive_now = false)
  end

  def return_live_cells(cell_array, alive_now = true)
    cell_array.select do |cell|
      alive_neighbours = (Neighbours.find_neighbours(cell) & @live_cells).length
      generation_or_survival_rule(cell, alive_neighbours, alive_now)
    end
  end

  private

  def generation_or_survival_rule(cell, alive_neighbours, alive_now)
    if alive_now
      cell if (MIN_SURV_THRESH..MAX_SURV_THRESH).cover?(alive_neighbours)
    else
      cell if GENERATION_THRESH == alive_neighbours
    end
  end
end
