require './lib/grid.rb'

describe 'grid' do
  it 'stores an array of live cells on initialization' do
    grid = Grid.new([[1, 1], [2, 2], [3, 3]])
    expect(grid.live_cells).to eq [[1, 1], [2, 2], [3, 3]]
  end

  it 'generates array of dead neighbour cells, given live cells' do
    grid = Grid.new([[1, 1], [2, 2]])
    expect(grid.dead_neighbours_of_living_cells).to eq [[0, 0], [0, 1], [0, 2],
                                                        [1, 0], [1, 2], [1, 3],
                                                        [2, 0], [2, 1], [2, 3],
                                                        [3, 1], [3, 2], [3, 3]]
  end

  it 'generates array of dead neighbour cells, given live cells' do
    grid = Grid.new([[2, 1], [4, 4], [-1, -1]])
    expect(grid.dead_neighbours_of_living_cells).to eq(
      [[-2, -2], [-2, -1], [-2, 0],
       [-1, -2], [-1, 0],
       [0, -2], [0, -1], [0, 0],
       [1, 0], [1, 1], [1, 2],
       [2, 0], [2, 2],
       [3, 0], [3, 1], [3, 2], [3, 3], [3, 4], [3, 5],
       [4, 3], [4, 5], [5, 3], [5, 4], [5, 5]]
    )
  end

  it 'generates array of dead neighbour cells for clustered cells' do
    clustered_grid = Grid.new([[-1, -1], [-1, 0], [0, -1], [1, 0]])
    expect(clustered_grid.dead_neighbours_of_living_cells).to eq(
      [[-2, -2], [-2, -1], [-2, 0], [-2, 1],
       [-1, -2], [-1, 1], [0, -2],
       [0, 0], [0, 1],
       [1, -2], [1, -1], [1, 1],
       [2, -1], [2, 0], [2, 1]]
    )
  end

  it 'has no dead neighbours if given an empty grid' do
    empty_grid = Grid.new([])
    expect(empty_grid.dead_neighbours_of_living_cells).to eq []
  end
end
