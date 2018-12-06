module Neighbours
  def self.find_neighbours(cell)
    movements = [[-1, -1], [-1, 0], [-1, 1], [0, -1],
                 [0, 1], [1, -1], [1, 0], [1, 1]]
    neighbours = []
    movements.each { |move| neighbours << move.zip(cell).map { |x, y| x + y } }
    neighbours
  end
end
