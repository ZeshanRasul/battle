require 'game'

describe Game do
  subject(:game) { described_class.new(player1, player2) }
  let(:player1) { double :player1 }
  let(:player2) { double :player2 }

  describe '#players' do
    it 'has two players in the game' do
      expect(game.player_1).to eq player1
      expect(game.player_2).to eq player2 
    end
  end

  describe '#attack' do
    it 'player1 attacks and sends message to a player2 to receive damage' do
      expect(player2).to receive(:receive_damage)
      game.attack(player2)
    end
  end


end
