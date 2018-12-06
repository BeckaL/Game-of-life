require './lib/Neighbours_module.rb'
describe Neighbours do

  it 'generates list of neighbours for a cell' do
    expect(Neighbours.find_neighbours([1, 1])).to eq(
      [[0, 0], [0, 1], [0, 2],
       [1, 0], [1, 2],
       [2, 0], [2, 1], [2, 2]]
    )
  end
end
