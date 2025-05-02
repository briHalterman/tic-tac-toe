# main.rb

require_relative './lib/player'
require_relative './lib/board'
require_relative './lib/game'

board = Board.new

player1 = Player.new("Player 1", "X")
player2 = Player.new("Player 2", "O")

puts "#{player1.name}, choose a row:"
row = gets.chomp.upcase

puts "#{player1.name}, choose a column:"
column = gets.chomp.to_i

row, column = Board.convert_coordinates_to_indices(row, column)
board.place_game_piece(player1.game_piece, row, column)

# Test
puts board.grid.inspect
puts player1.inspect
puts player2.inspect