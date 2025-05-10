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
    it 'does not identify a non-winner' do
      board = Board.new
      board.place_game_piece("O", 0, 0)
      board.place_game_piece("O", 1, 0)

      expect(board.winner?("O")).to eq(false)
    end

    it 'does not identify a non-winner' do
      board = Board.new
      board.place_game_piece("O", 0, 0)
      board.place_game_piece("O", 1, 0)
      board.place_game_piece("X", 2, 0)

      expect(board.winner?("O")).to eq(false)
    end

    it 'identifies a win in row 0' do
      board = Board.new
      board.place_game_piece("X", 0, 0)
      board.place_game_piece("X", 0, 1)
      board.place_game_piece("X", 0, 2)

      expect(board.winner?("X")).to eq(true)
    end

    it 'identifies a win in row 1' do
      board = Board.new
      board.place_game_piece("O", 1, 0)
      board.place_game_piece("O", 1, 1)
      board.place_game_piece("O", 1, 2)

      expect(board.winner?("O")).to eq(true)
    end

      it 'identifies a win in row 2' do
      board = Board.new
      board.place_game_piece("X", 2, 0)
      board.place_game_piece("X", 2, 1)
      board.place_game_piece("X", 2, 2)

      expect(board.winner?("X")).to eq(true)
    end

    it 'identifies a win in column 0' do
      board = Board.new
      board.place_game_piece("O", 0, 0)
      board.place_game_piece("O", 1, 0)
      board.place_game_piece("O", 2, 0)

      expect(board.winner?("O")).to eq(true)
    end

    it 'identifies a win in column 1' do
      board = Board.new
      board.place_game_piece("X", 0, 1)
      board.place_game_piece("X", 1, 1)
      board.place_game_piece("X", 2, 1)

      expect(board.winner?("X")).to eq(true)
    end

    it 'identifies a win in column 2' do
      board = Board.new
      board.place_game_piece("O", 0, 2)
      board.place_game_piece("O", 1, 2)
      board.place_game_piece("O", 2, 2)

      expect(board.winner?("O")).to eq(true)
    end

    it 'identifies a diagonal win' do
      board = Board.new
      board.place_game_piece("X", 0, 0)
      board.place_game_piece("X", 1, 1)
      board.place_game_piece("X", 2, 2)

      expect(board.winner?("X")).to eq(true)
    end
  end
end