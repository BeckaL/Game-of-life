class Grid
  attr_reader :live_cells

  def initialize(live_cells)
    @live_cells = live_cells
  end

  def dead_neighbours
    dead_cells = []
    @live_cells.each do |cell|
      movements.each do |movement|
        dead_cells << movement.zip(cell).map { |x, y| x + y }
      end
    end
    dead_cells.uniq.select { |cell| !@live_cells.include?(cell) }.sort
  end

  private
  def movements
    [[-1,-1], [-1, 0], [-1, 1], [0, -1],
    [0, 1], [1, -1], [1, 0], [1, 1]]
  end

end
