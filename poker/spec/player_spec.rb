require 'rspec'
require 'player'

describe Player do
  subject(:player) { Player.new("Vince", 2000, Deck.new) }

  describe "#initialize" do
    it "has a name" do
      expect(player.name).to eq("Vince")
    end

    it "has a hand of five cards" do
      expect(player.hand.length).to eq(5)
    end

    it "has a pot" do
      expect(player.pot).to eq(2000)
    end
  end

  describe "#discard" do
    it "changes number of cards in hand" do
      expect(player.hand.length).to eq (3)
    end
  end
end
