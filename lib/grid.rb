class Grid
  attr_reader :live_cells

  def initialize(live_cells)
    @live_cells = live_cells
  end

  def dead_neighbours
    dead_cells = []
    @live_cells.each do |cell|
      movements.each do |movement|
        dead_cells.push(movement.zip(cell).map { |x,y| x +y })
      end
    end
    dead_cells.uniq!.sort!
    dead_cells.select { |cell| !@live_cells.include?(cell) }
  end

  private
  def movements
    [[-1,-1], [-1, 0], [-1, 1],
    [0, -1], [0, 1],
    [1, -1], [1, 0], [1, 1]]
  end

end
