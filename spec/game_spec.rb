require './lib/game'
describe 'Game' do
  context 'surviving_live_cells' do
    let(:live_cell) { [1, 1] }
    let(:cell_neighbours) { [[0, 0], [0, 1], [0, 2],
                             [1, 0], [1, 2],
                             [2, 0], [2, 1], [2, 2]] }
    let(:two_by_two_sqaure) { [[0, 0], [0, 1], [1, 0], [1, 1]] }
    let(:two_by_two_sqaure_neighbours) { [[-1, -1], [-1, 0], [-1, 1], [-1, 2],
                                          [0, -1], [0, 2],
                                          [1, -1], [1, 2],
                                          [2, -1], [2, 0], [2, 1], [2, 2]] }

    it 'a live cell dies if less than two of its neighbours are live' do
      sparse_game = Game.new([live_cell],
                             cell_neighbours)
      expect(sparse_game.live_cells_for_next_tick).not_to include live_cell
    end

    it 'a live cell survives if two or three of its neighbours are live' do
      medium_game = Game.new([live_cell, *cell_neighbours[0..1]],
                             [*cell_neighbours[0..2]])
      expect(medium_game.live_cells_for_next_tick).to include live_cell
    end

    it 'a live cell dies if more than three of its neighbours are live' do
      busy_game = Game.new([live_cell, *cell_neighbours[0..3]],
                           [*cell_neighbours[4..8]])
      expect(busy_game.live_cells_for_next_tick).not_to include live_cell
    end

    it 'a game is stable if a two-by-two square exists' do
      stable_game = Game.new(two_by_two_sqaure,
                             two_by_two_sqaure_neighbours)
      expect(stable_game.live_cells_for_next_tick).to eq two_by_two_sqaure
    end
  end

  context 'generated_dead_cells' do
    let(:dead_cell) { [1, 1] }
    let(:dead_cell_neighbours) { [[0, 0], [0, 1], [0, 2],
                                  [1, 0], [1, 2],
                                  [2, 0], [2, 1], [2, 2]] }


    it 'a dead cell becomes alive if three of its neighbours are live' do
      game = Game.new(*[dead_cell_neighbours[0..2]],
                       [dead_cell])
      expect(game.live_cells_for_next_tick).to include dead_cell
    end

    it 'a dead cell stays dead if less than three of its neighbours are live' do
      game = Game.new([dead_cell],
                      dead_cell_neighbours)
      expect(game.live_cells_for_next_tick).not_to include dead_cell
    end

    it 'a dead cell stays dead if more than three of its neighbours are live' do
      game = Game.new(*[dead_cell_neighbours[0..3]],
                       [dead_cell])
      expect(game.live_cells_for_next_tick).not_to include dead_cell
    end
  end
end
