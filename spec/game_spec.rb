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
end