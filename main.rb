require_relative './lib/player'
require_relative './lib/board'
require_relative './lib/game'

board = Board.new

player1 = Player.new("Player 1", "X")
player2 = Player.new("Player 2", "O")

# Test
puts Board.convert_coordinates_to_indices("B", 2) == [1, 1]
puts board.grid.inspect
puts player1.inspect
puts player2.inspect