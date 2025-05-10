require 'spec_helper'
require_relative '../lib/game'
require_relative '../lib/board'
require_relative '../lib/player'

RSpec.describe Game do
  describe '#play_round' do
    it 'prompts again for invalid row input' do
      game = Game.new

      allow(game).to receive(:get_input).and_return('Z', 'A', '1')

      allow(game.board).to receive(:place_game_piece)
      allow(game).to receive(:switch_player)

      expect { game.play_round }.to output(/choose a valid row/).to_stdout
    end
  end

  describe '#place_game_piece' do
    it 'does not overwrite a taken space' do
      board = Board.new
      board.place_game_piece("X", 1, 1)

      board.place_game_piece("O", 1, 1)

      expect(board.grid[1][1]).to eq("X")
    end
  end

  describe '#switch_player' do
    it 'switches from player1 to player2 and back' do
      game = Game.new

      expect(game.current_player.name).to eq("Player 1")
      game.switch_player
      expect(game.current_player.name).to eq("Player 2")
      game.switch_player
      expect(game.current_player.name).to eq("Player 1")
    end
  end
end