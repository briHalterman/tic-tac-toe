# board

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, " ") }
  end

  def display_board
    puts "    1    2    3  "
    @grid.each_with_index do  |row, index|
      puts "#{(index + 65).chr} #{row.inspect}"
    end
  end

  def self.convert_coordinates_to_indices(letter, number)
    row = letter.ord - 65
    column = number.to_i - 1

    [row, column]
  end

  def place_game_piece(game_piece, row, column)
    if @grid[row][column] == " "
      @grid[row][column] = game_piece
    else
      puts "Please choose a space that is not already taken."
      @play_round
    end
  end

  def winner?(game_piece)
    # horizontal win in column 0
    return true if  grid[0][0] == game_piece &&
                    grid[0][1] == game_piece &&
                    grid[0][2] == game_piece

    # horizontal win in column 1
    return true if  grid[1][0] == game_piece &&
                    grid[1][1] == game_piece &&
                    grid[1][2] == game_piece

    # horizontal win in column 2
    return true if  grid[2][0] == game_piece &&
                    grid[2][1] == game_piece &&
                    grid[2][2] == game_piece

    # vertical win in row 0
    return true if  grid[0][0] == game_piece &&
                    grid[1][0] == game_piece &&
                    grid[2][0] == game_piece
    false
  end
end