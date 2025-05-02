require_relative './lib/player'
require_relative './lib/board'
require_relative './lib/game'

board = Board.new

# Test
puts Board.convert_coordinates_to_indices("B", 2) == [1, 1]
puts board.grid.inspect