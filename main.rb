require_relative './lib/player'
require_relative './lib/board'
require_relative './lib/game'

# Test
puts Board.convert_coordinates_to_indices("B", 2) == [1, 1]