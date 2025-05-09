require 'spec_helper'
require_relative '../lib/board'

RSpec.describe Board do
  describe '#initialize' do
    it 'sets up a 3x3 grid' do
      board = Board.new

      result = board.grid
      expect(result).to eq([
        [" ", " ", " "],
        [" ", " ", " "],
        [" ", " ", " "]
      ])
    end
  end

  describe '.convert_coordinates_to_indices' do
    it 'converts B, 2 to [1, 1]' do
      result = Board.convert_coordinates_to_indices("B", 2)
      expect(result).to eq([1, 1])
    end
  end
end