# board

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, " ") }
  end

  def self.convert_coordinates_to_indices(letter, number)
    row = letter.ord - 65
    column = number - 1

    [row, column]
  end

  def place_game_piece(game_piece, row, column)
    @grid[row][column] = game_piece
  end
end