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

  describe "#switch_turn" do
    it "will change the turn from player01 to player02" do
      game.switch_turn
      expect(game.turn).to eq player02.name
    end

    it "will change the turn from player02 to player01" do
      game.switch_turn
      game.switch_turn
      expect(game.turn).to eq player01.name
    end
  end

  describe "#game_over?" do
    let(:player03) { double("player03", :hit_points => 10) }
    let(:player04) { double("player04", :hit_points => 0) }
    let(:game2) { described_class.new(player03, player04) }

    it "returns true if a player's score is 0" do
      expect(game2.game_over).to eq true
    end
  end
end
