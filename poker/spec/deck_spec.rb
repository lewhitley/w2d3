require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
  describe "#initialize" do
    it "makes a deck of cards" do
      expect(deck.cards.first.class).to eq(Card)
    end
    it "makes contains 52 cards" do
      expect(deck.cards.length).to eq(52)
    end
  end
end
