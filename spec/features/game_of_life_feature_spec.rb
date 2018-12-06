require './lib/game.rb'
require './lib/grid.rb'
describe 'game of life' do
  it 'calculates the next tick for a sparse starting grid - sparse' do
    game = prepare_game([[1, 1]])
    expect(game.live_cells_for_next_tick).to eq []
  end

  it 'calculates the next tick for an empty starting grid' do
      game = prepare_game([])
      expect(game.live_cells_for_next_tick).to eq []
  end

  it 'calculates the next tick for a stable grid' do
    game = prepare_game([[0, 0], [0, 1], [1, 0], [1, 1]])
    expect(game.live_cells_for_next_tick).to eq [[0, 0], [0, 1], [1, 0], [1, 1]]
  end

  it 'calculates the next tick for a slightly more complex grid' do
    game = prepare_game([[1, 2], [2, 1], [2, 2], [3, 3], [3, 4], [4, 3]])
    expect(game.live_cells_for_next_tick).to eq [[1, 1], [1, 2],
                                                 [2, 1], [2, 2],
                                                 [3, 3], [3, 4],
                                                 [4, 3], [4, 4]]
  end
end
