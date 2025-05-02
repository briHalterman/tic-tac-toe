class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, " ") }
  end

  def self.convert_coordinates_to_indices(letter, number)
    row = letter.upcase.ord - 65
    column = number - 1

    [row, column]
  end
end