# Game of life

This is a ruby programme written to simulate the [Conway's game of life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life). Given a starting point of a grid of live cells, it calculates the state of the grid at the next 'tick'. This state is given as the array of live cells which are alive at the next tick.

The board available is theoretically infinite, as cells are indentified by their x and y coordinates (e.g. [0,0]), which can be positive or negative.

The programme is split into two classes and one module, to maintain the single responsibility principle. The two classes are: a) the Grid class, which calculates the arrays of dead and living cells which could be live on the next tick; and b) the Game class, which takes these dead and living cells to check and calculates which are alive on the next tick. The module generates all neighbours for a given cell. This is in a module rather than a class as this logic was needed for methods in both classes, and therefore made sense to extract out into a module.

## Working on or running the code

Clone this respository

Change into the directory from the command line

``cd game-of-life``

Install the gems from the command line:

``bundle install``

### Running the tests

Run rspec from the command line:

``rspec``

### Running linting

``rubocop``

### Running the programme

``irb``

Require in the game and grid files

```
require './lib/game.rb'
require './lib/grid.rb'
```

Create a new grid, passing in a list of currently live cells, given by their x and y coordinates:

```
$ my_grid = Grid.new([[1,1], [1,2], [2,1]])
=> #<Grid:0x00007fac0e136bd8 @live_cells=[[1, 1], [1, 2], [2, 1]]>
```

Calculate the list of dead cells next to the live cells, which may generate on this tick:

```
dead_neighbours = my_grid.dead_neighbours_of_living_cells
=> [[0, 0], [0, 1], [0, 2], [0, 3], [1, 0], [1, 3], [2, 0], [2, 2], [2, 3], [3, 0], [3, 1], [3, 2]]
```

Make a new instance of the game class with these live and dead cells:

```
$ game = Game.new(my_grid.live_cells, dead_neighbours)
=> #<Game:0x00007fac0e0f52a0 @live_cells=[[1, 1], [1, 2], [2, 1]], @dead_cells=[[0, 0], [0, 1], [0, 2], [0, 3], [1, 0], [1, 3], [2, 0], [2, 2], [2, 3], [3, 0], [3, 1], [3, 2]]>
```

Calculate the next 'tick' of live cells from this game instance

```
$ game.live_cells_for_next_tick
=> [[1, 1], [1, 2], [2, 1], [2, 2]]
```


## Future Development

Allow all the above commands to be run by a single game runner. Allow this to be done recursively to generate n new ticks.

I would like to eventually create a front-end visualisation for this. I would also be interested in attempting this same task in a functional, rather than Object-Oriented, style of programming, using JS and mithril.
