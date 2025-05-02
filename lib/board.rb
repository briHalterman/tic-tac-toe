class Board
  def self.convert_coordinates_to_indices(letter, number)
    row = letter.upcase.ord - 65
    column = number - 1

    [row, column]
  end
end