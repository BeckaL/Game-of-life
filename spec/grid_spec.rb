require './lib/grid.rb'

describe 'grid' do
  it 'stores an array of live cells on initialization' do
    grid = Grid.new([[1,1], [2,2], [3,3]])
    expect(grid.live_cells).to eq [[1,1], [2,2], [3,3]]
  end
end
