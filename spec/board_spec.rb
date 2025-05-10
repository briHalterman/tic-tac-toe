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

  describe '#place_game_piece' do
    it 'correctly updates the board grid' do
      board = Board.new
      board.place_game_piece("O", 1, 1)

      result = board.grid[1][1]

      expect(result).to eq("O")
    end
  end

  describe "winner?" do
    it 'identifies a winner' do
      board = Board.new
      board.place_game_piece("X", 0, 0)
      board.place_game_piece("X", 1, 0)
      board.place_game_piece("X", 2, 0)

      expect(board.winner?("X")).to eq(true)
    end
  end
end