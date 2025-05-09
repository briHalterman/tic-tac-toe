require 'spec_helper'
require_relative '../lib/player'

RSpec.describe Player do
  describe '#initialize' do
    it 'sets the name and game piece' do
      player = Player.new("Player 1", "X")

      expect(player.name).to eq("Player 1")
      expect(player.game_piece).to eq("X")
    end
  end
end