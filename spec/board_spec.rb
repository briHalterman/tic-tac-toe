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
end