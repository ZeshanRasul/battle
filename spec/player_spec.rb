require 'player'

describe Player do
  subject(:player) { described_class.new(name) }
  let(:player2) { described_class.new(name2) }
  let(:name) { double :name }
  let(:name2) { double :name2 }

  describe '#name' do
    it 'player has a name' do
      expect(player.name).to eq name
    end
  end

  describe '#hit_points' do
    it 'initialises with default HP' do
      expect(player.hit_points).to eq Player::DEFAULT_HP
    end
  end

  # describe '#attack' do
  #   it 'sends message to another player they are being attacked' do
  #     expect(player2).to receive(:receive_damage)
  #     player.attack(player2)
  #   end
  # end

  describe '#attacked' do
    it 'reduces hp by 10' do
      expect{ player.receive_damage }.to change{ player.hit_points }.by(-10)
    end

  end

end
