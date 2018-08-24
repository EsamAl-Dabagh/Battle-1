require 'game'

describe Game do

  let(:game) { described_class.new("Hagrid", "Dumbledore") }
  let(:player01) { double("player01", :name => "Hagrid") }
  let(:player02) { double("player02", :name => "Dumbledore") }

  describe ".new" do
    it "takes two arguments" do
      expect(described_class).to respond_to(:new).with(2).argument
    end
  end

  describe "#player01" do
    it "returns the first player" do
      expect(game.player01).to eq player01.name
    end
  end

  describe "#player02" do
    it "returns the second player" do
      expect(game.player02).to eq player02.name
    end
  end

  describe "#attack" do
    it "attacks player" do
      expect(player02).to receive(:receive_damage)
      game.attack(player02)
    end
  end

end