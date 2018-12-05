require './lib/grid.rb'

describe 'grid' do
  it 'stores an array of live cells on initialization' do
    grid = Grid.new([[1,1], [2,2], [3,3]])
    expect(grid.live_cells).to eq [[1,1], [2,2], [3,3]]
  end

  it 'generates array of dead neighbour cells, given live cells' do
    grid = Grid.new([[1,1], [2,2]])
    expect(grid.dead_neighbours.length).to eq 12

    expect(grid.dead_neighbours).to eq [[0,0], [0,1], [0,2], [1,0], [1,2], [1,3],
                                        [2,0], [2,1], [2,3], [3,1], [3,2], [3,3]]
  end
end
