# main.rb

require_relative './lib/player'
require_relative './lib/board'
require_relative './lib/game'

game = Game.new

# puts board.grid.inspect

# puts "#{player1.name}, choose a row:"
# row = gets.chomp.upcase

# puts "#{player1.name}, choose a column:"
# column = gets.chomp.to_i

# row, column = Board.convert_coordinates_to_indices(row, column)
# board.place_game_piece(player1.game_piece, row, column)

# puts board.grid.inspect

# puts "#{player2.name}, choose a row:"
# row = gets.chomp.upcase

# puts "#{player2.name}, choose a column:"
# column = gets.chomp.to_i

# row, column = Board.convert_coordinates_to_indices(row, column)
# board.place_game_piece(player2.game_piece, row, column)

# puts board.grid.inspect

# Test
puts game.inspect
