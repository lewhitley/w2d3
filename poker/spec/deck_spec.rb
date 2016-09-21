require 'rspec'
require 'deck'

describe Deck do
  subject(:deck) { Deck.new }
  describe "#initialize" do
    it "makes a deck of cards" do
      expect(deck.cards.first.class).to eq(Card)
    end

    it "contains 52 cards" do
      expect(deck.cards.length).to eq(52)
    end

    it "makes four suits of the same value" do
      suits_sample = []
      value = [:two, :three, :four, :five, :six, :seven, :eight,
          :nine, :ten, :jack, :queen, :king, :ace].sample
      deck.cards.each do |card|
        suits_sample << card.suit if card.value == value
      end

      expect(suits_sample).to eq([:clubs, :diamonds, :hearts, :spades])
    end

    it "makes thirteen values of the same suit" do
      value_spade = []
      suit = [:clubs, :diamonds, :hearts, :spades].sample
      deck.cards.each do |card|
        value_spade << card.value if card.suit == suit
      end

      expect(value_spade).to eq([:two, :three, :four, :five, :six,
          :seven, :eight, :nine, :ten, :jack, :queen, :king, :ace])
    end
  end

  describe "#shuffle" do
    it "shuffles the deck" do
      expect(deck.shuffle).to_not eq(deck)
    end
  end

  describe "#take_card" do

    it "returns dealt cards" do
      dealt_cards = deck.take_card(1)
      expect(dealt_cards.first.class).to eq(Card)
    end

    it "changes deck length" do
      dealt_cards = deck.take_card(2)
      expect(deck.cards.length).to eq(50)
    end
  end
end
