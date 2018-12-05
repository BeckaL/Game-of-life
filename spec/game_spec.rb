require './lib/game'

describe 'Game' do

  describe '#surviving_live_cells' do

    it 'a live cell dies if less than two of its neighbours are live' do
      sparse_game = Game.new([[1,1]], [[0,0], [0,1], [0,2], [1,0], [1,2], [2,0], [2,1], [2,2]])
      expect(sparse_game.surviving_live_cells).to eq []
    end

    it 'a live cell survives if two or three of its neighbours are live' do
      medium_game = Game.new([[1,1], [1,2], [1,0]], [[0, -1], [0, 0], [0, 1], [0, 2], [0, 3], [1, -1], [1, 3], [2, -1], [2, 0], [2, 1], [2, 2], [2, 3]])
      expect(medium_game.surviving_live_cells).to include [1,1]
    end

    it 'a live cell dies if more than three of its neighbours are live' do
      busy_game = Game.new([[1,1], [0,1], [1,0], [1,2], [0,0]], [[-1, -1], [-1, 0], [-1, 1], [-1, 2], [0, -1], [0, 2], [0, 3], [1, -1], [1, 3], [2, -1], [2, 0], [2, 1], [2, 2], [2, 3]])
      expect(busy_game.surviving_live_cells).not_to include [1,1]
    end
  end

  it 'a dead cell becomes alive if exactly three of its neighbours are live' do
    game = Game.new([[0,0], [1,0], [2,0]],[[-1, -1], [-1, 0], [-1, 1], [0, -1], [0, 1], [1, -1], [1, 1], [2, -1], [2, 1], [3, -1], [3, 0], [3, 1]])
    expect(game.generated_dead_cells).to include [1,1]
  end

end
