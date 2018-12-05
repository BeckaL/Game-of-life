require './lib/game'

describe 'Game' do

  it 'a live cell dies if less than two of its neighbours are live' do
    sparse_game = Game.new([[1,1]], [[0,0], [0,1], [0,2], [1,0], [1,2], [2,0], [2,1], [2,2]])
    expect(sparse_game.surviving_live_cells).to eq []
  end

end
