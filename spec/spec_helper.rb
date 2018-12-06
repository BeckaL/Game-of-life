RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end
  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
  config.shared_context_metadata_behavior = :apply_to_host_groups
end

def prepare_game(live_cells)
  grid = Grid.new(live_cells)
  dead_neighbours = grid.dead_neighbours_of_living_cells
  Game.new(grid.live_cells, dead_neighbours)
end
